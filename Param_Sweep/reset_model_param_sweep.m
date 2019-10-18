% Copyright 2013 MathWorks, Inc.
load_system(mdl);

% SET CONFIGURABLE SUBSYSTEMS
set_param([mdl '/Dual Clutch Transmission'],'BlockChoice','Detailed');
set_param([mdl '/Vehicle Dynamics'],'BlockChoice','Simple');
set_param([mdl '/Engine'],'BlockChoice','Generic');

% TURN ON LOGGING
set_param([mdl '/Scopes/Engine'],'SaveToWorkspace','on');
set_param([mdl '/Scopes/Vehicle speed'],'SaveToWorkspace','on');
set_param([mdl '/Scopes/Gear'],'SaveToWorkspace','on');
set_param([mdl '/Transmission Controller/Driver/Driver'],'SaveToWorkspace','on');
set_param([mdl '/Fuel Economy/Fuel Flow'],'SaveToWorkspace','on');

% SIMULATION SETTINGS
open_system([mdl '/Desktop Settings']);
open_system([mdl '/tictoc']);
set_param(mdl,'SimulationMode','normal')

% DRIVE CYCLE
Drive_Cycle_Num = 7;
set_param(mdl,'StopTime','174');

% SAVE FILE
warning off Simulink:Commands:SetParamLinkChangeWarn
warning off Simulink:Engine:SaveWithParameterizedLinks_Warning
save_system(mdl);
close_system(mdl);