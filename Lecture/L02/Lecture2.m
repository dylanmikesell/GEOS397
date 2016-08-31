% Below we cover some fundamental utilities of MATLAB that will make
% learning a bit easier. The goal is to learn by doing.

% The *.m file extension indicates a MATLAB script or function. MATLAB can
% interact with other file formats though.

% In this Lecture we will cover the basic elements of the MATLAB IDE
% (Interactive Development Environment), syntax, proper naming conventions
% and coding standards.
% We will also cover data types, arrays and matrices   




%% Let's now look a variable and the command window

x = 1; % this line makes a variable called 'x' and gives it the value 1

% you can use the keyboard shortcut (control-enter) to evaluate this
% section or use the button 'Run Section' in the ribbon above.

% What happens in the 'Workspace' on the right?

% You should see 'x' appear under the 'Name' column and 1 appear under the
% 'Value' column. This means that 'x' is now loaded into the memory. We can
% check this by typing x in the command prompt. We will indicate command
% prompt instructions like this:
%
% >> x

% So try it. MATLAB should return the value x=1 in the Command Window. What
% happens you enter x into the command window again, but this time put a
% semicolon after x
%
% >> x;
%
% What happened? Why?
%
% The change in output is due the MATLAB syntax. MATLAB has a different
% response to lines that do or do not end with a semicolon. Another
% interesting feature of MATLAB syntax is that MATLAB does not care about
% tabs. Try it; type
%
% >>    x = 1;
%
% with a tab before the x. You can even hit table multiple times. You can
% even put tabs before or after the 1 and before the ;
%
% >>     x =    1       ;
%
% MATLAB doesn't care about spaces. But will discuss this later. The proper
% use of whitespace can make you code much easier to read, especially for
% others. We will visit modern code standards later, but know that white
% space and indentation play an important role in MATLAB syntax. Tabs for
% example have a completely different meanin Python and become critical
% actually to the meaning of your code.

% What about two variables on the same line? Well try it.
%
% >> x = 1 y = 2
% 
% What happens? You should get an error! How might you fix this error?


%
% Now let's look at x in a little more detail. Type the following
%
% >> whos

% This will tell you that x takes up 8 bytes and is Class 'double'. Notice
% that if you mouse over the x icon in the Workspace MATLAB will tell you
% that x is a dobule. We can also adjust the Workspace view so it tells us
% the class automatically. Click the down arrow in the upper right corner
% of the workspace --> choose columns and add 'class'. We will discuss the
% different kinds (i.e. 'classes') of variables later in this lecture.

%% If we can make variables in memory then we can delete them too.

clear x; % remove this variable from the workspace memory

%% Moving on...

% Before we go any further let's keep track of what we are doing using the
% MATLAB 'diary'. This is a built in function 

% First we need to decide where to save our diary

myDiaryPath = '/Users/dmikesell/Desktop/'; % choose where to save my diary (i.e. the 'path')
myDiaryName = 'lecture1_diary.txt'; % choose the diary name
filename = fullfile( myDiaryPath, myDiaryName ); % combine the path and the name

diary( filename ); % turn on the diary and start recording to the file

% How did I know how diary() worked? How did I know how fullfile() worked?
%
% I used the MATLAB built in 'help' command. Type the following at the
% command window:
%
% >> help fullfile
%
% then try 
%
% >> help diary
%
% Notice the 'See also' commands. Feel free to click one.

% Another option besides 'help' is to type the function name (or part of
% it) into the search bar in the top left of the MATLAB window. This will
% open a window with even more information called the 'documentation'.
%
% You can get their from the command window by typing
%
% >> doc fullfile

%% Moving around the computer

% Type
%
% >> pwd

% This stands for "print working directory". It tells you where you are
% right now in the computer. It maybe be different than where we saved the
% diary file. Let's go to where the diary file is using the 'cd' command.
%
% >> cd(myDiaryPath)
%
% Any guesses what 'cd' stands for?

% You should see your text file in the 'Current Folder' pane on the left
% side of the MATLAB IDE now. Double click this file. It will open in
% another tab in the MATLAB 'Editor' pane. If it is empty, you need to type
%
% >> diary( filename )

% This will close the diary and write everything. Your diary file should
% show you everything we just typed into the command window as well as the
% MATLAB output.

% Things to note, you can move backward one directory with
%
% >> cd ..
%
% and you can see the contents (i.e. files and subdirectories) of the
% current directory by type
%
% >> ls

% Finally, you can clear the command window by typing
%
% >> clc
%

% That covers the basics of the MATLAB IDE and command window. Let's move
% on to the file Lecture1b.m
