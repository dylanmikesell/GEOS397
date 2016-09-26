clear all
close all
clc

% Remember the definition of a function:

% Scripts contain sequences of commands that are applied to variables in
% the workspace. MATLAB functions, however, allow inputs and outputs to be
% defined. They do not automatically import variables from the workspace.

% A function is a group of statements that together perform a task. In
% MATLAB, functions are defined in separate files. The name of the file and
% of the function should be the same.  

x = -100:100;

%% Some useful MATLAB commands to learn about the input variables
%
% # nargin <http://www.mathworks.com/help/matlab/ref/nargin.html nargin>

% nargin returns the number of input arguments passed in the call to the currently executing function

% let's try my modified function
minVal = mySimpleMinimum_v2(1, 0, -2, 6, 1.5);

%% You can also use nargin to find out how many inputs a function requires

fx = 'mySimpleMinimum_v2';
nargin( fx ) % get the number of input to mySimpleMinimum_v2.m

%% The same tools exists for output arguments as well
%
% # nargout <http://www.mathworks.com/help/matlab/ref/nargout.html nargout>

% nargout returns the number of output arguments specified in the call to
% the currently executing function 

minVal = myMinimum_v2( x )

%% What if you want a variable number of inputs or outputs?

% This is when we use varargin and varargout

% varargin is an input variable in a function definition statement that
% allows the function to accept any number of input arguments. 

varlist(ones(3),'some text',pi);

% This is how MATLAB functions like plot.m are working.

%% output

% varargout is an output variable in a function definition statement that
% allows the function to return any number of output arguments.  
clc
matrixInput = rand( 4, 5, 2 );

[sizeO,rows,cols,dep] = sizeout( matrixInput )

%% How do you write functions and debug?

% This is an important question since the variables in the function are not
% present in the Workspace. Therefore, you cannont tell if where you made a
% mistake. Fortunately MATLAB has breakpoints! (see the button on the
% Editor ribbon) 

% http://www.mathworks.com/help/matlab/debugging-code.html

% let's put a break point somewhere in one of our functions and see what
% happens

[minVal, minIdx ] = myMinimum( x )


%% Those were basic functions; there are other kinds of functions though
%
% * Anonymous Functions
%
% An anonymous function is like an inline function in traditional
% programming languages, defined within a single MATLAB statement. It
% consists of a single MATLAB expression and any number of input and output
% arguments.

% The syntax for creating an anonymous function from an expression is
%
% f = @(arglist) expression to evaluate

power = @(x, n) x.^n; % how many inputs to this function?

result1 = power( 7, 3 ) % what is happening here?
result2 = power( 49, 0.5 )
result3 = power( 10, -10 )
result4 = power( 4.5, 1.5 )

%% Primary and Sub-Functions

% Any function other than an anonymous function must be defined within a
% file. Each function file contains a required primary function that
% appears first and any number of optional sub-functions that comes after
% the primary function and used by it.   

% Primary functions can be called from outside of the file that defines
% them, either from command line or from other functions, but sub-functions
% cannot be called from command line or other functions, outside the
% function file.   

% Sub-functions are visible only to the primary function and other
% sub-functions within the function file that defines them. 

[x1,x2] = quadratic(2,4,-4)

help quadratic % this will work because it is a primary function

help disc % this will not because it is a sub-function

%% Nested Functions

% You can define functions within the body of another function. These are
% called nested functions. A nested function contains any or all of the
% components of any other function.  

% Nested functions are defined within the scope of another function and
% they share access to the containing function's workspace. 

% A nested function follows the following syntax ?
% 
% function x = A(p1, p2)
% ...
% B(p2)
%    function y = B(p3)
%    ...
%    end
% ...
% end

[x1,x2] = quadratic2( 2, 4, -4 )

%% Private Functions

% A private function is a primary function that is visible only to a
% limited group of other functions. If you do not want to expose the
% implementation of a function(s), you can create them as private
% functions.   

% Private functions reside in subfolders with the special name private.

% They are visible only to functions in the parent folder.

% Example

% Let us rewrite the quadratic function. This time, however, the disc
% function calculating the discriminant, will be a private function. 

% Create a subfolder named private in working directory. Store the
% following function file disc.m in it.

% Create a function quadratic3.m in your working directory and type the
% following code in it.

[x1,x2] = quadratic3( 2, 4, -4 )

%% Global Variables

% Global variables can be shared by more than one function. For this, you
% need to declare the variable as global in all the functions. 

% If you want to access that variable from the base workspace, then declare
% the variable at the command line. 

% The global declaration must occur before the variable is actually used in
% a function. It is a good practice to use capital letters for the names of
% global variables to distinguish them from other variables.  

global TOTAL; % declare to MATLAB that TOTAL is a global variable
TOTAL = 10; % set the value

n = [34, 45, 25, 45, 33, 19, 40, 34, 38, 42];

av = myAverage( n )

%% Class exercise

% Modify your function from last class to accept variable input with
% varargin.
% Use strings to denote each input followed by its numeric value.

%% Notes
%
% Many examples in this lecture come from
% <https://www.tutorialspoint.com/matlab/matlab_functions.htm here>.