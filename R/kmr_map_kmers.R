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
#' @family kmer_help
#'
#' @importFrom magrittr %>%
#'
#' @return GRange object of mapped kmers
#' 
#' @family kmer_help
#' @examples 
#' if (interactive()) {
#' 
#'   fa <- system.file("testdata/phix174.fasta", package = "kmerize")
#'   a <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz",
#'                    package = "kmerize")
#'   b <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz",
#'                    package = "kmerize")
#'   
#'   x <- kmr_scan_k_min(a, b, k = 9, min_kmers = 3, cleanup = FALSE)
#'   rr <- kmr_read_rds(x$kmer_tbl)
#'   
#'   
#'   kmap <- kmr_map_kmers(rr, genome = fa, "phi-X174")
#'   kmap
#' }
#' 
kmr_map_kmers <- function(kmers, genome, seqname = NULL) {
  if (!"kmer" %in% names(kmers)) {
    stop("Kmer table does not contain column named kmer.")
  }
  dict <- DNAStringSet(kmers$kmer)
  adna <- Biostrings::readDNAStringSet(genome)
  dna <- DNAString(as.character(adna))

  mp <- matchPDict(dict, dna)
  ks <- startIndex(mp) %>% unlist()
  ke <- endIndex(mp) %>% unlist()

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
