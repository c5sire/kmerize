#' kmr_map_kmers
#'
#' @param kmers kmer table
#' @param genome a path to a fasta sequence
#' @param seqname name of the sequence
#' 
#' @import Biostrings
#' @import GenomicRanges
#' @import IRanges
#' @import ggbio
#' @export
#' 
#' @importFrom magrittr %>%
#'
#' @return GRange object of mapped kmers
kmr_map_kmers <- function(kmers, genome, seqname = NULL) {
  if (!"kmer" %in% names(kmers)) stop("Kmer table does not contain column named kmer.")
  dict <- DNAStringSet(kmers$kmer)
  x <- genome[[1]]
  adna <-Biostrings::readDNAStringSet(genome)
  dna <- DNAString(as.character(adna))
  
  mp <- matchPDict(dict, dna)
  ks <- startIndex(mp) %>% unlist
  ke <- endIndex(mp) %>% unlist
  
  kl <- nchar(kmers$kmer[1])
  
  if (is.null(seqname)) seqname <- names(adna)[1]
  
  kmer_tbl <- as.data.frame(cbind(
    seqnames = seqname,
    start = ks,
    end = ke,
    width = kl,
    strand = "+"
  ), stringsAsFactors = FALSE)
  
  kmers <- GenomicRanges::makeGRangesFromDataFrame(kmer_tbl)
  return(kmers)
}
