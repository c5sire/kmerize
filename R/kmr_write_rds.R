#' kmr_write_rds
#'
#' Write kmer database as rds format.
#'
#' @param db Name of kmer database
#' @param to Name of target file (default same as db name)
#'
#' @return logical
#' @export
#' 
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
kmr_write_rds <- function(db, to = db) {
  return(kmr_saveas(db, to, "rds"))
}
