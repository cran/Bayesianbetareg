\name{Bayesianbetareg}
\alias{Bayesianbetareg}
\title{Bayesianbetareg}
\description{Function to do Bayesian Beta Regression: joint mean and precision modeling}
\usage{
Bayesianbetareg(Y, X, Z, nsim, bpri, Bpri, gpri, Gpri, burn, jump, graph1, graph2)
}
\arguments{
  \item{Y}{object of class matrix, with the dependent variable.}
  \item{X}{object of class matrix, with the variables for modelling the mean.}
  \item{Z}{object of class matrix, with the variables for modelling the precision.}
  \item{nsim}{a number that indicate the number of iterations.}
  \item{bpri}{a vector with the initial values of beta.}
  \item{Bpri}{a matrix with the initial values of the variance of beta.}
  \item{gpri}{a vector with the initial values of gamma.}
  \item{Gpri}{a matrix with the initial values of the variance of gamma.}
  \item{burn}{a proportion that indicate the number of iterations to be burn at the beginning of the chain.}
  \item{jump}{a number that indicate the distance between samples of the autocorrelated the chain, to be excluded from the final chain.}
  \item{graph1}{if it is TRUE present the graph of the chains without jump and burn.}
  \item{graph2}{if it is TRUE present the graph of the chains with jump and burn. }
 }
\details{
The bayesian beta regression allow the joint modelling of mean and precision of a beta distributed variable, 
as is proposed in Cepeda (2001), with logit link for the mean  and  logarithmic for the precision. 
}
\value{
 object of class bayesbetareg with:
\item{coefficients}{object of class matrix with the estimated coefficients of beta and gamma.}
 \item{desv}{object of class matrix with the estimated desviations of beta and gamma.}
 \item{interv}{object of class matrix with the estimated confidence intervals of beta and gamma.}
 \item{fitted.values}{object of class matrix with the fitted values of y.}
 \item{residuals}{object of class matrix with the residuals of the regression.}
 \item{precision}{object of class matrix with the precision terms of the regression.}
 \item{variance}{object of class matrix with the variance terms of the regression.}
 \item{beta.mcmc}{object of class matrix with the complete chains for beta.}
 \item{gamma.mcmc}{object of class matrix with the complete chains for gamma.}
 \item{beta.mcmc.short}{object of class matrix with the chains for beta after the burned process.}
 \item{gamma.mcmc.short}{object of class matrix with the chains for gamma after the burned process.}
 \item{call}{Call.} 
}
\references{
1. Cepeda C. E. (2001). Modelagem da variabilidade em modelos lineares generalizados. Unpublished Ph.D. tesis. Instituto de Matemáticas. 
Universidade Federal do Río do Janeiro.
//http://www.docentes.unal.edu.co/ecepedac/docs/MODELAGEM20DA20VARIABILIDADE.pdf.
http://www.bdigital.unal.edu.co/9394/.
2.Cepeda, E. C. and Gamerman D. (2005). Bayesian Methodology for modeling parameters in the two-parameter exponential family. Estadistica 57, 93 105.
//
3.Cepeda, E. and Garrido, L. (2011). Bayesian beta regression models: joint mean and precision modeling. Universidad Nacional
//
4.Cepeda, E. and Migon, H. and Garrido, L. and Achcar, J. (2012) Generalized Linear models with random effects in the two parameter exponential family. 
Journal of Statistical Computation and Simulation. 1, 1 13.
}
\author{
 Daniel Jaimes \email{dajaimesc@unal.edu.co},
 Margarita Marin \email{mmarinj@unal.edu.co},
 Javier Rojas \email{jarojasag@unal.edu.co},
 Martha Corrales \email{martha.corrales@usa.edu.co},  
 Maria Fernanda Zarate \email{mfzaratej@unal.edu.co},   
 Ricardo Duplat \email{rrduplatd@unal.edu.co},    
 Luis Villaraga \email{lfvillarragap@unal.edu.co}, 
 Edilberto Cepeda-Cuervo \email{ecepedac@unal.edu.co}        
}
\keyword{Bayesian}
\keyword{Metropolis Hastings}
\keyword{Meancovariance modelling}
\keyword{Beta}


