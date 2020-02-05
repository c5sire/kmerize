#' kmr_read_rds
#'
#' Read a file in rds format.
#'
#' @param afile file name (obligatory extension .rds)
#'
#' @return data.fraee
#' @export
kmr_read_rds <- function(afile) {
  afile <- assure_file_ext(afile, ".rds")
  stopifnot(file.exists(afile))
  readRDS(afile)
}

