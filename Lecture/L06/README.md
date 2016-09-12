# GEOS 397/597

## Lecture #6: File I/O, user I/O (command line and GUI), TRY-CATCH

### 1) Update the [master](https://github.com/dylanmikesell/GEOS397) branch on github.com. We are working with Lecture/L06/[README.md](https://github.com/dylanmikesell/GEOS397/tree/master/Lecture/L06).

### 2) Algorithm for homework partners

	Write on board.
	
__5 pts. extra credit to each person who can implement on their own.__

### 3) Finite differences and Taylor Expansion

### 4) File I/O

MATLAB has a variety of tools to load different formats. For an overview of functionality check [here](http://www.mathworks.com/help/matlab/data-import-and-export.html).

Let's first start with Excel spreadsheets (MATLAB guide [here](http://www.mathworks.com/help/matlab/spreadsheets.html)).

### 5) "try, catch" statements

Execute statements and catch resulting errors. This is useful in many circumstances, but particularly useful when trying to load a data file. You can also _repackage_ built-in MATLAB errors as a warning. The syntax is as follows.

	try
   		statements
	catch exception
   		statements
	end

_Notes:_

	1) You cannot use multiple catch blocks within a try block, but you can 
	nest complete try/catch blocks.
	2) Unlike some other languages, MATLAB does not allow the use of a finally
	block within try/catch statements.

### 6) User I/O

MATLAB has a variety of methods to get user input. These are either based on the command line, built-in GUI functions, or you can make custom GUIs. In this lecture we will consider the first two options.

For a list of built-in MATLAB dialog boxes check [this](http://www.mathworks.com/help/matlab/predefined-dialog-boxes.html) site.
