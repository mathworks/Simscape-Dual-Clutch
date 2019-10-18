% SCRIPT TO TEST ALL Dual_Clutch_Trans CONFIGURATIONS
% OR A SET OF SPECIFIC TESTS
% Copyright 2011 The MathWorks, Inc.

% SPECIFIC TESTS
%{
mdl_set = {'Dual_Clutch_Trans','Dual_Clutch_Trans'};
trans_config_set = {'Detailed','Abstracted'};
veh_config_set = {'Full','Simple'};
eng_config_set = {'Generic','Data Driven'};
solver_config_set = {'Desktop Settings','Real Time Settings'};
shiftmap_config_set = {'Orig Map','Orig Map'};
%}

% FULL TESTS
%{dd
mdl_opt = {'Dual_Clutch_Trans'};
trans_config_opts = {'Detailed','Abstracted'};
veh_config_opts = {'Full','Simple'};
%engine_config_opts = {'Generic','Data Driven'};
engine_config_opts = {'Data Driven'};
solver_config_opts = {'Desktop Settings','Real Time Settings'};
shiftmap_config_opts = {'Orig Map','Opt Map'};
run_ind = 0;
for i = 1:length(trans_config_opts)
    for j = 1:length(veh_config_opts)
        for k = 1:length(engine_config_opts)
            for l = 1:length(solver_config_opts)
                for m = 1:length(shiftmap_config_opts)
                    run_ind = run_ind + 1;
                    mdl_set{run_ind} = mdl_opt;
                    trans_config_set{run_ind} = trans_config_opts{i};
                    veh_config_set{run_ind} = veh_config_opts{j};
                    engine_config_set{run_ind} = engine_config_opts{k};
                    solver_config_set{run_ind} = solver_config_opts{l};
                    shiftmap_config_set{run_ind} = shiftmap_config_opts{m};
                end
            end
        end
    end
end
%}dd

for i=1:length(mdl_set)
    Data_Basename{i} = ['DCTRES_' char(trans_config_set{i}(1:3)) '_' char(veh_config_set{i}(1:3)) '_' char(engine_config_set{i}(1:3)) '_' char(solver_config_set{i}(1:3)) '_' char(shiftmap_config_set{i}(1:3)) ];
end

cd 'C:\SMILLER\TMW\Physical_Modeling\Demo_Materials\SMultiDom_Ex\Dual_Clutch_Trans'
addpath('SimResults')

for Run_Ind = 1:8
    Drive_Cycle_Num = Run_Ind;
    SimStopTime = eval(['max(UrbanCycle' num2str(Drive_Cycle_Num) '.time)']);
    for i = 1:length(mdl_set)
        mdl = char(mdl_set{i});
        load_system(mdl);
        %open_system(mdl);
        set_param([bdroot '/Dual Clutch Transmission'],'BlockChoice',char(trans_config_set{i}));
        set_param([bdroot '/Vehicle Dynamics'],'BlockChoice',char(veh_config_set{i}));
        set_param([bdroot '/Engine'],'BlockChoice',char(engine_config_set{i}));
        open_system([bdroot '/' char(solver_config_set{i})]);
        open_system([bdroot '/' char(shiftmap_config_set{i})]);
        
        %disp(['RUNNING ' mdl ', ' char(trans_config_set{i}) ', ' char(veh_config_set{i}) ', ' char(engine_config_set{i}) ', ' char(solver_config_set{i}) ' ON DRIVE CYCLE ' num2str(Drive_Cycle_Num) '...']);
        disp(['RUNNING ' mdl ', ' char(Data_Basename{i}) '_DC' num2str(Run_Ind)]);
        set_param(mdl,'StopTime',num2str(SimStopTime));
        %set_param(mdl,'StopTime','5'); % TO TEST LOOP
        sim(mdl);
        disp(['FINISHED RUNNING ' mdl ',' char(trans_config_set{i}) ' ON DRIVE CYCLE ' num2str(Drive_Cycle_Num) ]);
        disp(' ');
        
        DATA_vars = whos('*_DATA');
        DATA_names = cellstr(char(DATA_vars.name));
        for j=1:length(DATA_names)
            DATA_Field_Name = strrep(char(DATA_names{j}), '_DATA','');
            eval([char(Data_Basename{i}) '_DC' num2str(Run_Ind) '.' DATA_Field_Name '=' char(DATA_names{j}) ';']);
            clear(char(DATA_names{j}));
        end
        eval([char(Data_Basename{i}) '_DC' num2str(Run_Ind) '.Elapsed_Sim_Time = Elapsed_Sim_Time;']);
        eval([char(Data_Basename{i}) '_DC' num2str(Run_Ind) '.Fuel_Used_Liters = FuelUsedLiters;']);
        
        % SAVE FILE
        save(['./SimResults/' char(Data_Basename{i}) '_DC' num2str(Drive_Cycle_Num) '.mat'], [char(Data_Basename{i}) '_DC' num2str(Run_Ind)]);
        clear([char(Data_Basename{i}) '_DC' num2str(Run_Ind)])
    end
    
    %eval(['load DCT_ORIG_DC' num2str(Drive_Cycle_Num)]);
    %Plot_DCT_Results2
    
end
