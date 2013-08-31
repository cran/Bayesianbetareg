\name{betaresiduals}
\alias{betaresiduals}
\title{Residuals of the Beta Regression}
\description{This function calculates the beta regression residuals}
\usage{
betaresiduals(Y,X, model)
}
\arguments{
\item{Y}{object of class matrix, with the dependent variable}
\item{X}{object of class matrix, with the independent variable}
\item{model}{object of class Bayesianbetareg}
}
\value{
\item{abs}{The raw response residuals}
\item{swr0}{Pearson residuals}
\item{swr1}{standardized weighted residual 1}
\item{swr2}{standardized weighted residual 2}
\item{deviance}{deviance residuals}
\item{cook}{cook residuals}
\item{H}{H matrix H}
}
\references{
1.Cepeda C. E. (2001). Modelagem da variabilidade em modelos lineares generalizados. Instituto de Matemáticas. Universidade Federal do Río do Janeiro.http://www.docentes.unal.edu.co/ecepedac/docs/MODELAGEMDAVARIABILIDADE.pdf
2.Cepeda, E. C. and Gamerman D. (2005). Bayesian Methodology for modeling parameters in the two-parameter exponential family. Estadistica 57, 93 105.
3.Cepeda, E. and Garrido, L. (2011). Bayesian beta regression models: joint mean and precision modeling. Universidad Nacional
4.Cepeda, E. and Migon, H. and Garrido, L. and Achcar, J. (2012) Generalized Linear models with random effects in the two-parameter exponential family. Journal of Statistical Computation and Simulation. 1, 1 13.
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
# Modelation of the gini coeficient with multiples variables

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
reading_skillsresiduals<- betaresiduals(Y,X,re)
}
\keyword{Bayesian}
\keyword{Metropolis Hastings}
\keyword{Mean covariance modelling}
\keyword{Beta}
