context("K half")
fa <- system.file("testdata/phix174.fasta", 
                  package = "kmerize")
k <- as.integer(seq(1, 21, 4))

res <- kmr_response(fa, k)


test_that("kmer counter runs without error", {
  expect_true(
    kmr_calc_k_half(res) == 13
  )
})

pr <- file.path(tempdir(), "test.png")
png(pr)
plot_response(res)
dev.off()

#file.exists(pr)
context("Plot the genomic response")

test_that("Plot exists", {
  expect_true(
    file.exists(pr)
  )
})


test_that("Plot has expected size", {
  expect_true(
    file.size(pr)[1] >= 300
  )
})

pr <- file.path(tempdir(), "test_w_k.png")
png(pr)
plot_response(res, ref_k = 31)
dev.off()

#file.exists(pr)
context("Plot the genomic response with ref k")

test_that("Plot exists", {
  expect_true(
    file.exists(pr)
  )
})


test_that("Plot has expected size", {
  expect_true(
    file.size(pr)[1] >= 300
  )
})
