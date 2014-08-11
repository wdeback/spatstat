\name{plot.psp}
\alias{plot.psp}
\title{plot a Spatial Line Segment Pattern}
\description{
  Plot a two-dimensional line segment pattern
}
\usage{
  \method{plot}{psp}(x, \dots, add=FALSE, which.marks=1,
                     ribbon=TRUE, ribsep=0.15, ribwid=0.05, ribn=1024)
}
\arguments{
  \item{x}{
    The line segment pattern to be plotted.
    An object of class \code{"psp"},
    or data which can be converted into 
    this format by \code{\link{as.psp}()}.
  }
  \item{\dots}{
    extra arguments that will be passed to the plotting functions
    \code{\link{segments}} (to plot the segments)
    and 
    \code{\link{plot.owin}} (to plot the observation window).
  }
  \item{add}{
    Logical. If \code{TRUE}, the current plot is not erased;
    the segments are plotted on top of the
    current plot, and the window is not plotted.
  }
  \item{which.marks}{
    Index determining which column of marks to use,
    if the marks of \code{x} are a data frame.
    A character string or an integer.
    Defaults to \code{1} indicating the first column of marks.
  }
  \item{ribbon}{
    Logical flag indicating whether to display a ribbon
    showing the colour map (in which mark values are associated with colours).
  }
  \item{ribsep}{
    Factor controlling the space between the ribbon and the image.
  }
  \item{ribwid}{
    Factor controlling the width of the ribbon.
  }
  \item{ribn}{
    Number of different values to display in the ribbon.
  }
}
\value{
  \code{NULL}
}
\details{
  This is the \code{plot} method for 
  line segment pattern datasets (of class \code{"psp"},
  see \code{\link{psp.object}}).
  It plots both the observation window \code{x$window}
  and the line segments themselves.
  
  Plotting of the window \code{x$window} is performed by
  \code{\link{plot.owin}}. This plot may be modified 
  through the \code{...} arguments. 

  Plotting of the segments themselves is performed
  by the standard R function \code{\link{segments}}.
  Its plotting behaviour may also be modified through the \code{...}
  arguments.

  For a \emph{marked} line segment pattern
  (i.e. if \code{marks(x)} is not \code{NULL})
  the line segments are plotted in colours
  determined by the mark values. 
  If \code{marks(x)} is a data frame, the default is to use the first
  column of \code{marks(x)} to determine the colours. To specify another
  column, use the argument \code{which.marks}.
  The colour map (associating mark values with colours) will be
  displayed as a vertical colour ribbon to the right of the plot, if
  \code{ribbon=TRUE}. 
}
\seealso{
  \code{\link{psp.object}},
  \code{\link{plot}},
  \code{\link{par}},
  \code{\link{plot.owin}},
  \code{\link{symbols}}
}
\examples{
  X <- psp(runif(20), runif(20), runif(20), runif(20), window=owin())
  plot(X)
  plot(X, lwd=3)
  lettuce <- sample(letters[1:4], 20, replace=TRUE)
  marks(X) <- data.frame(A=1:20, B=factor(lettuce))
  plot(X)
  plot(X, which.marks="B")
}

\author{Adrian Baddeley
  \email{Adrian.Baddeley@csiro.au}
  \url{http://www.maths.uwa.edu.au/~adrian/}
  and Rolf Turner
  \email{r.turner@auckland.ac.nz}
}
\keyword{spatial}
 
 \keyword{hplot}