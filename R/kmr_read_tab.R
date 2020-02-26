#' kmr_read_tab
#'
#' Read a file in tab format.
#'
#' @param afile file name (obligatory extension .tab)
#' @import vroom
#'
#' @return data.frame with kmers as DNAStringSet
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
#'   kmr_write_tab(out_file)
#' 
#'   dat <- kmr_read_tab(out_file)
#'   head(dat)
#' 
#' }
kmr_read_tab <- function(afile) {
  afile <- assure_file_ext(afile, ".tab.gz")
  stopifnot(file.exists(afile))
  kmers <- vroom::vroom(afile, col_types = "cn", col_names = c("kmer", "count"))
  return(kmers)
}
