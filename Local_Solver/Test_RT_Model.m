%% Open model resave for real-time test
orig_mdl = 'Dual_Clutch_Trans';
open_system(orig_mdl);
mdl = [orig_mdl '_rttest_temp'];
save_system(orig_mdl,mdl);

Drive_Cycle_Num = 6;
set_param([mdl '/Vehicle Dynamics/Simple'],'LinkStatus','inactive')
DCT_Vehicle_Mass = 1600;
set_param([mdl '/Vehicle Dynamics/Simple'],'mass','DCT_Vehicle_Mass');
set_param(mdl,'StopTime','15');
set_param(mdl,'SimscapeLogType','None');
set_param(mdl,'SignalLogging','off');

%% Get reference results
Dual_Clutch_Trans_setsolver(mdl,'desktop')
sim(mdl)
t_ref = tout; y_ref = yout;
clear tout yout

%% Create plot for comparing results
figure(1); clf;
temp_colororder = get(gca,'DefaultAxesColorOrder');
set(gcf,'Position',[552    50   472   301]);
plot(t_ref,y_ref,'k','LineWidth',3)
title('Comparing Simulation Results','FontSize',14,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12);ylabel('Vehicle Speed');
legend({'Reference'},'Location','SouthEast')

%% Test with fixed-step, fixed-cost solver
Dual_Clutch_Trans_setsolver(mdl,'realtime')
sim(mdl)
t_fs = tout; y_fs = yout;

%% Add fixed-step results to plot
figure(1)
hold on
h2=stairs(t_fs, y_fs,'Color',temp_colororder(2,:),'LineWidth',2.5);
hold off
legend({'Reference','Fixed-Step'},'Location','NorthWest')

%% Enable real-time parameter
tune_bpth = [mdl '/Vehicle Dynamics/Simple/Inertia'];
set_param(tune_bpth,'inertia_conf','runtime');

% Highlight block
open_system(get_param(tune_bpth,'Parent'),'force')
set_param(tune_bpth,'Selected','on');

%% Build and download to real-time target
slbuild(mdl);

%% Set simulation mode to external
set_param(mdl,'SimulationMode','External');

%% Connect to target and run
set_param(mdl, 'SimulationCommand', 'connect')
set_param(mdl, 'SimulationCommand', 'start')

open_system(mdl);
disp('Waiting for Simulink Real-Time to finish...');
pause(1);
disp(get_param(mdl,'SimulationStatus'));
while(~strcmp(get_param(mdl,'SimulationStatus'),'stopped'))
    pause(2);
    disp(get_param(mdl,'SimulationStatus'));
end
pause(2);

t_rt = tg.TimeLog; y_rt = tg.OutputLog;

%% Add results from real-time simulation
figure(1)
hold on
h3=stairs(t_rt,y_rt,'c:','LineWidth',2.5);
hold off
legend({'Reference','Fixed-Step','Real-Time'},'Location','NorthWest');

%% Change a Simscape block parameter
mass_ParamId = getparamid(tg,'','DCT_Vehicle_Mass');
disp(['Vehicle Mass (current) = ' num2str(getparam(tg,mass_ParamId))]);
setparam(tg,mass_ParamId,1800);
disp(['Vehicle Mass (new)     = ' num2str(getparam(tg,mass_ParamId))]);

%% Run simulation on real-time hardware
tg.start

disp('Waiting for Simulink Real-Time to finish...');
pause(1);
disp(tg.Status);
while(~strcmp(tg.Status,'stopped'))
    pause(2);
    disp(tg.Status);
end
pause(2);

t_rt2 = tg.TimeLog; y_rt2 = tg.OutputLog;

%% Add results from modified vehicle model
figure(1)
hold on
h4=stairs(t_rt2,y_rt2,'Color',temp_colororder(4,:),'LineWidth',2);
hold off
legend({'Reference','Fixed-Step','Real-Time','Modified'},'Location','NorthWest');

% Copyright 2011-2017 The MathWorks(TM), Inc.
%% Close model and clean up directory
cleanup_rt_dir
