#' kmr_write_parquet
#'
#' Write kmer database as parquet format.
#'
#' @param db Name of kmer database
#' @param to Name of target file (default same as db name)
#' @return logical
#' @family kmer_core
#' @examples 
#' if (interactive()) {
#' 
#'   fa <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz",
#'   package = "kmerize")
#' 
#'   out_file <- file.path(tempdir(), "phx174")
#'   k <- 7
#'   kmr_count(fa, out_file, k = k, f = "q")
#'   
#'   kmr_write_parquet(out_file)
#' 
#' }
#' @export
#' 
kmr_write_parquet <- function(db, to = db) {
  kmr_saveas(db, to, "parquet")
}
