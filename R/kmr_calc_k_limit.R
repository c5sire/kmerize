calc_k_limit <- function(res, limit = .95) {
  lim <- max(res$total) * limit
  step <- max(diff(res$k))
  k <- max(phix_response[res$distinct < lim, "k"]) + step
  
  return(list(k = k, lim = lim))
}