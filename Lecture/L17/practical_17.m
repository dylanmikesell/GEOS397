clear all
close all
clc

% L17 practical

%% Up to now, we integrated continuous functions.

% How do we do integration when we have discretely sampled data?

x = linspace( 0, pi, 11 );
y = sin(x);

plot(x,y,'k*'); xlabel('x [rad]'); ylabel('sin(x)'); axis('tight');

% trapz  Trapezoidal numerical integration.
Q = trapz( x, y ); % trapz(x-vector, y-vector)

f = @(x) sin(x);
Qi = integral( f, 0, pi, 'AbsTol', 1.e-8 ); % new method


