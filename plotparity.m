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
man.dp = transpose(cell2mat(raw((2:end),4)));
man.dev = transpose(cell2mat(raw((2:end),5)));

%% Plot Results
hold on;

% Plot Simplified PCM
errorbar(man.dp,pcm.sim,man.dev,man.dev, ...
    'Horizontal','r.','MarkerSize',20);

% Compute line of best fit starting at origin
% y = ax, a = x\y to solve linear system
a = man.dp'\pcm.sim';
% Concatenate origin to best fit data set
fitx = [0 man.dp];
fity = [0 a*man.dp];
plot(fitx,fity,'r');

% Plot Generalized PCM
errorbar(man.dp,pcm.gen,man.dev,man.dev, ...
    'Horizontal','k.','MarkerSize',20);

% Compute line of best fit starting at origin
% y = ax, a = x\y to solve linear system
a = man.dp'\pcm.gen';
% Concatenate origin to best fit data set
fitx = [0 man.dp];
fity = [0 a*man.dp];
plot(fitx,fity,'k');

% Plot a 1:1 relation
maxval = max([pcm.sim,pcm.gen,man.dp]);
y = 0:1:maxval;
x = y;
plot(x,y);

xlabel('Manual dp (nm)');
ylabel('Method dp (nm)');
title('Parity Plot of Select Method dp Against Manual dp Sizing');
legend({'PCM Simplified Data and STDEV', ...
    'PCM Simplified Best Fit Line', ... 
    'PCM General Data and STDEV', ...
    'PCM General Best Fit Line' ...
    '1:1 Idealized Reference'}, ... 
    'Location','southeast');

