function [stdevs] = finddevs(dps)
%FINDMEANS Finds the standard deviations of the distributions and returns 
%it into an array of standard deviations

cols = size(dps,2);
stdevs = zeros(1,cols);

for i = 1:1:cols
    stdevs(1,i) = std(dps{1,i});
end

end

