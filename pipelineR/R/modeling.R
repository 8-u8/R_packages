#' Title
#'
#' @param Data Data to use the model
#' @param target dependent variable.
#' @param model_type  which model to use: "lm" or "logistic" or "poisson"
#' @param id_name if Data has ID columns, select it...、
#' @param use_features a character vector to use as features
#' @importFrom stats lm glm binomial
#' @import dplyr
#' @return model
#' @export
#'

base_linear_regression <- function(Data, target, model_type, id_name=NULL, use_features=NULL){
  ### error processing

  ### init
  if(!is.null(id_name)){
    local_usedata <- Data %>%
      dplyr::select(-{{target}}, -{{id_name}})
  }else{
    local_usedata <- Data %>%
      dplyr::select(-{{target}})
  }
  if(!is.null(use_features)){
    local_usedata <- local_usedata %>%
      dplyr::select({{use_features}})
  }
  y <- Data[,target]
  ### model

  if(model_type == "lm"){
    model <- lm(y ~ ., data = local_usedata)
  }
  if(model_type == "logstic"){
    ### chk target summary
    unique_target_value <- sort(unique(y))
    cond <- unique_target_value == c(0,1)
    if(!(cond[1] == TRUE & cond[2] == TRUE)){
      stop("there are not 0/1 values. logistic regression was not executed.")
    }
    ###
    model <- glm(y~., data = local_usedata, family=binomial("logit"))
  }
  if(model_type == "poisson")
    ### chk target summary
    if(min(y)<0){
      stop("this target is not positive value. poisson regression was not executed")
    }
    model <- glm(y~., data = local_usedata, family = "poisson")

    ### output
    return(model)

}
