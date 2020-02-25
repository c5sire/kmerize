#' kmr_response
#'
#' k should be an odd number.
#' In case of fastq files the file can also be in compressed format
#' (e.g. *.fastq.tar.gz).
#' This parameter will be inferred from the file name, if not set.
#'
#' @param fastx a fastq or fasta formatted file
#' @param k kmer size. One value or a sequence of values
#' @param fmt type of input file, fasta = f, fasta with multiple lines = m,
#'    fastq = q
#' @param ci cutoff value for min k
#'
#' @return data.frame with results
#' @export
kmr_response <- function(fastx,
                         k = c(5, 7, 9, 11),
                         fmt = NULL,
                         ci = 0) {
  if (!file.exists(fastx)) stop("Data file path does not exist!")

  msg <- "k must be a positive integer > 0 and < 256"
  if (any(is.null(k))) stop(msg)
  if (any(is.na(k))) stop(msg)
  if (any(is.character(k))) stop(msg)
  if (any(is.logical(k))) stop(msg)
  if (any(is.double(k))) stop(msg)
  if (any(k <= 0)) stop(msg)
  if (any(k > 255)) stop(msg)

  if (is.null(fmt)) {
    is_fastq <- detect_str(fastx, "f[ast]*[q\\.]{1}")
    fmt <- ifelse(is_fastq, "q", "m")
  }
  if (!fmt %in% c("a", "m", "q")) stop("fmt must be one of NULL, a, m, q!")

  res <- calc_kmer_summary(fastx, k = k[1], f = fmt, ci = ci)

  if (length(k) < 2) {
    return(res)
  }

  n <- length(k)

  for (i in 2:n) {
    cat(paste0(k[i], "\n"))

    res <- rbind(res, calc_kmer_summary(fastx, k = k[i], f = fmt, ci = ci))
    chk <- res$unique[i] / res$total[i]
    if (chk > 0.9999) break
  }
  return(res)
}
