#' Get the DNA (ISIN and Market identifier) of a ticker from the ETFs list
#'
#' This function checks if the provided ticker is present in the specified columns of the ETFs list. If the ticker is found in the ETFs list, the function returns the DNA (ISIN and Market identifier) of the corresponding ticker. Otherwise, it returns 'Ticker not found'.
#'
#' @family ISIN Retrieval
#' @family Infos Retrieval
#'
#' @seealso \code{\link{EN_GetISIN}} to get DNA of a giving Company or Index Ticker/Name/ISIN (Fund, Bond, and ETF are excluded), \code{\link{EN_Etfs_List}} to get the list of ETFs quoted on Euronext, \code{\link{EN_GetISIN_B}} to get a giving Bond DNA, \code{\link{EN_GetISIN_F}} to get a giving Fund DNA.
#'
#' @param ticker The ticker to search for.
#'
#' @return A character
#'
#' @examples
#'
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#'
#' the_dna = EN_GetISIN_Etf("AAPL")
#' sub("-.*", "", the_dna) #To get only the ISIN
#'
#' # Get ETF '-1X SHORT DIS' DNA
#' EN_GetISIN_Etf("-1X SHORT DIS")
#'
#' # Get ETF '3x Long Coinbase' DNA
#' EN_GetISIN_Etf("XS2399367254")
#'
#'
#' @import httr
#' @import jsonlite
#'
#' @export
#'

EN_GetISIN_Etf <- function(ticker) {
  ticker <- toupper(ticker)

  # URL de la requête
  url <- "https://live.euronext.com/en/pd_es/data/track?mics=XAMS%2CXBRU%2CXLIS%2CXPAR%2CXLDN%2CXMSM%2CXOSL%2CETFP"

  # Get numbers rows to calculate number on possible pages
  params <- list(
    "draw" = 3, #Permet de récupérer tout le tableau de la page
    "columns[0][data]" = 0,
    "columns[0][name]" = "",
    "search[value]" = "",
    "search[regex]" = "false",
    "args[initialLetter]" = "",
    "iDisplayLength" = 100,
    "iDisplayStart" = 0,
    "sSortDir_0" = "asc",
    "sSortField" = "name"
  )

  response <- httr::POST(url, body = params, encode = "form")

  # Lire le contenu JSON de la réponse
  content <- httr::content(response, "text", encoding = "UTF-8")
  data <- jsonlite::fromJSON(content)

  length_rows <- data$iTotalDisplayRecords
  nb_pages <- ceiling(length_rows/100)

  start_values <- seq(0, nb_pages*100, 100)
  the_length_ <- length(start_values)
  start_values <- seq(0, nb_pages*100, 100)


  max_pages <- start_values[the_length_ - 1]  # Nombre maximum de pages à vérifier

  for (i in 1:(max_pages/100)) {
    dt_List <- EN_Etfs_List_bis(target_page = i)

    if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name))) {
      # Filter
      adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker])[1]

      return(adn)
    }
  }

  return("Ticker not found")
}


# EN_GetISIN_Etf <- function(ticker) {
#   ticker <- toupper(ticker)
#
#   dt_List <- EN_Etfs_List()
#
#   if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name))) {
#     # Filter
#     adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker])[1]
#     return(adn)
#   } else {
#     return("Ticker not found")
#   }
# }
