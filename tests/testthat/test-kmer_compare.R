context("Kmer comparison")

testthat::skip_on_appveyor()
testthat::skip_on_travis()
testthat::skip_on_cran()

fa <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz",
  package = "kmerize"
)
fm <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz",
  package = "kmerize"
)

k <- 9
tmd <- tempdir()
if (!dir.exists(tmd)) dir.create(tmd)

out_fx <- file.path(tmd, "phx")
out_fm <- file.path(tmd, "phm")


test_that("Test data exists", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  kmr_count(fa, out_fx, k = k, f = "q")
  kmr_count(fm, out_fm, k = k, f = "q")

  cmp_xy <- file.path(tmd, "cmp_xy")



  expect_true(length(
    capture.output(
      kmr_compare(list(x = out_fx, y = out_fm), cmp = list(cmp_xy, "y - x"))
    )
  ) > 0)
})
