% Optimization script to find shift map that maximizes fuel economy
% Shift map parameterized with two parameters
% Steve Miller
% Copyright 2011-2021 MathWorks, Inc.

% SETUP MODEL TO USE UPDATED SHIFT SCHEDULE
mdl = 'Dual_Clutch_Trans';
setup_model_optim

% SET INITIAL VALUE OF SHIFT MAP PARAMETERS
rampconst0 = 35;
mingeardiff0 = 18;

% PRE-GENERATE RAPID ACCELERATOR TARGET
load_system(mdl);
rtp = Simulink.BlockDiagram.buildRapidAcceleratorTarget(mdl,'AddTunableParamInfo','on');
close_system(mdl);

% CREATE PLOTS OF PARAMETER SWEEP, INITIAL SHIFT MAP
setup_optim2D_plots

% RUN OPTIMIZATION USING PARALLEL COMPUTING
%parpool;
%options = psoptimset('Vectorized','off','Display','iter','UseParallel','always',...
%    'TolMesh',0.0025,'CompletePoll','on','InitialMeshSize',0.05,'ScaleMesh','on');

% RUN OPTIMIZATION WITHOUT PARALLEL COMPUTING
options = psoptimset('Vectorized','off','Display','iter','UseParallel','never',...
    'TolMesh',0.0025,'CompletePoll','on','InitialMeshSize',0.05,'ScaleMesh','on');

% RUN OPTIMIZATION
tic;
[x,fval,exitflag,output] = ...
    patternsearch(@(x)obj_find_min_fuel_2D(x,mdl,rtp,fuelUse_h,map_h),...
    [mingeardiff0 rampconst0],[],[],[],[],[16 0],[20 60],[],options);

Elapsed_Sim_Time = toc;
disp(['Elapsed Sim Time = ' num2str(Elapsed_Sim_Time)]);

% SAVE KEY RESULTS OF OPTIMIZATION
%{
mingeardiff_final = x(1);
rampconst_final = x(2);

OptPS2D.rampconst0 = rampconst0;
OptPS2D.rampconst_final = rampconst_final;
OptPS2D.mingeardiff0 = mingeardiff0;
OptPS2D.mingeardiff_final = mingeardiff_final;
OptPS2D.Elapsed_Sim_Time = Elapsed_Sim_Time;
OptPS2D.FuncCount = output.funccount;
OptPS2D.FuelUsedMin = fval;

save OptPS2D OptPS2D

figure(1)
saveas(gcf,'OptPS2D_Mesh','fig');
%}

% RESET MODEL InitFcn -- ONLY NECESSARY FOR OPTIMIZATION
%delete(gcb);
reset_model_optim
