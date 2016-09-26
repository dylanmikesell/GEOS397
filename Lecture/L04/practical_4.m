clear all
close all

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

%% logical indexing

clc

logicalIdx = A >= 4;

A(logicalIdx);

A(4:5);

idx = find( A >= 4 ); % use for big arrays

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

(A > B) | (A ~= 5) % & = and

%%

idx = find( B<=2 | B>4 ) % | = or

%% check for <=2 or >=4

B( idx )

%%

myString = 'Dylan';

strcmp(myString,'Dylan')

%%
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Conditional branching to control flow of code

C = 7.1;

%% Let's introduce the 'if' statement

if ( C > 6.5 ) % relational operator (should return 0 or 1)
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


%% we can also do things on a case-by-case basis

n = input('Enter a number: ');

switch n
    case -1
        disp('negative one');
    case 0
        disp('zero');
    case 1
        disp('positive one');
    otherwise
        disp('You did not enter -1, 0, or 1');
end

%% this works with any variable type, not just numbers

myCase = 'doSomething';

switch myCase % I am comparing 'myCase' to all possible cases 
    case 'doThat'
        disp('I did that.');
    case 'doThis'
        disp('I did this.');
    case 'doNothing'
        disp('I did nothing.');
    otherwise
        disp('You did not tell me what to do!');
end


%% Loops
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% First comment about loops. It is important to choose an iteration
% variable. In the matlab style guide we saw that the best practice to use
% an i before the variable. In some cases, there is no real variable to
% iterate thought (as in the example below). In that case, I sugguest 'ii'
% rather than 'i' by itself. MATLAB will let you do this, but you run the
% risk of confusing someone because i often equals the complex number
% \sqrt(-1).

%% the for loop

for ii = 1 : 5
    ii %print the value of i on the screen
end

%% how about we clean up the output with the disp() command

for ii = 1 : 5
    disp( ii ); %print the value of i on the screen
end

%% how about we clean it up some more with the fprintf() command

for ii = 1 : 5
    fprintf( 'ii=%0.2f \n', ii ); %print the value of i on the screen
end

%% we don't have to give the iterator an evenly sampled vector like 1:5

for ii = [ 3, 7, -1 ]
    ii %print the value of i on the screen
end
% MATLAB will automatically go through the elements and ii will take on
% that value during that iteration of the loop

%% we can use for loops to do computations that need repeated

for ii = 1 : 5
    iiPrevious = ii - 1;
    fprintf( 'The previus ii=%d\n', iiPrevious ); %print the value of i on the screen
end

%% There is also the While loop in MATLAB

a = 1;
while a <= 10
    fprintf('a = %d\n', a);
    a = a + 1; % what happens if we comment out this line??
end

%% We can use it compute 10! (i.e. the factorial of 10)

% Who can tell me what factorial is?

n = 10; % the number we start with
f = n;
while n > 1
    n = n - 1;  % here is where we update n 
    f = f*n;
end
disp( [ 'n! = ' num2str(f) ] )

%% Let's print out some things to the screen so can see what is happening

n = 10; % the number we start with
f = n;
while n > 1
    % Let's print the multiplication out so we can see what is going on
    if n == 10 
        fprintf('%d',n);
    else
        fprintf('*%d',n);
    end
    
    n = n - 1; % here is where we update n 
    f = f*n;

end
disp( [' = ' num2str(f) ] )

% What happened to the *1 term?

%% For a more complicated example of using the for loop, let's approximate pi

% It can be shown that the following infinite series holds:

% $\Sum_{n=0}^{\infty} \frac{(-1)^n}{2n+1} = \frac{\pi}{4}$

% We can check this with a for loop

% mySum = 0; % allocate that the summation starts at zero
% 
% for n = 0 : 1e5 % (1 to 10,000) (e means add 5 zeros)
%     thisTerm = (-1).^n ./ (2*n + 1);
%     mySum = mySum + thisTerm;
% end
% 
% pi4 = pi/4; % we can compute this from MATLAB's built in double-precision pi
% 
% fprintf('The difference between our pi/4 and the MATLAB pi/4 is %0.10f\n', mySum - pi4);





