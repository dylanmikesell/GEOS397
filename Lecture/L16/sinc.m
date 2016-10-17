% This is a commnent
% So is this.
function f = sinc( x )


% This is not.


if x == 0
    f = 1;
else
    f = sin(x) / x;
end

return