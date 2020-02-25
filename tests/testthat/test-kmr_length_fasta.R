context("kmr_length_fasta")

test_that("Sequence length is returned", {
  fa <- system.file("testdata/phix174.fasta",
    package = "kmerize"
  )

  expect_true(
    kmr_length_fasta(fa) > 5000
  )
})


test_that("NULL returns error", {
  expect_error(
    kmr_length_fasta()
  )
})

test_that("Non existent file returns error", {
  expect_error(
    kmr_length_fasta("xyz.fasta")
  )
})
