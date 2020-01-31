debug = FALSE

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
                    sf = 2, # number of threads for FASTQ reading
                    sp = 2, # number of splitting threads
                    sr = 2, # number of threads for second stage
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
  cat(cmd)  
  if(debug) {
    cat(cmd)  
  } else {
      
  }
  system(cmd)
  unlink(tmp)
}


fa <- "D:/projects/julia/simpot/phix174-pe_w_err.fastq.gz"

debug <- FALSE
kmr_kmc(fa, "M:/packages/kmerize/phwei11")

