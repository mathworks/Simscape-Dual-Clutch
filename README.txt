Vehicle with a Dual-Clutch Transmission
Copyright 2011-2017 The MathWorks, Inc.

This model contains a dual-clutch transmission built using Simscape and 
Simscape Driveline that can be configured for control algorithm development 
or optimization tests. The clutch states and pre-selection of the gears 
via dog clutches is controlled by a state machine modeled in Stateflow. 

Model variants for the transmission and vehicle dynamics can be selected 
using variant subsystems. MATLAB scripts demonstrate how to optimize a shift 
schedule for maximum fuel economy, and how to speed that process using 
parallel computing. 

This model can be configured for hardware-in-the-loop testing. 

1. You must run "startup_DCT_Model.m" to set the path and load key values.


2. DCT_Model_Demo_Script.html will walk you through most parts demo. 


