fix_win_path <- function(path) {
  fp <- sprintf('"%s"', path)
  
  return(fp)
}