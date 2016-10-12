clear all
close all
clc

% Lecture 12 practical: Derivatives and gradients

% Error in the finite difference methods

% Our function is f(x) = e^x
% Let's look at f'(0)=1

h = 0.0001; % our space step
forwardFD  = ( exp(h) - exp(0) ) / h % forward finite difference

backwardFD = ( exp(0) - exp(-h) ) / h % backward finite difference

centeredFD = ( exp(h) - exp(-h) ) / (2*h) % centered finite difference

%% Let's look at the forward difference plotted for different h values

hArray = logspace( -14, 0, 100 ); % build a vector in log space, rather than linear space (e.g. linspace)

forwardArray = ( exp(hArray) - exp(0) ) ./ hArray;

figure;
loglog( hArray, abs( forwardArray - 1 ) ); % plot the error (e.g. |approx-real| )
xlabel('h'); ylabel('error in forward difference');

%% For students: Why does error go up after a certain h

% Time to introduce machine epsilon

% The largest number in MATLAB is 
realmax

% The smallest number in MATLAB is
realmin

% But how close can two numbers be?? That number is eps

% In MATLAB, the closest two numbers can be is defined by the general
% parameter 'eps', known in computing as 'machine epsilon'.

% Machine epsilon is defined to be the smallest positive number which, when
% added to 1, gives a number different from 1 

%% Student activity -- compute machine epsilon on your own

% eps is defined to be the smallest number where the relationship 
% (1+eps) - 1 ~= 0
% is true.

% Use a _while_ loop and start computing (1+eps)-1, where eps=2^(-k), and
% increment k until (1+eps)-1=0. When your while loop stops, this gives the
% k value where this equality is zero. So go back one k can you have eps.

%  start at k=1

% Question: What is k and the epsilon you compute?

k = 1;
eps1 = 2^(-k);
while ( (1+eps1) - 1 ~= 0 )
    k = k + 1;
    eps1 = 2^(-k);
end

disp(k-1)
eps1 = 2^(-(k-1));
disp(eps1)
disp(eps)

%% Let's go back to the finite difference plot

figure;
loglog( hArray, abs( forwardArray - 1 ) ); % plot the error (e.g. |approx-real| )
xlabel('h'); ylabel('error in forward difference');

% The minimum is not at 10-16; the minimum occurs at 10-8. Why?
% We see that the error decreases in a straight line with slope 1, until h
% = 10?8. If h is decreased even further, the error goes up again. 

% Let's look at the second order term in the Taylor expansion
%
% f(x+h) = f(x) + h*f'(x) + (h^2/2)*f"(zeta), where zeta is any value in
%
% the interval of [x, x+h]. If we rewrite in terms of the first derivative
% we get 
%
% f'(x) = ( f(x+h) - f(x) ) / h + (h/2)*f"(zeta).
% 
% This means that the error is (h/2)*f"(zeta). If h is very small, then
% f"(zeta) = f"(x), which is almost constant. So the error is linear with
% h, and actually h/2. But that only explains the right hand side of the
% plot. 
%
% What is happening on the left-hand side?
%
% Another source of error is the floating-point arithmethic. Remember that
% two numbers can only be as close as machine epsilon to each out. In our
% example we are comparing (e^h-1)/h. Remember that the number e^h has to
% be rounded to the nearest floating point number, which gives an error of
% e^h*eps \approx eps. The error in this expression due to floating-point
% arithmetic accuracy is then eps/h. 
%
% The total error is therefore h/2 + eps/h. We can set these two equal and
% solve for h to find the optimal h. 
%
% h/2 = eps/h --> h^2 = 2*eps --> h = sqrt(2*eps) --> 2.1073e-08
% 



%% Let's look at all 3

backwardArray = ( exp(0) - exp(-hArray) ) ./ hArray;

centeredArray = ( exp(hArray) - exp(-hArray) ) ./ (2*hArray);

figure;
loglog( hArray, abs( forwardArray - 1 ) ); hold on;
loglog( hArray, abs( backwardArray - 1 ) );
loglog( hArray, abs( centeredArray - 1 ) );
legend('forward','backward','centered','location','southwest'); legend boxoff;
xlabel('h'); ylabel('error in finite difference');
title('FD methods');

% On the right hand side the error behave differently
% 
% a) forward and backward errors decrease linearly
% b) centered errors decrease quadratically


%% ------------------------------------------------------------------------
% The gradient -- need to know vectors

% Review vectors and gradients on board

S = 0; % set to zero so that quiver does not automatically scale the vectors

origin = [0,0]; % think (x,y) components

r = [1,1]; % think (x,y) components in (i,j) directions

figure;
quiver( origin(1), origin(2), r(1), r(2), S); hold on;
axis([0 5 0 5]); grid on;

%% make another vector

r0 = [2,3]; % think (x,y) components in (i,j) directions

quiver( origin(1), origin(2), r0(1), r0(2), S );

%% let's add these vectors

r2 = r + r0; 

quiver( origin(1), origin(2), r2(1), r2(2), S ); % total vector

quiver( r(1), r(2), r0(1), r0(2), S ); % or just start at r and add r0

%% Now do some gradient work on the board

%% Here is our function, compute the partial derivative with repsect to X

% F = X.*exp( -X.^2 - Y.^2 );

%% Here is our function, compute the partial derivative with repsect to Y

% F = X.*exp( -X.^2 - Y.^2 );


%% Compute the gradient of the function after doing it analytically

% gradFi(x, y) = exp(- x^2 - y^2) - 2*x^2*exp(- x^2 - y^2)
% gradFj(x, y) = -2*x*y*exp(- x^2 - y^2)

% The range of x and y variables
xArray = -2 : 0.2 : 2;
yArray = -2 : 0.2 : 2;

[X, Y] = meshgrid( xArray, yArray ); % make X-Y grid

gradTi = exp(-X.^2 - Y.^2) - 2*X.^2.*exp(-X.^2 - Y.^2);
gradTj = -2*X.*Y.*exp(-X.^2 - Y.^2);

h = figure;
quiver( X, Y, gradTi, gradTj );
xlabel( 'x-axis' ); ylabel( 'y-axis' ); axis('tight');
title('$\nabla T = \left(e^{(- x^2 - y^2)} - 2x^{2}e^{(- x^2 - y^2)}\right){\hat \imath} + \left( -2xye^{(- x^2 - y^2)}\right){\hat \jmath}$', 'Interpreter', 'Latex');

%% Use the numeric gradient operator implementation instead

% First we need to compute the actual scalar field
T = X.*exp( -X.^2 - Y.^2 );

[gradTi, gradTj] = gradient( T ); % Then we compute the gradient

h = figure;
% plot the contours fo the function itself
contour( X, Y, T ); hold on;
% plot the gradient field with vectors
quiver( X, Y, gradTi, gradTj );
xlabel( 'x-axis' ); ylabel( 'y-axis' ); axis('tight');
c = colorbar;
title('$T \ and \ \nabla T$', 'Interpreter', 'Latex');

%% plot background using colors and flip gradient sign so pointing in heat flow direction

h = figure;
% plot the contours fo the function itself
imagesc( xArray, yArray, T ); hold on; colormap(jet);
% plot the gradient field with vectors
quiver( X, Y, -gradTi, -gradTj );
xlabel( 'x-axis' ); ylabel( 'y-axis' ); axis('tight');
c = colorbar;
title('$T \ and \ -\nabla T$', 'Interpreter', 'Latex');
