# GEOS 397/597

## Lecture #12: Derivatives

### 1) Update from github

### 2) Numerical Derivatives

#### Error in the finite differences

	We have now completed the finite difference version of derivatives. We
	derived the equations for the finite differences and used them in HW3.
	However, we did not discuss the error. Let's return now and look at the
	error. See practical_12.m

#### Machine epsilon

Machine epsilon is the value of relative error due to rounding when computing with floats. For more on this value for different data types see this [wiki page](https://en.wikipedia.org/wiki/Machine_epsilon).

Machine epsilon is the distance from the number 1 to the next highest floating-point number. In other words, Machine epsilon is defined to be the smallest positive number which, when added to 1, gives a number different from 1.

Let's look at this in MATLAB. 

#### Class exercise: compute machine epsilon 

See practical_12.m

#### The Gradient operator

	The gradient comes up a lot in geosciences. We first need to review vectors
	and then we can talk about gradients. 



