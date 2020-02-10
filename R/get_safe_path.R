get_safe_path <- function(p) {
  p <- gsub("\\\\", "/", p)
  p <- gsub("\\ ", "\\\\ ", p)
  
  return(p)
}