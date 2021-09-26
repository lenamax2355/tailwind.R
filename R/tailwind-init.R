#' @title
#' Initialize Tailwind Configs
#'
#' @description
#' The R package will store the PostCSS config, the Tailwind Config, and
#' the source directory within the project, while keeping the node machinery
#' outside of the package. This initializes those configs so that you can
#' run `tailwind_build()` easier.
#'
#' @param dir       (pth) where the config files will be stored.
#' @param jit_mode  (flg) enable TailwindCSS jit mode
#' @param overwrite (flg) whether or not to overwrite
#'
#' @export
tailwind_init <- function(dir = pkg_inst("tailwind"),
                          jit_mode  = TRUE,
                          overwrite = FALSE) {

  dir_create(dir)
  assert_flag(jit_mode)
  assert_flag(overwrite)
  template_dir <- pkg_inst("templates", "tailwind")

  # tailwind.config.js
  tailwind_config_path <- path(dir, "tailwind.config.js")
  if (!overwrite) assert_false(file_exists(tailwind_config_path))
  write_file(
    whisker.render(
      read_file(path(template_dir, "tailwind.config.js")),
      data = list(
        jit_mode = if (jit_mode) "mode: 'jit'," else NULL
      )
    ),
    tailwind_config_path
  )

  # tailwind.css
  file_copy(
    path(template_dir, "tailwind.css"),
    path(dir, "tailwind.css"),
    overwrite = overwrite
  )

  # dist folder
  dir_create(path(dir, "dist"))

  invisible(TRUE)

}
