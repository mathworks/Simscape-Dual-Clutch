% Copyright 2013-2020 MathWorks, Inc.
load_system(mdl);

% SET SYSTEM VARIANTS
set_param([mdl '/Dual Clutch Transmission'],'OverrideUsingVariant','Abstracted');
set_param([mdl '/Vehicle Dynamics'],'OverrideUsingVariant','Simple');
set_param([mdl '/Engine'],'OverrideUsingVariant','Generic');

% SIMULATION SETTINGS
Dual_Clutch_Trans_setsolver(mdl,'desktop')
Dual_Clutch_Trans_tictoc(mdl,'off')
set_param(mdl,'SimulationMode','rapid-accelerator')
set_param(mdl,'SimscapeLogType','None')

% COMMENT OUT SLRT SCOPES
set_param([mdl '/SLRT Scope1'],'Commented','on');
set_param([mdl '/SLRT Scope2'],'Commented','on');

% DRIVE CYCLE
Drive_Cycle_Num = 7;
set_param(mdl,'StopTime','174');

% For full test
%Drive_Cycle_Num = 4;
%set_param(mdl,'StopTime','506');

% SAVE FILE
warning off Simulink:Commands:SetParamLinkChangeWarn
warning off Simulink:Engine:SaveWithParameterizedLinks_Warning
save_system(mdl);
close_system(mdl);
