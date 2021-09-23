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

tailwind <- function(content,
                     output_file = "tailwind.css",
                     working_dir = getwd()) {

  assert_character(content, min.len = 1L)
  assert_string(output_file)

  if (!tailwind_installed()) {
    stop("Please install tailwind with tailwind_install() first.")
  }

  npm_copy(
    pkg_inst("templates", "postcss.config.js"),
    "postcss.config.js"
  )

  npm_template(
    pkg_inst("templates", "tailwind.config.js"),
    "tailwind.config.js",
    content = paste0(
      paste0("'", path_abs(path(working_dir, content)), "'"),
      collapse = ",\n"
    )
  )

  npm_copy(
    pkg_inst("templates", "tailwind.css"),
    "tailwind.css"
  )

  npx_run(
    args = c(
      "tailwindcss", "-o",
      path_abs(path(working_dir, output_file))
    )
  )

}
