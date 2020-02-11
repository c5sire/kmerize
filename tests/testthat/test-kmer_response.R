context("Kmer response")

fa <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", 
                  package = "kmerize")
k <- as.integer(seq(1, 3, 2))
res <- kmr_response(fa, k, fmt = "q")

test_that("Response detects non-numeric k", {
  expect_error(
    kmr_response(fa, k = "x", fmt = "q")
  )
}
)

test_that("Response plot creates a plotl", {
  p <- kmr_plot_response(res, limit = .95)
  expect_true(
    ggplot2::is.ggplot(p)
  )
}
)




test_that("Response on fastq works", {
  expect_true(
    nrow(res) == 2
  )
}
)

fm <- system.file("testdata/phix174.fasta", 
                  package = "kmerize")

k <- as.integer(1)
res2 <- kmr_response(fm, k)

test_that("Response on fasta works", {
  expect_true(
    nrow(res2) == 1
  )
}
)

context("Kmer response marginal cases")
k <- NULL
test_that("Response raises error if k is null", {
  expect_error(
    kmr_response(fa, k)
  )
}
)

k <- as.integer(-1)
test_that("Response raises error if k < 0", {
  expect_error(
    kmr_response(fa, k)
  )
}
)


k <- as.integer(256)
test_that("Response raises error if k > 255", {
  expect_error(
    kmr_response(fa, k)
  )
}
)

k <- "x"
test_that("Response raises error if k = 'x'", {
  expect_error(
    kmr_response(fa, k)
  )
}
)

k <- NA
test_that("Response raises error if k = 'x'", {
  expect_error(
    kmr_response(fa, k)
  )
}
)

k <- "x"
test_that("Response raises error if k = NA", {
  expect_error(
    kmr_response(fa, k)
  )
}
)

k <- c(1, "x", 3)
test_that("Response raises error if k has mixed vector", {
  expect_error(
    kmr_response(fa, k)
  )
}
)


k <- 1.23
test_that("Response raises error if k = 1.23", {
  expect_error(
    kmr_response(fa, k)
  )
}
)


k <- TRUE
test_that("Response raises error if k = logical", {
  expect_error(
    kmr_response(fa, k)
  )
}
)

context("Response parameter file ref")

test_that("Response raises error if invalid file path", {
  expect_error(
    kmr_response("xyz", as.integer(3))
  )
}
)

context("Response parameter format value")

test_that("Response raises error if invalid format value", {
  expect_error(
    kmr_response(fa, as.integer(3), "x")
  )
}
)

res <- kmr_response(fa, as.integer(3), fmt = "q")

test_that("Response raises error if k = logical", {
  expect_true(
    nrow(res) == 1
  )
}
)

