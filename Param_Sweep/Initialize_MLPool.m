% Copyright 2011-2016 The MathWorks, Inc.

warning off
parfor i = 1:2
    out{i} = sim(mdl,SimSettings{i});
end
warning on
