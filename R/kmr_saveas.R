
kmr_saveas <- function(db, to = db, format = c("tab", "parquet",  "rds")) {
  
  of <- paste(to, ".tab")
  cmd <- dump(db, of)
  system(cmd)
  
  tbl <- utils::read.csv(to, header = FALSE, sep = "\t", stringsAsFactors = FALSE)
  names(tbl
  ) <- c("kmer", "count")
  
  
  if (format == "tab") {
    of <- paste0(to, ".tab")
    utils::write.table(tbl, of, row.names = FALSE, sep = "\t", quote = F)
  } else if (format == "parquet") {
    of <-  paste0(to, ".parquet") 
    arrow::write_parquet(tbl, of)
  } else {
    of <- paste0(to, ".rds")
    saveRDS(tbl,  of)
  }
 
  return(of)   
   
}