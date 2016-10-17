clear all
close all
clc

% Lecture 15 practical:

%% Colormaps and colorbars

[x, y, F] = peaks(25); % load a generic function from MATLAB

% plot the surface
figure;
surf(x,y,F); % surf(x-grid,y-grid, function(x,y))

xlabel('x'); ylabel('y'); zlabel('F(x,y)');

%% or plot the matrix with colorbar and label

x1 = x( 1, : ); % get the unique x-values
y1 = y( :, 1 ); % get the unique y-values

figure;
imagesc( x1, y1, F ); % imagesc(x-vector,y-vector, function(x,y))
axis xy;
xlabel('x'); ylabel('y'); 
c = colorbar; % make a colorbar and save a handle
c.Label.String = 'F(x,y)';
% or
% ylabel(c,'F(x,y)');


%% let's look at the colormap now

% more info at
% https://www.mathworks.com/help/matlab/ref/colormap.html?searchHighlight=colormap

clc; % clear command window

figure;
imagesc( x1, y1, F );
colormap % Each row defines a three-element RGB triplet.

%% change the colormap

figure;
imagesc( x1, y1, F );
colormap( jet ) % Each row defines a three-element RGB triplet.
colorbar;

%% change the colormap interval

figure;
imagesc( x1, y1, F );
colormap( jet( 10 ) ) % Each row defines a three-element RGB triplet.
colorbar;

% try changing the number inside of jet and look at the output

%% what about the axis the limits for the colorbar

figure;
imagesc( x1, y1, F );
colormap( jet ); % Each row defines a three-element RGB triplet.
colorbar;
caxis( [0 8] ); % caxis( [cmin cmax] )


