context("kmr_install_kmc")

test_that("It does not attempt to install on dev system", {
  expect_message(
    kmr_install_kmc(), "KMC3 already installed locally."
  )
})

test_that("It returns ok when installed", {
  expect_true(
    kmr_install_kmc()
  )
})

test_that("It raises an error if given a non existant file", {
  expect_error(
    kmr_install_kmc("xyz.tar")
  )
})
