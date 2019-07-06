% Reads Excel Data and Stuff
% Written by Samuel Ma
% Groups primary particle diameters into clusters pertaining to each
% Image in each Image File.

%% Initialization and Declaration
clear all; close all;
manual = struct;    % Setting manual and PCM as objects for 
pcm = struct;

%% Manual Processing
manual = manmethods.parsemanual();
manual.dpmeans = manmethods.findmeans(manual.sorteddp);
manual.dpdevs = manmethods.finddevs(manual.sorteddp);

%% PCM Processing
pcm = pcmmethods.parsepcm();




