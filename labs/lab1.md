---
output: pdf_document
---
## Lab 1

This session is about reading in, displaying and summarising point patterns.

If you have not already done so, you’ll need to
-   Start `R`.
-   Load the `spatstat` package by typing
```r
library(spatstat)
```

1.  We will study a dataset that records the locations of Ponderosa Pine
    trees (*Pinus ponderosa*) in a study region in the
    Klamath National Forest in northern California. The data are
    included with `spatstat` as the dataset
    `ponderosa`.

    1.  assign the data to a shorter name, like `X` or `P`;

    2.  plot the data;

    3.  find out how many trees are recorded;

    4.  find the dimensions of the study region;

    5.  obtain an estimate of the average intensity of trees (number of
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
        example, one of the integers 0 to 25, or a letter of the
        alphabet. (Note the difference between `chars=3` and
        `chars="+"`, and the difference between `chars=4` and
        `chars="X"`).

3.  The following vectors record the locations of 10 scintillation events
    observed under a microscope. Coordinates are given in microns, and
    the study region was $30 \times 30$ microns, with the origin at the
    bottom left corner.
    ```r
    x <- c(13, 15, 27, 17, 8, 8, 1, 14, 19, 23)
    y <- c(3, 15, 7, 11, 10, 17, 29, 22, 19, 29)
    ```
    Create a point pattern `X` from the data,
    and plot the point pattern (use `owin` or `square` to define the study region).

4.  The file `anthills.txt` is available in the Data directory:

    [https://github.com/spatstat/AAU2015/Data/anthills.txt](https://github.com/spatstat/AAU2015/Data/anthills.txt)

    It records the locations of anthills recorded in a
    1200x1500 metre study region in northern Australia.
    Coordinates are given in metres, along with a letter code recording
    the ecological ‘status’ of each anthill (in this exercise we will ignore this letter code).

    1.  read the data into `R` as a data frame, using the `R` function
        `read.table`. (Since the input file has a header line, you
        will need to use the argument `header=TRUE` when you call
        `read.table`.)

    2.  check the data for any peculiarities.

    3.  create a point pattern `hills` containing these data.
        Ensure that the unit of length is given its correct name.

    4.  plot the data.
