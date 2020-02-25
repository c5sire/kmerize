context("Kmer response")


fa <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz",
  package = "kmerize"
)
k <- as.integer(seq(1, 3, 2))

testthat::skip_on_appveyor()
testthat::skip_on_travis()
testthat::skip_on_cran()

res <- kmr_response(fa, k, fmt = "q")




test_that("Response detects non-numeric k", {
  expect_error(
    kmr_response(fa, k = "x", fmt = "q")
  )
})

test_that("Response plot creates a plotl", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  p <- kmr_plot_response(res, limit = .95)

  expect_true(
    class(p)[[1]] == "GGbio"
  )
})




test_that("Response on fastq works", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  expect_true(
    nrow(res) == 2
  )
})

fm <- system.file("testdata/phix174.fasta",
  package = "kmerize"
)

k <- as.integer(1)


test_that("Response on fasta works", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  res2 <- kmr_response(fm, k)
  expect_true(
    nrow(res2) == 1
  )
})

context("Kmer response marginal cases")

k <- NULL
test_that("Response raises error if k is null", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_error(
    kmr_response(fa, k)
  )
})

k <- as.integer(-1)
test_that("Response raises error if k < 0", {
  expect_error(
    kmr_response(fa, k)
  )
})


k <- as.integer(256)
test_that("Response raises error if k > 255", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_error(
    kmr_response(fa, k)
  )
})

k <- "x"
test_that("Response raises error if k = 'x'", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_error(
    kmr_response(fa, k)
  )
})

k <- NA
test_that("Response raises error if k = 'x'", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_error(
    kmr_response(fa, k)
  )
})

k <- "x"
test_that("Response raises error if k = NA", {
  expect_error(
    kmr_response(fa, k)
  )
})

k <- c(1, "x", 3)
test_that("Response raises error if k has mixed vector", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_error(
    kmr_response(fa, k)
  )
})


k <- 1.23
test_that("Response raises error if k = 1.23", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_error(
    kmr_response(fa, k)
  )
})


k <- TRUE
test_that("Response raises error if k = logical", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_error(
    kmr_response(fa, k)
  )
})

context("Response parameter file ref")

test_that("Response raises error if invalid file path", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_error(
    kmr_response("xyz", as.integer(3))
  )
})

context("Response parameter format value")

test_that("Response raises error if invalid format value", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_error(
    kmr_response(fa, as.integer(3), "x")
  )
})

res <- kmr_response(fa, as.integer(3), fmt = "q")

test_that("Response raises error if k = logical", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()

  expect_true(
    nrow(res) == 1
  )
})
