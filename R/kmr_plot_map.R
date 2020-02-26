
#' kmr_plot_map
#'
#' Create a quick overview of the kmers mapped to a region around the given
#' position.
#'
#' @param kmers a GenomicRange object
#' @param snp_pos a position on the sequence
#'
#' @import Biostrings
#' @import GenomicRanges
#' @import ggbio
#'
#' @return ggbio plot
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
#'   kmr_plot_map(kmap, snp_pos = 911)
#' }
#' 
#' 
#' @export
kmr_plot_map <- function(kmers, snp_pos) {


  # snp <- as.data.frame(cbind(
  #   xmin = snp_pos,
  #   xmax = snp_pos + 1,
  #   ymin = 0,
  #   ymax = length(lengths(kmers))))

  plot.kmer_matches <- function(kmers, bg = "brown") {
    p <- autoplot(kmers, bg = bg)
    p
  }

  plot.snp <- function(pos_snp) {
    p <- ggbio(data = kmers) + geom_arrowrect(
      GRanges(
        "SNP911",
        IRanges(
          pos_snp - 0.5,
          pos_snp + 0.5
        )
      )
    )
    p
  }

  plot.kmer_coverage <- function(kmers, col = "blue") {
    ggbio(data = kmers) + ggbio::stat_coverage(geom = "area")
  }



  pkm <- plot.kmer_matches(kmers)
  pkc <- plot.kmer_coverage(kmers)
  pks <- plot.snp(snp_pos)

  p <- ggbio::tracks(
    SNP = pks,
    kmers = pkm,
    Coverage = pkc
  ) + ggbio::theme_tracks_sunset()

  return(p)
}
