
# parquet read / write disabled due to withdrawal from CRAN Feb 2020
kmr_saveas <- function(db, to = db, format = c("tab", "rds")) {
  of <- paste0(to, ".tab")
  cmd <- dmp(db, of)
  system(cmd, wait = TRUE, show.output.on.console = FALSE)
  tbl <- utils::read.csv(of,
    header = FALSE, sep = "\t",
    stringsAsFactors = FALSE
  )
  names(tbl) <- c("kmer", "count")


  if (format == "tab") {
    of <- paste0(to, ".tab.gz")
    vroom::vroom_write(tbl, of, col_names = FALSE)
  } else if (format == "parquet") {
    of <- paste0(to, ".parquet")
    if (file.exists(of)) unlink(of, recursive = TRUE, force = TRUE)
    arrow::write_parquet(tbl, of)
  } else {
    of <- paste0(to, ".rds")
    saveRDS(tbl, of)
  }

  return(of)
}
