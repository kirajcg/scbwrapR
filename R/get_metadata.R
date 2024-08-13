#' Title
#'
#' @param lang
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
get_metadata <- function(lang = 'en', ...) {
  url <- paste(
    'https://api.scb.se/OV0104/v1/doris',
    lang,
    'ssd',
    ...,
    sep='/'
  )
  req <- httr2::request(url)
  resp <- req |> httr2::req_perform()
  resp_json <- resp |> httr2::resp_body_json()
  return(as.data.frame(do.call(rbind, resp_json)))
}
