#' kmr_write_rds
#'
#' Write kmer database as rds format.
#'
#' @param db Name of kmer database
#' @param to Name of target file (default same as db name)
#'
#' @return logical
#' @export
kmr_write_rds <- function(db, to = db) {
  return(kmr_saveas(db, to, "rds"))
}
