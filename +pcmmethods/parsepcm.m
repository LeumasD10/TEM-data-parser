function [pcm] = parsepcm()
%PARSEPCM Obtains, parses, and returns a pcm struct of data
%   Prompts user for a PCM Results spreadsheet and parses it.
%   Returns an array of dp measurements from PCM
%   WARNING: The spreadsheet cannot have an empty column, please remove it
%   prior to use.

pcm = struct;


%% Obtain and Parse Results from PCM
[n,p] = uigetfile({'*'},'Select Data for PCM Code');
path = [p n];
disp('Reading contents of File...');
pcm.raw = readcell(path); disp('Data extracted.');

%% Parse File Contents
% Primary particle diameters
pcm.dpsim = transpose(pcm.raw((2:end),9));
pcm.dpgen = transpose(pcm.raw((2:end),10));

%% Finished Parsing
disp('Parsing Complete');

end

