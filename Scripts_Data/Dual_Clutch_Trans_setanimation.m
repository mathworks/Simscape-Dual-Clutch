function Dual_Clutch_Trans_setanimation(enable)
% Copyright 2011-2020 The MathWorks, Inc.

var_str = 'To_Workspace';
if(strcmpi(enable,'on'))
    var_str = 'Show_VR';
end

temp_AnimSubSys = find_system(bdroot,'LookUnderMasks','all','Variants','AllVariants','FollowLinks','on','Name','Animation Data');

if(~isempty(temp_AnimSubSys))
    set_param(char(temp_AnimSubSys),'OverrideUsingVariant',var_str);
    vrblk = find_system(bdroot,'LookUnderMasks','all','Variants','AllVariants','FollowLinks','on','Name','VR Sink');
    if(~isempty(vrblk))
        if(strcmpi(enable,'on') && strcmp(get_param(temp_AnimSubSys,'ActiveVariant'),'Show_VR'))
            open_system(vrblk,'OpenFcn');
        end
        if(strcmpi(enable,'off'))
            close(vrgcf);
        end
    end
end
