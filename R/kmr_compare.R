
#' kmr_compare
#' 
#' Compare k-mer sets
#' 
#' The in_files list strings may contain parameter values for each in_file after the path.
#' 
#' Shorthand operator definitions:
#'  * intersect
#'  - subtract
#'  ~ counters_subtract
#'  + union
#'  
#'  Highest priority: *. All other operators have equal priority.
#'  
#'  Counter calculation modes are available for the oerators: *, ~,  +. They are:
#'  min, max, diff, sum, left, right
#'
#' @param in_files list of named file paths. The names are to be used in the comparison string.
#' @param ci integer; min k cutoff value; default 2.
#' @param cx integer; max k cutoff value; default 1e9.
#' @param cs integer; max k count value; default 255.
#' @param cmp a list containing a single named string with the kmer operations using the file short names.
#'
#' @return out_file
#' @author Reinhard Simon
#' @references Kokot M, Długosz M, Deorowicz S. KMC 3: counting and manipulating k-mer statistics. Bioinformatics. 2017 Sep 1;33(17):2759-61.
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
#' 
#' if (interactive()) {
#' 
#'  fa <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", 
#'                  package = "kmerize")
#'  fm <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", 
#'                  package = "kmerize")
#'
#'  k <- 9
#'  tmd <- tempdir()
#'  if (!dir.exists(tmd)) dir.create(tmd)
#'
#'  out_fx <- file.path(tmd, "phx")
#'  out_fm <- file.path(tmd, "phm")
#' 
#'  kmr_count(fa, out_fx, k = k, f = "q")
#'  kmr_count(fm, out_fm, k = k, f = "q")
#'
#'  cmp_xy <- file.path(tmd, "cmp_xy")
#'
#' 
#' }
#' 
kmr_compare <- function(in_files, cmp, ci = 2, cx = 1e9, cs = 255) {
  
  lines <- character()
  lines[1] <- "INPUT:"
  for (i in 1:length(in_files)) {
    l <- paste0(names(in_files)[i], " = ", get_safe_path(in_files[[i]]))
    lines[i + 1] <- l
  }
  
  n <- length(lines)
  lines[n + 1] <- "OUTPUT:"
  lines[n + 2] <- paste0(cmp[[1]], " = ", cmp[[2]])
  lines[n + 3] <- "OUTPUT_PARAMS:"
  lines[n + 4] <- paste0("-ci", ci)
  lines[n + 5] <- paste0("-cx", cx)
  lines[n + 6] <- paste0("-cs", cs)
  
  tmp_cmp <- file.path(tempdir(), "tmp_cmp.txt") %>% get_safe_path()
  writeLines(lines, tmp_cmp)
  
  cmd <- paste(cmp(), tmp_cmp)
  
  system(cmd, wait = TRUE, show.output.on.console = FALSE)
  return(cmp[[1]])
}