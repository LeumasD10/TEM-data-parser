function sorteddp = sortdp(id,dp)
%SORTDP Sorts primary particle diameter by aggregate
%   Function can determine which aggregate "group" the dp belongs to by its
%   associated id.
%   ASSUME: id and dp are one to one in terms of correspondence

sorteddp = {};  % Group of arrays to be filled  
acc = [];       % Accumulator for arrays in for loop

%% Pre-loop conditions
previousid = id(1,1);
rows = size(id,1);

%% Processing Loop
% For every id encountered, if it is equal to the previous id encountered,
% add its corresponding dp into the acccumulator.  If id is different, add
% accumulator value into sorteddp array, add the dp of the new aggregate
% into a cleared accumulator and move on.
for i = 1:1:rows
    currentid = id(i,1);
    currentdp = dp(i,1);
    dpval = currentdp{1};
    if isequal(previousid,currentid)
        acc = [acc, dpval];
    else
        previousid = currentid;
        sorteddp = [sorteddp, acc];
        acc = [dpval];
    end
end

% Add whatever was left in the accumulator into the sorteddp as it has
% reached the end of the file
sorteddp = [sorteddp, acc];

end

