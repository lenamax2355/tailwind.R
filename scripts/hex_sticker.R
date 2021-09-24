library(hexSticker)
library(usethis)

logo_location <- "inst/img/logo.png"

sticker(
  subplot = grid::rasterGrob(
    png::readPNG("inst/img/tailwind.png"),
    interpolate = TRUE
  ),
  package  = "tailwind.R",
  filename = logo_location,
  p_size   = 20,
  s_width  = 10,
  s_height = 0.75,
  s_x      = 1,
  p_color  = "#16BECB",
  h_color  = "#16BECB",
  h_fill   = "#161D2D"
)

file.remove("man/figures/logo.png")
use_logo(logo_location)
