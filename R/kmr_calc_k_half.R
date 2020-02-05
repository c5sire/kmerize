#' kmr_calc_k_half
#'
#' @param resp result from genomic response
#'
#' @return integer
#' @export
kmr_calc_k_half <- function(resp) {
  x <- resp$k
  y <- resp$distinct
  
  z <- diff(y)
  max_delta_at <- which(max(z) == z)
  idx <- max_delta_at + 2
  ifelse(idx > length(x), return(NULL),   return(x[idx]))
}
