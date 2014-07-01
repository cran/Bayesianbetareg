\name{dpostg}
\alias{dpostg}
\title{Posterior value of gamma}
\description{Propose a value for posterior distribution of the gamma parameter}
\usage{
dpostg(X, Z, Y, betas, gammas, gpri, Gpri)
}
\arguments{
  \item{X}{object of class matrix, with the variables for modelling the mean}
  \item{Z}{object of class matrix, with the variables for modelling the variance}
  \item{Y}{object of class matrix, with the dependent variables}
  \item{betas}{a vector with the previous proposal beta parameters}
  \item{gammas}{a vector with the previous proposal gamma parameters}
  \item{gpri}{a vector with the initial values of beta}
  \item{Gpri}{a matrix with the initial values of the variance of beta}
}
\details{Generate a proposal for the beta parameter according to the model proposed by Cepeda(2001) and Cepeda and Gamerman(2005).}
\value{
 \item{value}{a matrix with the proposal for beta}
}
\references{
1. Cepeda C. E. (2001). Modelagem da variabilidade em modelos lineares generalizados. Unpublished Ph.D. tesis. Instituto de Matematicas. Universidade Federal do Rio do Janeiro.
//http://www.docentes.unal.edu.co/ecepedac/docs/MODELAGEMDAVARIABILIDADE.pdf.
http://www.bdigital.unal.edu.co/9394/.
2.Cepeda, E. C. and Gamerman D. (2005). Bayesian Methodology for modeling parameters in the two-parameter exponential family. Estadistica 57, 93 105.
}
\author{
 Daniel Jaimes \email{dajaimesc@unal.edu.co},
 Margarita Marin \email{mmarinj@unal.edu.co},
 Javier Rojas \email{jarojasag@unal.edu.co},
 Hugo Andres Gutierrez Rojas \email{hugogutierrez@usantotomas.edu.co},
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
betas.ind=c(0,0,0,0)
gammas.ind=c(0,0)
bpri=c(0,0)
Bpri=diag(10,nrow=ncol(Z),ncol=ncol(Z))

gamma <- dpostg(X,Z,Y,betas.ind,gammas.ind,bpri,Bpri)
gamma
}
\keyword{Bayesian}
\keyword{Metropolis Hastings}
\keyword{Mean covariance modelling}
\keyword{Beta}
