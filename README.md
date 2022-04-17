# **MechaCar_Statistical_Analysis**

## **Linear Regression to predict mpg**

### The Data
Our data consists of a cross section of data that is materially complete.  Data includes 6 variables describing 50 obervations of miles-per-gallon, a vehicle's weight, a vehicle's length, its spoiler angle, its clearance from the ground, and a binary variable inidcating if the vehicle is all-wheel drive or not.  Since the population contains 50 variables, it was decided that it would be sufficient for analysis but that sampling might produce too few observations to conclude meaningful statistical inference.  Shapiro tests indicate that all variables wiht the exception of vehicle length can be considered normally distributed. In order state the estimators so that we are able to intepret them in terms of the % effect of each individual variable on the dependent variable, the data (with the exception of AWD) were treated with a lognormal transformation. 

### the Regression
![summary](regressio_summary.png)

Length, weight, spoiler angle, ground clearance, and AWD, were regressed on MPG.
Findings: 
 - Vehicle length and ground clerance had a statistically significant effect on mpg at the 99% confidence level. 
 - no other estimators were significants determinants of mpg, while given the other independent variables. 
 - The model as a whole has a statistically significant effect on mpg as indicated by the F-Statistic. 
 - The model explains approximately 70% of the variance in mpg. Although it explains most of the variance in Y, other data points and variables should be evaluated to increase the explanatory power of the overall model.
  
**Residuals**

 ![residuals](residuals_plot.png)
 
 - the plot of the residuals indicates random dispersion and no visually obervable presence of bias. 
 - The Breusch-Pagan test for heteroskedasticity was also ran concluding that the data within the model can be considered homoskedastistic in the current context. 

## **Summary Stats on Suspension Coils**






