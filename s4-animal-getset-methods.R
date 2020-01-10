##### Getter ####
# Get name
setGeneric("name", function(x) standardGeneric("name"))
setMethod("name", "animal", function(x) x@name)
# Get weight
setGeneric("weight", function(x) standardGeneric("weight"))
setMethod("weight", "animal", function(x) x@weight)
# Get female
setGeneric("female", function(x) standardGeneric("female"))
setMethod("female", "animal", function(x) x@female)

# for predeators: Get seek
setGeneric("seek", function(x) standardGeneric("seek"))
setMethod("seek", "predeator", function(x) x@seek)
# for predeators: Get hide
setGeneric("hide", function(x) standardGeneric("hide"))
setMethod("hide", "prey", function(x) x@hide)

# # Test
# a <- new("lynx")
# name(a)
# weight(a)
# female(a)
# seek(a)

#### Setter ####
# Set name
setGeneric("name<-", function(x, value) standardGeneric("name<-"))
setMethod("name<-", "animal", function(x, value) {
  x@name <- value
  validObject(x)
  x
})
# Set weight
setGeneric("weight<-", function(x, value) standardGeneric("weight<-"))
setMethod("weight<-", "animal", function(x, value) {
  x@weight <- value
  validObject(x)
  x
})
# Set female
setGeneric("female<-", function(x, value) standardGeneric("female<-"))
setMethod("female<-", "animal", function(x, value) {
  x@female <- value
  validObject(x)
  x
})
# for predeators: Set seek
setGeneric("seek<-", function(x, value) standardGeneric("seek<-"))
setMethod("seek<-", "predeator", function(x, value) {
  x@seek <- value
  validObject(x)
  x
})
# for prey: Set hide
setGeneric("hide<-", function(x, value) standardGeneric("hide<-"))
setMethod("hide<-", "prey", function(x, value) {
  x@hide <- value
  validObject(x)
  x
})

# Set method show 
# Predeator
setMethod("show", "predeator", function(object) {
  cat(is(object)[[1]], " '", object@name, "' (", ifelse(object@female == TRUE, "f", "m"), ")", "\n",
      "     weight: ", object@weight, "\n",
      "     seek:   ", object@seek, "\n",
      sep = ""
  )
})
# Prey
setMethod("show", "prey", function(object) {
  cat(is(object)[[1]], " '", object@name, "' (", ifelse(object@female == TRUE, "f", "m"), ")", "\n",
      "     weight: ", object@weight, "\n",
      "     hide:   ", object@hide, "\n",
      sep = ""
  )
})
