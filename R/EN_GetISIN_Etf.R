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
#' \dontrun{
#' the_dna = EN_GetISIN_Etf("AAPL")
#' sub("-.*", "", the_dna) #To get only the ISIN
#'}
#'
#' @import httr
#' @import jsonlite
#' @import dplyr
#'
#' @export
#'

EN_GetISIN_Etf <- function(ticker) {
  ticker <- toupper(ticker)

  dt_List <- EN_Etfs_List()

  if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name))) {
    # Replace "column_name" with the actual column name you want to retrieve
    adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker])[1]
    return(adn)
  } else {
    return("Ticker not found")
  }
}
