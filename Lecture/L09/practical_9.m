clear all
close all
clc

% Scripts contain sequences of commands that are applied to variables in
% the workspace. MATLAB functions, however, allow inputs and outputs to be
% defined. They do not automatically import variables from the workspace.    


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

%% Class exercise

% Take the topography vector from HW3
z = [0 0 0 0 0 1 2 3 4 5 6 7 8 9 10 9 8 7 6 5 4 3 2 1 0 0 0 0 0]; % [m]

% write a function that computes the average of this vector.
% Call it average.m and use it from this script.
