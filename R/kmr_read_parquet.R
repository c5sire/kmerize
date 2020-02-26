#' kmr_read_parquet
#'
#' Read a file in parquet format.
#'
#' @param afile file name (obligatory extension .tab)
#' @importFrom arrow read_parquet
#' @family kmer_core
#'
#' @return parquet object
#' @export
#' 
#' @examples 
#' 
#' if (interactive()) {
#' 
#'   fa <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz",
#'   package = "kmerize")
#' 
#'   out_file <- file.path(tempdir(), "phx")
#'   k <- 7
#'   kmr_count(fa, out_file, k = k, f = "q")
#'   
#'   kmr_write_parquet(out_file)
#' 
#'   dat <- kmr_read_parquet(out_file)
#'   dat
#' 
#' }
#' 
kmr_read_parquet <- function(afile) {
  afile <- assure_file_ext(afile, ".parquet")
  stopifnot(file.exists(afile))
  arrow::read_parquet(afile)
}
