kmr_kmc <- function(in_files, out_file, k = 11, 
                    m = 12, # RAM
                    sm = TRUE, # strict memory mode
                    p = 9, # signature length: 5:11
                    f = "fa", # format: fa, fm , fq
                    ci = 2, #minim k occurrence
                    cx = 1e9, # max k occ
                    cs = 255, # max counter
                    b = FALSE, # turn canonical transformation off
                    r = FALSE, # turn on RAM only
                    n = 255, # number of bins
                    t = parallel::detectCores(), # number of cores
                    sf = 2, # number of threads for FASTQ reading
                    sp = 2, # number of splitting threads
                    sr = t # number of threads for second stage
) {
  # check if files exists
  
  # check paramater values
  
  # form strings; omit the lesser used ones
  
}