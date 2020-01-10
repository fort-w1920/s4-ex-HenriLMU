library(methods)

# Set animal Main Class

setClass("animal",
         slots = list(name = "character", weight = "numeric", female = "logical")
)

# Set prey and predeator inhereting from animal
setClass("prey",
         slots = list(hide = "numeric"),
         contains = "animal"
)

setClass("predeator",
         slots = list(seek = "numeric"),
         contains = "animal"
)


# Set mouse deer and rabbit inhereting from prey

setClass("mouse",
         slots = list(),
         contains = "prey"
)


setClass("rabbit",
         slots = list(),
         contains = "prey"
)

setClass("deer",
         slots = list(),
         contains = "prey"
)

# Set hawk and lynx inhereting from predeator

setClass("hawk",
         slots = list(),
         contains = "predeator"
)

setClass("lynx",
         slots = list(),
         contains = "predeator")

source("s4-animal-contructors.R")
source("s4-animal-meet-methods.R")
