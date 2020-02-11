get_kmc_dir <- function() {
  kud <- rappdirs::user_config_dir(appname = "kmerize", appauthor =  "WUR")
  os <- get_os()
  kud <- ifelse (os == "Windows", kud, file.path("/usr", "local", "bin", "WUR", "kmerize"))
  
  
  kud <- gsub("\\\\", "/", kud)
  kud <- file.path(kud, "tools", "kmc3")
  if (!dir.exists(kud)) dir.create(kud, recursive = TRUE)
  kud <- get_safe_path(kud)
  
  return(kud)
}