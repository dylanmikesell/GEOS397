# GEOS 397/597

## Lecture #23: Rose plots, spider plots, ternary plots
use __practical_23.m__

### 1) Update from github & organize term project presentations
---
### 2) Rose plots

Rose diagrams explain the frequency of some parameter in a given orientation.

The azimuthal frequencies put into bins defined by the used. The radial distance from the center of the graph is the frequency or number of stations that recorded a given bin direction.

For example, if we use “20 degree” azimuthal bins for wind direction data (i.e. from 0‐20, 20‐40, 40‐60... etc... 320‐240, 340‐0), then the radial distance from the center of the graph is the frequency or number of stations that recorded a given wind direction, in a given 20‐degree bin.

MATLAB has __rose()__, but the most recent version of MATLAB suggest to use [__polarhistogram()__](https://www.mathworks.com/help/matlab/ref/polarhistogram.html). This makes sense as we are just making a histogram in azimuth.

NOTE: This is a special type of [polar plot](https://www.mathworks.com/help/matlab/polar-plots.html) that you can easily make with MATLAB. See the link for more on polar plots; here are the functions.

* polarplot()
* polarscatter()
* polarhistogram()
* compass()
* ezpolar()
---### 3) Spider (radar) plots

Example from [here](http://www.fusioncharts.com/chart-primers/radar-chart/).

Suppose you were asked to rank your favorite beer on 8 aspects (Sourness, Bitterness, Sweetness, Saltiness, Yeast, Hop, Malt and Special Grain) and then show them graphically. What is the best way to do this?

A Radar Chart is a graphical method of displaying multivariate data in the form of a two-dimensional chart of three or more quantitative variables represented on axes starting from the same point. 

There are a number of MATLAB File Exchange packages we can download for this purpose.

---

In Geochemistry we sometimes see these types of data simply represented as line graphs.

We can make our own version of this plot.

---
### 4) Ternary plots

A ternary plot is a graphical representation of phase diagram for a three component system. This type of plot displays the fraction of each element in the 3-element system. Each sample must add up to 1.

We will again use the File Exchange. There are many ternary plot programs out there. Use this [one](https://www.mathworks.com/matlabcentral/fileexchange/2299-alchemyst-ternplot). Download and put in your MATLAB working directory.

If you are not sure how to read a ternary diagram check out [this](http://csmres.jmu.edu/geollab/Fichter/SedRx/readternary.html) site. They have geology examples!

---
### 5) Student Exercise
