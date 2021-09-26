#' @title
#' NPM Utilities
#'
#' @description
#' Utiltiies to deal with `npm` and its attached technologies.
#'
#' @param dir (dir) npm directory
#' @param ... (arg) arguments to passed to [`processx::run`]
#'
#' @family NPM Utilities
#' @name npm
NULL

#' @describeIn npm `npm run` helper
#' @export
npm_run <- function(dir, ...) {

  run(
    command = "npm",
    echo_cmd = TRUE,
    echo = TRUE,
    ...,
    wd = dir
  )

}

#' @describeIn npm `npx run` helper
#' @export
npx_run <- function(dir, ...) {

  run(
    command = "npx",
    echo_cmd = TRUE,
    echo = TRUE,
    ...,
    wd = dir
  )

}
