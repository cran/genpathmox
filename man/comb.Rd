% Generated by roxygen2 (4.0.2): do not edit by hand
\name{comb}
\alias{comb}
\title{Enumerating the possible combinations of a specified size from the elements of a vector}
\usage{
comb(n, r, v = 1:n, set = TRUE, repeats.allowed = FALSE)
}
\arguments{
\item{n}{Size of the source vector}

\item{r}{Size of the target vectors}

\item{v}{Source vector. Defaults to 1:n}

\item{set}{Logical flag indicating whether duplicates should be removed from the source vector v}

\item{repeats.allowed}{Logical flag indicating whether the constructed vectors may include duplicated values.}
}
\value{
matrix
}
\description{
Enumerating the possible combinations of a specified size from the elements of a vector
}
\details{
Internal function. \code{comb} is called by \code{partition}.
}
\keyword{internal}
