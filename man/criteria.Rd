\name{criteria}
\alias{criteria}
\title{criteria for comparison the bayesian beta regression}
\description{Performs the comparison criterias for the Bayesian Beta Regression}
\usage{
criteria(X,beta.residuals)
}
\arguments{

 \item{X}{object of class matrix, with the independent variable for the mean}
 \item{beta.residuals}{object of class bayesbetareg, with the residuals of the Bayesian Beta regression, that can be calculated by the function beta.residuals}
}
\details{
This function calculate the residuals of a bayesian beta regression. 
}
\value{
 \item{deviance}{the deviance criteria}
 \item{AIC}{the AiC criteria}
 \item{BIC}{the BIC criteria}
}
\author{
 Daniel Jaimes \email{dajaimesc@unal.edu.co},
 Margarita Marin \email{mmarinj@unal.edu.co},
 Javier Rojas \email{jarojasag@unal.edu.co},
 Martha Corrales \email{martha.corrales@usa.edu.co}  
 Maria Fernanda Zarate \email{mfzaratej@unal.edu.co}   
 Ricardo Duplat \email{rrduplatd@unal.edu.co}    
 Luis Villaraga \email{lfvillarragap@unal.edu.co} 
 Edilberto Cepeda-Cuervo \email{ecepedac@unal.edu.co},     
}
\examples{
library(betareg)
data(ReadingSkills)

Y <- as.matrix(ReadingSkills[,1])
n <- length(Y)
X1 <- as.matrix(ReadingSkills[,2])
for(i in 1:length(X1)){
  X1 <- replace(X1,X1=="yes",1)
  X1 <- replace(X1,X1=="no",0)
}
X0 <- rep(1, times=n)
X1 <- as.numeric(X1)
X2 <- as.matrix(ReadingSkills[,3])
X3 <- X1*X2
X <- cbind(X0,X1,X2,X3)
Z0 <-  X0 
Z <- cbind(X0,X1)

burn <- 0.3
jump <- 3
nsim <- 400

bpri <- c(0,0,0,0)
Bpri <- diag(100,nrow=ncol(X),ncol=ncol(X))
gpri <- c(0,0)
Gpri <- diag(10,nrow=ncol(Z),ncol=ncol(Z))

re<-Bayesianbetareg(Y,X,Z,nsim,bpri,Bpri,gpri,Gpri,0.3,3,graph1=FALSE,graph2=FALSE)
summary(re)

readingskillsresiduals<- betaresiduals(Y,X,re)

readingskillscriterias <- criteria(X,readingskillsresiduals)

}
\keyword{Bayesian}
\keyword{Metropolis Hastings}
\keyword{Mean-covariance modelling}
\keyword{Beta}
