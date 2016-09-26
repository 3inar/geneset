library(geneset)
library(plyr)

test <- load_gmt("data-raw/raw-files/stress_sets.txt")
cleaned <- llply(test$genesets, function(x) {
  subset(x, x != "")
})

test$genesets <- cleaned
stress <- test

devtools::use_data(stress, overwrite=T)
