% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pls.R
\name{get_generals}
\alias{get_generals}
\title{Get general parameters}
\usage{
get_generals(MV, path_matrix)
}
\arguments{
\item{MV}{matrix of manifest variables}

\item{path_matrix}{matrix with path connections}
}
\value{
list with number and names of observations, MVs and LVs
}
\description{
Get general parameters
}
\details{
Internal function. \code{get_generals} is called by \code{plspm}.
This function gets the number and names of: observations,
manifest variables, and latent variables
}
\keyword{internal}
