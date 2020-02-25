#' kmr_write_tab
#'
#' Write kmer database as tab format.
#'
#' @param db Name of kmer database
#' @param to Name of target file (default same as db name)
#'
#' @return logical
#' @export
kmr_write_tab <- function(db, to = db) {
  kmr_saveas(db, to, "tab")
}
