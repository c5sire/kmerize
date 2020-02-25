context("kmr_position_coverage")

testthat::skip_on_appveyor()
testthat::skip_on_travis()
testthat::skip_on_cran()


fa <- system.file("testdata/phix174.fasta", package = "kmerize")
a <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
b <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", package = "kmerize")

kmers <- kmr_scan_k_min(a, b,
  k = seq(9, 12, 2),
  min_kmers = 1,
  cleanup = FALSE,
  ci = 3,
  cx = 100
)


res <- kmr_position_coverage(kmers, pos = 911, fasta = fa, min_coverage = 5)


test_that("Results are ok", {
  expect_true(
    nrow(res) == 2
  )
})
