% Optimization script to find shift map that maximizes fuel economy
% Shift map parameterized with 20 parameters
% Steve Miller
% Copyright 2011-2023 MathWorks, Inc.

% SETUP MODEL TO USE UPDATED SHIFT SCHEDULE
mdl = 'Dual_Clutch_Trans';
setup_model_optim_full

% PRE-GENERATE RAPID ACCELERATOR TARGET
load_system(mdl);
rtp = Simulink.BlockDiagram.buildRapidAcceleratorTarget(mdl,'AddTunableParamInfo','on');
close_system(mdl);

% OFFSET PARAMETERS
delta0 = [10 12 12 10 10;...
    3  3  3  3  3;
    3  3  3  3  3;
    3  3  3  3  3];

% RESHAPE OFFSETS INTO A VECTOR SO THAT IT CAN BE PASSED TO THE OBJECTIVE FUNCTION
delta0_v = reshape(delta0,[],1);

% SHIFT BOUNDARIES MUST BE SEPARATED TO ALLOW TIME TO SHIFT
% SHIFT BOUNDARIES MUST HAVE A POSITIVE SLOPE
%   SET LOWER BOUND FOR DELTAS (MINIMUM DIFFERENCE BETWEEN POINTS)
LB = reshape([5 5 5 5 5;...
    1  1  1  1  1;
    1  1  1  1  1;
    1  1  1  1  1],[],1);

% SHIFT BOUNDARY LINES MUST BE SEPARATED BY b
%   CREATE CONSTRAINT FOR DELTA VALUES ACCORDING TO Ax <= b
%   Delta(2,1) <= Delta(1,2) + Delta(2,2) + b
SubA = [0 1 0 0;0 1 1 0;0 1 1 1];
SubB = [-1 -1 0 0;-1 -1 -1 0;-1 -1 -1 -1];
Sub0 = zeros(size(SubA));

A =[SubA SubB Sub0 Sub0 Sub0;...
    Sub0 SubA SubB Sub0 Sub0;...
    Sub0 Sub0 SubA SubB Sub0;...
    Sub0 Sub0 Sub0 SubA SubB;...
    1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 1 1 1];

mingdiff = -10; 
b = [mingdiff*ones(size(A,1)-1,1); 120];

% PLOT INITIAL SHIFT MAP
[Upshift_Speeds, Downshift_Speeds, Pedal_Positions] = Calc_Shift_Map_DL(delta0,Pedal_Positions);
map_h=figure;
Plot_Gear_Shift_Schedule(Pedal_Positions,Upshift_Speeds,Downshift_Speeds);
set(gca,'XLim',[0 120])

% RUN OPTIMIZATION USING PARALLEL COMPUTING
%parpool;
%options = psoptimset('Vectorized','off','Display','iter','UseParallel','always',...
%    'TolMesh',0.0025,'CompletePoll','on','InitialMeshSize',0.05,'ScaleMesh','on');

% RUN OPTIMIZATION WITHOUT PARALLEL COMPUTING
options = psoptimset('Vectorized','off','Display','iter','UseParallel','never',...
    'TolMesh',0.0025,'CompletePoll','on','InitialMeshSize',0.05,'ScaleMesh','on','MaxFunEvals',50);
DCT_minFuelOptResMX.tableDeltas = delta0_v;
DCT_minFuelOptResMX.fuelUsed = 10;


% CALL OPTIMIZATION FUNCTION
tic;
[x,fval,exitflag,output] = ...
    patternsearch(@(x)obj_find_min_fuel_psMX(mdl,x,rtp,map_h),...
    delta0_v,A,b,[],[],LB,[],[],options);

Elapsed_Sim_Time = toc;
disp(['Elapsed Sim Time = ' num2str(Elapsed_Sim_Time)]);

% UPDATE WORKSPACE VARIABLES WITH FINAL VALUES (BASED ON x)
delta_final = reshape(x,4,[]);
[Upshift_Speeds_final, Downshift_Speeds_final, Pedal_Positions_final] = Calc_Shift_Map_DL(delta_final,Pedal_Positions);

% SAVE KEY RESULTS OF OPTIMIZATION
%{
trans_var = get_param([mdl '/Dual Clutch Transmission'],'BlockChoice');
veh_var = get_param([mdl '/Vehicle Dynamics'],'BlockChoice');
solver_setting = get_param(mdl,'Solver');
if (strcmp(solver_setting,'ode23t'))
    solver_var = 'Desktop';
else
    solver_var = 'Real Time';
end

SaveVarName = ['OptPSMX_' trans_var(1:3) solver_var(1:3) '_DC' num2str(Drive_Cycle_Num)];

eval([SaveVarName '.delta0 = delta0;']);
eval([SaveVarName '.delta_final = delta_final;']);
eval([SaveVarName '.Elapsed_Sim_Time = Elapsed_Sim_Time;']);
eval([SaveVarName '.FuncCount = output.funccount;']);
eval([SaveVarName '.FuelUsedMin = fval;']);
eval([SaveVarName '.Variants.Transmission = ''' trans_var ''';']);
eval([SaveVarName '.Variants.Vehicle = ''' veh_var ''';']);
eval([SaveVarName '.Variants.SolverSettings = ''' solver_var ''';']);

save(SaveVarName, SaveVarName);
%}

figure(2)
Plot_Gear_Shift_Schedule(Pedal_Positions_final,Upshift_Speeds_final,Downshift_Speeds_final);
set(gca,'XLim',[0 120])

%saveas(gcf,SaveVarName,'fig');

% RESET MODEL -- REMOVE SETTINGS SPECIFIC TO OPTIMIZATION
delete(gcp('nocreate'))
reset_model_optim

datestringfile = datestr(now,'yymmddHHMM');

save(['DCT_minFuelOptResMX_' datestringfile '.mat'], 'DCT_minFuelOptResMX');

%save DCT_minFuelOptResMX


