function [arrf] = trimarray(arr)
%TRIMARRAY Trims the matrix of any 0 entries in the first row
%   arr is a 2xn matrix

arrf = [];

for i = 1:1:size(arr,2)
    if arr(1,i) ~= 0
        arrf = [arrf arr(:,i)];
    end
end

end

