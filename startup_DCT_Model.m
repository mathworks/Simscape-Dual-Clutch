% SCRIPT TO SET UP Dual_Clutch_Trans SIMULATION
% Copyright 2011-2017 The MathWorks, Inc.

DCT_Model_HomeDir = pwd;
addpath(pwd);
addpath([pwd filesep 'Libraries' filesep 'Vehicle']);
addpath([pwd filesep 'Libraries' filesep 'Transmission']);
addpath([pwd filesep 'Libraries' filesep 'Engine']);
addpath([pwd filesep 'Libraries' filesep 'Animation']);
addpath([pwd filesep 'Images']);
addpath([pwd filesep 'Scripts_Data']);
addpath([pwd filesep 'Param_Sweep']);
addpath([pwd filesep 'Param_Sweep' filesep 'Param_Sweep_Res']);
addpath(genpath([pwd filesep 'Optim']));
addpath([pwd filesep 'Reports']);
addpath([pwd filesep 'Tune_Abstr_Model']);

DCT_Model_PARAM
MBC_Engine_Calibrations
open('DCT_Model_Demo_Script.html')

Dual_Clutch_Trans









