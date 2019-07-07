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
    '.','MarkerSize',20);

% Plot a 1:1 relation
maxval = max([pcm.sim,pcm.gen,man.dp]);
y = 0:1:maxval;
x = y;
plot(x,y);


legend({'PCM Simplified','1:1 Idealized Reference'}, ... 
    'Location','southeast');

