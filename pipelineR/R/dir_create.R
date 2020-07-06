#' create folders for data analytics
#' @aliases NULL hello-package
#' @useDynLib hello, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#' @keywords internal
#' @export dir_create
"_PACKAGE"

dir_create <- function(){
  dir.create("./01_imput")
  dir.create("./02_middle")
  dir.create("./03_output")
  dir.create("./04_source")
  dir.create("./99_sandbox")
  print("folder created. check your current directory.")
}
