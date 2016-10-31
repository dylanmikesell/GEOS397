clear all
close all
clc

% L20 practical: linear curve fitting and statistics

%% Part 3 - review polynomials

x = 0 : 4;
y = (2.7 * x.^4) + (4 * x.^3) - (x.^2) + (1.8 * x) - 12.2;
coef = [2.7, 4, -1, 1.8, -12.2]; % or just keep the coefficients to use polyval()

figure;
plot(x,y,'r+'); % plot the (x,y) points with red plus sign
xlabel('x'); ylabel('y(x)');

%% fit with different polynomial orders

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
noise = 10*randn( 1, numel(yClean) );
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

%% Look at linear correlation coefficients

R = corrcoef( x, yClean)

R = corrcoef( x, yDirty)

R = corrcoef( x, yEst)

% R = [autocor(X), xcor(X,Y);
%     xcor(Y,X), autocor(Y)];

%% Look at the coefficient of determination

R = corrcoef( x, yDirty);

Rsquared = R(1,2)^2

% What happens to Rsquared if we change the amplitude of the noise?

%% Finally look at the rescaling of data in polyfit to improve performance.

[p, S, mu] = polyfit( x, yDirty, order );





