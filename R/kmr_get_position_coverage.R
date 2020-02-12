library(GenomicRanges)

get_position_coverage <- function(kmers = NULL, pos = NULL, min_cov = 5) {
  stopifnot(!is.null(kmers))
  stopifnot(!is.null(pos))
  stopifnot(min_cov > 0)
  
  i <- 3
  
  rr <- kmr_read_rds(kmers$kmer_tbl[i])
  kmap <- kmr_map_kmers(rr, genome = fa, "phi-X174")
  
  sn <- unique(as.character(seqnames(kmap)))
  snp <- GRanges("phi-X174",
                 IRanges( pos, pos)
  )
  
  k <- x$res$k[i]
  
  kmap_r <- reduce(kmap)
  
  countOverlaps(kmap_r, snp) > 0 # should be TRUE
  max(coverage(kmap))[[1]] # gives 
  
  # combine results in a table!
  
  
}

# fa <- system.file("testdata/phix174.fasta", package = "kmerize")
# a <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
# b <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
# 
# # should clarify that the scan uses set difference! in name or so
# kmers <- kmr_scan_k_min(a, b, k = seq(5, 15, 2), min_kmers = 3, cleanup = FALSE, ci = 2, cx = 300)
# 
# get_position_coverage(kmers, pos = 911, min_cov = 2)




