clear all
close all
clc

% Class exercises

%% Integration



%% 1

f = @(y) sqrt( y + 1 );
Qi = integral( f, 0, 3, 'AbsTol', 1.e-4 )

%% 2

f = @(r) (5*r) ./ ( 4 + r.^2 ).^2;
Qi = integral( f, -1, 1, 'AbsTol', 1.e-8 )

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

f = @(y) 1 ./ ( 2 .* sqrt(y) .* (1 + sqrt(y)).^2 );
Qi = integral( f, 1, 4, 'AbsTol', 1.e-4 )

% Qi = 2/3

%% Discrete case to solve integral

format long

% 1
x = linspace(0,5,101);
y = x .* exp(-x);

plot(x,y,'k');
xlabel('x'); ylabel('y=xe^{-x}');

% 2 -- do by hand
% 3 -- function is made and used in 4

% 4
a = 5;
A = exactArea( a ); % 3

% 5
A1 = trapz(x,y);

% 6 
x = linspace(0,5,11);
y = x .* exp(-x);
A2 = trapz(x,y);

x = linspace(0,5,1001);
y = x .* exp(-x);
A3 = trapz(x,y);

% 7
clc
fprintf('11   pts. -- diff = %e\n',A-A2)
fprintf('101  pts. -- diff = %e\n',A-A1)
fprintf('1001 pts. -- diff = %e\n',A-A3)

%%

% 8
f = @(x) x.*exp(-x);
Qi = integral( f, 0, 5, 'AbsTol', 1.e-4 );
fprintf('using integral -- diff = %e\n',A-Qi)



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


