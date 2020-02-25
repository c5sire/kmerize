#' kmr_write_parquet
#' 
#' Write kmer database as parquet format.
#'
#' @param db Name of kmer database
#' @param to Name of target file (default same as db name)
#'
#' @return logical
#' @export
kmr_write_parquet <- function(db, to = db) {
  kmr_saveas(db, to, "parquet")
}