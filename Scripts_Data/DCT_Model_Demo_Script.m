%% DCT Model Demo Script
%
% <html>
% <span style="font-family:Arial">
% <span style="font-size:10pt">
% <tr><b><u>Model</u></b><br>
% <tr>1.  <a href="matlab:open_system('Dual_Clutch_Trans');">Open Dual Clutch Transmission Model</a><br>
% <tr>....a.  Animation: <a href="matlab:dos([DCT_Model_HomeDir '/Libraries/Animation/DCT_SL3D_Anim_DC7.wmv']);">Video</a>,<a href="matlab:open_system('GearSelect_Testrig');">Gear Select Animation</a><br>
% <tr>2.  <a href="matlab:Test_DCT_Model_Short;">Run Drive Cycles</a><br>
% <tr>3.  <a href="matlab:cd([DCT_Model_HomeDir '/Fuel_Consumption']);edit Create_Fuel_Consumption_LUT;">Estimate Fuel Economy With Measured Data</a><br>
% <tr>4.  Shift Map Animation:<a href="matlab:Shift_Map_Sim_Movie('stored');">Drive Cycle 7</a>, <a href="matlab:Shift_Map_Sim_Movie('lastrun');">Previous Simulation</a><br>
% <tr>5.  Model Abstraction:<br>
% <tr>....a.  Vehicle Dynamics: <a href="matlab:open_system('Vehicle_Dynamics_Testrig');">Vehicle Dynamics</a><br>
% <tr>....b.  Transmission: <a href="matlab:cd([DCT_Model_HomeDir '/Tune_Abstr_Model']);open_system('Dual_Clutch_Trans_SDO');">Parameter Tuning</a>, <a href="matlab:dos([DCT_Model_HomeDir '\Slides_Recordings\Videos\Tune_Abstr_Model.wmv']);">Video</a><br>
% <tr>....c.  <a href="matlab:Compare_Detailed_Abstracted_SimResults">Plot Comparing Simulation Results</a><br>
% <br>
% <tr><b><u>Simulate</u></b><br>
% <tr>6.  Parameter Sweep:<br>
% <tr>....a.  Shift Map Parameterization: <a href="matlab:ShiftMapParamGUI;">Shift Map Parameterization GUI</a><br>
% <tr>....b.  1-D Parameter Sweep (Parallel): <a href="matlab:edit DCT_Parameter_Sweep_1D;">Run Parameter Sweep (1D)</a><br>
% <tr>....c.  2-D Parameter Sweep (Parallel): <a href="matlab:edit DCT_Parameter_Sweep_2D;">Run Parameter Sweep (2D)</a><br>
% <tr>....d.  <a href="matlab:Compare_Det_Abs_Models_2DSweep;">Compare Detailed/Abstracted Models</a><br>
% <tr>7.  Optimization: <br>
% <tr>....a.  1-D Optimization: <a href="matlab:edit find_min_fuel_1D;">MATLAB Code</a>, <a href="matlab:dos([DCT_Model_HomeDir '/Optim/Videos/OptFm1D.wmv']);">Video</a><br>
% <tr>....b.  2-D Opt., fminsearch: <a href="matlab:edit find_min_fuel_2D;">MATLAB Code</a>, <a href="matlab:dos([DCT_Model_HomeDir '/Optim/Videos/OptFm2D.wmv']);">Video</a>, <a href="matlab:open('OptFm2D_AbsRea_DC7_Mesh.fig');">Figure</a><br>
% <tr>....c.  2-D Opt., patternsearch: <a href="matlab:edit find_min_fuel_ps2D;">MATLAB Code</a>, <a href="matlab:dos([DCT_Model_HomeDir '/Optim/Videos/OptPS2D.wmv']);">Video</a>, <a href="matlab:open('OptPS2D_AbsRea_DC7_Mesh.fig');">Figure</a><br>
% <tr>....d.  Full Opt., patternsearch: <a href="matlab:edit find_min_fuel_psMX;">MATLAB Code</a>, <a href="matlab:dos([DCT_Model_HomeDir '/Optim/Videos/OptPSMX.wmv']);">Video</a><br>
% <tr>8.  Analyze and Document: <a href="matlab:open('DCT_Model_Report_SHORT.html');">View Report</a>, <a href="matlab:cd([DCT_Model_HomeDir '/Reports']);open('DCT_Model_Report_SHORT.rpt');">Generate Report</a><br>
% <br>
% <tr><b><u>Deploy</u></b><br>
% <tr>9. <a href="matlab:cd([DCT_Model_HomeDir '/Local_Solver']);edit Test_RT_Model">Real-Time Simulation</a><br>
% </style>
% </style>
% </html>
% 
% Copyright 2011-2017 The MathWorks(TM), Inc.


