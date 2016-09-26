function [ x1, x2 ] = quadratic( a, b, c )
%
% USAGE: [x1,x2] = quadratic(a,b,c)
%
% DESCRIPTION: This function returns the roots of a quadratic equation. It
% takes 3 input arguments which are the co-efficients of x2, x and the
% constant term. It returns the roots.

d = disc( a, b, c); % disc is a sub-function

x1 = (-b + d) / (2*a); % this is the + term of the +/-
x2 = (-b - d) / (2*a); % this is the - term of the +/-

end % end of quadratic

%--------------------------------------------------------------------------
% Begin sub-functions
%--------------------------------------------------------------------------
function dis = disc(a, b, c)
%
% Function that calculates the discriminant.

dis = sqrt( b^2 - 4*a*c );

end % end of sub-function
%--------------------------------------------------------------------------
% END sub-functions
%--------------------------------------------------------------------------