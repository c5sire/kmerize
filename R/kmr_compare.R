
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
#' @export
#'
#' @examples
#' 
#' if (interactive()) {
#' 
#'    kmr_cmp()
#' 
#' }
#' 
kmr_compare <- function(in_files, cmp, ci = 2, cx = 1e9, cs = 255) {
  
  lines <- character()
  lines[1] <- "INPUT:"
  for (i in 1:length(in_files)) {
    l <- paste0(names(in_files)[i], " = ", in_files[[i]])
    lines[i + 1] <- l
  }
  
  n <- length(lines)
  lines[n + 1] <- "OUTPUT:"
  lines[n + 2] <- paste0(names(cmp), " = ", as.character(cmp))
  lines[n + 3] <- "OUTPUT_PARAMS:"
  lines[n + 4] <- paste0("-ci", ci)
  lines[n + 5] <- paste0("-cx", cx)
  lines[n + 6] <- paste0("-cs", cs)
  
  tmp_cmp <- file.path(tempdir(), "tmp_cmp.txt")
  writeLines(lines, tmp_cmp)
  
  cmd <- paste(cmp(), tmp_cmp)
  
  system(cmd)

}