function A = exactArea(a)
% compute the exact area of y=xe^{-x} from [0,a]
%
% USAGE: A = exactArea(a)
% 
% INPUT:
%   a = upper integration limit (lower limit is zero by default)
% OUTPUT:
%   A = area from 0 to a of the function y=xe^{-x}
 
A = 1 - exp(-a) - a*exp(-a); 

return