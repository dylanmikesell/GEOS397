function f = sinc( x )

if x == 0
    f = 1;
else
    f = sin(x) / x;
end

return