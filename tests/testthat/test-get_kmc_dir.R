context("Get kmc dir")


kud <- kmerize:::get_kmc_dir()

to <- paste0(kud, "x")
file.rename(kud, to)


test_that("Dir is not found", {
  expect_true(
    kmerize:::get_kmc_dir() == kud
  )
})

context("Get kmc base")

test_that("Dir is found but not program", {
  expect_error(
    kmerize:::get_kmc_base()
  )
})



unlink(kud, recursive = TRUE, force = TRUE)
file.rename(to, kud)
