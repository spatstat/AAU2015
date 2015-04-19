## Lab 2

This session covers exploratory tools for investigating intensity.

1.  The dataset `japanesepines` contains the locations of
    Japanese Black Pine trees in a study region.

    1.  Plot the `japanesepines` data.

    2.  Use the command `quadratcount` to divide the study
        region of the Japanese Pines data into a 3x3 array of
        equal quadrats, and count the number of trees in each quadrat.

    3.  Most plotting commands will accept the argument
        `add=TRUE` and interpret it to mean that the plot
        should be drawn over the existing display, without clearing the
        screen beforehand. Use this to plot the Japanese Pines data, and
        superimposed on this, the 3x3 array of quadrats, with
        the quadrat counts also displayed.

    4.  Use the command `quadrat.test` to perform the
        χ-square test of CSR on the Japanese Pines data.

    5.  Plot the Japanese Pines data, and superimposed on this, the
        3x3 array of quadrats and the observed, expected and
        residual counts. Use the argument `cex` to make the
        numerals larger and `col` to display them in another
        colour.

2.  Japanese Pines, continued:

    1.  Using `density.ppp`, compute a kernel estimate of the
        spatially-varying intensity function for the Japanese pines
        data, using a Gaussian kernel with standard deviation
        σ=0.1 units, and store the estimated intensity in an
        object `D` say.

    2.  Plot a colour image of the kernel estimate `D`.

    3.  Plot a colour image of the kernel estimate `D` with
        the original Japanese Pines data superimposed.

    4.  Plot the kernel estimate without the ‘colour ribbon’.

    5.  Try the following command
    	```r
	persp(D, theta=70, phi=25, shade=0.4)
	```
        and find the documentation for the arguments `theta`,
        `phi` and `shade`.

3.  More Japanese Pines:

    1.  Compute a kernel estimate of the intensity for the Japanese
        Pines data using a Gaussian kernel with standard deviation
        σ=0.15.

    2.  Find the maximum and minimum values of the intensity estimate
        over the study region.

    3.  The kernel estimate of intensity is defined so that its integral
        over the entire study region is equal to the number of points in
        the data pattern, ignoring edge effects. Check whether this is
        approximately true in this example.
