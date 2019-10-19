% Copyright 2013-2018 MathWorks, Inc.
load_system(mdl);

% RESET SYSTEM VARIANTS
set_param([mdl '/Dual Clutch Transmission'],'OverrideUsingVariant','Detailed');
set_param([mdl '/Vehicle Dynamics'],'OverrideUsingVariant','Simple');
set_param([mdl '/Engine'],'OverrideUsingVariant','Generic');

% SIMULATION SETTINGS
Dual_Clutch_Trans_setsolver(mdl,'desktop');
Dual_Clutch_Trans_tictoc('on');
set_param(mdl,'SimulationMode','normal')
set_param(mdl,'SimscapeLogType','All')

% COMMENT OUT SLRT SCOPES
set_param([mdl '/SLRT Scope1'],'Commented','off');
set_param([mdl '/SLRT Scope2'],'Commented','off');

% DRIVE CYCLE
Drive_Cycle_Num = 7;
set_param(mdl,'StopTime','174');

% SAVE FILE
warning off Simulink:Commands:SetParamLinkChangeWarn
warning off Simulink:Engine:SaveWithParameterizedLinks_Warning
save_system(mdl);
close_system(mdl);

