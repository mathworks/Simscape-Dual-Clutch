function Dual_Clutch_Trans_setanimation(enable)
% Copyright 2011-2024 The MathWorks, Inc.

var_str = 'Disable';
if(strcmpi(enable,'on'))
    var_str = 'Enable';
end

set_param([bdroot '/Dual Clutch Transmission/Detailed'],'popup_onoff',var_str);

vrblk = [bdroot '/Dual Clutch Transmission/Detailed/Animation Data/Show VR/VR Sink'];
if(strcmpi(enable,'on'))
    open_system(vrblk,'OpenFcn');
end
if(strcmpi(enable,'off'))
    close(vrgcf);
end
