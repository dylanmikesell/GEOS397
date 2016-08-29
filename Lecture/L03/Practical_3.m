clear all
close all
clc


%% A) Simple scalar arithmetic (Section 2.1.1)

% You can use MATLAB just like a calculator!!

%% B) Order of operations (a.k.a. evaluation) (Section 2.1.2)

% 1. Parentheses (brackets), innermost first.
% 2. Exponentiation, left to right.
% 3. Multiplication and division with equal importance, left to right. 
% 4. Addition and subtraction with equal important, left to right.

%%

% Given that 2^6.5 = 90.5097 can you added parentheses to the following
% MATLAB expression to obtain a value of 90.5097. 

(12 / 4 - 1) ^ (4 - 2 + 3 * 1.5);

%%
% Next, can you insert only two pairs of parentheses into the following
% expression to again obtain a value of 90.5097. 

(4 ^ 0.5) ^ (10 - (2 ^ 1 + 1 + 0.5))

%% C) Using named variables (Section 2.1.3)

hammers = 6
compasses = 2
magnifiers = 9

%%

(hammers*45.32) + compasses*23.17 + magnifiers*4.99

%%

cost = hammers*45.32 + compasses*23.17 + magnifiers*4.99

%%

items = hammers + compasses + magnifiers

%%

average_cost = cost / items


%% D) Rules for naming variables (Matlab's own restrictions)

% ? Variable names must start with a letter.
% ? Names can only be based on the letters A-Z & a-z, numbers 0-9 and underscore ?. 
% ? Only the first 31 characters in a variable name are recognized by MATLAB
% ? Names are case sensitive: name, Name, NAME are different.

%% From the style guide

% 1) Variable names should be in mixed case starting with lower case and
% discriptive

% linearity, credibleThreat, qualityOfLife

% 2) The prefix n should be used for variables representing the number of
% objects. 

% nFiles, nSegments

% 3) A MATLAB-specific addition is the use of m for number of rows (based on
% matrix notation), as in 

% mRows

% We usually give the dimensions of a matrix as [m x n] (i.e. [rows x columns])

% 4) A convention on pluralization should be followed consistently.

% point,   pointArray

% 5) Variables representing a single entity number can be suffixed by No or
% prefixed by i. 

% tableNo, employeeNo

% 6) The i prefix effectively makes the variables named iterators.

% iTable, iEmployee

% 7) Negated boolean variable names should be avoided.

% Use isFound

% Avoid isNotFound

% 8) Named constants should be all uppercase using underscore to separate
% words. 

% MAX_ITERATIONS, COLOR_RED

%% E) Vectors and Matrices
% 
% MATLAB is so useful as a computing language because it is built for linear
% algebra and has many features that allow for rapid development with
% vectors and matrices. In the previous examples we used what is known as a
% "singleton". For example,
a = 1;

%%
% *Vectors*
%
% To make a row vector we could write
a = [1, 1, 1]
% comma = new column

%%
% this uses the comma "," to separate the different entries. To make a
% column vector we could write
b = [1; 2; 3]
% semicolon = new row

%%
% using the semicolon ";" to separate the different entries. To _transpose_
% _b_ to same shape as _a_ there are two options:
btrans = transpose( b ) 

%%
% Tranpose takes the matrix [MxN] and makes it [NxM] by swapping rows for
% columns
a = [1 , 1; 2, 2; 3, 3]

atrans = transpose(a)

%%
% or the shorthand version
atrans = a'

%% ways to make vectors

% x = [start : delta : end]
x = [0.8: 0.15: 1.4] % by hand

% or 

x = linspace(0.8, 1.4, 6) % by a MATLAB function

delta = (1.4-0.8)/5

% or 

delta = x(2)-x(1)

%%
% *Matrices*
%
% Finally, to
% make a matrix we use a combination of the two. For example,
c = [1, 1, 1; 1, 2, 3]
%%
% We could also use the _zeros()_ or _ones()_ functions to allocate the
% matrix and then assign each element (i,j) a value.
d = ones( 2, 3 )
%%
% This brings us to matrix and vector indexing. In order to assign a value
% to _d(2,2)_ we need to explicitly tell MATLAB what we want.
d( 2, 2 ) = 2
%%
% Let's type "whos" again to see what we have so far.
whos
%%
% You can also assign a complete row or column in MATLAB using the colon
% ":" operator. For example
d( 3 ) = 2

% Two ways to index matrix elements
% d(i,j)

%d(index) --> index counts columnwise

%%
% or
d( :, 1 ) = 0
%%
% Finally, keep in mind that a matrix can be any dimension _N_. For example
% we can allocate a 3x3x3 matrix (or tensor)
e = zeros( 3, 3, 3)


%%
%--------------------------------------------------------------------------
% Let's look at arithmetic operations on vectors

x = [0.8: 0.15: 1.4]'

%% addition
y = x + 2

%% subtraction
y = x - 3

%% multiplication
y = x * 1.2

%% division
y = x / 2.5

%% we can also just modify certain elements using 'indexing'
y = x(1:2) + 5


%% F)

% When performing addition and subtraction on arrays (i.e. vectors) you
% must either use an array and a scalar together or two arrays of the same
% size. We just did a bunch of array-scalar operations. So let's look at
% array-array arithmetic

x = [ 1, 1, 1; 2, 2, 2]

y = [ 1, 2, 3; 4, 5, 6]

%% element by element multiplication
x.*y 

%% element by element divsion
x./y

%% element by element exponentiation
x.^y

%% matrix multiplication
x*y

%% What's the problem

% x is a [2,3] matrix
% y is a [2,3] matrix

% [2,3] * [2,3] does not work. Why?

%% we need to get the dimension right.

transpose(x) * y % now we have [3,2]*[2,3] and the output should be [3,3] matrix

%%
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% Relational operators

A = 5;
B = 6;

%% check if they are equal
A == B

%% check if they are not equal
A ~= B

%% check if A is greater than or equal to B
A >= B

%% check if A is less than B
A < B


%% What about with vectors
%--------------------------------------------------------------------------

A = [1:1:5];
B = [5:-1:1];

%% 
A >= 4

%%
A == B

%% 
B < A

%% What about dimensions? Think back to our array-array arithmetic

A = [1:1:4];
B = [1:1:3];

A == B

%% let's look at how to find the indices of vector elements that meet our relational test

B = [5:-1:1];

%%
B >= 3

%% What if we don't just want ones and zeros, but the actual element number of B

idx = find( B >= 3 )

% We see that this tells us elements 1, 2 and 3 meet this relational test

%%
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Logical operators

A = [1:1:5];
B = [5:-1:1];

%% let's test multiple things now

(A > B) & (A ~= 5) % & = and

%%

idx = find( B<=2 | B>4 ) % | = or

%% check for <=2 or >=4

B( idx )


%%
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Conditional branching to control flow of code

C = 7.1;

%% Let's introduce the 'if' statement

if C > 6.5 % relational operator (should return 0 or 1)
      C = C - 3.1; % when True (i.e. ==1) perform the calculation
end % end of the code relating to the if-statement

C % display

%%

C = 6.1; % set our value to be processed
if C > 6.5 % relational operator
      C = C - 3.1; % when True perform the calculation
end % end of the code relating to the if-statement

C % display --> we see C does not chance

%% we can set more than one test!

C = 6.1; % set our value to be processed
if C > 6.5 % relational operator
    C = C - 3.1; % when True perform the calculation
else % enter the alternative for a False
    C = C + 9.3;
end
C % display

%% look at indetation really quick

C = 6.1; % set our value to be processed
if C > 6.5 % relational operator
      C = C - 3.1; % when True perform the calculation
   else % enter the alternative for a False
C = C + 9.3;
end

%% we can get even more complex with elseif

C = 6.1; % set our value to be processed
if C > 6.5 % relational operator
    C = C - 3.1; % when if is True perform the calculation
elseif C < 2.4 % enter the alternative condition
    C = C + 9.3; % when elseif is True perform the calculation
end
C %display the result








