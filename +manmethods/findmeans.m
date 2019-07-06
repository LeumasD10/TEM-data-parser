function [means] = findmeans(dps)
%FINDMEANS Finds the means of the distributions and returns it into an
%array of means

cols = size(dps,2);
means = zeros(1,cols);

for i = 1:1:cols
    means(1,i) = mean(dps{1,i});
end

end

