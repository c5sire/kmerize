get_kmc_dir <- function() {
  kud <- rappdirs::user_config_dir(appname = "kmerize", appauthor =  "WUR")
  kyd <- gsub("\\\\", "/", kud)
  kud <- file.path(kud, "tools", "kmc3")
  if (!dir.exists(kud)) dir.create(kud, recursive = TRUE)
  kud <- get_safe_path(kud)
  
  return(kud)
}