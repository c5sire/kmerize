% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kmr_count.R
\name{kmr_count}
\alias{kmr_count}
\title{kmr_count}
\usage{
kmr_count(
  in_files,
  out_file,
  k = 11,
  m = 12,
  sm = FALSE,
  f = "a",
  ci = 2,
  cx = 1e+09,
  cs = 255,
  b = FALSE,
  r = FALSE,
  n = 255,
  t = parallel::detectCores(),
  v = FALSE
)
}
\arguments{
\item{in_files}{a name of a single file, a vector of file names, or a
directory containing files.}

\item{out_file}{name of the output file}

\item{k}{kmer size; default is 11.}

\item{m}{RAM memory size; default is 12.}

\item{sm}{strict memory mode; default is FALSE.}

\item{f}{format of input files; options: a fasta, m multiple fasta, q fastq.
Default is a.}

\item{ci}{minimum occurrence of kmers; default is 2.}

\item{cx}{maximum occurrence of kmers: default is 1e9.}

\item{cs}{maximum size of counter; default is 255.}

\item{b}{do not use canonical transformation of kmers. Default is FALSE.}

\item{r}{turn on RAM only. Default is FALSE.}

\item{n}{Number of bins. Default is 255.}

\item{t}{Number of threads. Default is all available number of CPUs.}

\item{v}{Use verbose mode. Default is FALSE.}
}
\value{
out_file
}
\description{
Count kmers.
}
\details{
A few parameters of the kmc3 counting program are not supported:
  p signature length; default is 9.
 sf Number of threads for FASTQ reading. Default is 4.
 sp Number of threads for splitting. Default is 4.
 sr Number of threads for second stage. Default is 4
}
\note{
Counts kmers up to a maximum of size of k = 255. Uses kmc3 in the
  backend on Windows, Linux, and
 Mac. The parameter lists corresponds to the list of options of kmc3.
}
\examples{
if (interactive()) {
  fa <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz",
    package = "kmerize"
  )
  k <- 13
  out_file <- file.path(tempdir(), "phwei11")
  kmerize:::kmr_count(fa, out_file, k = k, f = "q")
}
}
\references{
Kokot M, Dlugosz M, Deorowicz S. KMC 3: counting and manipulating
   k-mer statistics. Bioinformatics. 2017 Sep 1;33(17):2759-61.
}
\seealso{
Other kmer_core: 
\code{\link{kmr_install_kmc}()},
\code{\link{kmr_read_parquet}()},
\code{\link{kmr_read_rds}()},
\code{\link{kmr_read_tab}()},
\code{\link{kmr_write_parquet}()},
\code{\link{kmr_write_rds}()},
\code{\link{kmr_write_tab}()}
}
\author{
Reinhard Simon
}
\concept{kmer_core}
