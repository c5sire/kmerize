context("kmr_scan_k_min")

fa <- system.file("testdata/phix174.fasta", package = "kmerize")
a <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
b <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", package = "kmerize")

x <- kmerize:::kmr_scan_k_min(a, b, k = 7, min_kmers = 3, cleanup = TRUE)

test_that("Deleted temporary kmer file raises error", {
  expect_error(
    rr <- kmr_read_rds(x$kmer_tbl)
  )
})

test_that("Deleted temporary kmer file raises error", {
  expect_error(
    rr <- kmr_read_rds(x$kmer_tbl)
  )
})

test_that("Time is delayed for k > 12 for more than 2 seconds ", {
  start_time <- Sys.time()
  x <- kmerize:::kmr_scan_k_min(a, b, k = 13, min_kmers = 3, cleanup = TRUE)
  lapse <- Sys.time() - start_time
  
  expect_true(
    lapse > 2
  )
})
