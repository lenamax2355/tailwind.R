#' @title Run Tailwind Commands
#'
#' @description
#' After `tailwind_install()`, you can run tailwind commands arbitrarily using
#' `tailwind_run`.
#'
#' @param ... (arg) passed to [processx::run]
#'
#' @export
tailwind_run <- function(...) {

  invisible(
    run(
      command = assert_file_exists(tailwind_bin()),
      ...,
      spinner = TRUE,
      echo_cmd = TRUE,
      echo = TRUE
    )
  )

}

tailwind_bin <- function() {
  path(tailwind_dir(), "node_modules", ".bin", "tailwindcss")
}
