context("K limit")
fa <- system.file("testdata/phix174.fasta", 
                  package = "kmerize")
k <- as.integer(seq(5, 17, 2))

res <- kmr_response(fa, k)

tmd <- tempdir()

pr <- file.path(tmd, "test.png")
png(pr)
kmr_plot_response(res)
dev.off()

pr2 <- file.path(tmd, "test_w_k.png")
png(pr2)
kmr_plot_response(res, ref_k = 31)
dev.off()



test_that("kmer counter runs without error", {
  expect_true(
    kmr_calc_k_limit(res)$k == 9
  )
})


#file.exists(pr)
context("Plot the genomic response")

test_that("Plot exists", {
  expect_true(
    file.exists(pr) == TRUE
  )
})


test_that("Plot has expected size", {
  expect_true(
    file.size(pr)[1] >= 300
  )
})



#file.exists(pr)
context("Plot the genomic response with ref k")

test_that("Plot exists", {
  expect_true(
    file.exists(pr2)
  )
})


test_that("Plot has expected size", {
  expect_true(
    file.size(pr2)[1] >= 300
  )
})
