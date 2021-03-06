% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/5_fun_bin.levels.R
\name{bin.levels}
\alias{bin.levels}
\title{Defining labels of the binary partions.}
\usage{
bin.levels(variable, spl, ...)
}
\arguments{
\item{variable}{segmentation variables (factor).}

\item{spl}{matrix containing the posible combination of levels of factor.}

\item{\dots}{Further arguments passed on to \code{\link{bin.levels}}.}
}
\value{
list of matrices containing for each dependend latent variable the dependent LV and the explicative latent variables.
}
\description{
Defining labels of the binary partions.
}
\details{
Internal function. \code{bin.levels} is called by \code{splitopt.pls}.
}
\keyword{internal}
