function manual = parsemanual()
%PARSEMANUAL Obtains, parses, and returns a manual struct of data
%   Prompts user for a Manual Sizing Results spreadsheet and parses it.
%   Returns a struct for manual including the raw data, id's, dp's, and a
%   sorted dp cell array by aggregate.
%   WARNING: The spreadsheet cannot have an empty column, please remove it
%   prior to use.

manual = struct;    % Manual is a struct

%% Obtain and Parse Results from Manual
[n,p] = uigetfile({'*'},'Select Data for Manual Code');
path = [p n];
disp('Reading contents of File...');
manual.raw = readcell(path); disp('Data extracted.');

%% Parse File Contents
% Number of rows of data minus the headers
rows = size(manual.raw,1)-1; 

% BOTH VECTORS BELOW ARE COLUMN VECTORS
% Aggregate ID vector to assist in grouping primary particle data by the
% aggregate it belongs to
manual.id = manual.raw((2:end),6);
% Primary particle diameters
manual.dp = manual.raw((2:end),4);

%% Group Primary Particle Diameters by Aggregate
manual.sorteddp = manmethods.sortdp(manual.id,manual.dp);

%% Finished Parsing
disp('Parsing Complete');

end

