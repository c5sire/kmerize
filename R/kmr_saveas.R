
# parquet read / write disabled due to withdrawal from CRAN Feb 2020
kmr_saveas <- function(db, to = db, format = c("tab", "rds")) {
  
  of <- paste0(to, ".tab")
  cmd <- dmp(db, of)
  system(cmd, wait = TRUE)
  
  tbl <- utils::read.csv(of, header = FALSE, sep = "\t", stringsAsFactors = FALSE)
  names(tbl) <- c("kmer", "count")

  
  if (format == "tab") {
    of <- paste0(to, ".tab")
    utils::write.table(tbl, of, row.names = FALSE, sep = "\t", quote = F)
  # } else if (format == "parquet") {
  #   of <-  paste0(to, ".parquet") 
  #   arrow::write_parquet(tbl, of)
  } else {
    of <- paste0(to, ".rds")
    saveRDS(tbl,  of)
  }
 
  return(of)   
   
}