#' Get the DNA (ISIN and Market identifier) of a ticker from the funds list
#'
#' This function checks if the provided ticker is present in the specified columns of the funds list. If the ticker is found in the funds list, the function returns the DNA (ISIN and Market identifier) of the corresponding ticker. Otherwise, it returns 'Ticker not found'.
#'
#' @family ISIN Retrieval
#' @family Infos Retrieval
#' @seealso \code{\link{EN_GetISIN}} to get DNA of a giving Company or Index Ticker/Name/ISIN (Fund, Bond, and ETF are excluded), \code{\link{EN_Funds_List}} to get the list of funds quoted on Euronext markets, \code{\link{EN_GetISIN_B}} to get a giving Bond DNA, \code{\link{EN_GetISIN_Etf}} to get a giving ETF DNA.
#'
#' @param ticker The ticker to search for.
#' @return A character
#'
#' @examples
#' \donttest{
#' library(httr)
#' library(jsonlite)
#' library(stringr)
#' library(jsonlite)
#'
#' the_dna = EN_GetISIN_F("ACOMEA GLOBALE")
#' sub("-.*", "", the_dna) #To get only the ISIN
#'
#' # Get Fund 'ASNU SMALL MIDCAPF' DNA
#' asnu_dna <- EN_GetISIN_F("ASN5")
#' print(asnu_dna)
#'
#' # Get Fund 'COMPAM ACTIVE GLOB' DNA
#' EN_GetISIN_F("LU1275425897")
#' }
#'
#' @import httr
#' @import jsonlite
#'
#' @export
#'

EN_GetISIN_F <- function(ticker) {
  ticker <- toupper(ticker)

  dt_List <- EN_Funds_List()

  if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name))) {
    # Replace "column_name" with the actual column name you want to retrieve
    adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker])[1]
    return(adn)
  } else {
    return("Ticker not found")
  }
}
