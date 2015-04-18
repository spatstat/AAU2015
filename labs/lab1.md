## Lab1

This session gives a general orientation to `R` and
`spatstat`.

If you have not already done so, you’ll need to

-   Start `R`.

-   Load the `spatstat` package by typing
```r
library(spatstat)
```

-------------------------------------------------------------------

1.  We will study a dataset that records the locations of Ponderosa Pine
    trees (*Pinus ponderosa*) in a study region in the
    Klamath National Forest in northern California. The data are
    included with `spatstat` as the dataset
    `ponderosa`.

    1.  Type `data(ponderosa)` to access the data;

    2.  assign the data to a shorter name, like `X` or
        `P`;

    3.  plot the data;

    4.  find out how many trees are recorded;

    5.  find the dimensions of the study region;

    6.  obtain an estimate of the average intensity of trees (number of
        trees per unit area).

2.  The Ponderosa data, continued:

    1.  When you type `plot(ponderosa)`, the command that is
        actually executed is `plot.ppp`, the plot method for
        point patterns. Read the help file for the function
        `plot.ppp`, and find out which argument to the
        function can be used to control the main title for the plot;

    2.  plot the Ponderosa data with the title *Ponderosa Pine
        Trees* above it;

    3.  from your reading of the help file, predict what will happen if
        we type
 ```r
 plot(ponderosa, chars="X", cols="green")
```
        then check that your guess was correct;

    4.  try different values of the argument `chars`, for
        example, one of the integers $0$ to $25$, or a letter of the
        alphabet. (Note the difference between `chars=3` and
        `chars="+"`, and the difference between `chars=4` and
        `chars="X"`).

3.  Create and plot a window object (object of
    class `"owin"`) representing each of the following:

    1.  the rectangle [0,10]x[0, 5];

    2.  the disc of radius 4 centred at (5,2);

    3.  the intersection of these two windows.

3.  The following vectors record the locations of 10 scintillation events
    observed under a microscope. Coordinates are given in microns, and
    the study region was $30 \times 30$ microns, with the origin at the
    bottom left corner.
```r
x <- c(13, 15, 27, 17, 8, 8, 1, 14, 19, 23)
y <- c(3, 15, 7, 11, 10, 17, 29, 22, 19, 29)
```
    Create a point pattern `X` from the data,
    and plot the point pattern.

4.  The dataset `longleaf` contains the Longleaf Pines
    dataset giving the locations of trees and their diameters at breast
    height.

    1.  Read the help file for the data;

    2.  access the dataset and plot it;

    3.  re-plot the data so that the tree diameters are displayed at a
        physical scale that is 10 times the physical scale of the
        location coordinates.

