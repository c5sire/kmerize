context("K limit")
testthat::skip_on_appveyor()
testthat::skip_on_travis()
testthat::skip_on_cran()

skip_if_not(kmerize:::get_os() == "Windows", "Skipping image creation on Mac.")

fa <- system.file("testdata/phix174.fasta", 
                  package = "kmerize")
k <- as.integer(seq(5, 17, 2))

tmd <- tempdir()

pr <- file.path(tmd, "test.png")
pr2 <- file.path(tmd, "test_w_k.png")

test_that("kmer counter runs without error", {
  
  
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  
  res <- kmr_response(fa, k)
  

  png(pr)
  kmr_plot_response(res)
  dev.off()
  

  png(pr2)
  kmr_plot_response(res, ref_k = 31)
  dev.off()
  
  
  expect_true(
    kmr_calc_k_limit(res)$k == 9
  )
})


#file.exists(pr)
context("Plot the genomic response")

test_that("Plot exists", {
  
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  
  expect_true(
    file.exists(pr) == TRUE
  )
})


test_that("Plot has expected size", {
  
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  
  expect_true(
    file.size(pr)[1] >= 300
  )
})



#file.exists(pr)
context("Plot the genomic response with ref k")

test_that("Plot exists", {
  
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  
  expect_true(
    file.exists(pr2)
  )
})


test_that("Plot has expected size", {
  
  testthat::skip_on_appveyor()
  testthat::skip_on_travis()
  testthat::skip_on_cran()
  
  expect_true(
    file.size(pr2)[1] >= 300
  )
})
