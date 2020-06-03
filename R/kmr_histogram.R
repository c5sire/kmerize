#' kmr_histogram
#'
#' @param db path to kmc3 database
#' @param out filename for histogram data
#'
#' @return
#' @export
#'
# @examples
kmr_histogram <- function(db, out = paste0("hist_", basename(db), ".txt")) {
  if (!dir.exists(dirname(out))) dir.create(dirname(out))
  bn <- basename(db)
  db <- file.path(db, bn)
  #base_cmd <- "usr/local/bin/kmerize/kmc_tools transform %s histogram %s"  
  base_cmd <- histogram()
  cmd <- sprintf(base_cmd, db, out)
  #message(out)
  system(cmd)
  return(out)
}
