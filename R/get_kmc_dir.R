get_kmc_dir <- function() {
  kud_win <- rappdirs::user_config_dir(appname = "kmerize", appauthor =  "WUR")
  kud_osx <- file.path("/usr", "local", "bin", "kmerize")
  
  # Intentionally for Linux: This will just install kmc into the local directory 
  # where the user
  # should have write rights
  kud_lin <- paste0("usr/", file.path("local", "bin", "kmerize"))
  
  os <- get_os()
  kud <- ifelse(os == "Windows", kud_win, 
                ifelse(os == "Linux", kud_lin, kud_osx) )
  if (os != "Windows") return(kud)
  
  kud <- gsub("\\\\", "/", kud)
  kud <- file.path(kud, "tools", "kmc3")
  if (!dir.exists(kud)) dir.create(kud, recursive = TRUE)
  kud <- get_safe_path(kud)
  
  return(kud)
}