named_list <- function(...) {
  value <- list(...)
  if (length(value) > 0) {
    value
  } else {
    set_names(list(...), character(0))
  }
}

add_class <- function(obj, ...) {

  set_class(obj, union(c(...), class(obj)))

}

match_arg <- function(arg, assert = TRUE) {

  if (is.null(arg)) return(NULL)
  sys_parent <- sys.parent()
  formal_args <- formals(sys.function(sys_parent))
  choices <- eval(formal_args[[as.character(substitute(arg))]],
                  envir = sys.frame(sys_parent))

  if (length(arg) > 1 || identical(arg, choices)) {
    NULL
  } else {
    if (assert) assert_choice(arg, choices)
    arg
  }

}

tailwind_json <- function(x, auto_unbox = TRUE, pretty = TRUE, ...) {

  if (!is.null(names(x))) names(x) <- to_lower_camel_case(names(x))
  toJSON(x, auto_unbox = auto_unbox, pretty = pretty, ...)

}
