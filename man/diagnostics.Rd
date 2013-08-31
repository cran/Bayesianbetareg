\name{diagnostics}
\alias{diagnostics}
\title{Plot the residuals of the bayesian beta regression}
\description{Plot the residuals (pearson standarized and deviance), the Cooks distance and the leverage against the predicted values for the Bayesian Beta Regression}
\usage{
diagnostics(model, residuals)
}
\arguments{
  \item{model}{object of class bayesbetareg, with the structure of the model}
  \item{residuals}{object of class bayesbetareg, with the residuals of the Bayesianbetareg}
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

#Example of the function betasresiduals and plots

readingskillsresiduals<- betaresiduals(Y,X,re)
diagnostics(re,readingskillsresiduals)

}
\keyword{Bayesian}
\keyword{Metropolis Hastings}
\keyword{Mean covariance modelling}
\keyword{Beta}
