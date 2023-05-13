%ENGINE_CALIBRATION  Calibration M file.
% Copyright 2013-2023 MathWorks, Inc.

%  Generated by MATLAB 7.9.0.529 (R2009b) on 30-Sep-2009 14:15:19.

L_norm.X = [ 0.3, 0.43333, 0.56667, 0.7, 0.83333, 0.96667, 1.1, 1.2333, 1.3667, 1.5 ];
L_norm.Y = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ];

N_norm.X = [ 750, 1333.3333, 1916.6667, 2500, 3083.3333, 3666.6667, 4250, 4833.3333, 5416.6667, 6000 ];
N_norm.Y = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ];

AFR_Table.X = [ 750, 1333.3333, 1916.6667, 2500, 3083.3333, 3666.6667, 4250, 4833.3333, 5416.6667, 6000 ];
AFR_Table.Y = [ 0.3, 0.43333, 0.56667, 0.7, 0.83333, 0.96667, 1.1, 1.2333, 1.3667, 1.5 ];
AFR_Table.Z(1,:) = [ 14.45, 14.45, 14.45, 14.45, 14.3034, 13.865, 13.3213, 12.7856, 12.3333, 11.9575 ];
AFR_Table.Z(2,:) = [ 14.45, 14.45, 14.45, 14.45, 14.45, 13.8667, 13.2833, 12.7, 12.2879, 11.9508 ];
AFR_Table.Z(3,:) = [ 14.45, 14.45, 14.45, 14.45, 14.45, 13.8667, 13.2833, 12.7, 12.3682, 12.021 ];
AFR_Table.Z(4,:) = [ 14.45, 14.45, 14.45, 14.45, 14.45, 14.0357, 13.6358, 13.0525, 12.5945, 12.1172 ];
AFR_Table.Z(5,:) = [ 14.45, 14.45, 14.45, 14.45, 14.45, 14.3445, 13.7612, 13.1779, 12.5945, 12.1239 ];
AFR_Table.Z(6,:) = [ 14.45, 14.45, 14.2309, 13.7833, 14.3667, 14.3445, 13.7612, 13.1779, 12.5945, 12.1244 ];
AFR_Table.Z(7,:) = [ 14.4007, 14.3664, 14.1983, 13.8667, 14.45, 14.4133, 13.83, 13.2466, 12.6633, 12.1701 ];
AFR_Table.Z(8,:) = [ 14.1988, 14.0909, 13.886, 13.7929, 14.3763, 14.348, 13.7646, 13.2, 12.6923, 12.2188 ];
AFR_Table.Z(9,:) = [ 13.9434, 13.773, 13.5703, 13.4858, 13.7096, 14.2929, 13.8, 13.2167, 12.7127, 12.2517 ];
AFR_Table.Z(10,:) = [ 13.7155, 13.5346, 13.3656, 13.3046, 13.4947, 13.8026, 13.6206, 13.1682, 12.6998, 12.2551 ];

ECP_Table.X = [ 750, 1333.3333, 1916.6667, 2500, 3083.3333, 3666.6667, 4250, 4833.3333, 5416.6667, 6000 ];
ECP_Table.Y = [ 0.3, 0.43333, 0.56667, 0.7, 0.83333, 0.96667, 1.1, 1.2333, 1.3667, 1.5 ];
ECP_Table.Z(1,:) = [ 49.7847, 49.7847, 49.7847, 41.6181, 34.8513, 29.7823, 28.1261, 24.5263, 18.8176, 13.3026 ];
ECP_Table.Z(2,:) = [ 49.7847, 49.7847, 44.949, 36.7823, 28.6156, 20.449, 22.4285, 18.1827, 11.6316, 6.4199 ];
ECP_Table.Z(3,:) = [ 49.7847, 43.7823, 35.6156, 27.449, 19.2823, 11.1156, 13.0952, 8.8494, 2.683, -0.82029 ];
ECP_Table.Z(4,:) = [ 41.6149, 34.449, 26.2823, 18.1156, 9.949, 1.7823, 3.7619, -0.48394, -4.9071, -4.9071 ];
ECP_Table.Z(5,:) = [ 32.2816, 25.1156, 16.949, 8.7823, 0.61564, -4.9071, -4.9071, -4.9071, -4.9071, -4.9071 ];
ECP_Table.Z(6,:) = [ 23.3849, 15.7823, 7.7279, -0.4388, -4.9071, -4.9071, -4.9071, -4.9071, -4.9071, -4.9071 ];
ECP_Table.Z(7,:) = [ 15.9506, 7.7839, -0.38275, -4.8896, -4.9071, -3.691, -0.84575, -4.9071, -4.9071, -4.9071 ];
ECP_Table.Z(8,:) = [ 11.407, 4.0272, -2.5973, -4.9071, 3.2595, 5.6423, 8.4876, 0.32092, -4.4714, -4.9071 ];
ECP_Table.Z(9,:) = [ 9.9655, 4.777, 1.844, 4.4262, 10.189, 2.0224, 6.5984, 3.1834, -2.1673, -4.9071 ];
ECP_Table.Z(10,:) = [ 10.3666, 7.1973, 6.3583, 8.278, 8.7156, 4.3594, 3.8337, 2.2679, -1.5643, -4.9071 ];

ICP_Table.X = [ 750, 1333.3333, 1916.6667, 2500, 3083.3333, 3666.6667, 4250, 4833.3333, 5416.6667, 6000 ];
ICP_Table.Y = [ 0.3, 0.43333, 0.56667, 0.7, 0.83333, 0.96667, 1.1, 1.2333, 1.3667, 1.5 ];
ICP_Table.Z(1,:) = [ 49.8258, 48.4457, 45.0499, 44.0921, 41.8725, 34.9519, 30.5408, 34.0145, 39.0498, 41.9546 ];
ICP_Table.Z(2,:) = [ 49.8258, 49.8258, 47.6615, 42.6612, 46.0706, 38.4856, 32.4407, 40.162, 45.094, 46.0833 ];
ICP_Table.Z(3,:) = [ 49.8258, 46.7897, 38.623, 36.1301, 43.8975, 47.819, 41.774, 49.4954, 49.3798, 48.2343 ];
ICP_Table.Z(4,:) = [ 45.2564, 37.4564, 29.2897, 35.7328, 43.8994, 47.0782, 48.0174, 44.4959, 46.5165, 46.8394 ];
ICP_Table.Z(5,:) = [ 35.923, 28.123, 21.3696, 29.5363, 37.7029, 42.5363, 43.7484, 44.1853, 42.8314, 44.2738 ];
ICP_Table.Z(6,:) = [ 26.9564, 18.7897, 14.1186, 20.2029, 28.3696, 36.5363, 40.3428, 42.0453, 42.2525, 43.3544 ];
ICP_Table.Z(7,:) = [ 22.3362, 17.5766, 16.7913, 18.2515, 26.4182, 33.3713, 35.8012, 40.4523, 42.2713, 43.376 ];
ICP_Table.Z(8,:) = [ 20.6651, 17.6443, 16.2631, 17.1086, 25.2753, 27.7422, 28.4105, 36.5772, 40.9635, 43.0129 ];
ICP_Table.Z(9,:) = [ 20.3296, 18.2239, 17.6473, 20.1043, 26.3572, 31.2522, 31.2984, 35.3593, 39.6523, 42.3532 ];
ICP_Table.Z(10,:) = [ 20.9797, 19.8858, 20.4387, 23.3737, 28.3147, 32.5001, 34.2426, 36.4992, 39.4341, 41.9496 ];

S_Table.X = [ 750, 1333.3333, 1916.6667, 2500, 3083.3333, 3666.6667, 4250, 4833.3333, 5416.6667, 6000 ];
S_Table.Y = [ 0.3, 0.43333, 0.56667, 0.7, 0.83333, 0.96667, 1.1, 1.2333, 1.3667, 1.5 ];
S_Table.Z(1,:) = [ 9.1311, 11.4051, 14.2223, 20.5163, 26.6345, 34.7348, 39.1053, 41.7759, 43.3666, 43.8681 ];
S_Table.Z(2,:) = [ 6.1524, 8.3596, 10.8468, 17.773, 22.0419, 35.1698, 37.2942, 40.7507, 41.7884, 41.4352 ];
S_Table.Z(3,:) = [ 3.2579, 4.7905, 14.0049, 15.5066, 21.7699, 32.1307, 34.4483, 39.5232, 38.5113, 37.8389 ];
S_Table.Z(4,:) = [ 1.2175, 9.8441, 12.5461, 16.9317, 23.2446, 28.6769, 32.6008, 33.8796, 33.2968, 34.1827 ];
S_Table.Z(5,:) = [ 3.6357, 9.8184, 11.4073, 16.9664, 26.2058, 30.4424, 31.9083, 32.9619, 32.7495, 32.6895 ];
S_Table.Z(6,:) = [ 5.1298, 9.2829, 10.855, 15.1064, 26.9713, 31.3561, 32.4849, 33.1548, 32.3868, 32.1403 ];
S_Table.Z(7,:) = [ 6.3007, 9.6271, 12.4705, 18.3106, 28.4551, 32.8848, 35.1192, 33.942, 32.165, 32.1451 ];
S_Table.Z(8,:) = [ 8.3703, 11.7201, 14.9549, 20.1688, 32.0144, 40.8488, 46.0246, 36.6701, 33.7356, 33.6253 ];
S_Table.Z(9,:) = [ 11.7111, 15.9879, 21.2607, 29.7453, 40.2253, 39.3657, 46.8614, 42.6877, 38.2606, 36.8682 ];
S_Table.Z(10,:) = [ 15.7199, 20.9758, 27.4574, 35.3885, 41.5174, 43.0149, 45.8173, 45.1474, 42.3766, 40.5967 ];

NNormalizer.X = [ 570.2262, 1170.3953, 1770.5645, 2370.7337, 2970.9028, 3571.072, 4171.2412, 4771.4104, 5371.5795, 5971.7487 ];
NNormalizer.Y = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ];

TQ_CMDNormalizer.X = [ 0, 41.1111, 82.2222, 123.3333, 164.4444, 205.5556, 246.6667, 287.7778, 328.8889, 370 ];
TQ_CMDNormalizer.Y = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ];

Load_Table.X = [ 0, 41.1111, 82.2222, 123.3333, 164.4444, 205.5556, 246.6667, 287.7778, 328.8889, 370 ];
Load_Table.Y = [ 570.2262, 1170.3953, 1770.5645, 2370.7337, 2970.9028, 3571.072, 4171.2412, 4771.4104, 5371.5795, 5971.7487 ];
Load_Table.Z(1,:) = [ 0.10556, 0.27529, 0.44495, 0.62145, 0.79429, 0.95656, 1.1091, 1.2587, 1.4, 1.4 ];
Load_Table.Z(2,:) = [ 0.1081, 0.28363, 0.45389, 0.64229, 0.80744, 0.96558, 1.1114, 1.2593, 1.4, 1.4 ];
Load_Table.Z(3,:) = [ 0.10093, 0.2762, 0.46195, 0.63683, 0.80423, 0.96174, 1.1063, 1.2574, 1.4, 1.4 ];
Load_Table.Z(4,:) = [ 0.092364, 0.26557, 0.45308, 0.6264, 0.80925, 0.95873, 1.1058, 1.2566, 1.4, 1.4 ];
Load_Table.Z(5,:) = [ 0.091856, 0.26637, 0.44776, 0.62404, 0.79162, 0.94366, 1.0931, 1.242, 1.3834, 1.4 ];
Load_Table.Z(6,:) = [ 0.095109, 0.27027, 0.44694, 0.60875, 0.75612, 0.90794, 1.0595, 1.1988, 1.3504, 1.4 ];
Load_Table.Z(7,:) = [ 0.096229, 0.26719, 0.43791, 0.60001, 0.747, 0.89647, 1.0547, 1.1877, 1.3136, 1.4 ];
Load_Table.Z(8,:) = [ 0.096329, 0.26045, 0.42, 0.5767, 0.74889, 0.91095, 1.0721, 1.2422, 1.3543, 1.4 ];
Load_Table.Z(9,:) = [ 0.10063, 0.26285, 0.4241, 0.59337, 0.77382, 0.95096, 1.1143, 1.2733, 1.4, 1.4 ];
Load_Table.Z(10,:) = [ 0.11115, 0.27617, 0.4443, 0.61989, 0.80072, 0.97756, 1.1419, 1.2935, 1.4, 1.4 ];

