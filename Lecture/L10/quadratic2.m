function [x1,x2] = quadratic2(a,b,c)
%
% USAGE: [x1,x2] = quadratic(a,b,c)
%
% DESCRIPTION: This function returns the roots of a quadratic equation. It
% takes 3 input arguments which are the co-efficients of x2, x and the
% constant term. It returns the roots.

    % define our nested function
    function disc  % nested function
        d = sqrt( b^2 - 4*a*c );
    end % end of nested function disc

disc; % notice we do not have to give disc any inputs and the variables are a different color

x1 = (-b + d) / (2*a);
x2 = (-b - d) / (2*a);

end % end of function quadratic2