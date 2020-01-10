# Validate Objects of class animal
setValidity("animal", function(object) {
  
  invalids <- character(0)
  no_name <- nchar(object@name) == 0
  wrong_weight <- object@weight <= 0
  if (is.na(object@weight))  wrong_weight <- TRUE
  
  if (no_name) invalids <- "No <name> provided."
  if (wrong_weight) invalids <- c(invalids, " <weight> must be higher than zero")
  
  
  if (length(invalids)) invalids else TRUE
  
  
})

# Validate Objects of class prey
setValidity("prey", function(object) {
  
  invalids <- character(0)
  invalids <- validate_numeric(object@hide, class = "prey",
                               start = 0, end = 1)
  
  
  if (length(invalids)) invalids else TRUE
  
  
})

# Validate Objects of class predeator
setValidity("predeator", function(object) {
  
  invalids <- character(0)
  invalids <- validate_numeric(object@seek, class = "predeator",
                               start = 0, end = 1)
  
  
  if (length(invalids)) invalids else TRUE
  
  
})

# Validate Objects of class mouse, deer, rabbit
# # * Unterklassen:
# #   * `mouse`: `weight`$\in[0.5, 1]$, `hide`$\in[0.6, 1]$
setValidity("mouse", function(object) {
  
  invalids <- character(0)
  invalids <- validate_numeric(object@hide, class = "mouse",
                               start = 0.6, end = 1)
  invalids <- c(invalids, validate_numeric(object@weight, class = "mouse", 
                                           start = 0.5, end = 1))
  
  if (length(invalids)) invalids else TRUE

})
# #   * `deer`: `weight`$\in[15, 30]$, `hide`$\in[0.2, 0.7]$
setValidity("deer", function(object) {
  
  invalids <- character(0)
  invalids <- validate_numeric(object@hide, class = "deer",
                               start = 0.2, end = 0.7)
  invalids <- c(invalids, validate_numeric(object@weight, class = "deer", 
                                           start = 15, end = 30))
  
  if (length(invalids)) invalids else TRUE
  
})
# #   * `rabbit`: `weight`$\in[1, 5]$, `hide`$\in[0.3, 0.8]$
setValidity("rabbit", function(object) {
  
  invalids <- character(0)
  invalids <- validate_numeric(object@hide, class = "rabbit",
                               start = 0.3, end = 0.8)
  invalids <- c(invalids, validate_numeric(object@weight, class = "rabbit", 
                                           start = 1, end = 5))
  
  if (length(invalids)) invalids else TRUE
  
})

# Validate Objects of class hawk, lynx
# # * Unterklassen:
# #   * `hawk`: `weight`$\in[3, 8]$, `seek`$\in[0.6, 1]$
setValidity("hawk", function(object) {
  
  invalids <- character(0)
  invalids <- validate_numeric(object@seek, class = "hawk",
                               start = 0.6, end = 1)
  invalids <- c(invalids, validate_numeric(object@weight, class = "hawk", 
                                           start = 3, end = 8))
  
  if (length(invalids)) invalids else TRUE
  
})
# #   * `lynx`: `weight`$\in[20, 60]$, `seek`$\in[0.5, 0.9]$ 
setValidity("lynx", function(object) {
  
  invalids <- character(0)
  invalids <- validate_numeric(object@seek, class = "lynx",
                               start = 0.5, end = 0.9)
  invalids <- c(invalids, validate_numeric(object@weight, class = "hawk", 
                                           start = 20, end = 60))
  
  if (length(invalids)) invalids else TRUE
  
})





# function the determine if a given value is in an specified intervall
validate_numeric <- function(slot, class, start = -Inf, end = Inf) {

  wrong_slot <- !(slot >= start && slot <= end)
  
  if (wrong_slot) {
    # get string for object and slot to generate a invalids message
    char_slot <- deparse(substitute(slot))
    slot_str <- stringr::str_extract(char_slot, "(?<=@).*")
    
    invalids <- paste0("Wrong <", slot_str, "> for a ", class, " must be element [",
                                  start, ", ", end, "].")
  } else invalids <- character(0)
  
  invalids
}

