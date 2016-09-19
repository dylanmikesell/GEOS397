clear all
close all
clc


%% Mapping toolbox

% http://www.mathworks.com/products/mapping/

% MATLAB has "toolboxes" that are designed to aid specific tasks.
% For example, they have a signal processing toolbox, an optimization
% toolbox, a mapping toolbox, etc. The list goes on and on.

%% Make a worldmap with coastlines

worldmap('world');
load('coastlines'); % load built-in MATLAB data called coastlines
plotm(coastlat, coastlon);

% NOTE: plotm(), not plot(). This is a special version of plot for the
% Mapping toolbox.

%% Let's try another example and save the figure handle so we can change properties

h = worldmap('Europe');
getm(h,'MapProjection')
% For more on this projection stuff, look at the assigned reading for Week #4

% Here are all of the projections that matlab knows
% http://www.mathworks.com/help/map/summary-and-guide-to-projections.html

%% Let's add some data (shape files in this case)

geoshow( 'landareas.shp', 'FaceColor', [0.15 0.5 0.15] )
geoshow( 'worldlakes.shp', 'FaceColor', 'cyan' )
geoshow( 'worldrivers.shp', 'Color', 'blue' )
geoshow( 'worldcities.shp', 'Marker', '.', 'Color', 'red' )
                       
%% what's geoshow()

help geoshpw

%% add a label 

labelLat = 35;
labelLon = 14;
textm(labelLat, labelLon, 'Mediterranean Sea')

%% Let's look at global topography

load( 'topo.mat' ); % matlab knows where this file is

% show simple world map (no specific projection), add coastline
figure; 
pcolor( topo ); shading flat; 
axis image; colorbar;
hold on;
contour( topo, [0, 0], 'k' );

% How might we plot this data on a map instead of using pcolor()
