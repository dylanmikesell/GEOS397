function v = polyinterp( x, y, u )
%
% Lagrange version of interpolating polynomial
%
% This function evaluates the Lagrange form of the interpolating polynomial
% at all points u simultaneously. We could do this individually with
% another outer loop over u(i), but we don't want to.
%
% This script is taken from the chapter on interpolation at 
% https://www.mathworks.com/moler/chapters.html

n = length( x );
v = zeros( size(u) );

for k = 1 : n % do the outer summation
    
    w = ones( size(u) ); % a dummy variable
    
    for j = [1:k-1 k+1:n] % do the inner multiplication, skipping j=k
        
        num = u - x(j); % compute the numerator
        denom = x(k) - x(j); % compute the denominator
        
        w = num ./ denom .* w; % compute the new value
    
    end
    
    v = v + w*y(k); % add this term to the sum
end

return