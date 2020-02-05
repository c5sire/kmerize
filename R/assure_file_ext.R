assure_file_ext <- function(afile, ext) {
  ifelse(detect_str(afile, ext), afile, paste0(afile, ext))
}