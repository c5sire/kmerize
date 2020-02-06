#' kmr_calc_k_limit
#' 
#' Calculates the k corresponding to a limit relative to the maximum number of k-mers.
#'
#' @param res a dataframe
#' @param limit numeric between 0 and 1
#'
#' @return list k and limit values
#' @export
kmr_calc_k_limit <- function(res, limit = .95) {
  lim <- max(res$total) * limit
  step <- max(diff(res$k))
  k <- max(phix_response[res$distinct < lim, "k"]) + step
  
  return(list(k = k, lim = lim))
}