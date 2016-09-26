clear all
close all
clc

%% Let's look at global topography

% http://www.mathworks.com/help/matlab/examples/displaying-topographic-data.html

load( 'topo.mat' ); % matlab knows where this file is

% show simple world map (no specific projection), add coastline
figure; 
pcolor( topo ); shading flat; 
axis image; colorbar;
hold on;
contour( topo, [0, 0], 'k' ); % build my own coastlines by loopking at 0 elevation contour

% How might we plot this data on a map instead of using pcolor()

%% What about plotting on sphere

[x,y,z] = sphere(50);          % create a sphere 
s = surface(x,y,z);            % plot spherical surface

s.CData = topo;                % set color data to topographic data
s.FaceColor = 'texturemap';    % use texture mapping
% s.EdgeColor = 'none';          % remove edges
% s.FaceLighting = 'gouraud';    % preferred lighting for curved surfaces
% s.SpecularStrength = 0.4;      % change the strength of the reflected light

% light('Position',[-1 0 1])     % add a light

axis square off                % set axis to square and remove axis
view([-30,30])                 % set the viewing angle
demcmap(topo); % give it a better colormap

%% Mapping toolbox

% http://www.mathworks.com/products/mapping/

% MATLAB has "toolboxes" that are designed to aid specific tasks.
% For example, they have a signal processing toolbox, an optimization
% toolbox, a mapping toolbox, etc. The list goes on and on.

%% Make a worldmap with coastlines

h = worldmap('world');
getm(h,'MapProjection')
load('coastlines'); % load built-in MATLAB data called coastlines
plotm(coastlat, coastlon);
% framem on; gridm on;

% NOTE: plotm(), not plot(). This is a special version of plot for the
% Mapping toolbox.

% what about our topo map?

% http://www.mathworks.com/help/map/vector-and-raster-map-display.html
LAT = topolatlim(1):topolatlim(2);
LON =  topolonlim(1):topolonlim(2);

idx180 = find(LON > 180, 1); % find first index of longitude array that is larger than 180 deg 
LON(idx180:end) = LON(idx180:end) - 360; % subtract 360 degrees to make lon interval [-180 180] instead of [0 360] 

[lon, lat] = meshgrid(LON,LAT); % compute the lat/lon of every grid point in topo
pcolorm(lat,lon,topo); % plot the matrix of elevations on the map
demcmap(topo); % give it a better colormap

% Can make contours on maps as well
% http://www.mathworks.com/help/map/ref/contourm.html
%
% and in 3D
% http://www.mathworks.com/help/map/ref/contour3m.html

%% Terrain data sources

% http://www.mathworks.com/help/map/sources-of-terrain-data.html

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

help geoshow

%% add a label 

labelLat = 35;
labelLon = 14;
textm(labelLat, labelLon, 'Mediterranean Sea')

