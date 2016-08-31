%% MATLAB Introduction

% What is MATLAB?
% MATLAB ("MATrix LABoratory") is a tool for numerical computation and
% visualization. The basic data element is a matrix, so if you need a
% program that manipulates array-based data it is generally fast to write
% and run in MATLAB (unless you have very large arrays or lots of
% computations, in which case you're better off using C or Fortran).  

%% Getting started

% MATLAB is available on computer lab machines. You
% can find more information about getting MATLAB through BSU at
% http://oit.boisestate.edu/software/software-services/mathematical-and-statistical-software/

% Click the MATLAB icon to start. This will open the MATLAB
% desktop, which includes interactive menus and windows in addition to the
% command window.   

%% Using MATLAB

% The best way to learn to use MATLAB is to sit down and try to use it. In
% this handout are a few examples of basic MATLAB operations, but after
% you've gone through this tutorial you will probably want to learn more.
% Check out the "Other Resources" listed at the end of this handout.   

%%
% *Launching MATLAB*

% When you start MATLAB, the command prompt ">>" appears. You will tell
% MATLAB what to do by typing commands at the prompt. Let's look at the
% MATLAB GUI (Graphical User Interface) now and become familiar with the
% features.

%%
% *GUI Features*
%
% * Command Window
% * Command History
% * Current Folder
% * Workspace
% * Editor
% * Variable Editor
% * Details
% * Search Documentation (searchable help)

%%
% *GUI Tabs* (>= MATLAB 2014) (i.e. the ribbon)
%
% * Home
% * Plots
% * Apps
% * Editor
% * Publish
% * View

%% This is the start of a something called a 'Section' in MATLAB.

% If you didn't notice already, some text in this script is green. This
% indicates that the text is a 'comment'. Comments are ignored by MATLAB
% when we actually run a script. Any line that begins with the '%' symbol
% is a comment.

% Anything that starts with '%%' is a section (assuming 'Sections' are
% enabled in the MATLAB preferences).

% Sections allow you to step through your code and run only sections of it.
% It is a really useful tool when your code/scripts get to be hundreds or
% thousands of lines.

% On that note, look at the line numbers on the left. These will be useful
% for debugging output later. When errors occur, the MATLAB command window
% with tell you on which line the errored occurred so that you can quickly
% find the line that's giving you trouble.


%% Useful commands for begginners

% Let's first type >>"help help" in the command window

help help

%%
% We can also use a few built-in commands to clean up the MATLAB workspace.

help clc
%%
help home
%%
help clear
%%
clear all
%%
help close
%%
help diary
%% 
help who
%%
help whos

% Let's create a new diary for the remainder of this class.
diary('MyFirst.diary');

% Question: What is the significance of the ";" at the end of the line?

%% Syntax
%
% * White space does not matter. For example
a=1+1
%%
% is the same as 
a  =  1 +      1
%%
% * ';' are important though
x = 1 y = 2
%%
x = 1; y = 2
%%
% To suppress the output you can type
clear a
a = 1 + 1;
%%
% Now look at the "workspace". Variable _a_ is there, but because we used
% the ";" operator at the end, the output to the "command window" was
% suppressed.

%% Variable explorer
% Let's look at _a_ now. At the "command window" type _a_.
a
%%
% You see that the value is returned. Now type _whos a_
whos a
%%
% We can now look at the variable _a_ to learn about it properties. You can
% also *double-click _a_* in the workspace tab to pull up the "Variable
% Explorer" that gives you the ability to look at _a_ in the form of a
% table.

%% Data types in MATLAB
%
% * Numeric Types: Integer and floating-point data
% * Characters and Strings: Text in character arrays
% * Dates and Time: Arrays of date and time values that can be displayed in different formats
% * Categorical Arrays: Arrays of qualitative data with values from a finite set of discrete, nonnumeric data
% * Tables: Arrays in tabular form whose named columns can have different types
% * Structures: Arrays with named fields that can contain data of varying types and sizes
% * Cell Arrays: Arrays that can contain data of varying types and sizes
% * Function Handles: Variables that allow you to invoke a function indirectly
% * Map Containers: Objects with keys that index to values, where keys need not be integers
% * Time Series: Data vectors sampled over time
%
% You can find more info about all of these at 
% http://www.mathworks.com/help/matlab/data-types_data-types.html

%%
% To find out what something is you can type "help isa"
help isa
%%
% Keep in mind that all of these "types" take of different amounts of
% memory. You can allocate a variable as a certain data type or you can
% convert a variable from one data type to another after you have declared
% that variable. For example type "b = single(a); whos"
b = single( a ); whos

%% 
% This is one way to make a single from a double. Another way would be to
% allocate the variable to a certain data type before assigning a value to
% the variable. For example type "c = zeros(1,1,'int8'); whos
c = zeros( 1, 1, 'int8' ); whos
%%
% We will come back to variable allocation later to look at how allocating
% memory can save computing time in certain instances. To learn more about
% data type identification look at 
% http://www.mathworks.com/help/matlab/data-type-identification.html
% and to learn more about converting frome one data type to another look at
% http://www.mathworks.com/help/matlab/data-type-conversion.html
%
% For more on memory allocation see
% http://www.mathworks.com/help/matlab/matlab_prog/memory-allocation.html


%% Saving your workspace.
% MATLAB offers the user the ability to save all current variables (or just
% a subset) to disk in MATLAB's native ".mat" format. This is a binary file
% format and can be loaded back into MATLAB with a single command. Below we
% go through an example.
clear all; % delete everything from memory

a = 1;
b = 4;
c = 3;

d = a + b * c; % Note the order of operations.
%%
% For more on MATLAB's "order of operations" look at
% http://www.mathworks.com/help/matlab/matlab_prog/operator-precedence.html
%%
% Back to saving a workspace.
whos
%%
save('./myFirstWorkspace.mat'); % This will save everything
%%
% We can load this information back into MATLAB using
clear all;
whos
%%
load('./myFirstWorkspace'); % Note that we can neglect the '.mat' or we can add the file extension. MATLAB does not care. It will first look for a file with the same filename and .mat extension.
whos
%%
%%
% We can also save individual variables by modifying our _save()_ command.
save('./myFirstLetter.mat','a','b'); % Here we save only _a_ and _b_.
clear all;
whos
%%
load('./myFirstLetter.mat');
whos
%%
% You can also load a '.mat' file by simply double-clicking the filename in
% your "Current Folder" panel of the MATLAB GUI. You can also investigate
% what is inside of a '.mat' file before ever actually loading it into the
% MATLAB workspace. To do this single-click a filename in your "Current
% Folder" panel; in the "Details" you will see information (or even a
% thumbnail of images) about what is inside of the highlighted '.mat' file.
