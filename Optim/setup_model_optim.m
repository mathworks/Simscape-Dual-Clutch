% Copyright 2013-2016 MathWorks, Inc.
load_system(mdl);

% SET CONFIGURABLE SUBSYSTEMS
set_param([mdl '/Dual Clutch Transmission'],'BlockChoice','Abstracted');
set_param([mdl '/Vehicle Dynamics'],'BlockChoice','Simple');
set_param([mdl '/Engine'],'BlockChoice','Generic');

% SIMULATION SETTINGS
open_system([mdl '/Real Time Settings']);
open_system([mdl '/No tictoc']);
set_param(mdl,'SimulationMode','rapid-accelerator')

% DRIVE CYCLE
Drive_Cycle_Num = 7;
set_param(mdl,'StopTime','174');

% SAVE FILE
warning off Simulink:Commands:SetParamLinkChangeWarn
warning off Simulink:Engine:SaveWithParameterizedLinks_Warning
save_system(mdl);
close_system(mdl);
