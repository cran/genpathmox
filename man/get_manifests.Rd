% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pls.R
\name{get_manifests}
\alias{get_manifests}
\title{Building data matrix with manifest variables}
\usage{
get_manifests(Data, blocks)
}
\arguments{
\item{Data}{matrix or data frame from which manifest variables are extracted}

\item{blocks}{list (wtih numeric elements) indicating the set of manifest 
variables that form each block}
}
\value{
matrix or data frame of selected manifest variables
}
\description{
Building data matrix with manifest variables
}
\details{
Internal function. \code{get_manifests} is called by \code{plspm}.
}
\keyword{internal}
