\name{plotresiduals}
\alias{plotresiduals}
\title{Plot the residuals of the bayesian beta regression}
\description{Plot the residuals (pearson standarized and deviance), the Cooks distance and the leverage against the predicted values for the Bayesian Beta Regression}
\usage{
plotresiduals(X, Y, betaresiduals, type)
}
\arguments{
  \item{X}{object of class matrix, with the independent variable for the mean}
  \item{Y}{object of class matrix, with the dependen variables}
  \item{betaresiduals}{object of class bayesbetareg, with the residuals of the Bayesianbetareg}
  \item{type}{type of residuals: 1. Deviance, 2.Pearson, 3.Standarized Pearson 4. Commun}
}
\value{
Plot the residuals of the bayesian beta regression
}
\author{
 Daniel Jaimes \email{dajaimesc@unal.edu.co},
 Margarita Marin \email{mmarinj@unal.edu.co},
 Javier Rojas \email{jarojasag@unal.edu.co},
 Martha Corrales \email{martha.corrales@usa.edu.co},  
 Maria Fernanda Zarate \email{mfzaratej@unal.edu.co},  
 Ricardo Duplat \email{rrduplatd@unal.edu.co},    
 Luis Villaraga \email{lfvillarragap@unal.edu.co}, 
 Edilberto Cepeda Cuervo \email{ecepedac@unal.edu.co} 
}
\keyword{Bayesian}
\keyword{Metropolis Hastings}
\keyword{Mean covariance modelling}
\keyword{Beta}