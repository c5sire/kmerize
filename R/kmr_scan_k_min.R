
#' kmr_scan_k_min
#'
#' @param a sequence file path
#' @param b sequence file path
#' @param k k-mer size
#' @param ci minimum cutoff; default 2
#' @param cx maximum cutoff; default 100
#' @param min_kmers coverage 10
#' @param f format of files; q fastq; a fasta, m multiple fasta
#' @param cleanup delete k-mer count files
#'
#' @return list k_min identified minimal k; table of coverage for each k
#' @export
kmr_scan_k_min <- function(a, b, k = seq(3, 13, 2), ci = 2, cx = 100, 
                           min_kmers = 10, f = "q",
                           cleanup = TRUE) {
  
  tmd <- tempdir()
  a_out <- file.path(tmd, corename(a))
  b_out <- file.path(tmd, corename(b))
  atbl <- as.data.frame(cbind(k = NA, n_kmer = NA))
  
  # for a given k count k-mers
  for (i in seq_along(k)) {
    # count kmers
    a_cnt <- kmr_count(a, a_out, k = k[i], ci = ci, cx = cx, f = f)
    b_cnt <- kmr_count(b, b_out, k = k[i], ci = ci, cx = cx, f = f)
    
    # compare reads
    n_kmer <- NA
    
    if (k[i] > 12) Sys.sleep(2)
    if (file.exists(paste0(a_cnt, ".kmc_pre")) && file.exists(paste0(b_cnt, ".kmc_pre"))) {
      res_kmr <- file.path(tmd, "result__kmerize")
      c_res <-
      kmr_compare(list(a = a_cnt, b = b_cnt), cmp = list(
        res_kmr,  "a - b"),
                         ci = ci, cx = cx)
   
    if (file.size(paste0(res_kmr, ".kmc_pre")) > 10) {
      c_tbl <- kmr_write_rds(file.path(res_kmr))
      
      # read rds table, get n of rows == n of distinct kmers
      if (file.size(c_tbl) > 0) {
        tbl <- kmr_read_rds(c_tbl)
        n_kmer <- nrow(tbl)
        
        # add new row to result table
        arow <- as.data.frame(cbind(k = k[i], n_kmer = n_kmer))
        atbl <- rbind(atbl, arow)
      }
    }
    } # kmer count files exist
   
    
  }
  # cleanup tmp dir
 
  if (cleanup) {
    unlink(tmd, recursive = TRUE, force = TRUE)
    unlink(file.path(tmd, ".*"))
  }

  atbl <- atbl[-c(1), ]
  # get min k
  atbl <- atbl[atbl$n_kmer >= min_kmers, ]
  k_min <- min(atbl$k)
  
  # return list object with k_min and table
  return(list(k_min = k_min, res = atbl, kmer_tbl = paste0(res_kmr, ".rds")))
}

