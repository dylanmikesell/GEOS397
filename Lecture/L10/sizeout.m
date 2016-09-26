function [s,varargout] = sizeout(x)

s = size(x); % get the size of input variable

nout = max( nargout, 1 ) - 1; % determine how many output variables

for k = 1 : nout
    varargout{k} = s(k);
end

return