## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
Sys.setenv("NOT_CRAN" = "true")


## ----setup--------------------------------------------------------------------

suppressPackageStartupMessages(
  library(kmerize)
)


fq <- system.file("testdata/phix174-pe_w_err_5k_30q.fastq.gz", 
                  package = "kmerize")
k <- 9

out_file <- file.path(tempdir(), "phwei11")
out_db <- paste0(out_file, c(".kmc_pre", ".kmc_suf"))


## -----------------------------------------------------------------------------
if (kmerize:::check_install_ok()) {
kmer_path = kmr_count(fq, out_file, 
                  k = k, 
                  f = "q" # file input format is fastq
                  )  
}



## -----------------------------------------------------------------------------
if (kmerize:::check_install_ok()) {
kp <- kmr_write_tab(kmer_path)

kmers <- kmr_read_tab(kp)
head(kmers)
}

## -----------------------------------------------------------------------------
# Getting the DNA
if (kmerize:::check_install_ok()) {
fp <- system.file("testdata/phix174.fasta", 
                  package = "kmerize")
dna <- Biostrings::readDNAStringSet(fp)

k <- as.integer(seq(3, 25, 2)) # currently k explicitly as integer sequence
res <- kmr_response(fp, k, fmt = "m")
res
}


## ----fig.width=7, warning=FALSE-----------------------------------------------
if (kmerize:::check_install_ok()) {

kmr_plot_response(res, ref_k = 9, max_y = Biostrings::width(dna))
}

