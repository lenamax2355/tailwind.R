#' @title Tailwind CSS Configuration
#'
#' @param purge      ([`tailwind_purge()`]) instance
#' @param dark_mode  (str) how dark mode is applied:
#'                         * false - don't apply
#'                         * media - ???
#'                         * class - ???
#' @param theme      ([`tailwind_theme()`]) instance
#' @param variants   ([`tailwind_variants()`]) instance
#' @param plugins    ([`tailwind_plugins()`]) instance
#'
#' @export
tailwind_config <- function(purge     = tailwind_purge(),
                            dark_mode = c("false", "media", "class"),
                            theme     = tailwind_theme(),
                            variants  = tailwind_variants(),
                            plugins   = tailwind_plugins()) {

  dark_mode <- match_arg(dark_mode) %||% "false"
  if (dark_mode == "false") dark_mode <- FALSE

  list(
    purge     = purge,
    dark_mode = dark_mode,
    theme     = theme,
    variants  = variants,
    plugins   = plugins
  ) %>%
    add_class("tailwind_config")

}

#' @describeIn tailwind_config Purge settings (tree-shaking unused classes)
#'
#' @param enabled  (flg) whether or not the purge is enabled; disable for dev
#' @param content  (chr) paths that will be scanned for the relevant classes
#' @param safelist (chr) classes accidentally removed from rendered CSS
#'
#' @export
tailwind_purge <- function(enabled  = TRUE,
                           content  = character(),
                           safelist = character()) {

  named_list(
    enabled  = assert_flag(enabled),
    content  = assert_character(content),
    safelist = assert_character(safelist)
  ) %>%
    add_class("tailwind_purge")

}

tailwind_theme <- function(colors = NULL) {



  named_list() %>%
    add_class("tailwind_theme")

}

tailwind_variants <- function() {

  named_list() %>%
    add_class("tailwind_variants")

}

tailwind_plugins <- function() {

  list() %>%
    add_class("tailwind_plugins")

}
