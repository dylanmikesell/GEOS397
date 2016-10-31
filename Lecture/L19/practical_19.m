clear all
close all
clc

% L19 practical: polynomial curve fitting, roots, statistics and
% interpolation

addpath('./ncm'); % add the GUItools for root finding!

%% Part 3 - review polynomials

order = 2;
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

%% Part 4: roots of polynomials (disc. > 0)

clc; % clear the command window

x = 0 : 0.1 : 5; % make an x-vector
y = x.^2 - 6*x + 8; % our function f(x) or y(x)

figure;

plot( x, y, 'k' ); xlabel('x'); ylabel('y(x)'); grid on;
hold on;
plot([x(1) x(end)],[0 0],'k');

P = [1, -6, 8 ];
roots( P )

%% (disc. < 0) --> two complex roots 

x = -5 : 0.1 : 5;
y = 4*x.^2 - 2*x + 6;

figure;

plot( x, y, 'k' ); xlabel('x'); ylabel('y(x)'); grid on;
hold on;
plot([x(1) x(end)],[0 0],'k');

P = [4, -2, 6 ];
roots( P )

%% higher order polynomial

x = -5 : 0.1 : 6;
y = x.^4 - 23*x.^2 - 18*x + 40;

figure;

plot( x, y, 'k' ); xlabel('x'); ylabel('y(x)'); grid on;
hold on;
plot([x(1) x(end)],[0 0],'k');

P = [1, 0, -23, -18, 40 ];
roots( P )

%% Bisection method to find a value

% our function is f(x) = x^2 = 2
% our interval is x=[1,2] and we looking for x=2^(1/2)
format long

a = 1; % start of interval
b = 2; % end of interval
k = 0; % a counter to tell us how many iterations we have made
while b-a > eps
    
    k = k + 1; % update the counter

    x = (a + b) / 2; % compute the midpoint
    fprintf('x = %0.15f\n',x);

    % compare current x value to actual function
    if x^2 > 2
        b = x; % reset the upper bound
    else
        a = x; % reset the lower bound
    end
end

sqrt(2)

%% Now use bisection to find roots of a function

% We might not be able to actually find a point where f(x) is exactly zero.
% Our goal is as follows: 
%   Find a very small interval, perhaps two successive floating-point
%   numbers, on which the function changes sign. 
%
% The Matlab code for bisection is 

f = @(x) x.^2 - 6*x + 8; % our function f(x)

% Let's find the root x=2
a = 1;
b = 3;

k = 0;
while abs(b-a) > eps*abs(b)
    
    x = (a + b)/2; % compute the midpoint
    fprintf('x = %0.15f\n',x);

    if sign(f(x)) == sign(f(b)) % test if both are positive or ne
        b = x;
    else
        a = x;
    end
    k = k + 1;
end

% Bisection is slow. With the termination condition in the above code, it
% always takes 52 steps for any function. But it is completely reliable. If
% we can find a starting interval with a change of sign, then bisection
% cannot fail to reduce that interval to two successive floating-point
% numbers that bracket the desired result.    

%% Let's use MATLAB's function fzerotx()

% This is a textbook example of fzero(). We give it a function and we give
% it the interval [a,b].

J0 = @(x) besselj( 0, x ); % Make a function. We are making a zero order bessel function

for n = 1 : 10 % find the first ten roots (we know they are spaced roughly pi apart, hence we change a,b for each root)
    a = (n-1) * pi;
    b = n * pi;
    z(n) = fzerotx( J0, [a,b] );
end

% compute the actual bessel function
x = 0 : pi/50 : 10*pi;
y = J0(x);

% plot the zero
plot( z, zeros(1,10), 'o'); hold on; % plot the roots
plot( x, y, '-' ); grid on;% plot the continuous function
axis('tight');

%% try the fzeroGUI() to see how fzero uses the different methods

% find the first root between zero and pi
a = 0;
b = 3.83;

fzerogui( J0, [a,b] );

%% now just try fzero()

myZero = fzero( J0, pi )
% This will find the zero closest to pi, which should be the first zero

%% for optimization problems, you can use fmin()
% to find the minimum value of a function instead of the root.

%%

f = @(x) x.^3 - 2*x - 5;

% f(x)= x.^3 - 2*x - 5;

%%

f = @(x) 1/(x-pi);
z = fzerotx( f, [0,5] )



