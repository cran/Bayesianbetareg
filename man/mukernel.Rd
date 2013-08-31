\name{mukernel}
\alias{mukernel}
\title{the probability of a beta parameter from the probability density funcion defined by old parameters}
\description{evaluate the probability of a beta parameter from the probability density function defined by old parameters}
\usage{
mukernel(X, Z, Y, betas.n, betas.v, gammas.v, bpri, Bpri)
}
\arguments{
  \item{X}{object of class matrix, with the variables for modelling the mean}
  \item{Z}{object of class matrix, with the variables for modelling the variance}
  \item{Y}{object of class matrix, with the dependent variable}
  \item{betas.n}{a vector with the beta parameter, new parameter,  to evaluate in the old p.d.f}
  \item{betas.v}{a vector with the beta that define the old p.d.f}
  \item{gammas.v}{a vector with the gamma that define the old p.d.f}
  \item{bpri}{a vector with the initial values of gamma}
  \item{Bpri}{a matrix with the initial values of the variance of gamma}
}
\details{
Evaluate the probability of a beta parameter from the probability density function defined by old parameters, according with the model proposed by Cepeda(2001) and Cepeda and Gamerman(2005). 
}
\value{
 \item{value}{a matrix with the probability for the beta parameter from the probability density function defined by old parameters}
}
\references{
1. Cepeda C. E. (2001). Modelagem da variabilidade em modelos lineares generalizados. Unpublished Ph.D. tesis. Instituto de Matemáticas. Universidade Federal do Río do Janeiro. 
//http://www.docentes.unal.edu.co/ecepedac/docs/MODELAGEMDAVARIABILIDADE.pdf.
http://www.bdigital.unal.edu.co/9394/.
2.Cepeda, E. C. and Gamerman D. (2005). Bayesian Methodology for modeling parameters in the two-parameter exponential family. Estadistica 57, 93 105.
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
betas.n=c(0,0,0,0)
betas.v=c(0,0,0,0)
gammas.v=c(0,0)
bpri=c(0,0,0,0)
Bpri=diag(100,nrow=ncol(X),ncol=ncol(X))

denbeta <- mukernel(X,Z,Y,betas.n,betas.v,gammas.v,bpri,Bpri)
denbeta

}
\keyword{Bayesian}
\keyword{Metropolis Hastings}
\keyword{Mean covariance modelling}
\keyword{Beta}
