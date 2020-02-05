context("Kmer comparison")


fa <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", 
                  package = "kmerize")
fm <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", 
                  package = "kmerize")

k <- 17

out_fx <- file.path(tempdir(), "phx")
out_fm <- file.path(tempdir(), "phm")

kmr_count(fa, out_fx, k = k, f = "q")
kmr_count(fm, out_fm, k = k, f = "q")

cmp_xy <- file.path(tempdir(), "cmp_xy")

test_that("Test data exists", {
  expect_true(length(
    capture.output(
      kmr_compare(list(x = out_fx, y = out_fm), cmp = list(cmp_xy = "y - x"))
    )
  ) == 1)
}
)

#unlink(tempdir())