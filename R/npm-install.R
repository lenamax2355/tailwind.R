#' @title NPM installation utilities
#'
#' @inheritParams npm
#' @param pkgs (arg) npm packages as character strings
#' @param ...  (arg) extra arguments to pass to [`processx::run`]
#'
#' @name npm_install
#' @family NPM Utilities
NULL

#' @describeIn npm_install Install packages
npm_install <- function(dir, pkgs, ...) {

  npm_run(
    dir  = dir,
    args = c("install", pkgs),
    spinner = TRUE,
    ...
  )

}

#' @describeIn npm_install List packages in a directory
npm_list <- function(dir, pkgs, ...) {

  try(
    npm_run(
      args = c("list", pkgs),
      dir = dir,
      ...
    ),
    silent = TRUE
  )

}

#' @describeIn npm_install Checks whether certain npm packages are installed
npm_installed <- function(dir, pkgs, ...) {

  results <- npm_list(dir, pkgs, ...)
  if (inherits(results, "try-error")) {
    FALSE
  } else {
    strings <- paste0("(\u2514|\u251c)\u2500(\u2500|\u252c) ", pkgs, "@")
    every(strings, grepl, x = results$stdout)
  }

}
