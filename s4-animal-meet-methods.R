# meet Method
setMethod("meet", "animal", function(animal1, animal2) {
  
  events <- c("ignore each other", 
              "sniff each others' butts", 
              "make sweet, sweet love", 
              "fight for territory",
              "kills and eats", 
              "escapes from")
  
  
  # Explore the relationship between animal 1 and 2
  prey_count <- is(animal1, "prey") + is(animal2, "prey")
  # Assign the rigth function to each relationship
  if (prey_count == 0) prob <- predmeetspred(animal1, animal2)
  if (prey_count == 1) prob <- preymeetspred(animal1, animal2)
  else prob <- preymeetsprey(animal1, animal2)
  
})

# Add Propabilities of events to animals meeting 
preymeetsprey <- function(animal1, animal2){
  #Explore relationship between preys and add cum probabilities
  if (identical(is(animal1)[1], is(animal2)[1])) return(c(0.25, 0.25, 0.5, 0, 0, 0))
  else c(0.5, 0.5, 0, 0, 0, 0)
}
predmeetspred <- function(animal1, animal2){
  #Explore relationship between preds and add cum probabilities
  if (identical(is(animal1)[1], is(animal2)[1])) return(c(0, 0, 0.5, 0.5, 0, 0))
  else c(1/3, 1/3, 1/3, 0, 0, 0)
}
preymeetspred <- function(animal1, animal2){
  # Sort pred and prey in a way, that animal1 is alway prey
  if (is(animal1, "predeator")) {
    pred <- animal1
    prey <- animal2
  } else{
    prey <- animal1
    pred <- animal2
  }
  
  #Explore weight relations and add cum probabilities
  
  
  
  
}