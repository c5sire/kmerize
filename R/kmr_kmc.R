#' kmr_kmc
#' 
#' Count kmers.
#' 
#' @notes Counts kmers up to a maximum of size of k = 255. Uses kmc3 in the backend on Windows, Linux, and
#' Mac. The parameter lists corresponds to the list of options of kmc3.
#'
#' @param in_files a single file or a name of file containing a list of file. If it is a file name it must start with an @.
#' @param out_file name of the output file
#' @param k kmer size; default is 11.
#' @param m RAM memory size; default is 12.
#' @param sm strict memory mode; default is FALSE.
#' @param p signature length; default is 9.
#' @param f format of input files; options: a fasta, m multiple fasta, q fastq. Default is a.
#' @param ci minimum occurrence of kmers; default is 2.
#' @param cx maximum occurrence of kmers: default is 1e9.
#' @param cs maximum size of counter; default is 255.
#' @param b do not use canonical transformation of kmers. Default is FALSE.
#' @param r turn on RAM only. Default is FALSE.
#' @param n Number of bins. Default is 255.
#' @param t Number of threads. Default is all available number of CPUs.
#' @param sf Number of threads for FASTQ reading. Default is 4.
#' @param sp Number of threads for splitting. Default is 4.
#' @param sr Number of threads for second stage. Default is 4
#' @param v Use verbose mode. Default is FALSE.
#'
#' @return
#' @author Reinhard Simon
#' @references Kokot M, Długosz M, Deorowicz S. KMC 3: counting and manipulating k-mer statistics. Bioinformatics. 2017 Sep 1;33(17):2759-61.
#' 
#' @export
#'
#' @examples
#' if( interactive()) {
#' 
#'  fa <- system.file("testdata/phix174_m-pe_w_err_5k_30q.fastq.gz", package = "kmerize")
#'  k <- 13
#'  out_file <- file.path(tempdir(), "phwei11")
#'  kmerize:::kmr_kmc(fa, out_file, k = k, f = "q")
#' 
#' }
kmr_kmc <- function(in_files, 
                    out_file, 
                    k = 11, 
                    m = 12, # RAM
                    sm = FALSE, # strict memory mode
                    p = 9, # signature length: 5:11
                    f = "a", # format: fa, fm , fq
                    ci = 2, #minim k occurrence
                    cx = 1e9, # max k occ
                    cs = 255, # max counter
                    b = FALSE, # turn canonical transformation off
                    r = FALSE, # turn on RAM only
                    n = 255, # number of bins
                    t = parallel::detectCores(), # number of cores
                    sf = 4, # number of threads for FASTQ reading
                    sp = 4, # number of splitting threads
                    sr = 4, # number of threads for second stage
                    v = FALSE # verbose mode; use to turn off 
) {
  # check if files exists
  
  # check parameter values
  
  # if more than input file use a temp archive to store the list and change in_files to pointer
  tmp <- file.path(tempdir(), "_kmer")
  unlink(tmp)
  #dir.create(tmp)
  
  # ptr_file <- file.path(tmp, "infile_list.txt")
  # writeLines(in_files, ptr_file)
  
  # in_files <- paste0("@", ptr_file)
  
  # form parameter strings; omit the lesser used ones: use sprintf
  
  params <- " -k%i -m%i -p%i -f%s -ci%i -cx%i -cs%i -n%i -t%i -sf%i -sp%i -sr%i"
  params <- sprintf(params, k, m, p, f, ci, cx, cs, n, t, sf, sp, sr)
  
  if(sm) params <- paste(params, "-sm")
  if(b) params <- paste(params, "-b")
  if(r) params <- paste(params, "-r")
  if(v) params <- paste(params, "-v")
  
  cmd <- paste0(kmc(), params)
  

  
  # execute as promise!
  cmd <- paste0(cmd, " ", in_files, " ", out_file, " ", tmp)
  # TODO cat(cmd)  
  system(cmd)
  unlink(tmp)
}

