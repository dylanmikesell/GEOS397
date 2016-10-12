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
colormap( jet( 30 ) ) % Each row defines a three-element RGB triplet.
colorbar;

% try changing the number inside of jet and look at the output

%% what about the axis the limits for the colorbar

figure;
imagesc( x1, y1, F );
colormap( jet ); % Each row defines a three-element RGB triplet.
colorbar;
caxis( [-10 30] ); % caxis( [cmin cmax] )





%%
%--------------------------------------------------------------------------
% Numerical integration
%--------------------------------------------------------------------------

addpath('./ncm'); % tell MATLAB to look in this folder for functions

%% Let's start with a default example from MATLAB

ezplot(@humps,[0,1]);
quadgui(@humps,0,1,1e-4);

%% Setup the integrand

f = @(x) sin(x); % use an anonymous function

quadgui( f, 0, pi, 1.e-8 );

tic
Q = quad( f, 0, pi, 1.e-8 ); % old method (note orange line under function name)
toc

tic
I = integral( f, 0, pi, 'AbsTol', 1.e-8 ); % new method
toc

%% what about with lower tolerance?

quadgui( f, 0, pi, 1.e-3 );

%% do not have to use anonymous function

quadgui('cos(x)', 0, (9/2)*pi, 1.e-6 );

% Notice how weird the function looks when you first use the midpoint rule
% to split it up into rectangles.

%% You can really do almost any type of integral

f = @(x) 1./sqrt(1+x.^4);

quadgui( f, 0, 1 );

%% another example

quadgui( 't^(8/3)*(1-t)^(10/3)' ,0, 1, 1.e-8 );

%% another example

f= @(x) sin(x)./x;

quadgui( f, 0, pi, 1.0e-4 );

%% what happened?

% We divided by zero and eventually we should reach a recursion limit.
% This is because there is a "singularity" in the function at x=0.

% One solution is
quadgui( f, realmin, pi, 1.0e-4 );

%% another option is to make a smarter function

quadgui( @sinc, 0, pi, 1.0e-4 ); % then call this anonymous function

%% What about if your integral depends on other parameters?

% Well we need to build more complicated functions then.

f = @(t,z,w) t.^(z-1) .* (1-t).^(w-1);

z = 8/3;
w = 10/3;
tol = 1.0e-5;

quadgui( f, 0, 1, tol, z, w); % all values passed after tol will be given to the function f

%% Up to now, we integrated continuous functions.

% How do we do integration when we have discretely sampled data?

x = linspace( 0, pi, 11 );
y = sin(x);

plot(x,y,'k*'); xlabel('x [rad]'); ylabel('sin(x)'); axis('tight');

% trapz  Trapezoidal numerical integration.
Q = trapz( x, y ); % trapz(x-vector, y-vector)

f = @(x) sin(x);
Qi = integral( f, 0, pi, 'AbsTol', 1.e-8 ); % new method




%%
%
% NOTE: Example in this practical are taken from the Quadrature Chapter
% (chapter 6) in https://www.mathworks.com/moler/chapters.html

