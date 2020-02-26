#' kmr_write_tab
#'
#' Write kmer database as tab format.
#'
#' @param db Name of kmer database
#' @param to Name of target file (default same as db name)
#'
#' @return logical
#' @export
#' @family kmer_core
#' @examples 
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
#'   head(dat)
#' 
#' }
kmr_write_tab <- function(db, to = db) {
  kmr_saveas(db, to, "tab")
}
