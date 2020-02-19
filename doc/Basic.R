## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

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
kmer_path = kmr_count(fq, out_file, 
                  k = k, 
                  f = "q" # file input format is fastq
                  )


## -----------------------------------------------------------------------------
kp <- kmr_write_tab(kmer_path)

## -----------------------------------------------------------------------------
kmers <- kmr_read_tab(kp)
head(kmers)

## -----------------------------------------------------------------------------
# Getting the DNA
suppressPackageStartupMessages(
  library(BSgenome.phix174.NCBI.NC001422)
)

phi <- BSgenome.phix174.NCBI.NC001422::BSgenome.phix174.NCBI.NC001422
dna <- phi$NC_001422.1

# DNA has to be available in a FASTA file for the kmer_response function.
# So it needs to be converted and stored.
fp <- file.path(tempdir(), "dna.fasta")

Biostrings::writeXStringSet(DNAStringSet(dna), fp)

k <- as.integer(seq(3, 25, 2)) # currently k explicitly as integer sequence
res <- kmr_response(fp, k, fmt = "m")
res



## ----fig.width=7--------------------------------------------------------------
kmr_plot_response(res, ref_k = 9, max_y = length(dna))

