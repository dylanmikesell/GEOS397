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

if (nx > 1) && (ny > 1)
    error('MATLAB:myMinimum','Input is not a vector. This function only works for vectors!')
end

npts = max( [ nx, ny ] ); % take whichever is largest, assuming nx or ny is equal to 1

minVal = 1e6; % make a huge number to start the comparison

for ii = 1 : npts % loop through all elements and compare the value
    if xArray( ii ) < minVal
        minVal = xArray( ii ); % set current value to new minimum
        minIdx = ii; % keep the array index of the new minimum
    end
end

return