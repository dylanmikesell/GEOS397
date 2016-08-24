

%% Vectors and Matrices
% 
% MATLAB is so useful as a computing language because it is build to linear
% algebra and has many features that allow for rapid development with
% vectors and matrices. In the previous examples we used what is known as a
% "singleton". For example,
a = 1;

%%
% *Vectors*
%
% To make a row vector we could write
a = [1, 1, 1]
%%
% this uses the comma "," to separate the different entries. To make a
% column vector we could write
b = [1; 2; 3]
%%
% using the semicolon ";" to separate the different entries. To _transpose_
% _b_ to same shape as _a_ there are two options:
btrans = transpose( b ) 
%%
% or the shorthand version
btrans = b'

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
d( 2, : ) = 2
%%
% or
d( :, 1 ) = 0
%%
% Finally, keep in mind that a matrix can be any dimension _N_. For example
% we can allocate a 3x3x3 matrix (or tensor)
e = zeros( 3, 3, 3)

%% Plotting
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


%% Useful things to know about plotting and MATLAB graphics objects
%
% There are many more graphic properties that are worth knowing. Here we
% go through a few of the more important properties for creating nice
% graphics.
close all; % First will close all previous graphic windows.

fontName = 'Times'; % set the font name we want to use
fontWeight = 'Normal'; % set the font weight we want to use

h = figure('Color','White'); % create a new graphic and assign it "h", which is the _figure handle_
set(h,'PaperUnits','Inches'); % set the paper size units
set(h, 'Units', 'Inches','Position',[1 1 8 4]); % set the graphic size unit and dimension

plot( x, y, 'Color', 'r', 'LineWidth', 4 ); % change the color and line size
xlabel('X','FontName',fontName , 'FontWeight',fontWeight ); % set xlabel and font properties
ylabel('Y','FontName',fontName , 'FontWeight',fontWeight ); 
title('Our first plot','FontName',fontName , 'FontWeight',fontWeight );
axis('tight');

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
