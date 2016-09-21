function minVal = mySimpleMinimum_v2(n1, n2, n3, n4, n5)
%
% USAGE:  min = mySimpleMinimum( n1, n2, n3, n4, n5 )
%
% INPUT:
%   n1, n2, n3, n4, n5 = five numbers you want to compare
% OUTPUT:
%   minVal = minimum value in the xArray input

% Written by: Dylan Mikesell
% Last modified: 21 September 2016

% Use nargin
fprintf( '\nNumber of input arguments = %d\n', nargin );

% Start with the first component
minVal = n1;

% Sequentially check if values are smaller than n1
if(n2 < minVal)
    minVal = n2;
end

if(n3 < minVal)
   minVal = n3;
end

if(n4 < minVal)
    minVal = n4;
end

if(n5 < minVal)
    minVal = n5;
end

fprintf( 'The minimum of [%0.1f,%0.1f,%0.1f,%0.1f,%0.1f] is %0.1f\n', n1, n2, n3, n4, n5, minVal );

return % exit function and go back to main program (not required, but programming habit)
%
% return forces MATLAB® to return control to the invoking function before it reaches the end of the function.
% http://www.mathworks.com/help/matlab/ref/return.html
%
% E.g. you can use return to break out of a function if some logic is satisfied