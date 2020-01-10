# NOTE:
# Prototype included in default args, don't know how to solve this better

# To generate random names
source("makenames.R")

# Constructor for animals
animal <- function(name = make_name(sample(3:10,size = 1)), 
                   weight = runif(1, min = 0.5, max = 60),
                   female = sample(c(TRUE, FALSE), 1)) {
  
  weight <- as.double(weight)
  female <- as.logical(female)
  new("animal", name = name, weight = weight, female = female)
  
}
# Constructor for prey
prey <- function(name = make_name(sample(3:10,size = 1)),
                 weight = runif(1, min = 0.5, max = 30),
                 female = sample(c(TRUE, FALSE), 1),
                 hide = runif(1, min = 0, max = 1)) {
  
  weight <- as.double(weight)
  female <- as.logical(female)
  hide <- as.double(hide)
  new("prey", name = name, weight = weight, female = female, hide = hide)
  
}
# Constructor for Predeators
predeator <- function(name = make_name(sample(3:10,size = 1)),            
                      weight = runif(1, min = 3, max = 60),
                      female = sample(c(TRUE, FALSE), 1),
                      seek = runif(1, min = 0, max = 1)) {
  
  weight <- as.double(weight)
  female <- as.logical(female)
  seek <- as.double(seek)
  new("predeator", name = name, weight = weight, female = female, seek = seek)
  
}
# Constructor for mouses
mouse <- function(name = make_name(sample(3:10,size = 1)),
                  weight = runif(1, min = 0.5, max = 1),
                  female = sample(c(TRUE, FALSE), 1),
                  hide = runif(1, min = 0.6, max = 1)) {
  
  weight <- as.double(weight)
  female <- as.logical(female)
  hide <- as.double(hide)
  new("mouse", name = name, weight = weight, female = female, hide = hide)
  
}
# Constructor for rabbits
rabbit <- function(name = make_name(sample(3:10,size = 1)),
                   weight = runif(1, min = 1, max = 5),
                   female = sample(c(TRUE, FALSE), 1),
                   hide = runif(1, min = 0.3, max = 1)) {
  
  weight <- as.double(weight)
  female <- as.logical(female)
  hide <- as.double(hide)
  new("rabbit", name = name, weight = weight, female = female, hide = hide)
  
}
# Constructor for deers
deer <- function(name = make_name(sample(3:10,size = 1)),
                 weight = runif(1, min = 15, max = 30),
                 female = sample(c(TRUE, FALSE), 1),
                 hide = runif(1, min = 0.2, max = 0.7)) {
  
  weight <- as.double(weight)
  female <- as.logical(female)
  hide <- as.double(hide)
  new("deer", name = name, weight = weight, female = female, hide = hide)
  
}
# Constructor for hawks
hawk <- function(name = make_name(sample(3:10,size = 1)),
                 weight = runif(1, min = 3, max = 8),
                 female = sample(c(TRUE, FALSE), 1),
                 seek = runif(1, min = 0.6, max = 1)) {
  
  weight <- as.double(weight)
  female <- as.logical(female)
  seek <- as.double(seek)
  new("hawk", name = name, weight = weight, female = female, seek = seek)
  
}
# Constructor for Predeators
lynx <- function(name = make_name(sample(3:10,size = 1)),
                 weight = runif(1, min = 20, max = 60),
                 female = sample(c(TRUE, FALSE), 1),
                 seek = runif(1, min = 0.5, max = 0.9)) {
  
  weight <- as.double(weight)
  female <- as.logical(female)
  seek <- as.double(seek)
  new("lynx", name = name, weight = weight, female = female, seek = seek)
  
}

source("s4-animal-validiator.R")
source("s4-animal-getset-methods.R")