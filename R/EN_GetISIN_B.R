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
#' \dontrun{
#' library(httr)
#' library(jsonlite)
#' library(dplyr)
#'
#' the_dna1 = EN_GetISIN_B("ABN AMRO BANK N.V.") #To get only the DNA of all same bonds issuerd
#' the_isin1 = sub("-.*", "", the_dna1) #To get only the ISINs
#' print(the_isin1)
#'
#' the_dna2 = EN_GetISIN_B("A2A GREEN BOND TF")
#' the_isin2 =sub("-.*", "", the_dna2) #To get only the ISIN
#' print(the_isin2)
#'}
#'
#' @import httr
#' @import jsonlite
#' @import dplyr
#'
#' @export
#'

EN_GetISIN_B <- function(ticker) {
  ticker <- toupper(ticker)

  dt_List <- EN_Bonds_List("Max")

  if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Issuer, dt_List$Name, dt_List$Ticker_adn))) {
    # Replace "column_name" with the actual column name you want to retrieve
    adn <- na.omit(dt_List$Ticker_adn[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
    return(adn)

  } else {
    return("Ticker not found")
  }
}
