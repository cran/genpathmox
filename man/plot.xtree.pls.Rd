% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_plot.xtree.pls.R
\name{plot.xtree.pls}
\alias{plot.xtree.pls}
\title{Plot function for the Pathmox Segmentation Trees: PLS-PM}
\usage{
\method{plot}{xtree.pls}(
  xtree,
  root.col = "grey",
  node.col = "orange",
  leaf.col = "green2",
  shadow.size = 0.003,
  node.shadow = "red",
  leaf.shadow = "darkgreen",
  cex = 0.7,
  seg.col = "blue3",
  lwd = 1,
  show.pval = TRUE,
  pval.col = "blue",
  main = NULL,
  cex.main = 1,
  ...
)
}
\arguments{
\item{xtree}{An object of class \code{"xtree.pls"} returned by 
\code{\link{pls.pathmox}}}

\item{root.col}{Fill color of root node.}

\item{node.col}{Fill color of child nodes.}

\item{leaf.col}{Fill color of leaf.}

\item{shadow.size}{Relative size of shadows.}

\item{node.shadow}{Color of shadow of child nodes.}

\item{leaf.shadow}{Color of shadow of leaf nodes.}

\item{cex}{A numerical value indicating the magnification to be used for
plotting text.}

\item{seg.col}{The color to be used for the labels of the segmentation
variables.}

\item{lwd}{The line width, a positive number, defaulting to 1}

\item{show.pval}{Logical value indicating whether the p-values should be
plotted.}

\item{pval.col}{The color to be used for the labels of the p-values.}

\item{main}{A main title for the plot.}

\item{cex.main}{The magnification to be used for the main title.}

\item{\dots}{Further arguments passed on to \code{\link{plot.xtree.pls}}.}
}
\description{
The function \code{plot.xtree.pls} allows to drow PATHMOX tree for PLS-SEM
}
\examples{

\dontrun{
 ## example of PLS-PM in bank customer satisfaction
 
data(csibank)

# select manifest variables
data.bank <-csibank[,6:32]

# define inner model matrix
Image 			  = rep(0,6)
Expectation	  = c(1,0,0,0,0,0)
Quality		    = c(0,1,0,0,0,0)
Value			    = c(0,1,1,0,0,0)
Satis			    = c(1,1,1,1,0,0)
Loyalty       = c(1,0,0,0,1,0)
inner.bank = rbind(Image,Expectation, Quality, Value, Satis,Loyalty)
colnames(inner.bank) = rownames(inner.bank)

# blocks of indicators (outer model)
outer.bank  = list(1:6,7:10,11:17,18:21,22:24,25:27)
modes.bank = rep("A", 6)


# re-ordering those segmentation variables with ordinal scale 
seg.bank= csibank[,1:5]

seg.bank$Age = factor(seg.bank$Age, ordered=TRUE)
seg.bank$Education = factor(seg.bank$Education, ordered=TRUE)


# Pathmox Analysis
bank.pathmox=pls.pathmox(data.bank, inner.bank, outer.bank, modes.bank,SVAR=seg.bank,signif=0.05,
                         deep=2,size=0.2,n.node=20)
plot(bank.pathmox)
 
 }
}
