context("Kmer counting with single file")

testthat::skip_on_appveyor()
testthat::skip_on_travis()
testthat::skip_on_cran()

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
  ) > 0
  
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
  ) > 0
  
  )
})

test_that("kmer counter runs without error & invalid param comb", {
  expect_true(length(
    capture.output(
      kmr_count(fa, out_file, k = k, f = "q", sm = TRUE, b = TRUE, r = TRUE, v = TRUE)
    )
  ) > 0
  
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
  ) > 0
  
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
  ) > 0
  
  )
})


test_that("kmer counter produces output files with size > 0 when out dir not exists", {
  out_file <-  file.path(tempdir(), "subdir", "phwei11")
  expect_true(
    expect_true(length(
      capture.output(
        x = kmr_count(fa, out_file, k = k, f = "q")
      )
    ) > 0
    )
  )
})


context("kmer counter accepts more than one file")

test_that("kmer counter accepts two files", {
  out_file <-  file.path(tempdir(), "subdir", "phwei11")
  expect_true(
    expect_true(length(
      capture.output(
        x = kmr_count(c(fa, fa), out_file, k = k, f = "q")
      )
    ) > 0
    )
  )
})

test_that("kmer counter deletes internal temp file", {
  out_file <-  file.path(tempdir(), "subdir", "phwei11")
  x = kmr_count(c(fa, fa), out_file, k = k, f = "q")
  expect_true(
    expect_true(length(
      capture.output(
        x = kmr_count(c(fa, fa), out_file, k = k, f = "q")
      )
    ) > 0
    )
  )
})


test_that("kmer counter accepts a directory containing seq files", {
  a <- system.file("testdata/phix174.fasta", 
                   package = "kmerize")
  b <- system.file("testdata/phix174_m.fasta", 
                   package = "kmerize")
  dir_fa <- file.path(tempdir(), "_fasta")
  if (!dir.exists(dir_fa)) dir.create(dir_fa)
  
  x <- file.copy(c(a, b), dir_fa, overwrite = TRUE)
  
  expect_true(length(
    capture.output(
      x = kmr_count(dir_fa, out_file, k = 1, f = "m")
    )
  ) > 0
  )
  
  
})
