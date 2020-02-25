calc_kmer_summary <- function(fasta, out_file = NULL, k = 3, f = "m", ci = 0) {
  # extract kmers
  if (is.null(out_file)) {
    out_file <- file.path(tempdir(), corename(fasta))
  }
  k_cnt <- kmr_count(fasta, out_file, k = k[1], f = f, ci = ci)

  # dump kmers
  rds <- kmr_write_rds(k_cnt)

  # read kmers
  dat <- kmr_read_rds(rds)


  # get summary
  tbl <- table(dat$count)

  uq <- ifelse("1" %in% names(tbl), tbl[[1]], 0)
  universe <- ifelse(k %% 2 != 0, 4^k / 2, (4^k + 4^ (k / 2)) / 2)

  smry <- as.data.frame(cbind(
    k = k, unique = uq, distinct = nrow(dat),
    total = sum(dat$count),
    universe = universe
  ))
  return(smry)
}
