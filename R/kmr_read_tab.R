#' kmr_read_tab
#' 
#' Read a file in tab format.
#'
#' @param afile file name (obligatory extension .tab)
#' @import vroom
#'
#' @return data.frame with kmers as DNAStringSet
#' @export
kmr_read_tab <- function(afile) {
  afile <- assure_file_ext(afile, ".tab.gz")
  stopifnot(file.exists(afile))
  #kmers <- utils::read.delim(afile)
  kmers <-  vroom::vroom(afile, col_types = "cn")
  return(kmers)
}

