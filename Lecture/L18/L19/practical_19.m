clear all
close all
clc

% L19 practical: polynomial curve fitting, roots, statistics and
% interpolation

order = 20;
x = 0 : 0.15 : 5;
y = 5 .* sqrt(x) - 1.5 .* x; % we have x^(1/2) now

p = polyfit( x, y, order );
yFit = polyval( p, x );

figure;
plot( x, y, 'ko' ); hold on;
plot( x, yFit, 'r+' );

xlabel('x'); ylabel('y(x)');

% Increasing the order of the polynomial allows for more complex curves to
% be fit 

% Be careful to not over-fit your data!

% MATLAB will give a warning if the result is poorly conditioned (try
% order=20) 
