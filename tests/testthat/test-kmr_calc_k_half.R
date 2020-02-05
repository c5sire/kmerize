context("K half")
fa <- system.file("testdata/phix174.fasta", 
                  package = "kmerize")
k <- seq(1, 15, 2)

res <- kmr_response(fa, k)


test_that("kmer counter runs without error", {
  expect_true(
    kmr_calc_k_half(res) == 9
  )
})


