assure_kmc3_ext <- function(fp, ext) {
  los <- get_os()
  ext <- ifelse(los == "Windows", ".exe", "")
  fp <- paste0(fp, ext)

  return(fp)
}
