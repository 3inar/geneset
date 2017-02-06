# immunological blood sets from msigdb
library(geneset)

immunological <- load_gmt("data-raw/raw-files/immuno_blood.gmt")

devtools::use_data(immunological, overwrite=T)
