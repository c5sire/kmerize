context("Kmer response")

fa <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", 
                  package = "kmerize")
k <- seq(1, 3, 2)
res <- kmr_response(fa, k)

test_that("Response on fastq works", {
  expect_true(
    nrow(res) == 2
  )
}
)

fm <- system.file("testdata/phix174.fasta", 
                  package = "kmerize")

k <- seq(1, 3, 2)
res <- kmr_response(fm, k)

test_that("Response on fasta works", {
  expect_true(
    nrow(res) == 2
  )
}
)

