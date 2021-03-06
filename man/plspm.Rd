% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pls.R
\name{plspm}
\alias{plspm}
\title{PLS-PM: Partial Least Squares Path Modeling}
\usage{
plspm(
  Data,
  path_matrix,
  blocks,
  modes = NULL,
  scaling = NULL,
  scheme = "centroid",
  scaled = TRUE,
  tol = 1e-06,
  maxiter = 100,
  plscomp = NULL,
  boot.val = FALSE,
  br = NULL,
  dataset = TRUE
)
}
\arguments{
\item{Data}{matrix or data frame containing the manifest variables.}

\item{path_matrix}{A square (lower triangular) boolean matrix representing 
the inner model (i.e. the path relationships between latent variables).}

\item{blocks}{list of vectors with column indices or column names
from \code{Data} indicating the sets of manifest variables forming 
each block (i.e. which manifest variables correspond to each block).}

\item{modes}{character vector indicating the type of measurement for each
block. Possible values are: \code{"A", "B", "newA", "PLScore", "PLScow"}. 
The length of \code{modes} must be equal to the length of \code{blocks}.}

\item{scaling}{optional argument for runing the non-metric approach; 
it is a list of string vectors indicating the type of 
measurement scale for each manifest variable specified in \code{blocks}.
\code{scaling} must be specified when working with non-metric variables.
Possible values: \code{"num"} (linear transformation, 
suitable for numerical variables), \code{"raw"} (no transformation), 
\code{"nom"} (non-monotonic transformation, suitable for nominal variables), 
and \code{"ord"} (monotonic transformation, suitable for ordinal variables).}

\item{scheme}{string indicating the type of inner weighting
scheme. Possible values are \code{"centroid"}, \code{"factorial"}, or
\code{"path"}.}

\item{scaled}{whether manifest variables should be standardized. 
Only used when \code{scaling = NULL}. When (\code{TRUE}, data is 
scaled to standardized values (mean=0 and variance=1). 
The variance is calculated dividing by \code{N} instead of \code{N-1}).}

\item{tol}{decimal value indicating the tolerance criterion for the
iterations (\code{tol=0.000001}). Can be specified between 0 and 0.001.}

\item{maxiter}{integer indicating the maximum number of iterations
(\code{maxiter=100} by default). The minimum value of \code{maxiter} is 100.}

\item{plscomp}{optional vector indicating the number of PLS components
(for each block) to be used when handling non-metric data 
(only used if \code{scaling} is provided)}

\item{boot.val}{whether bootstrap validation should be performed. 
(\code{FALSE} by default).}

\item{br}{number bootstrap resamples. Used only
when \code{boot.val=TRUE}. When \code{boot.val=TRUE}, the default number of 
re-samples is 100.}

\item{dataset}{whether the data matrix used in the computations should be
retrieved (\code{TRUE} by default).}
}
\description{
Estimate path models with latent variables by partial least squares approach
(for both metric and non-metric data)
}
\details{
Internal function
}
\keyword{internal}
