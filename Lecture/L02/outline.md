## GEOS 397/597 Lecture #2: Intro to Github Desktop, MATLAB, language types, & variable types

### Outline:
 
#### Github desktop applicaiton

	- Clone a repository from online source
	- Make our own branch
	- Commit a change to our branch
	- Switch back to master branch
	- Create a new completely new repository
	
GEOS397 folder can be found [here](https://github.com/dylanmikesell/GEOS397).

#### MATLAB desktop application

Get familiar with 

	- Editor
	- Current Folder
	- Command Window
	- Command History
	- Workspace
	- Variable space
	- Ribbon
	- Figures
	
You can refer to **Section 1.2** in the textbook for a reminder of the MATLAB GUI.

---
#### MATLAB publishing

[Markup](http://www.mathworks.com/help/matlab/matlab_prog/marking-up-matlab-comments-for-publishing.html) in MATLAB?

---
### MATLAB diary and help

See Lecture2.m file.

---
#### Language types

	- Compiled vs. Interpretated

Consider reading either of these:

* [Programming Concepts: Compiled and Interpreted Languages](https://thesocietea.org/2015/07/programming-concepts-compiled-and-interpreted-languages/)
* [What’s the difference between compiled and interpreted languages?](http://www.programmerinterview.com/index.php/general-miscellaneous/whats-the-difference-between-a-compiled-and-an-interpreted-language/)

---
#### Variable types in MATLAB

All data types found [here](http://www.mathworks.com/help/matlab/data-types_data-types.html). For example,

	- int
	- double
	- string
	- structure

Remember to read the Matlab Style Guide pdf!! It explain conventions for naming variables so that the person reading the code can quickly determine the variable type just by the name.

---
Let's look at the [Numeric Types](http://www.mathworks.com/help/matlab/numeric-types.html).

Consider the 32 bit (single) vs. 64 bit (double) representation of a number. Both of these data types are floating-point numbers. Let's look at this MATLAB [site](http://www.mathworks.com/help/matlab/matlab_prog/floating-point-numbers.html) to get an idea of the difference.

---
Different variables take up a different amount of space on the computer no matter what the value of the variable. Try this MATLAB code to determine the size of $a$:

~~~~% Create random variable
a = rand(100);
% Get variable information. Note the variable name is passed as a string
S = whos('a') ;
varSize = S.bytes
~~~~ 

Remember 8 bits in a byte!! [Here's](http://lifehacker.com/the-difference-between-bits-and-bytes-and-why-it-matte-510705022) a good example of why knowing the difference is worthwhile as a consumer.
