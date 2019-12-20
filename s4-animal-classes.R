library(methods)



#   * Unterklasse  `predator` (Raubtier):
#   * mit Attribut `seek` zwischen 0 und 1 das angibt wie gut sie Beute aufspüren und verfolgen können.
# * Unterklassen:
#   * `hawk`: `weight`$\in[3, 8]$, `seek`$\in[0.6, 1]$
#   * `lynx`: `weight`$\in[20, 60]$, `seek`$\in[0.5, 0.9]$ 
#   
#   Schreiben Sie entsprechende Konstruktorfunktionen `mouse()`, `hawk()`, etc... 
#   für Objekte aus den Klassen, die nicht übergebene Attributwerte zufällig aus 
#   den oben angebenen Intervallen ziehen. Überprüfen Sie alle Aspekte Ihrer Implementation
#   mit Testfällen wie den folgenden:

# * `animal`: 
#   * haben einen `name`
# * ein numerisches `weight`
# * sind `female` oder nicht.
setClass("animal",
         slots = list(name = "character", weight = "numeric", female = "logical"),
         prototype = list(name = "Xoxo", weight = 120, female = TRUE),
         validity = function(object) {
            invalids <- character(0)
            no_name <- nchar(object@name) == 0
            wrong_weight <- object@weight <= 0
           if (no_name) invalids <- "No <name> provided."
           if (wrong_weight) invalids <- c(invalids, "\n", "Please stop lying about your <weight>.")
           if (length(invalids)) invalids else TRUE
         }
)

# * Unterklasse `prey` (Beutetiere) 
# * mit Attribut `hide` zwischen 0 und 1 das angibt wie gut sie sich verstecken bzw. weglaufen können.
setClass("prey",
         slots = list(hide = "numeric"),
         contains = "animal",
         prototype = list(
           name = "Toto", weight = 12, female = FALSE, hide = 0.5
         ),
         validity = function(object) {
           invalids <- character(0)
           wrong_hide <- !(object@hide >= 0 && object@hide <= 1)
           if (wrong_hide) invalids <- "Wrong <hide> for a prey. Must be element [0, 1]."
           if (length(invalids)) invalids else TRUE
         })

# * Unterklassen:
#   * `mouse`: `weight`$\in[0.5, 1]$, `hide`$\in[0.6, 1]$
#   * `deer`: `weight`$\in[15, 30]$, `hide`$\in[0.2, 0.7]$
setClass("mouse",
         slots = list(),
         contains = "prey",
         prototype = list(
           name = "Momo", weight = 0.75, female = FALSE, hide = 0.8
         ),
         validity = function(object) {
           invalids <- character(0)
           wrong_weight <- !(object@weight >= 0.5 && object@weight <= 1)
           wrong_hide <- !(object@hide >= 0.6 && object@hide <= 1)
           if (wrong_weight) invalids <- "Wrong <weight> for a prey. Must be element [0.5, 1]."
           if (wrong_hide) invalids <- c(invalids, "\n", 
                                         "Wrong <hide> for a prey. Must be element [0.6, 1].")
           if (length(invalids)) invalids else TRUE
         })
#   * `rabbit`: `weight`$\in[1, 5]$, `hide`$\in[0.3, 0.8]$
setClass("rabbit",
         slots = list(),
         contains = "prey",
         prototype = list(
           name = "Hoho", weight = 0.75, female = FALSE, hide = 0.8
         ),
         validity = function(object) {
           invalids <- character(0)
           wrong_weight <- !(object@weight >= 0.5 && object@weight <= 1)
           if (wrong_weight) invalids <- "Wrong <weight> for a prey. Must be element [0.5, 1]."
           
           if (length(invalids)) invalids else TRUE
         })