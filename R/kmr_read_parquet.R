#' kmr_read_parquet
#'
#' Read a file in parquet format.
#'
#' param afile file name (obligatory extension .tab)
#'
#' return parquet object
# kmr_read_parquet <- function(afile) {
#   afile <- assure_file_ext(afile, ".parquet")
#   stopifnot(file.exists(afile))
#   arrow::read_parquet(afile)
# }

