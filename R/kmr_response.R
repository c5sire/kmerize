#' kmer_response
#' 
#' k should be an odd number.
#' In case of fastq files the file can also be in compressted format (e.g. *.fastq.tar.gz).
#' This parameter will be inferred from the file name, if not set.
#'
#' @param fastx a fastq or fasta formatted file
#' @param k kmer size. One value or a sequence of values
#' @param fmt type of input file, fasta = f, fasta with multiple lines = m, fastq = q
#'
#' @return data.frame with results
#' @export
kmer_response <- function(fastx, k = seq(5, 11, 2), fmt = NULL) {
  if (is.null(fmt)) {
    fmt <- ifelse(detect_str(fastx, "f[ast]*[q\\.]{1}"), "q", "m")
  }
  
  res <- calc_kmer_summary(fastx, k = k[1],  f = fmt)
  
  if (length(k) < 2) return(res)

  n <- length(k)
  
  for (i in 2:n) {
    cat(paste0(k[i], "\n"))
    
    res <- rbind(res, calc_kmer_summary(fastx, k =  k[i], f = fmt))
    chk <- res$unique[i] / res$total[i]
    if(chk > 0.9999) break
  }
  return(res)
}
