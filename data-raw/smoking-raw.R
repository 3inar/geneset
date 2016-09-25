library(geneset)

former_v_never <- c("LRRN3", "RASSF1", "METRNL", "TTC38", "MAL", "GNLY",
  "TSPAN7", "PILRA", "FRAT1", "TMEM184B", "CCL5", "C5AR2", "PTGDR", "MATK",
  "ADAM23", "STAT3", "LAT2", "PRDM9", "LEF1", "CLDND1", "REXO2", "B3GNT3",
  "HPS1", "DACT1", "PLAUR")

current_v_never <- c("LRRN3", "SASH1", "CLDND1", "PID1", "CLEC10A", "MAL",
  "PYHIN1", "CX3CR1", "GPR15", "TTC38", "PTGDR", "LEF1", "CDKN1C", "S1PR5",
  "MTSS1", "SAMD3", "LTB", "PASK", "FPR3", "FUCA1", "RHOC", "KLRF1", "OSBPL5",
  "FBXL16", "ABCB1")

gsnames <- c("Top 25, current smoker vs never smoker",
           "Top 25, former smoker vs never smoker")
gsdescriptions <- rep("http://dx.doi.org/10.1093/hmg/ddw288", 2)
gslist <- list(current_v_never, former_v_never)

smoking <- gset(gsnames, gsdescriptions, gslist)

devtools::use_data(smoking, overwrite=T)
