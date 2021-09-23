npm_run <- function(...) {

  assert_true(Sys.which("npm") != "")
  dir_create(pkg_user("npm"))
  run(
    command = "npm",
    echo_cmd = TRUE,
    echo = TRUE,
    ...,
    wd = pkg_user("npm")
  )

}

npx_run <- function(...) {

  assert_true(Sys.which("npx") != "")
  dir_create(pkg_user("npm"))
  run(
    command = "npx",
    echo_cmd = TRUE,
    echo = TRUE,
    ...,
    wd = pkg_user("npm")
  )

}

npm_copy <- function(file, path, overwrite = TRUE) {

  dir_create(pkg_user("npm"))
  file_copy(file, pkg_user("npm", path), overwrite = overwrite)

}

npm_template <- function(file, path, ..., text = NULL) {

  dir_create(pkg_user("npm"))
  write_file(
    whisker.render(
      text %||% read_file(file),
      data = list(...)
    ),
    pkg_user("npm", path)
  )

}
