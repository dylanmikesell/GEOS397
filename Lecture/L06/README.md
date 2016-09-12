# GEOS 397/597

## Lecture #6: Taylor Series, Derivatives, File I/O, TRY-CATCH

### 1) Update the [master](https://github.com/dylanmikesell/GEOS397) branch on github.com. We are working with Lecture/L06/[README.md](https://github.com/dylanmikesell/GEOS397/tree/master/Lecture/L06).

### 2) Announcements & pop quiz #1

### 3) Algorithm for homework partners

	Write on board.
	
__5 pts. extra credit to each person who can implement on their own.__

### 4) Finite differences and Taylor Expansion

See L05 notes.

### 5) File I/O

MATLAB has a variety of tools to load different formats. For an overview of functionality check [here](http://www.mathworks.com/help/matlab/data-import-and-export.html).

ASCII file readers

	1) Import data GUI
	2) importdata()
	3) xlsread()
	4) csvread()
	5) dlmread()
	6) textscan() + fileID

Binary files
	
	1) low-level I/O

Excel spreadsheets (MATLAB guide [here](http://www.mathworks.com/help/matlab/spreadsheets.html)).

### 6) "try, catch" statements

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
