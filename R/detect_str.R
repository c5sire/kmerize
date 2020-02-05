detect_str <- function(s, p) {
  length(grep( p , s, ignore.case = TRUE)) == 1
}