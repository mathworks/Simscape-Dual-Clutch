%% PERFORM PARAMETER SWEEP
% Copyright 2011-2023 The MathWorks(TM), Inc.
mdl = 'Dual_Clutch_Trans';
setup_model_param_sweep

%% BUILD TARGET
rtp = Simulink.BlockDiagram.buildRapidAcceleratorTarget(mdl,'AddTunableParameterInfo','on');

%% GENERATE PARAMETER SETS
% SHORT SWEEP
rampconst = 0:10:70;

% DETAILED SWEEP
%rampconst = 0:0.5:80;

mingeardiff = 17;
[SimSettings,rc,mg] = Generate_Sim_Settings(rampconst,mingeardiff,rtp);

numSims = length(SimSettings);
out = cell(1, numSims);

% VARIABLE FOR SAVING RESULTS
clear FuelUsedSET

% SET UP FIGURE WINDOW
map_h = figure;

%% START MATLAB POOL
gcp('nocreate');
Initialize_MLPool

%% SIMULATE
tic;
parfor run_i = 1:numSims
    % CALCULATE NEW SHIFT MAP
    [Upshift_Speeds, Downshift_Speeds, Pedal_Positions] = Calc_Shift_Map_RO(rampconst(run_i),mingeardiff);
    
    figure(map_h)
    Plot_Gear_Shift_Schedule(Pedal_Positions, Upshift_Speeds, Downshift_Speeds);
    set(gca,'XLim',[0 120]);
    
    %disp(['Simulating with rampconst = ' num2str(rampconst(run_i))]);
    out{run_i} = sim(mdl,SimSettings{run_i});         
    %disp(['FINISHED with rampconst = ' num2str(rampconst(run_i)) ' Fuel Used = ' num2str(FuelUsedLiters)]);
    %FuelUsedSET(run_i) = FuelUsedLiters;
end
Elapsed_Sim_Time = toc;
disp(['Elapsed Sim Time = ' num2str(Elapsed_Sim_Time)]);

%% PLOT RESULTS
for i=1:numSims
    FuelUsedSET(i) = out{i}.find('FuelUsedLiters');
end

figure(map_h);clf;
%set(gcf,'Position',[11   356   545   293]);
plot(rampconst,FuelUsedSET,'b-.o','LineWidth',2,'MarkerFaceColor','b');
title('Fuel Use With Varying Shift Schedule','FontWeight','Bold','FontSize',14);
xlabel('Shift Schedule Parameter','FontWeight','Bold','FontSize',12);
ylabel('Fuel Used (L)','FontWeight','Bold','FontSize',12);
legend('Parameter Sweep','Location','NorthWest');

%% SAVE RESULTS
%{
trans_var = get_param([mdl '/Dual Clutch Transmission'],'BlockChoice');
veh_var = get_param([mdl '/Vehicle Dynamics'],'BlockChoice');
solver_setting = get_param(mdl,'Solver');
if (strcmp(solver_setting,'ode23t'))
    solver_var = 'Desktop';
else
    solver_var = 'Real Time';
end

SaveVarName = ['FuelUsedSweep1D_' trans_var(1:3) solver_var(1:3) '_' num2str(length(FuelUsedSET))];
eval([SaveVarName '.FuelUsedSET = FuelUsedSET;']);
eval([SaveVarName '.rampconst = rampconst;']);
eval([SaveVarName '.mingeardiff = mingeardiff;']);
eval([SaveVarName '.Elapsed_Sim_Time = Elapsed_Sim_Time;']);
eval([SaveVarName '.Variants.Transmission = ''' trans_var ''';']);
eval([SaveVarName '.Variants.Vehicle = ''' veh_var ''';']);
eval([SaveVarName '.Variants.SolverSettings = ''' solver_var ''';']);

save(SaveVarName, SaveVarName);
%}
clear rampconst mingeardiff FuelUsedSET

%% CLOSE PARALLEL POOL
delete(gcp);
reset_model_param_sweep
