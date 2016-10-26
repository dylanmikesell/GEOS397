clear all
close all
clc

% L18 practical: polynomial curve fitting

%% build an "independent variable" vector

x = 0 : 4;

%% compute y (the dependent variable) the traditional way

y = (2.7 * x.^4) + (4 * x.^3) - (x.^2) + (1.8 * x) - 12.2;

figure;
plot(x,y,'r+'); % plot the (x,y) points with red plus sign
xlabel('x'); ylabel('y(x)');

%% compute use polyval to write less code and save time

coef = [2.7, 4, -1, 1.8, -12.2];
yo = polyval( coef, x );

hold on;
plot(x,yo,'bo'); % plot the (x,y) points with blue circles

%% estimate the polynomial coefficients of this function

order = 0;
P0 = polyfit(x,y,order)

order = 1;
P1 = polyfit(x,y,order)

order = 2;
P2 = polyfit(x,y,order)

order = 3;
P3 = polyfit(x,y,order)

order = 4;
P4 = polyfit(x,y,order)

coef

% You should note that the last instance, when order=4, is the correct
% estimation of polynomial coefficients used to compute y(x).

%% let's evaluate the fit coefficients of the lower order polynomials

y0 = polyval( P0, x );
y1 = polyval( P1, x );
y2 = polyval( P2, x );
y3 = polyval( P3, x );
y4 = polyval( P4, x );

lw=3; % set the line width for plotting
figure;
plot(x,y0,'b','LineWidth',lw); hold on; % plot the (x,y) points with blue circles
plot(x,y1,'r','LineWidth',lw); 
plot(x,y2,'g','LineWidth',lw); 
plot(x,y3,'k','LineWidth',lw); 
plot(x,y4,'c--','LineWidth',lw); 
legend('order=0','order=1','order=2','order=3','order=4','Location','NorthWest');
legend boxoff;

%% Let's compare P3 and P4 over a longer range of x

x = -10 : 10;

y3 = polyval( P3, x );
y4 = polyval( P4, x );

figure;
plot(x,y3,'k','LineWidth',lw); hold on;
plot(x,y4,'c--','LineWidth',lw); 
legend('order=3','order=4','Location','NorthWest'); legend boxoff;

% We see they only fit within the interval where we fit the data (i.e. x=[0,4])

%% Let's look at polyfit now as a least-squares fit

% We can use polyfit to perform a least square fit of a 1st oder polynomial
% i.e. a linear fit

x = -10 : 10; % independent variable
m0 = 4; % true slope
y0 = -1; % true y-intercept
yClean = m0*x + y0;

figure;
plot(x,yClean,'ro-'); hold on;
legend('Original')

% add noise to the curve
noise = 5*randn( 1, numel(yClean) );
yDirty = yClean + noise;

plot(x,yDirty,'b*');

% least-squares linear fit of noisy curve
order = 1; % linear!
p = polyfit( x, yDirty, order );

yEst = polyval( p, x );
plot(x,yEst,'k+');
legend('Original','Contaminated','Estimated','Location','NorthWest'); legend boxoff;

tStr = sprintf( 'Equation of the best fit line: y(x) = %0.2fx + %0.2f\n', p(1), p(2) );
title(tStr);