
kmr_scan_k_min <- function(a, b, k = seq(3, 13, 2), ci = 2, cx = 100, min_kmers = 10, f = "q") {
  
  tmd <- tempdir()
  a_out <- file.path(tmd, kmerize:::corename(a))
  b_out <- file.path(tmd, kmerize:::corename(b))
  atbl <- as.data.frame(cbind(k = NA, n_kmer = NA))
  
  # result table
  # k, n kmers
  # return (list object: min k where n of distinct kmers >= min_kmers)
  
  # for a given k count k-mers
  for (i in seq_along(k)) {
    # count kmers
    a_cnt <- kmr_count(a, a_out, k = k[i], ci = ci, cx = cx, f = f)
    b_cnt <- kmr_count(b, b_out, k = k[i], ci = ci, cx = cx, f = f)
    
    # compare reads
    n_kmer <- NA
    
    if (k[i] > 12) Sys.sleep(2)
    if (file.exists(paste0(a_cnt, ".kmc_pre")) && file.exists(paste0(b_cnt, ".kmc_pre"))) {
    c_res <-
      kmr_compare(list(a = a_cnt, b = b_cnt), cmp = list(result__kmerize = "a - b"),
                         ci = ci, cx = cx)
   
    
    # convert result of comparison to rds table
    cat("\n")
    cat("\n")
    cat(k[i])
    cat("\n")
    if (file.size("result__kmerize.kmc_suf") > 10) {
      c_tbl <- 
        kmr_write_rds("result__kmerize")
      
      # read rds table, get n of rows == n of distinct kmers
      if (file.size("result__kmerize") > 0) {
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
  write.csv(atbl, "kmer_scan_results.csv")
  #unlink(tmd, recursive = TRUE, force = TRUE)
  #unlink("result_kmerize*.*")
  
  
  atbl <- atbl[-c(1), ]
  # get min k
  atbl <- atbl[atbl$n_kmer >= min_kmers, ]
  k_min <- min(atbl$k)
  
  # return list object with k_min and table
  return(list(k_min = k_min, res = atbl))
}

# a <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
# b <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
# 
# x <- kmr_scan_k_min(a, b, k = seq(7, 21, 2), min_kmers = 5)
# saveRDS(x, "krun3")
# x
