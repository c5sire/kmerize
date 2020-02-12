is_dir <- function(apath) {
  all(dir.exists(dirname(apath))) && length(apath) == 1 && file.info(apath)[["isdir"]]
}