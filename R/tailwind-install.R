#' @title Install Tailwind CSS
#'
#' @description
#' Installs the template tailwind css npm directory into a specific directory
#' that can then be operated by other functions in this package.
#'
#' To configure the tailwind settings after installation, you should edit
#' the tailwind files themselves and refer to the
#' [Tailwind Docs](https://tailwindcss.com/docs).
#'
#' Use `tailwind_installed()` to check a directory for an installation.
#'
#' @family Tailwind CSS
#' @export
tailwind_install <- function() {

  npm_install(dir_create(tailwind_dir()), tailwind_pkgs())
  invisible(NULL)

}

#' @rdname tailwind_install
#' @export
tailwind_installed <- function() {

  npm_installed(tailwind_dir(), tailwind_pkgs())

}

tailwind_dir <- function() pkg_user("tailwind")

tailwind_pkgs <- function() c("tailwindcss", "postcss", "autoprefixer")
