#' kmr_read_parquet
#'
#' Read a file in parquet format.
#'
#' @param afile file name (obligatory extension .tab)
#' @importFrom arrow read_parquet
#'
#' @return parquet object
#' @export
kmr_read_parquet <- function(afile) {
  afile <- assure_file_ext(afile, ".parquet")
  stopifnot(file.exists(afile))
  arrow::read_parquet(afile)
}
