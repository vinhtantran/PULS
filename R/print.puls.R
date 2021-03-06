#' Print PULS Clustering Result
#'
#' Render the PULS split tree in an easy to read format with important
#' information such as terminal nodes, etc.
#'
#' @param x A `PULS` result object.
#' @param spaces Spaces indent between 2 tree levels.
#' @param digits Number of significant digits to print.
#' @param ... Arguments to be passed to [monoClust::print.MonoClust()].
#'
#' @return A nicely displayed PULS split tree in text.
#'
#' @export
#'
#' @examples
#' \donttest{
#' library(fda)
#'
#' # Build a simple fd object from already smoothed smoothed_arctic
#' data(smoothed_arctic)
#' NBASIS <- 300
#' NORDER <- 4
#' y <- t(as.matrix(smoothed_arctic[, -1]))
#' splinebasis <- create.bspline.basis(rangeval = c(1, 365),
#'                                     nbasis = NBASIS,
#'                                     norder = NORDER)
#' fdParobj <- fdPar(fdobj = splinebasis,
#'                   Lfdobj = 2,
#'                   # No need for any more smoothing
#'                   lambda = .000001)
#' yfd <- smooth.basis(argvals = 1:365, y = y, fdParobj = fdParobj)
#'
#' Jan <- c(1, 31); Feb <- c(31, 59); Mar <- c(59, 90)
#' Apr <- c(90, 120); May <- c(120, 151); Jun <- c(151, 181)
#' Jul <- c(181, 212); Aug <- c(212, 243); Sep <- c(243, 273)
#' Oct <- c(273, 304); Nov <- c(304, 334); Dec <- c(334, 365)
#'
#' intervals <-
#'   rbind(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
#'
#' PULS4_pam <- PULS(toclust.fd = yfd$fd, intervals = intervals,
#'                   nclusters = 4, method = "pam")
#' print(PULS4_pam)
#' }
print.PULS <- function(x, spaces = 2L, digits = getOption("digits"), ...) {

  coerced_mono <- as_MonoClust.PULS(x)

  print(coerced_mono, spaces = spaces, digits = digits, ...)

  return(invisible(x))
}
