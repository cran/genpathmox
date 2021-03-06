% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/35_fun_Fc.test.reg.R
\name{Fc.test.reg}
\alias{Fc.test.reg}
\title{Coefficient test for the regression model}
\usage{
Fc.test.reg(Y1, X1, var.f, var.p, method, ...)
}
\arguments{
\item{Y1}{vector of the concatenate indipendent latent variables of alternative hypothesis coefficient test.}

\item{X1}{matrix of the concatenate predictor latent variables of alternative hypothesis coefficient test.}

\item{var.f}{string define lable for the F-statistic.}

\item{var.p}{string define lable for the p-value.}

\item{method}{string indicating the method: LM or LAD.}

\item{\dots}{Further arguments passed on to \code{\link{Fc.test.reg}}.}
}
\value{
list containing the statistic and the p-value of coefficient test
}
\description{
Coefficient test for the regression model
}
\details{
Internal function. \code{Fc.test.reg} is called by \code{test.partition.reg}.
}
\keyword{internal}
