# GEOS 397/597

## Lecture #5: Hillslope evolution
(Guest lecture by Mike Poulos)

### 1) Update the [master](https://github.com/dylanmikesell/GEOS397) branch on github.com. We are working Lecture/L05/[README.md](https://github.com/dylanmikesell/GEOS397/tree/master/Lecture/L05).

### 1) Discussion of "Surface Dating of Dynamic Landforms: Young Boulders on Aging Moraines", Bernard Hallet and Jaakko Putkonen, Science (1994)

Key points:

* The dating of landforms is crucial to understanding the evolution, history, and stability oflandscapes.
* Scientists must take into account the dynamic nature of landforms and of the ever-present processes of erosion, deposition, and weathering.
* Taking these processes into account leads to better resolved and more realistic interpretations of exposure age estimates from cosmogenic isotope analysis of landform surfaces.
* Information about the rates of surficial processes can be gained from ages of landform surfaces.
* The paper by Hallet and Putkonen focuses on the dating of moraines because moraines constitute the most prominent _terrestrial_ records of glacial history. Moreover, "recent" (c. 1994) dating experiments have been carried out on these landforms.
* Accurate dating of moraines is critical to reconstruct spatial and temporal variability of past climate.

#### Interpreting exposure ages

Interpretation requires an understanding of 2 processes:
	
	1) Processes that alter the cosmogenic isotope concentrations in rocks
	2) Processes that alter the duration of exposure

Lots of studies in the past have assessed isotope concentrations. This paper focuses on duration of exposure to a landform surface. A key remark in this paper about moraines is the following:

	"...in general there is no simple relation between moraine age and either
	 the exposure age of boulders or their degree of weathering. Boulders
	 initially situated on the moraine surface as ice retreats tend to remain
	 there, but finegrained sediment removal by wind, water, and slow
	 downslope movement causes additional boulders to emerge at the moraine
	 surface as this surface is lowered. These newly exposed boulders were
	 previously sheltered from cosmic rays and will thus attain exposure ages
	 that are younger than the moraine formation age."

and

	"Boulders at or near the ground surface break down and eventually
	disappear because of weathering. Thus, the age distribution of surface
	boulders is a function not only of moraine age but also of the competing
	effects of moraine erosion and boulder weathering, which respectively
	add and subtract surface boulders."

The relative ages of moraines are relatively simple to determine. We can simply study "the degree of soil development; the abundance and weathering characteristics of boulders on moraine surfaces; moraine shape that tends to smooth out with time because of erosion; and, in places, the superposition of moraines that reveals their ordering in time."

Regarding the use of hillslope modeling: "The influence of local erosion exposing subsurface boulders on exposure-age distributions has recently been explored (14) without consideration of weathering. In addition, the progressive topographic degradation of moraines has been well documented in the field (15, 16) and has been the subject of theoretical analysis (17). These studies provide the foundation for our modeling."

#### The model

"...a moraine flattens and widens with time as fine-grained sediment is transferred downslope from the moraine crest, exposing previously buried boulders there. Topographic evolution is dictated by the spatially nonuniform downslope motion of soil, defined here as including the loose, glacially derived rock debris that makes up the bulk of moraines"

* A simple way to think about this is if more soil exits from one particular domain than enters, the average elevation of that domain must decrease. This is soil conservation and "...the conservation of soil leads to an expression relating the rate of change of the local surface elevation, $dz/dt$, to the divergence of soil flux, $q$
$$\frac{\partial z}{\partial t} = - \frac{\partial q}{\partial x},$$
where $x$ is the horizontal distance in a plane perpendicular to the moraine axis."

### Question for students: What does this partial differential equation represent physically?

#### What is soil flux?

The downslope motion of soil is known as soil creep and arises from a diversity of processes that recurrently move soil particles including wind, rain splash, freeze and thaw cycles, and plant and animal activity.

Studies have shown that the topographic evolution of landforms "can be modeled quantitatively as a simple diffusional process, much like heat conduction. The analog of thermal diffusivity is the topographic diffusivity, $\kappa$, which is the volume of soil moving downslope per unit time and per unit length transverse to the slope divided by the slope inclination, $\partial z/\partial x$."

"The simplest relation expressing the general increase in soil flux with slope steepness is $$q = -\kappa \frac{\partial z}{\partial x}.$$

### Question for students: What does this partial differential equation represent physically?

#### Topographic diffusivity

1) "For slopes a few meters long, $\kappa$ typically ranges between 10-2 to 10-4 m$^2$/year over a wide spectrum of areas, climates, and alluvial substrates."

2) "For longer slopes, as high as 20 m on erosional scarps in alluvium, the value for $\kappa$ increases linearly with distance downslope.""

"To treat the evolution of lateral moraines, which in Bloody Canyon range in heights from about 50 to 200 m, we assume that topographic diffusivity takes the form $$\kappa = \alpha + \beta x,$$ where $\alpha$ and $\beta$ are site-specific constants."

#### The diffusion equation

Combining the conservation and transport equations (by inserting $q$), we arrive at the diffusion equation for topographic evolution $$ \frac{\partial z}{\partial t} = \frac{\partial }{\partial x} \left( \kappa \frac{\partial z}{\partial x} \right) = \kappa \frac{\partial^2 z}{\partial x^2} + \beta \frac{\partial z}{\partial x}.$$

#### Solving this equation numerically for $\partial z/ \partial t$

This equation can be solved _numerically_ using the **finite-difference approximation**. This is a numerical technique to approximate the value of a derivative. Note in the equation above that we have first and second order derivatives of $z$ with respect to $x$, each multiplied by a different constant. We can break this down into simple physical notions if we consider what the derivatives represent.

_For more on the finite difference method see section 3 below._

1) The first order derivative relates the slope of the topographic feature to the change in elevation with time. A larger slope leads to a larger change in elevation with time, assuming $\beta$ is positive and greater than or equal to 1.

2) The second derivative relates the slope curvature of the topographic to the change in elevation with time.

### Question for students: What is the relationship between topographic change, the second derivative and $\kappa$?  

In HW3 we will implement the finite difference approximation to solve the diffusion equation for topographic evolution. In this case, $h$ will be the distance between samples in a horizontal topography model. We will model the change in topography with time.

In the paper, the authors assume the starting model is a triangular slope, slightly gentler than the angle of repose.

### Question for students: What is the angle of repose?


#### Modeling results

This diffusion model produces moraine transverse topographic profiles in excellent agreement with observed forms (Fig. 1), which supports the notion that lateral moraine profiles can be useful indicators of moraine age.

**Look at Figure 1 and analyze the different curves.** Compare squares and solid line to see how well the model matches the observed data.

The authors were also able to estimate the best-fit $\alpha$ and $\beta$ using least squares fitting. We will discuss this method in a future class.

$\alpha$=1.2x10$^{-2}$ m$^2$/year

$\beta$=1.6x10$^{-4}$ m/year

The topographic model presented above yields the surface-lowering rate at a moraine crest, which permits determination of 

1) the rate at which new boulders emerge at the surface of the moraine crest as they are unearthed, and 

2) the length of time any particular boulder is subjected to subsurface and subaerial weathering.

#### Model discussion

"In spite of extreme idealizations, model results reproduce the essence of several known properties of boulder abundance and exposure ages (Fig. 2)."

**Study figure 2.**

Figure 2B shows the modeling of **boulder exposure age** compared to **percentage of boulders older than their exposure age**. Remember that boulders under the surface are old, but not exposed to cosmogenic radiation until un-earthed at the surface of the moraine. Take away -- "Mean exposure age does not necessarily increase with time because of the complicated interplay between rates at which boulders 1) are unearthed and 2) are reduced in size, both of which generally vary with time."

At small exposure age, few boulders match the exposure age. Contrastingly, as exposure age increases, more boulders match their exposure age estimates. Figure 2A shows real observations from different moraines.

#### Conclusions

1) The mean exposure age of boulders on a moraine crest is always only a fraction of the moraine age, although the two ages become identical for very young moraines.

2) On moraines sufficiently old that most boulders originally on the surface have been destroyed by weathering, exposure ages would be substantially younger than the moraine and, hence, would be useful in establishing only minimum moraine ages.

3) Factors absent from the model, such as the attritional loss of cosmogenically enriched outer parts of boulders and prior exposure, introduce additional uncertainty into the interpretation of cosmogenic surface exposure ages.

4) Our theoretical considerations highlight the need to complement advances in the use of cosmogenic isotopes to date geomorphic surfaces with detailed examination of the dynamic nature of landforms and of the universally present processes of weathering, erosion, and deposition.

### 2) Mike Poulos: Hillslope evolution in the Boise foothills and Dry Creel Experimental Watershed

### 3) Finite-difference approximation

(if time)

A) We use the Taylor Series expansion of the function $f(x+h)$
$$ f(x+h) = f(x) + h \frac{\partial f(x)}{\partial x} + \frac{h^2}{2} \frac{\partial^2 f(x)}{\partial x^2} + \frac{h^3}{6} \frac{\partial^3 f(x)}{\partial x^3} + \ldots$$
to derive the forward finite difference operator
$$ \frac{\partial f(x)}{\partial x} = \frac{f(x+h) - f(x)}{h} + \frac{h}{2} \frac{\partial^2 f(x)}{\partial x^2} + \frac{h^2}{6} \frac{\partial^3 f(x)}{\partial x^3} + \ldots = \frac{f(x+h) - f(x)}{h} + O(h),$$
where $O(h)$ stands for terms of order $h$ and higher. If we truncate this expression at $O(h)$, we arrive at the **forward** finite difference approximation for the first derivative
$$ \frac{\partial f(x)}{\partial x} \approx \frac{f(x+h) - f(x)}{h}.$$

B) We can also use the Taylor Series expansion of the function $f(x-h)$
$$ f(x-h) = f(x) - h \frac{\partial f(x)}{\partial x} + \frac{h^2}{2} \frac{\partial^2 f(x)}{\partial x^2} - \frac{h^3}{6} \frac{\partial^3 f(x)}{\partial x^3} + \ldots$$
to derive the backward finite difference operator
$$ \frac{\partial f(x)}{\partial x} = \frac{f(x) - f(x-h)}{h} + \frac{h}{2} \frac{\partial^2 f(x)}{\partial x^2} - \frac{h^2}{6} \frac{\partial^3 f(x)}{\partial x^3} + \ldots = \frac{f(x+h) - f(x)}{h} + O(h),$$
where $O(h)$ stands for terms of order $h$ and higher. If we truncate this expression at $O(h)$, we arrive at  the **backward** finite difference approximation
$$ \frac{\partial f(x)}{\partial x} \approx \frac{f(x) - f(x-h)}{h}.  $$

C) Finally we can subtract the two (forward and backward) expansions to get
$$ f(x+h) - f(x-h) = 2h \frac{\partial f(x)}{\partial x} + 2\frac{h^2}{6} \frac{\partial^3 f(x)}{\partial x^3} + \ldots$$
and then solve for the first derivative to get the centered finite difference operator
$$ \frac{\partial f(x)}{\partial x} = \frac{f(x+h) - f(x-h)}{2h} - \frac{h^2}{3} \frac{\partial^3 f(x)}{\partial x^3} + \ldots = \frac{f(x+h) - f(x-h)}{2h} + O(h^2),$$
where $O(h^2)$ stands for terms of order $h^2$ and higher. Neglecting terms of $O(h^2)$ gives us the **centered** finite difference approximation
$$ \frac{\partial f(x)}{\partial x} \approx \frac{f(x+h) - f(x-h)}{2h}. $$

D) To get the second order centered finite difference operator we add the expansions rather than subtract them (note that odd terms in $h$ cancel)
$$ f(x+h) + f(x-h) = 2f(x) + 2\frac{h^2}{2} \frac{\partial^2 f(x)}{\partial x^2} + 2\frac{h^4}{4!} \frac{\partial^4 f(x)}{\partial x^4} + \ldots$$
and then solve for the second order derivative
$$ h^2 \frac{\partial^2 f(x)}{\partial x^2} = f(x+h) -2f(x) + f(x-h) - 2\frac{h^4}{4!} \frac{\partial^4 f(x)}{\partial x^4} + \ldots$$
further reduction gives
$$ \frac{\partial^2 f(x)}{\partial x^2} = \frac{f(x+h) -2f(x) + f(x-h)}{h^2 } - 2\frac{h^2}{4!}\frac{\partial^4 f(x)}{\partial x^4} + \ldots = \frac{f(x+h) -2f(x) + f(x-h)}{h^2 } + O(h^2)$$
and neglecting $O(h^2)$ terms and higher, the **centered** finite difference approximation is 
$$ \frac{\partial^2 f(x)}{\partial x^2} \approx \frac{f(x+h) -2f(x) + f(x-h)}{h^2 } $$
