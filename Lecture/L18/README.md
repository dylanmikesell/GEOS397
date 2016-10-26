# GEOS 397/597

## Lecture #18: Curve fitting
use __practical_18.m__

### 1) Update from github
---
### 2) polyfit, polyval, corrcoef, roots

MATLAB provides several built-in functions to fit curves* Many require the “Curve Fitting Toolbox”, or other toolboxes.
* We will only use the basic curve fitting functions that are part of standard MATLAB
* We will focus on:
	
1) polyfit

2) polyval

3) corrcoef

4) roots---### 3) Review polynomials

Polynomials come in different **orders** or **degrees**.

---

* $0^{th}$ order: a single constant value

Examples: 

$y=4$		
$y=2.75$		
$y=-12.1$

---

* $1^{st}$ order: a linear equation (i.e. independent variable is to $1^{st}$ power)

Examples: 

$y=4x$		
$y=2.75x+7$		
$y=-12.1x-21.3$

---

* $2^{nd}$ order: a quadratic equation

Examples: 

$y=4x^2$		
$y=2.75x^2 + 7$		
$y=-12.1x^2-21.3x+1.4$

---

* $3^{rd}$ order: a cubic equation

Examples: 

$y=4x^3$		
$y=2.75x^3 + 7$		
$y=-12.1x^3-21.3x+1.4$		
$y=12x^3+3x^2-11x+2$

---

* $n^{th}$ order: a polynomial where $n$ is the largest exponent on the independent variable

* Can be represented in MATLAB as a row vector of the coefficients in front of the independent variable of decreasing order

[3, 2.7, 1, -5.7] $\rightarrow 3x^3 + 2.7x^2 + x - 5.7$
	
The polynomial **order** is always 

	n = numel(vector) - 1 

_Remember the $0^{th}$ order term! Also remember that the equation order doesn't matter, but the vector order does! (It is a good habit to organize the terms based on reducing order though.)_

x - 5.7 + $3x^3 + 2.7x^2 \rightarrow $ [3, 2.7, 1, -5.7] 

---

#### polyval() -- evaluate polynomial

These vectors can be interpreted by __polyval()__ as coefficients of a polynomial and used to make a curve.

_Try first practical exercise._

---

#### polyfit() -- fit polynomial to data

This function can be used to estimate the coefficients from an existing curve.

_Try second practical exercise._

#### Linear least-squares fitting

---

#### Goodness of fit

---

### 4) Student exercises in class
