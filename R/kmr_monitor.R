kmr_monitor <- function(FUN, ...) {
  
  args <- list(...)
  k <- args[["k"]]
  x <- args[["x"]]
  
  n <- length(k)
  pb <- txtProgressBar(title = "Counting", width = n)
  for(i in 1:n) {
    cat(FUN(x))
    cat("\n")
    
    setTxtProgressBar(pb, i)
  }
  
  
  close(pb)
}
