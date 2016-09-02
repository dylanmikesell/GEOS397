# GEOS 397/597

## Lecture #3: Conditional branching and loops

### 1) Announcement about Markdown and MATLAB publishing to PDF for first homework.

## To we will talk about [**control flow**](http://www.mathworks.com/help/matlab/control-flow.html) in MATLAB.

### Preliminary

(Chapter 4 in book)

The purpose of relational and logical operators is to provide answers to True/False questions. To represent this idea numerically MATLAB uses a system based on:

True=1 and False=0

	a) Relational testing (<,>,<=,>=,==,~=) (Section 4.1.1)
	b) Logical Operators (&, | , ~) (Section 4.1.2)
	c) Conditional branching If, elseif, else, end (Section 4.1.3)


### 2) Conditional branching with if-statements

A [**branch**](https://en.wikipedia.org/wiki/Branch_(computer_science)) is an instruction in a computer program that can cause a computer to begin executing a different instruction sequence and thus deviate from its default behavior of executing instructions in order. **Branch** (or branching, branched) may also refer to the act of switching execution to a different instruction sequence as a result of executing a branch instruction. A branch instruction can be either an unconditional branch, which always results in branching, or a conditional branch, which may or may not cause branching, depending on some condition. Branch instructions are used to implement control flow in program loops and conditionals (i.e., executing a particular sequence of instructions only if certain conditions are satisfied).

In computer science, [**conditional statements**](https://en.wikipedia.org/wiki/Conditional_(computer_programming)), **conditional expressions** and **conditional constructs** are features of a programming language, which perform different computations or actions depending on whether a programmer-specified boolean condition evaluates to true or false. Apart from the case of branch predication, this is always achieved by selectively altering the control flow based on some condition.

[Flowchart image 1](https://en.wikipedia.org/wiki/Conditional_(computer_programming)#/media/File:If-Then-Else-diagram.svg)

[Flowchart image 2](https://en.wikipedia.org/wiki/Conditional_(computer_programming)#/media/File:IF-THEN-ELSE-END_flowchart.svg)

	if expression
    	statements
	elseif expression
    	statements
	else
    	statements
	end

### 3) Conditional branching with switch-statements

In computer programming languages, a [**switch**](https://en.wikipedia.org/wiki/Switch_statement) statement is a type of selection control mechanism used to allow the value of a variable or expression to change the control flow of program execution via a multiway branch. In MATLAB it looks like:

	switch switch_expression
   		case case_expression
      		statements
   		case case_expression
      		statements
    		...
   		otherwise
      		statements
	end

### 4) For Loops

	"There are a number of other ways of controlling the flow of your code,
	for example the for command can be used when we want to repeat the same
	operation a specific number of times. For loops are commonly used in
	other programming languages such as FORTRAN to repeat specific tasks,
	they are also possible in MATLAB but computationally expensive, so they
	should be avoided when possible. For loops depend on a variable which is
	set as a counter that will run for a specific number of cycles. 
	
The syntax looks like:
	
	for index = values
   		statements
	end
	
### 5) While

[**while**](http://www.mathworks.com/help/matlab/ref/while.html) evaluates an expression, and repeats the execution of a group of statements in a loop while the expression is true. An expression is true when its result is nonempty and contains only nonzero elements (logical or real numeric). Otherwise, the expression is false.

	while expression
   		statements
	end

### 6) In class exercise

	a) Create an array that starts at 0.0 and ends at the 10.5. Make the array spacing 0.1.
	b) Using relation testing, make a new vector that contains a 1 if the element in your array is less than 5 and a 0 if your element is greater than or equal to 5.
	c) Compute pi/4 using: 
	
$$\sum_{n=0}^{\infty} \frac{(-1)^n}{2n+1} = \frac{\pi}{4}$$

