library(testthat)
library(kmerize)

testthat::skip_on_appveyor()
testthat::skip_on_travis()
testthat::skip_on_cran()
test_check("kmerize")
