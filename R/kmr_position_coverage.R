#' kmr_position_coverage
#'
#' Scans a set of mapped kmers if they fall around a position.
#' Returns a summary table for each k which includes the coverage and the start and beginning of the range.
#'
#' @param kmers a list object as returned from kmr_scan_k_min
#' @param pos a position from the reference genome
#' @param fasta a path to a fasta sequence file (for example a reference chromosome)
#' @param min_coverage a desirable level of minimum coverage
#'
#' @import GenomicRanges
#' @importFrom Biostrings readDNAStringSet
#'
#' @return data.frame
#' @export
#'
#' @examples
#' if (interactive()) {
#'
#'   # Reference genome
#'   fasta <- system.file("testdata/phix174.fasta", package = "kmerize")
#'
#'   # Simulated NGS files from reference sequence and a modified sequence.
#'   # The modification is a SNP at position 911.
#'
#'   a <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
#'   b <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
#'
#'   # should clarify that the scan uses set difference! in name or so
#'   kmers <- kmr_scan_k_min(a, b,
#'     k = seq(5, 15, 2),
#'     min_kmers = 1,
#'     cleanup = FALSE,
#'     ci = 0,
#'     cx = 1000
#'   )
#'
#'   kmr_position_coverage(kmers, pos = 911, fasta = fasta, min_coverage = 5)
#' }
kmr_position_coverage <- function(kmers = NULL, pos = NULL,
                                  fasta = fasta, min_coverage = 5) {
  stopifnot(!is.null(kmers))
  stopifnot(!is.null(pos))
  stopifnot(min_coverage > 0)

  res <- kmers$res
  res <- as.data.frame(cbind(res,
    coverage = NA,
    min_coverage = FALSE,
    n_ranges = 0,
    left = NA,
    right = NA
  ))


  ss <- Biostrings::readDNAStringSet(fasta)
  sn <- names(ss)
  snp <- GRanges(
    sn,
    IRanges(pos, pos)
  )

  for (i in 1:nrow(res)) {
    rr <- kmr_read_rds(kmers$kmer_tbl[i])
    kmap <- kmr_map_kmers(rr, genome = fasta, sn)

    kmap_r <- reduce(kmap)

    if (countOverlaps(kmap_r, snp) > 0) {
      mcv <- max(coverage(kmap))[[1]]
      res$coverage[i] <- mcv
      res$min_coverage[i] <- mcv > min_coverage
      res$n_ranges[i] <- length(kmap_r)
      res$left[i] <- start(kmap_r)
      res$right[i] <- end(kmap_r)
    } # should be TRUE
  }

  return(res)
}
