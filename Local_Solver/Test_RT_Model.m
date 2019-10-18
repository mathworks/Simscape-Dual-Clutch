%% OPEN MODEL
% Copyright 2011-2016 The MathWorks, Inc.

mdl = 'Dual_Clutch_Trans_LS';
open_system(mdl);
Drive_Cycle_Num = 6;

%% GET REFERENCE RESULTS
%open_system([mdl '/Desktop Settings']);
%sim(mdl)
t_ref = tout; y_ref = yout;
clear tout yout

%% CREATE PLOT
figure(1)
set(gcf,'Position',[552    50   472   301]);
plot(t_ref,y_ref,'k','LineWidth',3)
title('Comparing Simulation Results','FontSize',14,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12);ylabel('Vehicle Speed');
legend({'Reference'},'Location','best')

%% LOAD REAL-TIME SIMULATION SOLVER SETTINGS
%open_system([mdl '/Real Time Settings']);
%sim(mdl)
t_fs = tout; y_fs = yout;

%% ADD FIXED-STEP RESULTS TO PLOT
figure(1)
set(gcf,'Position',[552    50   472   301]);
h1=plot(t_ref,y_ref,'k','LineWidth',3);
hold on
h2=stairs(t_fs, y_fs,'r','LineWidth',2.5);
title('Comparing Simulation Results','FontSize',14,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12);ylabel('Vehicle Speed');
legend([h1(1) h2(1)],{'Reference','Fixed-Step'},'Location','best')
hold off

%% BUILD AND DOWNLOAD XPC TARGET
slbuild(mdl);

%% SET SIMULATION MODE TO EXTERNAL
set_param(mdl,'SimulationMode','External');

%% CONNECT TO TARGET AND RUN
set_param(gcs, 'SimulationCommand', 'connect')
set_param(gcs, 'SimulationCommand', 'start')

open_system(mdl);
disp('Waiting for xPC to finish...');
pause(1);
disp(get_param(bdroot,'SimulationStatus'));
while(~strcmp(get_param(bdroot,'SimulationStatus'),'stopped'))
    pause(2);
    disp(get_param(bdroot,'SimulationStatus'));
end
%% PLOT REFERENCE AND REAL-TIME RESULTS
figure(1)
set(gcf,'Position',[552    50   472   301]);
h1=plot(t_ref,y_ref,'k','LineWidth',3);
hold on
h2=stairs(t_fs,y_fs,'r','LineWidth',2.5);
h3=stairs(tg.TimeLog,tg.OutputLog,'c:','LineWidth',2.5);
hold off
xlabel('Time (s)'); ylabel('Results');
title('Reference and Real-Time Results','FontSize',14,'FontWeight','Bold');
legend([h1(1),h2(1),h3(1)],{'Reference','Fixed-Step','Real-Time'},'Location','Best');

%% CLEAN UP DIRECTORY
cleanup_rt_dir
