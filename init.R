my_packages <- c("dplyr","readr","ggplot2","geosphere","shiny")
install_if_missing <- function(p) {
  if(p %in% rownames(installed.packages())==FALSE){
    install.packages(p)}
}
invisible(sapply(my_packages, install_if_missing))
