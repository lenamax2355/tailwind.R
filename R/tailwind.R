#' @title Generate Tailwind CSS file
#'
#' @param config      ([`turbo_config()`]) instance governing this render
#' @param output_file (path) to save the rendered css file
#' @param input_file  (path) to an input CSS file. If NULL just renders the
#'                           default CSS files with default directives.
#' @param working_dir (path) get the working directory
#'
#' @export
tailwind <- function(config      = tailwind_config(),
                     input_file  = NULL,
                     output_file = "tailwind.css",
                     working_dir = getwd()) {

  assert_class(config, "tailwind_config")
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
    config = tailwind_json(config)
  )

  npm_template(
    pkg_inst("templates", "tailwind.css"),
    "tailwind.css",
    extra = if (!is.null(input_file)) read_file(input_file)
  )

  npx_run(
    args = c(
      "tailwindcss", "-o",
      path_abs(path(working_dir, output_file))
    )
  )

}
