function [minVal, minIdx ] = myMinimum( xArray )
%
% USAGE:  [minVal, minIdx] = myMinimum( xArray )
%
% INPUT:
%   xArray = vector of numbers that you wish to find the minimum
% OUTPUT:
%   minVal = minimum value in the xArray input
%   minIdx = element number in xArray of the minimum value

% Written by: Dylan Mikesell
% Last modified: 23 August 2015

[nx, ny] = size( xArray ); % get the dimensions

% Some error checking of the inputs is important!!
if (nx > 1) && (ny > 1)
    error('MATLAB:myMinimum','Input is not a vector. This function only works for vectors!')
end

npts = max( [ nx, ny ] ); % take whichever is largest, assuming nx or ny is equal to 1

minVal = realmax; % make the starting number the largest matlab can have
% http://www.mathworks.com/help/matlab/ref/realmax.html

for ii = 1 : npts % loop through all elements and compare the value
    if xArray( ii ) < minVal
        minVal = xArray( ii ); % set current value to new minimum
        minIdx = ii; % keep the array index of the new minimum
    end
end

return