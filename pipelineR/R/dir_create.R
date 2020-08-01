#' create folders for data analytics
#' @aliases NULL pipelineR
#' @useDynLib pipelineR, .registration = TRUE
#' @importFrom rlang .data
#' @keywords internal
#' @export dir_create
#' @examples
#' dir_create()
"_PACKAGE"

dir_create <- function(){
  dir.create("./01_imput")
  dir.create("./02_middle")
  dir.create("./03_output")
  dir.create("./04_source")
  dir.create("./99_sandbox")
  print("folder created. check your current directory.")
}
