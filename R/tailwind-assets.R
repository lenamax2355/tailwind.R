#' @title Tailwind CSS assets
#'
#' @description
#' Include this in `{htmltools}` tags to include the rendered Tailwind CSS
#' file in the current page so that it can be used.
#'
#' @inheritParams tailwind_build
#' @param build (flg) whether to build the tailwind CSS file; default is FALSE
#'                    if `prod == TRUE`, and TRUE if `prod == FALSE`
#' @param prod  (flg) whether this inclusion is in production
#' @param vers  (flg) version of the tailwind dependency, defaults to the
#'                    hash digest of the current time
#'
#' @family Tailwind CSS
#' @export
tailwind_assets <- function(
  input  = pkg_inst("tailwind", "tailwind.css"),
  config = pkg_inst("tailwind", "tailwind.config.js"),
  output = pkg_inst("tailwind", "dist", "tailwind.css"),
  prod   = FALSE,
  vers   = NULL,
  build  = !prod
) {

  assert_flag(build)
  if (build) tailwind_build(input  = input,
                            config = config,
                            output = output,
                            prod   = prod)

  htmlDependency(
    name    = if (prod) "tailwindcss" else
      paste0("tailwindcss-", format(Sys.time(), format = "%Y%m%d%H%M%S")),
    version = vers %||% pkg_vers(),
    src     = path_dir(output),
    stylesheet = path_file(output),
    all_files  = FALSE
  )

}
