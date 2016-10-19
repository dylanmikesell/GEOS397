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
colormap(jet)
xlabel('x'); ylabel('y'); zlabel('F(x,y)');

%% add 10 to F

F = F + 10;

% plot the surface
figure;
surf(x,y,F); % surf(x-grid,y-grid, function(x,y))
hold on;
imagesc( x1, y1, F ); % imagesc(x-vector,y-vector, function(x,y))
xlabel('x'); ylabel('y'); zlabel('F(x,y)');
colormap(jet)

%% Integration

f = @(theta) ( cos(2*theta).^(-3) ) .* sin(2*theta);

Qi = integral( f, 0, pi/6, 'AbsTol', 1.e-2 );


%% Air temp

x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
T = [63, 65, 66, 68, 70, 69, 68, 68, 65, 64, 62, 58, 55];

Tav = mean(T)

% Trapezoid rule
h = 1;
Ttrap = h/2 * (T(1) + T(end) + sum( 2*T(2:end-1) ) );
Tav2 = 1/(x(end)-x(1)) * Ttrap

Ttrapz = trapz(x,T);
Tav3 = 1/(x(end)-x(1)) * Ttrapz


