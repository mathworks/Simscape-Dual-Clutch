% Optimization script to find shift map that maximizes fuel economy
% Shift map parameterized with two parameters
% Steve Miller
% Copyright 2011-2017 MathWorks, Inc.

% SETUP MODEL TO USE UPDATED SHIFT SCHEDULE
mdl = 'Dual_Clutch_Trans';
setup_model_optim

% SET INITIAL VALUE OF SHIFT MAP PARAMETERS
rampconst0 = 36;
mingeardiff0 = 19;

% PRE-GENERATE RAPID ACCELERATOR TARGET
load_system(mdl);
rtp = Simulink.BlockDiagram.buildRapidAcceleratorTarget(mdl,'AddTunableParamInfo','on');
close_system(mdl);

% CREATE PLOTS OF PARAMETER SWEEP, INITIAL SHIFT MAP
setup_optim2D_plots

% RUN OPTIMIZATION
tic;
[x,fval,exitflag,output] = ...
    fminsearch(@obj_find_min_fuel_2D,[mingeardiff0 rampconst0], ...
    optimset('Tolx',1e-3,'Display','iter'),mdl,rtp,fuelUse_h,map_h);

Elapsed_Sim_Time = toc;
disp(['Elapsed Sim Time = ' num2str(Elapsed_Sim_Time)]);

% SAVE KEY RESULTS OF OPTIMIZATION
%{
mingeardiff_final = x(1);
rampconst_final = x(2);

OptFm2D.rampconst0 = rampconst0;
OptFm2D.rampconst_final = rampconst_final;
OptFm2D.mingeardiff0 = mingeardiff0;
OptFm2D.mingeardiff_final = mingeardiff_final;
OptFm2D.Elapsed_Sim_Time = Elapsed_Sim_Time;
OptFm2D.FuncCount = output.funcCount;
OptFm2D.FuelUsedMin = fval;

save OptFm2D OptFm2D

figure(1)
saveas(gcf,'OptFm2D_Mesh','fig');
%}

% RESET MODEL InitFcn -- ONLY NECESSARY FOR OPTIMIZATION
reset_model_optim





