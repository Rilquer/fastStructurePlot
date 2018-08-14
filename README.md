# fastStructurePlot
Basic R script to plot results from fastStructure

str_plot is an R function with 3 arguments:
str_plot(x,y=NA,order=NA)

x = file with extension .Q outputted by fastStructure.

y (optional) = a string vector with the names of samples to be plotted in the X axis (following the order in original .Q file from fastStructure)

order (optional) = a string vector with the names of samples in the order they should be plotted. Using order requires that y is informed. This
is useful when samples need to be plotted, e.g., in a geographical order for more didatic plots. 
