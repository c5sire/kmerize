#' kmr_length_fasta
#' 
#' Get the length of a sequnce in a fasta formatted file.
#'
#' @param fasta path to a file
#'
#' @return integer length of the sequence in the file
#' @import seqinr
#' @export
#'
#' @examples
#' 
#' fasta <- system.file("int/testdata/phix174.fasta)
#' 
#' kmr_length_fasta(fasta)
#' 
kmr_length_fasta <- function(fasta = NULL) {
  msg <- "Need to provide a valid path to a fasta file."
  if (is.null(fasta)) stop(msg)
  if (!file.exists(fasta)) stop(msg)
  
  flen <- seqinr::read.fasta(fasta) %>% seqinr::getLength()
                                
  return(flen)
}