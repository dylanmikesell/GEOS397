clear all
close all
clc

% Class exercises

%% Plotting

[x, y, F] = peaks(40); % load a generic function from MATLAB

x1 = x( 1, : ); % get the unique x-values
y1 = y( :, 1 ); % get the unique y-values

% plot the surface
figure;
surf(x,y,F); % surf(x-grid,y-grid, function(x,y))
hold on;
imagesc( x1, y1, F ); % imagesc(x-vector,y-vector, function(x,y))
xlabel('x'); ylabel('y'); zlabel('F(x,y)');

%% add 10 to F

F = F + 10;

% plot the surface
figure;
surf(x,y,F); % surf(x-grid,y-grid, function(x,y))
hold on;
imagesc( x1, y1, F ); % imagesc(x-vector,y-vector, function(x,y))
xlabel('x'); ylabel('y'); zlabel('F(x,y)');


%% Integration

f = @(theta) ( cos(2*theta).^(-3) ) .* sin(2*theta);

Qi = integral( f, 0, pi/6, 'AbsTol', 1.e-2 );