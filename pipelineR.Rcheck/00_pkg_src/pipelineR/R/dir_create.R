#' create folders for data analytics
#' @aliases NULL pipelineR
#' @importFrom rlang .data
#' @importFrom utils menu
#' @import usethis
#' @keywords internal
#' @param R_proj make .Rproj file. default is TRUE
#' @param dir if define working directory, set as character. default is NULL
#' @export
#' @examples

dir_create <- function(R_proj = TRUE, dir = NULL){
  ### todo
  ## create R project to current directory.
  ##
  proj_create_day <- Sys.Date()

  if(R_proj){
    if(is.null(dir)){
      project_dir     <- paste0("./R_project_", proj_create_day)
      usethis::create_project(project_dir, open = FALSE)
    }else{
      project_dir     <- paste0(dir, "/R_project_", proj_create_day)
      usethis::create_project(project_dir, open = FALSE)
    }
  }
  print(paste0("R project file was successfully created at", getwd()))
  setwd(paste0("./R_project_", proj_create_day))
  dir.create("./01_input")
  dir.create("./02_middle")
  dir.create("./03_output")
  dir.create("./04_source")
  dir.create("./99_sandbox")
  print("folder created. start project?")
  switch (menu(c("Yes", "No")),
          usethis::proj_activate(paste0("../R_project_",proj_create_day))
  )
}
