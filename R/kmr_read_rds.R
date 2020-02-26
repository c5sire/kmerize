#' kmr_read_rds
#'
#' Read a file in rds format.
#'
#' @param afile file name (obligatory extension .rds)
#'
#' @return data.fraee
#' @export
#' @family kmer_core
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
#'   kmr_write_rds(out_file)
#' 
#'   dat <- kmr_read_rds(out_file)
#'   dat
#' 
#' }
kmr_read_rds <- function(afile) {
  afile <- assure_file_ext(afile, ".rds")
  stopifnot(file.exists(afile))
  readRDS(afile)
}
