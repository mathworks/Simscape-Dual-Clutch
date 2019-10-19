% Optimization script to find shift map that maximizes fuel economy
% Shift map parameterized with a single parameter
% Steve Miller
% Copyright 2011-2017 MathWorks, Inc.

% SETUP MODEL FOR OPTIMIZATION
mdl = 'Dual_Clutch_Trans';
setup_model_optim

% SET INITIAL VALUE OF SHIFT MAP PARAMETER
rampconst0 = 55;

% PRE-GENERATE RAPID ACCELERATOR TARGET
load_system(mdl);
rtp = Simulink.BlockDiagram.buildRapidAcceleratorTarget(mdl,'AddTunableParamInfo','on');
close_system(mdl);

% CREATE PLOTS OF PARAMETER SWEEP, INITIAL SHIFT MAP
setup_optim1D_plots

% RUN OPTIMIZATION
tic;
[x,fval,exitflag,output] = ...
    fminsearch(@obj_find_min_fuel_1D,rampconst0, ...
    optimset('Tolx',1e-3,'Display','iter','MaxIter',6),mdl,rtp,fuelUse_h,map_h);

disp(['Elapsed time for optimization = ' num2str(toc)]);

% SAVE FINAL VALUE OF SHIFT MAP PARAMETER
rampconst_final = x;

% RESET MODEL (REMOVE SETTINGS ONLY NECESSARY FOR OPTIMIZATION)
reset_model_optim

% PLOT DETAILED PARAMETER SWEEP
%hold on
%figure(1);
%load FuelUsedSweep1D_AbsRea_161
%plot(FuelUsedSweep1D_AbsRea_161.rampconst(1:121),FuelUsedSweep1D_AbsRea_161.FuelUsedSET(1:121),'m');



