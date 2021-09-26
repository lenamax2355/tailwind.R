#' @title Tailwind Demonstration
#'
#' @description
#' This is a demonstration of an app that is built using the Tailwind CSS
#' JIT compiler.
#'
#' @export
tailwind_demo <- function() {

  html_tags(
    tailwind_assets(),
    head(title("Tailwind CSS Demo")),
    div(
      class = "flex items-center justify-center py-8 px-4",
      div(
        class = "
          max-w-sm w-full rounded-lg shadow-lg
          md:p-8 p-5 bg-white
        ",
        tailwind_demo_header(),
        tailwind_demo_calendar()
      )
    )
  )

}

#' @rdname tailwind_demo
tailwind_demo_browse <- function() {

  htmltools::browsable(tailwind_demo())

}

tailwind_demo_header <- function() {

  html_tags(
    div(
      class = "pr-4 flex items-center justify-between leading-8",
      h1(
        class = "cursor-pointer text-base font-medium text-gray-800",
        "October 2020"
      ),
      div(
        class = "flex items-center text-xl",
        button(
          class = "ml-3 text-gray-800 hover:text-gray-400",
          HTML("&#8592;")
        ),
        button(
          class = "ml-3 text-gray-800 hover:text-gray-400",
          HTML("&#8594;")
        )
      )
    )
  )

}

tailwind_demo_calendar <- function() {

  html_tags(div(
    class = "flex items-center justify-between pt-8 overflow-x-auto",
    table(
      class = "w-full",
      tailwind_demo_calendar_header(),
      tailwind_demo_calendar_row(c(" ", " ", " ", "1", "2", "3", "4")),
      tailwind_demo_calendar_row(as.character(5:11), "8"),
      tailwind_demo_calendar_row(as.character(12:18)),
      tailwind_demo_calendar_row(as.character(19:25)),
      tailwind_demo_calendar_row(c("26", "27", "28", "29", "30", "", ""))
    )
  ))

}

tailwind_demo_calendar_header <- function() {

  html_tags(thead(do.call(
    tr,
    lapply(
      c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
      function(day) {
        th(
          div(
            class = "w-full flex justify-center",
            p(
              class = "text-base font-medium text-center text-gray-800",
              day
            )
          )
        )
      }
    )
  )))

}

tailwind_demo_calendar_row <- function(icons, selected = NULL) {

  assert_character(icons, len = 7)
  assert_choice(selected, icons, null.ok = TRUE)

  html_tags(tbody(
    class = "pt-6",
    do.call(tr, lapply(icons, function(icon_text) {
      tailwind_demo_calendar_icon(icon_text, icon_text %in% selected)
    }))
  ))

}

tailwind_demo_calendar_icon <- function(icon_text, selected = FALSE) {

  if (selected) {
    html_tags(
      td(div(
        class = "w-full h-full",
        div(
          class = "
            flex items-center justify-center w-full rounded-full
            cursor-pointer
          ",
          div(
            class = "
              focus:outline-none  focus:ring-2 focus:ring-offset-2
              focus:ring-indigo-700 focus:bg-indigo-500 hover:bg-indigo-500
              text-base w-8 h-8 flex items-center justify-center font-medium
              text-white bg-indigo-700 rounded-full
            ",
            icon_text
          )
        )
      ))
    )
  } else {
    html_tags(
      td(div(
        class = "px-2 py-2 cursor-pointer flex w-full justify-center",
        icon_text
      ))
    )
  }

}
