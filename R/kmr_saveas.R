
#' kmr_saveas
#' 
#' Convert a kmer database to other formats.
#'
#' @param db kmer database
#' @param to target file name (wihout extension); default same as db name
#' @param format one of three: tab, parquet, rds
#' @importFrom utils read.csv write.table 
#'
#' @return string file path
#' @export
#'
#' @importFrom arrow write_parquet
kmr_saveas <- function(db, to = db, format = c("tab", "parquet",  "rds")) {
  
  of <- paste(to, ".tab")
  cmd <- dump(db, of)
  system(cmd)
  
  tbl <- read.csv(to, header = FALSE, sep = "\t", stringsAsFactors = FALSE)
  names(tbl
  ) <- c("kmer", "count")
  
  
  if (format == "tab") {
    of <- paste0(to, ".tab")
    write.table(tbl, of, row.names = FALSE, sep = "\t", quote = F)
  } else if (format == "parquet") {
    of <-  paste0(to, ".pqt") 
    arrow::write_parquet(tbl, of)
  } else {
    of <- paste0(to, ".rds")
    saveRDS(tbl,  of)
  }
 
  return(of)   
   
}