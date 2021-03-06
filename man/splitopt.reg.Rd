% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/30_fun_splitopt.reg.R
\name{splitopt.reg}
\alias{splitopt.reg}
\title{Defining optimum partition for a specific variable (regression model)}
\usage{
splitopt.reg(x, splits, fact, method, ...)
}
\arguments{
\item{x}{matrix or data.frame with the data.}

\item{splits}{vector indicating the binary partition}

\item{fact}{vector indicating the variable}

\item{method}{string indicating the method: LM or LAD}

\item{\dots}{Further arguments passed on to \code{\link{splitopt.reg}}.}
}
\value{
list containing information of the optimum partition for a specific variable
}
\description{
Defining optimum partition for a specific variable (regression model)
}
\details{
Internal function. \code{splitopt.reg} is called by \code{all.part.reg}.
}
\keyword{internal}
