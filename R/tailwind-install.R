tailwind_install <- function(force = FALSE) {
  if (!tailwind_installed() || force) {
    npm_install(
      "-D",
      glue("tailwindcss@latest"),
      glue("postcss@latest"),
      glue("autoprefixer@latest")
    )
  }
}

tailwind_installed <- function() {
  npm_installed(
    "tailwindcss",
    "postcss",
    "autoprefixer"
  )
}
