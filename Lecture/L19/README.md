# GEOS 397/597

## Lecture #19: Polynomial roots
use __practical_19.m__

### 1) Update from github
---
### 2) polyfit, polyval, corrcoef, roots

MATLAB provides several built-in functions to fit curves* Many require the “Curve Fitting Toolbox”, or other toolboxes.
* We will only use the basic curve fitting functions that are part of standard MATLAB
* We will focus on:
	
1) polyfit

2) polyval

3) roots

4) fzero -- to find roots when function is not a polynomial

5) corrcoef
---### 3) Review of polynomials with polyval, polyfit---### 4) Review roots of polynomials

Roots of a function are where the function equals 0 (i.e. f(x)=0)

Some polynomials have no real roots, but do have roots with imaginary numbers -- the discriminant tells us the roots.

$b^2 - 4ac$ 

The discriminant is the name given to the expression that appears under the square root (radical) sign in the quadratic formula.

$x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$

The discriminant tells you about the _nature_ of the roots of a quadratic equation given that a, b and c are rational numbers.  It quickly tells you the number of real roots associated with a quadratic equation.__Three cases__

1) $b^2 - 4ac > 0$, there are two real roots

2) $b^2 - 4ac = 0$, there is one real root

3) $b^2 - 4ac < 0$, there are two complex roots

---

Let's look at an example:

$x^2 - 6x + 8$, we can factor this to find $x^2 - 6x + 8 = (x-2)(x-4)$

Discriminant = $6^2 - 4*(1)*(8) = 4$

Discriminant is greater than zero so the function has _real_ roots: $x=2$ and $x=4$. Let's plot this polynomial in MATLAB.

---

* $1^{st}$ order: 1 root

* $2^{nd}$ order: 0, 1, or 2 roots

* $3^{rd}$ order: up to 3 roots

* $n^{th}$ order: up to n roots
---

#### roots() -- find a polynomial's roots given the polynomial coefficients 

_Try first practical exercise._

---

#### bisection method to find roots of a function on the interval [a,b]

What about when we have a function (e.g. a data time series) and we do not know the polynomial coefficients, but we want to find the roots in a given interval?

As an example let's find the roots of $x^2=2$. We know analytically that the roots are $x=\pm\sqrt{2}$. Let's use a computer program to find the root $x=\sqrt{2}$.

_See the two practical exercises._

First exercise demonstrates bisection to find $x$ when $x^2=2$.

Second exercise demonstrates how to modify the bisection method to find two points (one negative, one positive) that bound a zero.

---

#### Other methods used to find roots (i.e. zeros) of a function

1) Newton's Method

2) Secant Method

3) Inverse Quadratic Interpolation

### 5) How to find roots of general functions

In MATLAB __fzero()__ is the function we want to use; it combines the above methods for high accuracy and speed.


### 6) Student exercises in class
