function v = piecelin( x, y, u )
% 
% USAGE: v = piecelin( x, y, u )
%
% Piecewise linear interpolation finds the piecewise linear L(x) with
% L(x(j)) = y(j) and returns v(k) = L(u(k)).  
%
% This function was modified from the chapter on interpolation at 
% https://www.mathworks.com/moler/chapters.html

% First divided difference
delta = diff( y ) ./ diff( x );

% Find subinterval indices k so that x(k) <= u < x(k+1)
n = length( x );
k = ones( size(u) );
for j = 2 : n-1
    k( x(j) <= u ) = j;
end

% Evaluate interpolant
s = u - x(k);
v = y(k) + s.*delta(k);