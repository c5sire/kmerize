#' kmr_read_tab
#' 
#' Read a file in tab format.
#'
#' @param afile file name (obligatory extension .tab)
#'
#' @return data.frame
#' @export
kmr_read_tab <- function(afile) {
  afile <- assure_file_ext(afile, ".tab")
  stopifnot(file.exists(afile))
  utils::read.delim(afile)
}

