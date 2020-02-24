context("Read a kmer database from another file format")

testthat::skip_on_appveyor()
testthat::skip_on_travis()
testthat::skip_on_cran()


fa <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", 
                  package = "kmerize")
k <- 7

out_file <- file.path(tempdir(), "phwei11")
kmr_count(fa, out_file, k = k, f = "q")

fo <- kmr_write_tab(out_file)

dat <- kmr_read_tab(out_file)
#out_db <- paste0(out_file, c(".kmc_pre", ".kmc_suf"))

test_that("Can write file: .tab.gz", {
  expect_true(
   fo  == paste0(out_file, ".tab.gz")
  )
})

test_that("Can write file: .rds", {
  expect_true(
    kmr_write_rds(out_file) == paste0(out_file, ".rds")
  )
})



test_that("Can read tab file", {
  
  expect_true(
    all(names(dat) == c("kmer", "count"))
  )
})

test_that("Can NOT read tab file raises error", {
  expect_error(
    kmr_read_tab("___xxx___")
  )
})


test_that("Can read rds file", {
  dat <- kmr_read_rds(out_file)
  expect_true(
    nrow(dat) > 0
  )
})

test_that("Can NOT read tab file raises error", {
  expect_error(
    kmr_read_rds("___xxx___")
  )
})

skip("Until arrow package back on CRAN")

test_that("Can write file: .parquet", {
  expect_true(
    kmr_write_parquet(out_file) == paste0(out_file, ".parquet")
  )
})

skip("Until arrow package back on CRAN")
test_that("Can read parquet file", {
  dat <- kmr_read_parquet(out_file)
  expect_true(
    nrow(dat) > 0
  )
})

skip("Until arrow package back on CRAN")
test_that("Can NOT read parquet file raises error", {
  expect_error(
    kmr_read_parquet("___xxx___")
  )
})