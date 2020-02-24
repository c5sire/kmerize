context("assure file ext")

test_that("Extension is added if missing - no matter the case", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  expect_true(
    kmerize:::assure_file_ext("xxx", ".tab") == "xxx.tab"
  )
})

test_that("Extension is added if missing - no matter the case", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  expect_true(
    kmerize:::assure_file_ext("XXX", ".tab") == "XXX.tab"
  )
})

test_that("Extension is NOT added if missing - no matter the case", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  expect_true(
    kmerize:::assure_file_ext("xxx.tab", ".tab") == "xxx.tab"
  )
})

test_that("Extension is NOT added if missing - no matter the case", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  expect_true(
    kmerize:::assure_file_ext("xxx.TAB", ".tab") == "xxx.TAB"
  )
})
