context("K half")
fa <- system.file("testdata/phix174.fasta", 
                  package = "kmerize")
k <- seq(1, 21, 4)

res <- kmr_response(fa, k)


test_that("kmer counter runs without error", {
  expect_true(
    kmr_calc_k_half(res) == 13
  )
})

pr <- tempfile(fileext = "png")
png(pr)
plot_response(res)
dev.off()

# context("Plot the genomic response", {
#   expect_true(
#     file.exists(pr) == TRUE
#   )
# })
# 
# context("Plot the genomic response: img with content", {
#   expect_true(
#     file.size(pr) == 5383
#   )
# })
# 
