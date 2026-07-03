library(shiny)
library(plotly)
library(DT)
library(dplyr)

# Absolute path to the project root, so this works the same whether you
# Ctrl+Enter individual lines, Source() the file, or click "Run App" -
# unlike a relative path or an rstudioapi-based setwd(), it doesn't depend
# on the working directory or which editor tab happens to be focused.
# project_root <- "/mnt/WD4/Dropbox/Documents/workspace/code/worldbankmodular"

load(file = file.path(project_root, "data", "mfi.rda"))
load(file = file.path(project_root, "data", "mfi_population.rda"))
load(file = file.path(project_root, "data", "country_code.rda"))

options(scipen = 999)

font_style <- list(size = 20, color = "gray25", weight = "bold")

format_bignum <- function(n) {
  dplyr::case_when(
    n >= 1e12 ~ paste(round(n / 1e12), "Tn"),
    n >= 1e9 ~ paste(round(n / 1e9), "Bn"),
    n >= 1e6 ~ paste(round(n / 1e6), "M"),
    n >= 1e3 ~ paste(round(n / 1e3), "K"),
    TRUE ~ as.character(n)
  )
}

# pure plot functions + shiny modules, one file per tab
invisible(lapply(list.files(file.path(project_root, "R"), pattern = "\\.R$", full.names = TRUE), source))
