% SCRIPT TO SET UP Dual_Clutch_Trans SIMULATION
% Copyright 2011 The MathWorks, Inc.

DCT_Model_HomeDir = pwd;
addpath(pwd);
addpath([pwd '/Libraries/Vehicle']);
addpath([pwd '/Libraries/Transmission']);
addpath([pwd '/Libraries/Engine']);
addpath([pwd '/Libraries/Animation']);
addpath([pwd '/Images']);
addpath([pwd '/Scripts_Data']);
addpath([pwd '/Param_Sweep']);
addpath([pwd '/Param_Sweep/Param_Sweep_Res']);
addpath([pwd '/Optim']);
addpath([pwd '/Optim/Optim_Res']);
%addpath([pwd '/Optim/Videos']);
addpath([pwd '/Reports']);
addpath([pwd '/Tune_Abstr_Model']);

DCT_Model_PARAM
MBC_Engine_Calibrations
open('DCT_Model_Demo_Script.html')

Dual_Clutch_Trans









