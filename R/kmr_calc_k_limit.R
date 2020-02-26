#' kmr_calc_k_limit
#'
#' Calculates the k corresponding to a limit relative to the distinct number of
#' k-mers.
#'
#' @param res a dataframe
#' @param limit numeric between 0 and 1
#'
#' @return list k and limit values
#' @family genomic_response
#' @examples 
#' 
#' if (interactive()) {
#' 
#'  fa <- system.file("testdata/phix174.fasta",
#'    package = "kmerize")
#'    
#'  k <- as.integer(seq(5, 17, 2))
#' 
#'  res <- kmr_response(fa, k)
#'  kmr_calc_k_limit(res)
#'  
#' }
#' 
#' @export
kmr_calc_k_limit <- function(res, limit = .95) {
  lim <- max(res$distinct) * limit
  step <- max(diff(res$k))
  k <- max(res[res$distinct < lim, "k"]) + step

  return(list(k = k, lim = lim))
}
