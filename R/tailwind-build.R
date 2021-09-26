#' @title Build Tailwind CSS
#'
#' @description
#' Builds the Tailwind CSS file based on the configuration in `dir`. It's
#' recommended that you use JIT mode when running `tailwind_install()` to make
#' this process faster.
#'
#' @param input  (pth) path to the input css file with tailwind directives
#' @param config (pth) path to the config js file that dictates rendering
#' @param output (pth) path to the output css file that can be linked
#' @param prod   (flg) to render production build vs development
#'
#' @export
tailwind_build <- function(
  input  = pkg_inst("tailwind", "tailwind.css"),
  config = pkg_inst("tailwind", "tailwind.config.js"),
  output = pkg_inst("tailwind", "dist", "tailwind.css"),
  prod   = FALSE
) {

  assert_file_exists(input)
  assert_file_exists(config)
  assert_directory_exists(path_dir(output))
  assert_flag(prod)

  tailwind_run(
    args = c(
      "-i", path_abs(input),
      "-c", path_abs(config),
      "-o", path_abs(output)
    ),
    env = c(
      "current",
      NODE_ENV = if (prod) "production",
      SRC_DIR  = here()
    )
  )

  invisible(NULL)

}
