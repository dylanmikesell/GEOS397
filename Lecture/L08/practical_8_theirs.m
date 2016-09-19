

%% Functions

% In order to improve the readability and reduce writing repetitive lines
% of code we can write functions to do simple tasks. The built-in MATLAB
% _plot()_ command is an example of a function. I have written a function
% that we can then call to do a task. Open the file myMinimum.m
x = -100:100;

[minVal, minIdx ] = myMinimum( x )
%%
% Let's look at the help for this function. Everything in comments
% immediately following the "function" declaration is part of the preamble
% of this functiona and will show up in the "help myMinimum" command.
help myMinimum

%%
% That is it for Lecture 1!

a = 1 + 1i;


%% 
% Written by _Dylan Mikesell_,
% with excerpts from
% http://web.gps.caltech.edu/classes/ge11d/doc/matlab_Resource_Seminar.pdf 
