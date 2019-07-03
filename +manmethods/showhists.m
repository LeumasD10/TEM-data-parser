function showhists(histgroups)
%UNTITLED Summary of this function goes here
%   Displays every entry in the cell array as a histogram
for i = 1:1:size(histgroups,2)
    histogram(histgroups{i});
end
end

