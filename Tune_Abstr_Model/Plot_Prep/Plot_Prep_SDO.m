% SCRIPT FOR PLOTTING RESULTS OF OPTIMIZATION
% Copyright 2011 The MathWorks, Inc.
load Engine_DATA_SDO
load RefRPMData

figure(1);
plot(Ref_EngRPM_time,Ref_EngRPM,'b','LineWidth',5)
hold on;
plot(Engine_DATA.time,Engine_DATA.signals(1).values,'r--','LineWidth',2)
hold off
title('Compare Detailed and Abstracted Models','FontSize',14,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12,'FontWeight','Bold');
ylabel('Engine Speed (RPM)','FontSize',12,'FontWeight','Bold');
legend({'Detailed','Abstracted'},'FontSize',12,'FontWeight','Bold');
axis([6 13 1100 2600]);

figure(2);
plot(Ref_EngRPM_time,Ref_EngRPM,'b','LineWidth',5)
hold on;
plot(Engine_DATA_orig.time,Engine_DATA_orig.signals(1).values,'r--','LineWidth',2)
hold off
title('Compare Detailed and Abstracted Models','FontSize',14,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12,'FontWeight','Bold');
ylabel('Engine Speed (RPM)','FontSize',12,'FontWeight','Bold');
legend({'Detailed','Abstracted'},'FontSize',12,'FontWeight','Bold');
axis([6 13 1100 2600]);

