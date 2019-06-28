% Reads Excel Data and Stuff
% Written by Samuel Ma
% Groups primary particle diameters into clusters pertaining to each
% aggregate in each Image File.

%% Initialization and Declaration
clear all; close all;
manual = struct;    % Setting manual and PCM as objects for 
pcm = struct;

% MANUAL CODE -------------------------------------------------------------

%% Obtain and Parse Results from Manual
[n,p] = uigetfile({'*'},'Select Data for Manual Code');
path = [p n];
manual.raw = readcell(path);

%% Parse each aggregate
rows = size(manual.raw,1)-1;
agg_num = 1;
manual.id = manual.raw((2:size(manual.raw,1)),1);
agg_current = manual.id(1,1);
manual.diams_raw = manual.raw((2:size(manual.raw,1)),4);

% Temporary Containers
manual.diams = [];
container = zeros(1,rows);

disp('Parsing Data');

% Reads the ID and clusters all corresponding diameters belonging to the
% Image ID into separate entries in the manual.diams array.
for i = 1:1:rows
    if isequal(manual.id(i,1),agg_current)
        current_diam = manual.diams_raw(i,1);
        container(1,i) = current_diam{1};
    else
        manual.diams = [manual.diams, container];
        container = zeros(1,rows);
        agg_num = agg_num + 1;
    end
end

if agg_num == 1
    manual.diams = [manual.diams, container];
end

disp('Parsing Complete');


