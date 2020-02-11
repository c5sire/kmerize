#' kmr_length_fasta
#' 
#' Get the length of a sequnce in a fasta formatted file.
#'
#' @param fasta path to a file
#'
#' @return integer length of the sequence in the file
#' @import Biostrings
#' @export
#'
#' @examples
#' 
#' fasta <- system.file("testdata/phix174.fasta", package = "kmerize")
#' 
#' kmr_length_fasta(fasta)
#' 
kmr_length_fasta <- function(fasta = NULL) {
  msg <- "Need to provide a valid path to a fasta file."
  if (is.null(fasta)) stop(msg)
  if (!file.exists(fasta)) stop(msg)
  
  flen <- Biostrings::readDNAStringSet(fasta) %>% width
                                
  return(flen)
}