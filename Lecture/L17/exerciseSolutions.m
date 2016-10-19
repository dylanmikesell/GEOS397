clear all
close all
clc

% Class exercises

%% Integration

%% 1

f = @(y) sqrt( y + 1 );
Qi = integral( f, 0, 3, 'AbsTol', 1.e-4 )

%% 2

f = @(r) (5*r) ./ sqrt( 4 + r.^2 ).^2;
Qi = integral( f, -1, 1, 'AbsTol', 1.e-4 )

%% 3

f = @(theta) ( cos(2*theta).^(-3) ) .* sin(2*theta);
Qi = integral( f, 0, pi/6, 'AbsTol', 1.e-4 )

%% 4

f = @(x) exp(sin(x)) .* cos(x);
Qi = integral( f, 0, pi/2, 'AbsTol', 1.e-4 )

%% 5

f = @(x) 2*x .* exp(x.^2) .* cos( exp(x.^2) );
Qi = integral( f, 0, sqrt(log(pi)), 'AbsTol', 1.e-4 )

%% 6

f = @(y) 1 ./ ( 2*sqrt(y) .* (1 + sqrt(y)).^2 );
Qi = integral( f, 0, 4, 'AbsTol', 1.e-4 )

% Qi = 2/3



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


