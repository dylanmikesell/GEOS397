clear all
close all
clc

% load the data
fid = fopen('dipData.txt');
header = fgetl(fid);
% strike, dip, dip_direction
cnt = 0;
while ~feof(fid)
    cnt = cnt + 1;
    strike(cnt)    = str2double(fgetl(fid));
    dip(cnt)       = str2double(fgetl(fid));
    direction{cnt} = strtrim( fgetl(fid) );
end
fclose(fid);

%% now plot
close all

% Create your own rose diagram showing the frequency distribution of strike
% azimuths of fractures. 

nBins = 360/20;

h = figure;
% plot the strike
subplot(1,2,1)
% polarhistogram(strike,nBins);
p1 = rose(strike,nBins);
title('strike');
view(90, -90);
% plot the dip
subplot(1,2,2)
% polarhistogram(dip,nBins);
rose(dip,nBins);
title('dip');

%%

% make another version and change some of the properties
h = figure;
% plot the strike
subplot(1,2,1)
p1 = polarhistogram(strike,nBins);
title('strike');
p1.DisplayStyle = 'stairs';
% plot the dip
subplot(1,2,2)
p2 = polarhistogram(dip,nBins,'FaceColor','red','FaceAlpha',0.3);
title('dip');
% p2.ThetaDir = 'clockwise';
p2.Parent.ThetaDir = 'clockwise';
p2.Parent.ThetaZeroLocation = 'top';
p2.Parent.RLim = [0 15];


%% Let's look at spider plots now

% % trace element vector
% traceElements = {'Rb','Sr','Ni','Zr','Pb','U','Sm'};
% 
% % rock type vector
% rockTypes = {'Peridotite','Basalt','Granite','Shale'};
% 
% elementData = transpose(reshape(data,numel(traceElements),numel(rockTypes)));
% elementData = elementData * 100;

load('spider_data.mat');

axes_interval = 4; % number of radial contours

h = figure;
spider_plot(log10(elementData), traceElements, axes_interval,'Marker','o');
legend(rockTypes,'Location','northeastoutside');

h = figure;
plot(log10(elementData)','-o');
p1 = gca;
p1.XTickLabel = traceElements;
legend(rockTypes);
xlabel('Element'); ylabel('log_{10}(Rock/primitive mantle)');

%% Let's look at ternary plots

addpath('./alchemyst-ternplot/');
% This is for 2D ternary plots from 
% https://www.mathworks.com/matlabcentral/fileexchange/2299-alchemyst-ternplot


Al2O3 = [0, 5,10,10,2,2,1,1,3,2,1,3,1,3,1,0,0,.10,.275,.500,.075,.50,.025,.20];
ZrO2  = [2,40,40,45,2,2,2,2,2,2,2,2,0,0,0,1,0,.60,.450,.175,.325,.25,.450,.55];
SiO2  = [2,55,50,45,2,0,2,3,2,3,4,3,2,2,0,0,1,.30,.275,.325,.600,.25,.525,.25];

figure;
ternplot(Al2O3,ZrO2,SiO2, 'o','majors', 5);
ternlabel('Al2O3', 'ZrO2', 'SiO2');

% figure;
nBins = 10;
nColors = 20;
ternplot_pro(Al2O3,ZrO2,SiO2,nBins,nColors);
ternlabel('Al2O3', 'ZrO2', 'SiO2');


