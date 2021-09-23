npm_install <- function(..., args = list()) {
  exec(
    npm_run,
    args = c("install", ...),
    !!!args
  )
}

npm_list <- function(..., args = list()) {
  try(exec(
    npm_run,
    args = c("list", ...),
    !!!args
  ))
}

npm_installed <- function(..., args = list()) {

  results <- npm_list(..., args = args)
  if (inherits(results, "try-error")) {
    FALSE
  } else {
    strings <- paste0("(└|├)─(─|┬) ", c(...), "@")
    every(strings, grepl, x = results$stdout)
  }

}
