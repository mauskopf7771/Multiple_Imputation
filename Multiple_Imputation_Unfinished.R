library(readxl)
Nicky_G_MI <- read_excel("Nicky_G_MI.xlsx")
View(Nicky_G_MI)

percentmiss = function(x) { sum(is,na(x)) / length(x) * 100}

apply(notypos [ ,2, percentmiss])

missing = apply(notypos, 1, percentmiss)
summary(mising)
#table(missing)

