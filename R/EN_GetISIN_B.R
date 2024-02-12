#' Get the DNA (ISIN and Market identifier) of a ticker from the Bonds list
#'
#' This function checks if the provided ticker is present in the specified columns of the Bonds list. If the ticker is found in the Bonds list, the function returns the DNA (ISIN and Market identifier) of the corresponding ticker. Otherwise, it returns 'Ticker not found'.
#'
#' @family ISIN Retrieval
#' @family Infos Retrieval
#'
#' @seealso \code{\link{EN_GetISIN}} to get DNA of a giving Company or Index Ticker/Name/ISIN (Fund, Bond, and ETF are excluded), \code{\link{EN_Bonds_List}} to get the list of Bonds quoted on Euronext, \code{\link{EN_GetISIN_Etf}} to get a giving Eft DNA, \code{\link{EN_GetISIN_F}} to get a giving Fund DNA.
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
#' the_dna1 = EN_GetISIN_B("ABN AMRO BANK N.V.") #To get only the DNA of all same bonds issuerd
#' the_isin1 = sub("-.*", "", the_dna1) #To get only the ISINs
#' print(the_isin1)
#'
#' the_dna2 = EN_GetISIN_B("A2A GREEN BOND TF")
#' the_isin2 =sub("-.*", "", the_dna2) #To get only the ISIN
#' print(the_isin2)
#'
#'
#' @import httr
#' @import jsonlite
#'
#' @export
#'


EN_GetISIN_B <- function(ticker) {
  ticker <- toupper(ticker)

  url = "https://live.euronext.com/en/pd/data/bond?mics=ALXB%2CALXL%2CALXP%2CXPAR%2CXAMS%2CXBRU%2CXLIS%2CXMLI%2CMLXB%2CENXB%2CENXL%2CTNLA%2CTNLB%2CXLDN%2CXHFT%2CVPXB%2CXOSL%2CXOAM%2CEXGM%2CETLX%2CMOTX%2CXMOT&display_datapoints=dp_bond&display_filters=df_bond"


  # Get numbers rows to calculate number on possible pages
  params <- list(
    "draw" = 3, #Permet de récupérer tout le tableau de la page
    "columns[0][data]" = 0,
    "columns[0][name]" = "",
    "search[value]" = "",
    "search[regex]" = "false",
    "args[initialLetter]" = "",
    # "start" = ifelse(start_value == 800, 800, 0),
    # "length" = 100,
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
    dt_List <- EN_Bonds_List_bis(target_page = i)

    if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Issuer, dt_List$Name, dt_List$Ticker_adn))) {
      # Replace "column_name" with the actual column name you want to retrieve
      adn <- na.omit(dt_List$Ticker_adn[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
      return(adn)
    }
  }

  return("Ticker not found")
}

# EN_GetISIN_B <- function(ticker) {
#   ticker <- toupper(ticker)
#
#   dt_List <- EN_Bonds_List("Max")
#
#   if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Issuer, dt_List$Name, dt_List$Ticker_adn))) {
#     # Replace "column_name" with the actual column name you want to retrieve
#     adn <- na.omit(dt_List$Ticker_adn[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#     return(adn)
#
#   } else {
#     return("Ticker not found")
#   }
# }
