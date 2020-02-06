context("Kmer counting with single file")
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
      x = kmr_count(fa, out_file, k = k, f = "q")
    )
  ) == 1
    
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



context("kmer counting parameters")

test_that("kmer counter runs without error", {
  expect_true(length(
    capture.output(
      kmr_count(fa, out_file, k = k, f = "q", sm = TRUE, b = TRUE, r = FALSE, v = TRUE)
    )
  ) == 1
  
  )
})

test_that("kmer counter runs without error & invalid param comb", {
  expect_true(length(
    capture.output(
      kmr_count(fa, out_file, k = k, f = "q", sm = TRUE, b = TRUE, r = TRUE, v = TRUE)
    )
  ) == 1
  
  )
})



context("Kmer counting with multiple file names")
errf <- "____x.fastq.gz"
fa_e <- c(fa, errf)

test_that("kmer counter with non-exist filename returns error", {
  expect_error(
      kmr_count(fa_e, out_file, k = k, f = "q")
  )
})

test_that("kmer counter with non-exist filename(s) lists them", {
  expect_true(
    capture_message(kmr_count(fa_e, out_file, k = k, f = "q"))[[1]] == paste0(errf, "\n\n"), 
  )
})

context("Kmer counter for fasta files with multiple lines: f = m, not compressed")

test_that("kmer counter runs ok with multiple files", {
  fa <-  system.file("testdata/phix174.fasta", 
                     package = "kmerize")
  out_file <- file.path(tempdir(), "phi174")
  k <- 6
  
  expect_true(length(
    capture.output(
      kmr_count(fa, out_file, k = k, f = "m", ci = 0)
    )
  ) == 1
  
  )
})


context("Kmer counter special parameter combination")

test_that("kmer counter converts parameter correctly", {
  fa <-  system.file("testdata/phix174.fasta", 
                     package = "kmerize")
  out_file <- file.path(tempdir(), "phi174")
  k <- 6
  
  expect_true(length(
    capture.output(
      kmr_count(fa, out_file, k = k, f = "m", ci = 0, r = TRUE, sm = FALSE)
    )
  ) == 1
  
  )
})

