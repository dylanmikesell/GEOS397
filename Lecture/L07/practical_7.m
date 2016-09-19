clear all
close all
clc

%% Continue Lecture 6 materials

% Structures vs. Cells

%% Difference between cell arrays and structures here

% http://www.mathworks.com/help/matlab/matlab_prog/cell-vs-struct-arrays.html

%% Cell arrays

% A cell array is a data type with indexed data containers called cells.
% Each cell can contain any type of data. Cell arrays commonly contain
% lists of text strings, combinations of text and numbers from spreadsheets
% or text files, or numeric arrays of different sizes.

c = {'a'};

methods(c)
%%
c = {10,'1'};
%%
b = c(1) % you access a cell with ()
%%
a = c{1} % you access the contents of a cell directly with {}
%%

% TODO uncomment this line to show students the cell2mat() function

% d = cell2mat(b)

%% allocate a cell

myCell = cell(2,2);
myCell{1,1} = 10;
myCell{2,1} = 1;

%% retrieve info from cell block

a = myCell{:,1}

b = [myCell{:,1}] % use array concatenation operator []

% b = cell2mat(myCell(:,1))

%% more on cell arrays

% http://www.mathworks.com/help/matlab/matlab_prog/access-data-in-a-cell-array.html
% and
% http://www.mathworks.com/help/matlab/matlab_prog/multilevel-indexing-to-access-parts-of-cells.html

%% Structures

clear all
clc

S = struct % allocate a blank structure;

methods(S)

%% declare 'fields' during allocation

S = struct( 'Field1', [], 'Field2', [] ); % generate a structure with fields 1 and 2 and empty cells

fields(S)

%% add another field on the fly

S(1).Field3 = {}; % add another field
S(1).Field4 = 1:10;

fieldnames(S)

%%
S(1).Field4(5:7)

%% remove a field

S = rmfield(S,'Field3');

fieldnames(S)

%% access data within a structure

h=figure;
plot(S(1).Field4,'*'); hold on;
plot(getfield(S(1),'Field4'),'o');

%% rearrange the order of fields

S = struct('b', 2, 'c', 3, 'a', 1)

Snew = orderfields(S)



%% User I/O

% It is also very useful to be able to get user input while a program is
% running. We call this user I/O, and we can use the command line or a GUI.


%% Let's start with command line input

% get some information from the user
aNumber = input('Input a number between 0 and 10: '); 
fprintf('You entered %0.2f\n',aNumber);

%% Matlab has many built-in GUIs

% http://www.mathworks.com/help/matlab/predefined-dialog-boxes.html

%% You can a get a file name

filename = uigetfile; % displays a modal dialog box that lists files in the current folder and enables you to select or enter the name of a file.

%% You can get a folder

folder_name = uigetdir; % displays a modal dialog box showing the folders that are inside the current working directory.

%% You can choose a file to save as

FileName = uiputfile; %  displays a modal dialog box for selecting or specifying a file you want to create or save. 

%% You can directly load some file into the workspace.

uiopen; % displays the dialog box with the file filter set to all MATLAB® files (with file extensions *.m, *.mlx, *.mat, *.fig, *.mdl, and *.slx).

%% You can directly save the workspace or specific variables

uisave; % or uisave(variables)

%% There are other types of dialog boxes

%% The 'waitbar' is a useful one if you're running loops

h = waitbar(0,'Please wait...');
steps = 1000;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h) 

% check here to see how to add a cancel button
% http://www.mathworks.com/help/matlab/ref/waitbar.html

%% You can ask the user to choose from a list

d = dir;
str = {d.name};
[s,v] = listdlg('PromptString','Select a file:',...
                'SelectionMode','single',... % single here only allows one selection
                'ListString',str); % creates a modal dialog that allows the user to select one or more items from a list. 

%% You can ask the user questions:

% Construct a questdlg with three options
choice = questdlg('Would you like a dessert?', ...
	'Dessert Menu', ...
	'Ice cream','Cake','No thank you','No thank you');
% Handle response
switch choice
    case 'Ice cream'
        disp([choice ' coming right up.'])
        dessert = 1;
    case 'Cake'
        disp([choice ' coming right up.'])
        dessert = 2;
    case 'No thank you'
        disp('I''ll bring you your check.')
        dessert = 0;
end

%% Plotting
clear all

%
% Now that we can make a vector, let's plot a sine function. First we need
% to build the independent variable _x_. Let's make _x_ go from 0 to pi,
% with a sample interval of pi/180. 
dx = pi / 180;
x = 0 : dx : 2*pi - dx;
%%
% Let's compute the dependent variable _y_ = sin(x).
y = sin(x); % keep in mind that this function need input in radians. If _x_ were in degrees we would use _sind()_
%%
% To plot we use MATLAB's built in plot command
plot( x, y );
%%
% We can see straight away that this is a very bare plot. In order to make
% a better plot we want to add axes labels, remove extra white space, and
% maybe even add a legend or title. We have a few options to accomplish
% this. I will talk about 2 of them.
%%
% 
% # Using the graphic's GUI
% # Directly at the command line
% 
%%
% 1.
plot( x, y);
%%
% 2.
plot( x, y); xlabel('X'); ylabel('Y'); title('Our first plot');
axis('tight'); % type "help axis" to see other built-in options
%%
% For much more on MATLAB plotting look at 
% http://www.mathworks.com/help/matlab/plotting-basics.html
% You can plot surfaces, 3D shapes, etc. In reality you can almost plot
% anything you want. It can some effort to figure out how, but MATLAB
% usually has examples at the bottom of every "help" or a quick online
% search can yield useful information. For example, a surface plot looks
% like
surf(peaks)


%% turn off the grid lines

surf(peaks,'EdgeColor','none');

%% Useful things to know about plotting and MATLAB graphics objects
%
% There are many more graphic properties that are worth knowing. Here we
% go through a few of the more important properties for creating nice
% graphics.
close all; % First will close all previous graphic windows.

fontName = 'Times'; % set the font name we want to use
fontWeight = 'Normal'; % set the font weight we want to use

h = figure('Color','White'); % create a new graphic and assign it "h", which is the _figure handle_

l = plot( x, y, 'Color', 'r', 'LineWidth', 4 ); % change the color and line size
ax = gca;
xlabel('X','FontName',fontName , 'FontWeight',fontWeight ); % set xlabel and font properties
ylabel('Y','FontName',fontName , 'FontWeight',fontWeight ); 

title('Our first plot','FontName',fontName , 'FontWeight',fontWeight );

axis('tight');

set(h,'PaperUnits','Inches'); % set the paper size units
set(h, 'Units', 'Inches','Position',[1 1 8 4]); % set the graphic size unit and dimension

% Investigate figure properties
% Question 1: How do you change from inches to pixels?
% Question 2: How do you change from portrait to landscape?



% Question 3: How do you make the x-axis appear on top of the plot instead
% of the bottom.

%%
% Notes: 
% You can use 'rgb' color codes, 'cmyk' or the built-in shortcuts like 'r'
% You can change the line style

%%
% Let's say we don't want to set individual properties to all have the same
% font characteristics. We could use the _findall()_ function to set
% everything in this plot the same font size 
set( findall( h, '-property', 'FontSize' ), 'FontSize', 36 );
%%
% Let's say we had a more complex function that was y = sin(wt) and we
% wanted the Y-axis label to reflect this. We could use the built in
% 'TeX' interpreter or we could use the 'LaTeX' interpreter.
set( findall( h, '-property', 'Interpreter' ), 'Interpreter', 'Tex' );
ylabel('Y = sin(\omega X)','FontName',fontName , 'FontWeight',fontWeight ); % this can't handle \sin() though
%%
% Use 'LaTeX'
set( findall( h, '-property', 'Interpreter' ), 'Interpreter', 'Latex' );
ylabel('$Y = \sin(\omega X)$','FontName',fontName , 'FontWeight',fontWeight ); % NOTE the added $_$ around the label -- just like in LaTeX inline math command 
%%
% For more information about setting the text properties look at 
% http://www.mathworks.com/help/matlab/ref/text-properties.html
%%
% Let's save our figure now. You can save a figure manually from the
% Graphics -> File -> SaveAs to any of the available formats. Or you can
% open Graphics -> File -> Export Setup to modifies figure properties
% before exporting to one of the available formats. You can also save a
% figure from the command line using the _print()_ command.
print( h, './firstFigure.png', '-dpng' ); % save figure as png. Type "help print" to see all options.
%%
% You should notice that the dimensions of the figure in the saved file are
% not the same as the dimension of the figure that we manually set, nor how
% it looks on the screen when we plot. To resolve this we need to set one
% more property.
set(h, 'PaperPositionMode','Auto'); % this command makes saving the figur
print( h, './firstFigure2.png', '-dpng' );
%%
% MATLAB's built-in ".fig" format is worth knowing about. Type "help
% savefig". This allows you to save a graphic object and open it later with
% the capability to edit the graphic properties as we have just done. This
% is useful for saving publication figures. If you need to change something
% later, this can be a quick way to modify the figure.
help savefig
%%
%
savefig(h,'./firstFigure.fig');
close all
openfig('./firstFigure.fig');
