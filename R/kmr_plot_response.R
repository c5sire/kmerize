#' kmr_plot_response
#'
#' Plots genomics response object.
#'
#' @param res result from genomic response scan
#' @param ref_k a reference k value to include
#' @param limit a numeric value between 0 and 1. If 0 no line will be displayed.
#'    Default is 0. A recommended value is 0.95.
#' @param max_y a maximum y value. Default 0 indicates automatic selection.
#' @return plot
#' @importFrom ggplot2 geom_line aes .data xlab ylab guides guide_legend
#'    geom_vline annotate ylim
#'    
#' @family kmer_help
#' @examples 
#' if (interactive()) {
#'   fa <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz",
#'     package = "kmerize"
#'   )
#'   fp <- system.file("testdata/phix174.fasta", 
#'                      package = "kmerize")
#'   dna <- Biostrings::readDNAStringSet(fp)
#'
#'   k <- as.integer(seq(3, 17, 2))
#' 
#' 
#'   res <- kmr_response(fa, k, fmt = "q")
#'   kmr_plot_response(res, ref_k = 9, max_y = max(res$distinct))
#' }
#' @export
kmr_plot_response <- function(res, ref_k = NULL, limit = 0, max_y = -1) {
  stopifnot(is.data.frame(res))
  stopifnot(nrow(res) > 1)

  k_lim <- ifelse(limit > 0, kmr_calc_k_limit(res, limit)$k, 0)

  y_max <- ifelse(max_y == 0, max(res$total), max_y) 

  res[res$unique > y_max, "unique"] <- y_max
  res[res$distinct > y_max, "distinct"] <- y_max
  res[res$total > y_max, "total"] <- y_max
  res[res$universe > y_max, "universe"] <- y_max
  
  rn <- row.names(res[res$universe == y_max, ])
  rn <- rn[-c(1)]

  p <- ggbio() +
    ggplot2::ylim(0, y_max) +
    geom_line(data = res[, c(1, 2)], aes(
      x = .data$k, y = .data$unique,
      color = "unique"
    )) +
    geom_line(data = res[, c(1, 3)], aes(
      x = .data$k, y = .data$distinct,
      color = "distinct"
    )) +
    geom_line(data = res[, c(1, 4)], aes(
      x = .data$k, y = .data$total,
      color = "total"
    )) +
    geom_line(data = res[, c(1, 5)], aes(
      x = .data$k, y = .data$universe,
      color = "universe"
    )) +

    xlab("k") +
    ylab("counts") +
    # xlim(as.character(seq(res$k[1], max(res$k), 1))) +
    guides(fill = guide_legend(title = "kmer"))

  if (!is.null(ref_k)) {
    p <- p +
      geom_vline(
        xintercept = ref_k, linetype = "dashed", color = "darkgreen",
        lwd = .6
      )
  }

  if (limit > 0) {
    yk <- y_max / 2
    p <- p +
      geom_vline(xintercept = k_lim, color = "darkgreen", lwd = .6) +
      annotate(
        geom = "text", x = (k_lim + 1), y = yk,
        label = paste0("k = ", k_lim, "\nlimit = ", limit), color = "red"
      )
  }

  p
}
