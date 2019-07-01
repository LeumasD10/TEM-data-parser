% Reads Excel Data and Stuff
% Written by Samuel Ma
% Groups primary particle diameters into clusters pertaining to each
% Image in each Image File.

%% Initialization and Declaration
clear all; close all;
manual = struct;    % Setting manual and PCM as objects for 
pcm = struct;

% MANUAL CODE -------------------------------------------------------------

%% Obtain and Parse Results from Manual
[n,p] = uigetfile({'*'},'Select Data for Manual Code');
path = [p n];
disp('Reading contents of File...');
manual.raw = readcell(path); disp('Data extracted.');

%% Parse each Image
% Number of rows of data minus the headers
rows = size(manual.raw,1)-1; 
% Image ID vector corresponding to all diameters in raw data
manual.id = manual.raw((2:size(manual.raw,1)),1);   
% Corresponding diameter vector for Image ID's
manual.diams_by_img_raw = manual.raw((2:size(manual.raw,1)),4);
% Corresponding aggregate identifier vector for diameters
manual.aggid_raw = manual.raw((2:size(manual.raw,1)),6);


disp('Parsing Data...');

% Sort diameters into groups based on the Image File they belong to
manual.diams_by_img = manmethods.sortimage(manual.diams_by_img_raw, ...
    manual.id, manual.aggid_raw, rows);

%% Parse each Aggregate in Each Image
% Every image file has its own primary particles belonging to a certain
% aggregate, we need to sort them into their corresponding aggregates
testarray = manual.diams_by_img{1,1};
testresult = sortAggregates(testarray);


%% Finished Parsing
disp('Parsing Complete');


%% Accessory Function
% Particles is a 2xn matrix, 1st row is diameters, 2nd row is its aggregate
% ID given from the Manual Code
% Returns an array of diameter groups pertaining to their aggregate
function arrayOfDiams = sortAggregates(particles)
    previousid = particles(2,1);
    container = [];
    arrayOfDiams = {};
    for i = 1:1:size(particles,2)
        idcurrent = particles(2,i);
        if isequal(idcurrent,previousid)
            container = [container, particles(1,i)];
        else
            arrayOfDiams = [arrayOfDiams, container];
            container = [particles(1,i)];
            previousid = idcurrent;
        end
    end
    
    if isequal(idcurrent,previousid)
        arrayOfDiams = [arrayOfDiams, container];
    end
end




