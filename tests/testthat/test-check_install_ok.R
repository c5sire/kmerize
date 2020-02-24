context("Check installation is ok")

test_that("Installation is ok", {
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
 expect_true(check_install_ok()) 
})