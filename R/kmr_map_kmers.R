#' kmr_map_kmers
#'
#' @param kmers kmer table
#' @param genome a fasta sequence
#' @param seqname name of the sequence
#'
#' @return
kmr_map_kmers <- function(k, genome, seqname = "phix") {
  if (!"kmer" %in% names(kmers)) stop("Kmer table does not contain column named kmer.")
  dict <- DNAStringSet(kmers$kmer)
  x <- genome[[1]]
  dna <-DNAString(paste(x, collapse = ""))
  mp <- matchPDict(dict, dna)
  ks <- startIndex(mp) %>% unlist
  ke <- endIndex(mp) %>% unlist
  
  kl <- nchar(kmers$kmer[1])
  
  kmer_tbl <- as.data.frame(cbind(
    seqnames = seqname,
    start = ks,
    end = ke,
    width = kl,
    strand = "+"
  ), stringsAsFactors = FALSE)
  
  kmers <- makeGRangesFromDataFrame(kmer_tbl)
  return(kmers)
}


# fa <- system.file("testdata/phix174.fasta", package = "kmerize")
# a <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
# b <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
# 
# x <- kmr_scan_k_min(a, b, k = 7, min_kmers = 5)
# rr <- kmr_read_rds("result__kmerize.rds")
# 
# ref <- seqinr::read.fasta(fa)
# 
# k7map <- kmr_map_kmers(rr, genome = ref, "PhiX174")
# plot.kmers(k7map, 911)
# 
# 
# 
# x <- kmr_scan_k_min(a, b, k = 9, min_kmers = 5)
# rr <- kmr_read_rds("result__kmerize.rds")
# ref <- seqinr::read.fasta(fa)
# k9map <- kmr_map_kmers(rr, genome = ref, "PhiX174")
# plot.kmers(k9map, 911)
# 
# x <- kmr_scan_k_min(a, b, k = 11, min_kmers = 5)
# rr <- kmr_read_rds("result__kmerize.rds")
# ref <- seqinr::read.fasta(fa)
# k11map <- kmr_map_kmers(rr, genome = ref, "PhiX174")
# plot.kmers(k11map, 911)
# 
# x <- kmr_scan_k_min(a, b, k = 13, min_kmers = 5)
# rr <- kmr_read_rds("result__kmerize.rds")
# ref <- seqinr::read.fasta(fa)
# k13map <- kmr_map_kmers(rr, genome = ref, "PhiX174")
# plot.kmers(k13map, 911)
