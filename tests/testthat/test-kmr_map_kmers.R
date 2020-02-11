context("kmr_map_kmers")

fa <- system.file("testdata/phix174.fasta", package = "kmerize")
a <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
b <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", package = "kmerize")

x <- kmerize:::kmr_scan_k_min(a, b, k = 9, min_kmers = 3, cleanup = FALSE)
rr <- kmr_read_rds(x$kmer_tbl)


kmap <- kmerize:::kmr_map_kmers(rr, genome = fa, "phi-X174")


test_that("A map plot is returned", {
  expect_true(
    class(kmr_plot_map(kmap, 911))[[1]] == "Tracks"
  )
})
