clear all
close all
clc

% L21 practical: Polynomial interpolation

%% Part 2 -- power form of interpolation polynomial and coefficients

x = 0 : 3; % x_k
y = [-5, -6, -1, 16]; % y_k

disp( [ x; y ] ); % list the (x_k, y_k) pairs

%% build Vandermonde matrix and solve for coefficients

V = vander(x); % make the Vandermonde matrix
disp( V );

% Solve the linear system V*c=y for the coefficient vector c

c = V \ y'; % need to transpose y so the shape is correct

% The backslash means matrix division:
% https://www.mathworks.com/help/matlab/ref/mldivide.html
% Only valid for Ax=B type problems.

% If you have xA=B then use '/' operator
% https://www.mathworks.com/help/matlab/ref/mrdivide.html

disp(c);

%% interpolate to new x-grid using these coefficients

u = -0.25 : 0.2 : 3.25; % new x-grid

v = polyval( c, u);

figure;   
plot( x, y, 'o', u, v, '*-');
xlabel('x'); ylabel('P(x)');

%% Part 3 -- Lagrange interpolation

v = polyinterp( x, y, u);

figure;   
plot( x, y, 'o', u, v, '*-');

%% We can also do this with symbolic math

symx = sym( 'x' ); % make x a symbolic variable

P = polyinterp( x, y, symx );
   
pretty( P ); % print P(x)
   
P = simplify( P ); % make "power" form version of the polynomial
disp( P ); % display

%% Another example -- interpolation for plotting

x = 1 : 6;
y = [16 18 21 17 15 12];

figure; subplot(1,2,1)
plot( x, y, 'ok', x, y, '-r' ); axis([0 7 6 22]);
% The red line is plotted using piecewise linear interpolation by deafult

u = 0.75 : 0.05 : 6.25;
v = polyinterp( x, y, u ); % Lagrange interpolation with full-degree polynomial

subplot(1,2,2);
plot(x,y,'o',u,v,'r-'); axis([0 7 6 22])





