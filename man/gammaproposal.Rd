\name{gammaproposal}
\alias{gammaproposal}
\title{A proposal for gamma parameter}
\description{Propose a value for the gamma parameter}
\usage{
gammaproposal(Y,X, Z, betas, gammas, gpri, Gpri)
}
\arguments{
  \item{Y}{object of class matrix, with the dependent variable}
  \item{X}{object of class matrix, with the variables for modelling the mean}
  \item{Z}{object of class matrix, with the variables for modelling the variance}
  \item{betas}{a vector with the previous proposal beta parameters}
  \item{gammas}{a vector with the previous proposal gamma parameters}
  \item{gpri}{a vector with the initial values of gamma}
  \item{Gpri}{a matrix with the initial values of the variance of gamma}
}
\details{Generate a proposal for the gamma parameter according to the model proposed by Cepeda(2001) and Cepeda and Gamerman(2005). }
\value{
 \item{value}{a number with the proposal for the gamma parameter}
 }
\references{
1.Cepeda C. E. (2001). Modelagem da variabilidade em modelos lineares generalizados. Unpublished Ph.D. tesis. Instituto de Matemáticas. Universidade Federal do Río do Janeiro. 
//http://www.docentes.unal.edu.co/ecepedac/docs/MODELAGEM0DAVARIABILIDADE.pdf
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
betas.ind=c(0,0,0,0)
gammas.ind=c(0,0)
gpri=c(0,0)
Gpri=diag(10,nrow=ncol(Z),ncol=ncol(Z))

gamma <- gammaproposal(Y,X,Z,betas.ind,gammas.ind,gpri,Gpri)
gamma

}
\keyword{Bayesian}
\keyword{Metropolis Hastings}
\keyword{Mean covariance modelling}
\keyword{Beta}
