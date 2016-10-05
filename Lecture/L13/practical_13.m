clear all
close all
clc

% Lecture 13: Vectors, Dot product, Cross product, Gradient

%% Let's start with two real-valued vectors in the x-y plane

origin = [ 0, 0 ]; % think (x,y) components

A = [4, -1]; % think (x,y) components

B = [2, -2]; % think (x,y) components

% we can plot these two vectors
figure;
S = 0; % set to zero so that quiver does not automatically scale the vectors
quiver( origin(1), origin(2), A(1), A(2), S); hold on;
quiver( origin(1), origin(2), B(1), B(2), S); 
axis([-5 5 -5 5]); grid on; legend('A','B');

%% what is the unit vector for each of these?

Ahat = A ./ norm(A); % norm is the 'magnitude' of the vector = sqrt( x^2 + y^2 )
Bhat = B ./ norm(B);

% we can plot these two vectors
figure;
quiver( origin(1), origin(2), Ahat(1), Ahat(2), S); hold on;
quiver( origin(1), origin(2), Bhat(1), Bhat(2), S); 
axis([-1 1 -1 1]); grid on; title('Unit vectors'); legend('Ahat','Bhat');

%% What about adding/subtracting vectors

r = [1,1]; % think (x,y) components in (i,j) directions
r0 = [2,3]; % think (x,y) components in (i,j) directions
r2 = r + r0; 

figure;
quiver( origin(1), origin(2), r(1), r(2), S); hold on;
quiver( origin(1), origin(2), r0(1), r0(2), S );
quiver( origin(1), origin(2), r2(1), r2(2), S ); % total vector
quiver( r(1), r(2), r0(1), r0(2), S ); % or just start at r and add r0
axis([0 3.5 0 4.5]); grid on;
legend('r','r0','r2','r+r0','location','southeast');

%% The dot product (component multiplication)

% The dot product is defined as element-wise multiplication and then
% addition.

% C = A(1)*B(1) + A(2)*B(2)
% C = 8 + 2 = 10

C = dot(A,B)

%%

% order doesn't matter when A and B are real-valued: it is a linear operation

C = dot(B,A)

%% Make your own dot product

C = sum( A .* B )

%% How do we project one vector in another direction?

% In mathematical physics we use the dot product to project one vector into
% the direction of another unit vector. 

% Let's look at the component of vector B in the Ahat direction

C = dot(B,Ahat) .* Ahat;

% we can plot these two vectors
figure;
quiver( origin(1), origin(2), A(1), A(2), S); hold on;
quiver( origin(1), origin(2), B(1), B(2), S); 
quiver( origin(1), origin(2), C(1), C(2), S); 
axis([-5 5 -5 5]); grid on; legend('A','B', 'C');

%% let's do 3D space

origin = [0,0,0]; % think (x,y,z) components

A = [4 -1 2]; % think (x,y,z) components

B = [2 -2 -1]; % think (x,y,z) components

% we can plot these two vectors
figure;
quiver3( origin(1), origin(2), origin(3), A(1), A(2), A(3), S); hold on;
quiver3( origin(1), origin(2), origin(3), B(1), B(2), B(3), S); 
axis([-5 5 -5 5]); grid on; legend('A','B');
xlabel('x'); ylabel('y'); zlabel('z');

% We can then repeat computing the unit vectors and doing dot products,
% etc.

%% Dot product of matrices

% NOTE: Sometimes you will hear the dot product referred to as the inner
% project.

A = [      ...
    1 2 3; ...
    4 5 6; ...
    7 8 9  ...
    ];

B = [      ...
    9 8 7; ...
    6 5 4; ...
    3 2 1  ...
    ];

C = dot(A,B,1) % treats the columns of A and B as vectors and returns the dot products of corresponding columns.

% vs.

C = dot(A,B,2) % treats the rows of A and B as vectors and returns the dot products of corresponding rows.

%% The cross product of two vectors

% NOTE: Sometimes you will hear the dot product referred to as the inner
% project.

% let's go back to our simple vectors
A = [4 -1 2];
B = [2 -2 -1];

C = cross(A,B) % compute the C vector from cross product of A and B

%% 
% C is orthogonal to A and B

dot(A,C) == 0 & dot(B,C) == 0

%% 
% -------------------------------------------------------------------------
% The gradient
% -------------------------------------------------------------------------

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

[gradTi, gradTj] = gradient( -T ); % Then we compute the gradient

h = figure;
% plot the contours fo the function itself
contour( X, Y, T ); hold on; colormap(jet);
% plot the gradient field with vectors
quiver( X, Y, gradTi, gradTj, 'k' );
xlabel( 'x-axis' ); ylabel( 'y-axis' ); axis('tight');
c = colorbar;
title('$T \ and \ -\nabla T$', 'Interpreter', 'Latex');

%% plot background using colors and flip gradient sign so pointing in heat flow direction

h = figure;
% plot the contours fo the function itself
imagesc( xArray, yArray, T ); hold on; colormap(jet);
% plot the gradient field with vectors
quiver( X, Y, gradTi, gradTj, 'k' );
xlabel( 'x-axis' ); ylabel( 'y-axis' ); axis('tight');
c = colorbar;
title('$T \ and \ -\nabla T$', 'Interpreter', 'Latex');
