% Copyright 2013 MathWorks, Inc.
load_system(mdl);

% SET CONFIGURABLE SUBSYSTEMS
set_param([mdl '/Dual Clutch Transmission'],'BlockChoice','Abstracted');
set_param([mdl '/Vehicle Dynamics'],'BlockChoice','Simple');
set_param([mdl '/Engine'],'BlockChoice','Generic');

% TURN OFF LOGGING
set_param([mdl '/Scopes/Engine'],'SaveToWorkspace','off');
set_param([mdl '/Scopes/Vehicle speed'],'SaveToWorkspace','off');
set_param([mdl '/Scopes/Gear'],'SaveToWorkspace','off');
set_param([mdl '/Transmission Controller/Driver/Driver'],'SaveToWorkspace','off');
set_param([mdl '/Fuel Economy/Fuel Flow'],'SaveToWorkspace','off');

% SIMULATION SETTINGS
set_param(mdl,'SimulationMode','rapid-accelerator');
%set_param(mdl,'SimulationMode','accelerator');
open_system([mdl '/Real Time Settings']);
%open_system([mdl '/Desktop Settings']);
open_system([mdl '/No tictoc']);

% DRIVE CYCLE
Drive_Cycle_Num = 7;
set_param(mdl,'StopTime','174');

% SAVE FILE
warning off Simulink:Commands:SetParamLinkChangeWarn
warning off Simulink:Engine:SaveWithParameterizedLinks_Warning
save_system(mdl);
close_system(mdl);