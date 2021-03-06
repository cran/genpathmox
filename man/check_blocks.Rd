% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pls.R
\name{check_blocks}
\alias{check_blocks}
\title{Check well defined blocks}
\usage{
check_blocks(blocks, Data)
}
\arguments{
\item{blocks}{list defining the blocks of manifest variables. Elements in
\code{blocks} must have the same mode: all "numeric" or all "character".}

\item{Data}{matrix or data frame from where to extract manifest variables.}
}
\value{
validated blocks (output in numeric format)
}
\description{
Check well defined blocks
}
\details{
Internal function. \code{check_blocks} is called by \code{check_args}.
}
\keyword{internal}
