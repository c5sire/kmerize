context("kmr_map_kmers")
testthat::skip_on_appveyor()
testthat::skip_on_travis()
testthat::skip_on_cran()

fa <- system.file("testdata/phix174.fasta", package = "kmerize")
a <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz",
                 package = "kmerize")
b <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz",
                 package = "kmerize")

x <- kmr_scan_k_min(a, b, k = 9, min_kmers = 3, cleanup = FALSE)
rr <- kmr_read_rds(x$kmer_tbl)


kmap <- kmr_map_kmers(rr, genome = fa, "phi-X174")


test_that("A map plot is returned", {
  expect_true(
    class(kmr_plot_map(kmap, 911))[[1]] == "Tracks"
  )
})

test_that("An error occurs when table seems incorrect judged by column names", {
  names(rr) <- c("x", "y")
  expect_error(
    kmr_map_kmers(rr, genome = fa, "phi-X174")
  )
})

test_that("Seq name is given automatically", {
  km <- kmr_map_kmers(rr, genome = fa)

  expect_true(
    all(seqnames(km) == "NC_001422.1 Coliphage phi-X174, complete genome")
  )
})
