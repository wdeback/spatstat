#
#   bw.ppl.R
#
#   Likelihood cross-validation for kernel smoother of point pattern
#
#   $Revision: 1.7 $ $Date: 2017/01/28 06:30:21 $
#

bw.ppl <- function(X, ..., srange=NULL, ns=16, sigma=NULL, weights=NULL) {
  stopifnot(is.ppp(X))
  if(!is.null(sigma)) {
    stopifnot(is.numeric(sigma) && is.vector(sigma))
    ns <- length(sigma)
  } else {
    if(!is.null(srange)) check.range(srange) else {
      nnd <- nndist(X)
      srange <- c(min(nnd[nnd > 0]), diameter(as.owin(X))/2)
    }
    sigma <- geomseq(from=srange[1L], to=srange[2L], length.out=ns)
  }
  cv <- numeric(ns)
  for(i in 1:ns) {
    si <- sigma[i]
    lamx <- density(X, sigma=si, at="points", leaveoneout=TRUE, weights=weights)
    lam <- density(X, sigma=si, weights=weights)
    cv[i] <- sum(log(lamx)) - integral.im(lam)
  }
  result <- bw.optim(cv, sigma, iopt=which.max(cv), 
                     creator="bw.ppl",
                     criterion="Likelihood Cross-Validation",
                     unitname=unitname(X))
  return(result)
}
