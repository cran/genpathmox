% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pls.R
\name{get_rank}
\alias{get_rank}
\title{Rank of a non-metric variable}
\usage{
get_rank(X)
}
\arguments{
\item{X}{an ordinal or nominal manifest variable to be ranked}
}
\value{
vector with the corresponding rank for each category
}
\description{
Rank of a non-metric variable
}
\details{
Internal function. \code{get_rank} is called by \code{get_treated_data}
and \code{get_weights}.
}
\keyword{internal}
