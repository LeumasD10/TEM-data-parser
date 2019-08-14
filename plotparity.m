close all; clear all;

%% Obtain parity plot data
[n,p] = uigetfile('*','Choose Excel File of Parity Plot');
parity = struct;

% Parse Excel Data File
raw = readcell([p,n]);

%% Assign Vectors for Plottable Information
pcm = struct; man = struct;

pcm.sim = transpose(cell2mat(raw((2:end),1)));
pcm.gen = transpose(cell2mat(raw((2:end),2)));
man.dp = transpose(cell2mat(raw((2:end),3)));
man.dev = transpose(cell2mat(raw((2:end),4)));

%% Plot Results
hold on;

% Plot Simplified PCM
pcm.simplot = errorbar(man.dp,pcm.sim,man.dev,man.dev, ...
    'Horizontal','r^','MarkerSize',5);

% Plot Generalized PCM
pcm.genplot = errorbar(man.dp,pcm.gen,man.dev,man.dev, ...
    'Horizontal','kd','MarkerSize',5);

% Compute line of best fit starting at origin
% y = ax, a = x\y to solve linear system
% a is a struct to store slopes of general and simplified as fields
a = struct;     

% PCM Simplified
a.pcmsim = man.dp'\pcm.sim';
% Concatenate origin to best fit data set
fitx = [0 man.dp];
fity = [0 a.pcmsim*man.dp];
pcm.simfit = plot(fitx,fity,'r');

%PCM General
a.pcmgen = man.dp'\pcm.gen';
% Concatenate origin to best fit data set
fitx = [0 man.dp];
fity = [0 a.pcmgen*man.dp];
pcm.genfit = plot(fitx,fity,'k');

% Plot a 1:1 relation
maxval = max([pcm.sim,pcm.gen,man.dp]);
y = 0:1:maxval;
x = y;
man.ideal = plot(x,y);

dim = [.15 .6 .3 .3];
str = 'Error Bars are 95% Confidence Intervals';
annotation('textbox',dim,'String',str,'FitBoxToText','on');

xlabel('Manual dp Measure (nm)');
ylabel('Automated dp Measure (nm)');
title('Comparison of Automated and Manual Particle Sizing');
legend([pcm.simplot,pcm.genplot,man.ideal], ... 
    {'PCM Simplified','PCM Generalized','1:1 Reference'}, ...
    'Location','Southeast');

