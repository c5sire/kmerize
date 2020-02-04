context("Kmer counting")
fa <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", 
                  package = "kmerize")
k <- 13

out_file <- file.path(tempdir(), "phwei11")
out_db <- paste0(out_file, c(".kmc_pre", ".kmc_suf"))


test_that("Test data exists", {
  expect_true(file.exists(fa))
})

test_that("kmer counter runs without error", {
  expect_true(length(
    capture.output(
      kmr_kmc(fa, out_file, k = k, f = "q")
    )
  ) == 0
    
  )
})

test_that("kmer counter produces output files", {
  expect_true(
    all(file.exists(out_db))
  )
})

test_that("kmer counter produces output files with size > 0", {
  expect_true(
    all(file.size(out_db) > 0)
  )
})
