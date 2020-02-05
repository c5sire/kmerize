corename <- function(s) {
  strsplit(basename(basename(s)), "\\.")[[1]][1]
}