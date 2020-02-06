

#' kmr_install_kmc
#' 
#' Installs a local version of kmc3.
#'
#' @param download_file If provided, kmc3 is provided from a local archive. User makes sure it is the appropriate version for the local OS.
#'
#' @return logical
#' @export
#'
#' @examples
#' 
#' if(interactive()) {
#'   kmr_install_kmc()
#' }
kmr_install_kmc <- function(download_file = NULL) {
  # check if installed locally on known path
  kmc_ok <- check_install_ok()  
  
  # if not installed and no package given
  if (!kmc_ok) {
    # get local OS ref
    los <- get_os()
    
    # get local kmc3 path reference
    kmc_dir <- get_kmc_dir() 
    
    if (is.null(download_file)) {
    
    url_base <- "https://github.com/refresh-bio/KMC/releases/download/v3.0.0/"
    url_app <- switch(los,
                Windows = "KMC3.windows.tar.gz",
                Linux = "KMC3.linux.tar.gz",
                Mac = "KMC3.mac.tar.gz"
           )
    url <- file.path(url_base, url_app)
    
    # download from official URL the appropriate version
    tgt <- file.path(tempdir(), url_app)
    utils::download.file(url, tgt)
    } else {
      tgt <- download_file
      if (!file.exists(tgt)) {stop("Path to archive does not exist!")}
    }
    
    # unpack into known location
    utils::untar(tgt, exdir = kmc_dir)
  } else {
    message("KMC3 already installed locally.")
  }
  
  # check if program files present and works
  kmc_ok <- check_install_ok() 
  stopifnot(kmc_ok)
  return(kmc_ok)
}