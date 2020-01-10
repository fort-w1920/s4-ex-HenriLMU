# define Generic
setGeneric("meet", function(animal1, animal2) standardGeneric("meet"))
# meet Method
setMethod("meet", "animal", function(animal1, animal2) {
  
  events <- c("ignore each other\n", 
              "sniff each others' butts\n", 
              "make sweet, sweet love\n", 
              "fight for territory\n")
  
  for (i in 1:4) {
    events[i] <- paste0(is(animal1)[1], " '", animal1@name, "' & ", 
                       is(animal2)[1], " '", animal2@name, "' ", events[i] )
  }
  events
})
# prey meet prey
setMethod("meet", signature = c(animal1 = "prey", animal2 = "prey"), function(animal1, animal2) {
  if (identical(animal1, animal2)) return(meetyourego(animal1, animal2))
  # Explore relationship between preys and add probabilities
  if (identical(is(animal1)[1], is(animal2)[1]))  prob <- c(0.25, 0.25, 0.5, 0)
  else prob <- c(0.5, 0.5, 0, 0)
  sample(callNextMethod(), size = 1, prob = prob)
})

# pred meets pred
setMethod("meet", signature = c(animal1 = "predeator", animal2 = "predeator"), function(animal1, animal2) {
  if (identical(animal1, animal2)) return(meetyourego(animal1, animal2))
  #Explore relationship between preds and add probabilities
  if (identical(is(animal1)[1], is(animal2)[1])) prob <- c(0, 0, 0.5, 0.5)
  else prob <- c(1/3, 1/3, 0, 1/3)
  sample(callNextMethod(), size = 1, prob = prob)
})


# prey meets pred
setMethod("meet", signature = c("prey", "predeator"), function(animal1, animal2){
 # if prey is not suitble pred
 if (meetandeat(pred = animal2, prey = animal1) == TRUE) sample(callNextMethod(), size = 1, prob = c(0.5, 0.5, 0, 0))
 else meetandeat(pred = animal2, prey = animal1)
})

setMethod("meet", signature = c("predeator", "prey"), function(animal1, animal2){
  # if prey is not suitble pred
  if (meetandeat(pred = animal1, prey = animal2) == TRUE) sample(callNextMethod(), size = 1, prob = c(0.5, 0.5, 0, 0))
  else meetandeat(pred = animal1, prey = animal2)
})

# meetandeat funuction for prey meets pred
meetandeat <- function(pred, prey) {
  #Explore weight relations and add cum probabilities
  wrong_weight <- validate_numeric(weight(prey), start = 0.05 *  weight(pred), 
                                   end = 0.7 * weight(pred), class = "prey")
  # If Prey is dinner for the pred
  if (!length(wrong_weight)) {
    events <- c(paste0(is(pred)[1], " '", pred@name, "' kills and eats ", 
                       is(prey)[1],  " '", prey@name, "'\n"),
                paste0(is(prey)[1], " '", prey@name, "' escapes from ", 
                       is(pred)[1],  " '", pred@name, "'\n"))
    
    kill_prob <- min(1, max(0, 0.6 + pred@seek - prey@hide))
    
    sample(events, size = 1, prob = c(kill_prob, 1 - kill_prob))
  } else TRUE
   
}

# For animals meeting themselfes 
meetyourego <- function(animal1, animal2) {
# Special exception, if one meets itself
paste0(is(animal1)[1], " '", animal1@name, 
       "' gazes at ", ifelse(animal1@female, "her", "his"),
       "  reflection in a puddle" )
}
