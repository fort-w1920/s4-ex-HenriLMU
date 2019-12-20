validate_animal <- function(object) {
  checkmate::assert(inherits(object, "animal"))
  invalids <- character(0)
  no_name <- nchar(object@name) == 0
  wrong_weight <- object@weight <= 0
  wrong_gender <- (any(object@gender == c(TRUE, FALSE)) && 
                length(object@gender) ==1)
  if (no_name) invalids <- "No <name> provided."
  if (wrong_weight) invalids <- c(invalids, "\n", "Please stop lying about your <weight>.")
  if (wrong_gender) invalids <- c(invalids, "\n", "Please make a TRUE/FLASE specification on your <gender>.")
  
  # validate subclasses
  if (inherits(object,  c("prey", "predeator")) invalids <- c(invalids, validate_predprey(object))
   
  # Define Return
  if (length(invalids)) invalids
  else TRUE
  
}


validate_predprey <- function(object) {
  invalids <- character(0)
  
  # Validate prey
  if (inherits(object, "prey") {
    wrong_hide <- !(object@hide >= 0 && object@hide <= 1)
    if (wrong_hide) invalids <- "Wrong <hide> for a prey. Must be element [0, 1]."
    
    # validate subclasses
    if (inherits(object,  c("mouse", "rabbit", "deer")) invalids <- c(invalids, validate_prey(object))
  }
  
  # Validate predeator    
  if (inherits(object, "predeator") {
    wrong_hide <- !(object@hide >= 0 && object@hide <= 1)
    if (wrong_hide) invalids <- "Wrong <seek> for a predeator. Must be element [0, 1]."
  }
  
  invalids
}


# * Unterklassen:
#   * `mouse`: `weight`$\in[0.5, 1]$, `hide`$\in[0.6, 1]$
#   * `deer`: `weight`$\in[15, 30]$, `hide`$\in[0.2, 0.7]$
#   * `rabbit`: `weight`$\in[1, 5]$, `hide`$\in[0.3, 0.8]$






