#' Unnest R calls
#'
#' @param x an R call or list of R calls
#'
#' @return a tibble of the unnested R calls with three columns: `line`: the line number of the call
#'  (if a list was supplied), `names`: the name of the function called, `args`: a list of arguments
#' @export
#'
#' @examples
#' matahari::dance_start()
#' m <- lm(mpg ~ cyl, mtcars)
#' matahari::dance_stop()
#' expr <- matahari::dance_tbl()$expr
#' unnest_calls(expr)
#' matahari::dance_remove()
unnest_calls <- function(x) {
  if (is.list(x)) {
    m <- purrr::map(x, unnest_calls)
    t <- dplyr::bind_rows(m, .id = "line") # TODO I hate having a dplyr dependency :(
    t$line <- as.numeric(t$line)
  }
  if (is.call(x)) {
  t <- tibble::tibble(names = ls_fun_calls(x),
                 args = ls_fun_args(x))
  }
  if (is.name(x)) {
  t <- tibble::tibble(names = as.character(x),
                   args = list(character(0)))
  }
  return(t)
}