% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kmr_write_tab.R
\name{kmr_write_tab}
\alias{kmr_write_tab}
\title{kmr_write_tab}
\usage{
kmr_write_tab(db, to = db)
}
\arguments{
\item{db}{Name of kmer database}

\item{to}{Name of target file (default same as db name)}
}
\value{
logical
}
\description{
Write kmer database as tab format.
}
\examples{
if (interactive()) {

  fa <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz",
  package = "kmerize")

  out_file <- file.path(tempdir(), "phx")
  k <- 7
  kmr_count(fa, out_file, k = k, f = "q")
  
  kmr_write_rds(out_file)

  dat <- kmr_read_rds(out_file)
  head(dat)

}
}
\seealso{
Other kmer_core: 
\code{\link{kmr_count}()},
\code{\link{kmr_install_kmc}()},
\code{\link{kmr_read_parquet}()},
\code{\link{kmr_read_rds}()},
\code{\link{kmr_read_tab}()},
\code{\link{kmr_write_parquet}()},
\code{\link{kmr_write_rds}()}
}
\concept{kmer_core}
