#####################################################################################
############################## GEt intraday stock data ##############################
#####################################################################################

#' Fetches intraday price data for a specified stock on Euronext.
#'
#' This function fetches intraday data for a given stock ticker on Euronext. You can specify the type of intraday price
#' to retrieve, either "Today" or "Previous" day. The default type is "Today." The function returns a data frame
#' containing intraday stock information.
#'
#' @param ticker A character string representing the stock ticker or name.
#' @param day_type A character string specifying the type of intraday price to fetch. Options are "Today" or "Previous" day.
#'   Default is "Today." You can also use 'T' for 'Today' or 'P' for 'Previous'.
#' @param stock_type   The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
#' @param escape Boolean, either TRUE or FALSE. If escape is True, it means you're providing the DNA (ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN and the type of market to which it belongs.
#' @param nbitems An integer specifying the number of items to fetch. Default is 30 (also the maximum).
#'
#' @return A data frame containing intraday stock information.
#'
#' @examples
#' \donttest{
#'
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#' library(magrittr)
#' library(rlang)
#'
#' # Get recent intraday prices of ABCA share
#' intra_ = EN_intraday_Data("ABCA", day_type = 'T')
#' print(intra_)
#'
#' # Get recent intraday prices of ACOMEA EMERGING Q2 Fund
#' intra_1 = EN_intraday_Data("IT0005091126", 'F', escape = FALSE, day_type = 'T')
#' print(intra_1)
#'
#' # Get Previous intraday prices of ETF AAPL by providing directly the ISIN-Market identifier
#' intra_2 = EN_intraday_Data("XS2337099563-XAMS", escape = TRUE, day_type = 'Previous')
#' print(intra_2)
#'
#' # Get Previous intraday prices of AEX All-Share Index
#' intra_3 = EN_intraday_Data("AEX All-Share Index GR", day_type = 'P')
#' print(intra_3)
#' }
#'
#' @family Data Retrieval
#' @family Euronext
#'
#' @seealso \code{\link{EN_GetISIN}}, \code{\link{EN_HistData}}
#'
#' @import httr
#' @importFrom magrittr %>%
#' @importFrom stringr str_to_upper str_to_title
#' @export


EN_intraday_Data <- function(ticker, day_type = "Today", escape = FALSE, stock_type = 'Eq_Ind', nbitems = 30) {
  type <- str_to_title(day_type)

  today_types <- c('T', 'Today')
  yesterday_types <- c('P', 'Previous')

  date <- Sys.Date()

  if (type %in% today_types) {
    if(weekdays(date) == 'samedi'){
      date <- Sys.Date()-1
    } else if(weekdays(date) == 'dimanche'){
      date <- Sys.Date()-2
    } else {
      date <- date
    }

    # Body of the request
    body <- list(
      "nbitems" = nbitems,
      "date" = date,
      "timezone" = 'CET')

  } else if(type %in% yesterday_types){

    if(weekdays(date) == 'samedi'){
      date <- Sys.Date()-2
    } else if(weekdays(date) %in% c('dimanche', 'Lundi')){
      date <- Sys.Date()-3
    } else {
      date <- Sys.Date() - 1
    }

    # print(date)

    # Body of the request
    body <- list(
      "date" = date,
      "nbitems" = 10
    )

  } else {
    rlang::abort(
      "Choose between 'T' and 'P' "
    )
  }

  ready_to_use1 <- function(the_adn, body) {
    headers <- list(
      "accept" = "*/*",
      "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
      "content-type" = "application/x-www-form-urlencoded; charset=UTF-8",
      "sec-fetch-dest" = "empty",
      "sec-fetch-mode" = "cors",
      "sec-fetch-site" = "same-origin",
      "x-requested-with" = "XMLHttpRequest"
    )

    url <- paste0("https://live.euronext.com/en/ajax/getIntradayPriceFilteredData/", the_adn)

    # referrer <- paste0("https://live.euronext.com/en/product/equities/", the_adn)

    response <- httr::POST(url,
                           # referrer = referrer,
                           body = body,
                           encode = "form")

    if (status_code(response) == 200) {
      # Parse the JSON content
      content <- httr::content(response, "text", encoding = "UTF-8")
      data <- jsonlite::fromJSON(content)

      # Get the Data
      data <- data$rows

      # Turn to title the column name
      names(data) <- str_to_title(names(data))

      return(data)
    } else {
      warning("Error fetching data. HTTP status code: ", status_code(response))
      return(NULL)
    }
  }


  #####
  # Test if escape is TRUE or FALSE
  if (is.logical(escape)) {
    if (escape) {
      the_adn <- toupper(ticker)
    } else {
      ticker <- toupper(ticker)
      if (stock_type %in% c('Fund', "F")) {
        the_adn <- EN_GetISIN_F(ticker)
      } else if (stock_type %in% c('Bond', "B")) {
        the_adn <- EN_GetISIN_B(ticker)
      } else if (stock_type %in% c('Etfs', "E")) {
        the_adn <- EN_GetISIN_Etf(ticker)
      }  else if(stock_type == 'Eq_Ind'){
        the_adn <-  EN_GetISIN(ticker)
      } else{
        rlang::abort(
          "Only parameters such us 'Eq_Ind' for Stocks and Indexes, 'Fund' or 'F' for Fund tickers, 'Bond' or 'B' for Bond tickers, and 'Etfs' or 'E' for EFTs are allowed."
        )
      }
    }

    if (the_adn == "Ticker not found") {
      return("Ticker not found")
    } else(

      tryCatch(
        {
          return(ready_to_use1(the_adn, body = body))
        },
        error = function(e) {
          warning("Ticker not found")

        }
      )

    )
  } else {
    stop("The 'escape' parameter must be a logical value.")
  }

}




# EN_intraday_Data <- function(ticker, day_type = "Today", nbitems = 30) {
#
#   type <- str_to_title(day_type)
#
#   today_types <- c('T', 'Today')
#   yesterday_types <- c('P', 'Previous')
#
#   date <- Sys.Date()
#
#   if (type %in% today_types) {
#     if(weekdays(date) == 'samedi'){
#       date <- Sys.Date()-1
#     } else if(weekdays(date) == 'dimanche'){
#       date <- Sys.Date()-2
#     } else {
#       date <- date
#     }
#
#     # Body of the request
#     body <- list(
#       "nbitems" = nbitems,
#       "date" = date,
#       "timezone" = 'CET')
#
#   } else if(type %in% yesterday_types){
#
#     if(weekdays(date) == 'samedi'){
#       date <- Sys.Date()-2
#     } else if(weekdays(date) %in% c('dimanche', 'Lundi')){
#       date <- Sys.Date()-3
#     } else {
#       date <- Sys.Date() - 1
#     }
#
#     # print(date)
#
#     # Body of the request
#     body <- list(
#       "date" = date,
#       "nbitems" = 10
#     )
#
#   } else {
#     rlang::abort(
#       "Choose between 'T' and 'P' "
#     )
#   }
#
#   # date = Sys.Date()
#
#   ticker <- toupper(ticker)
#
#   the_adn <-  EN_GetISIN(ticker)
#
#   if (the_adn != "Ticker not found") {
#
#     # URL for the intraday data
#     url <- paste0("https://live.euronext.com/en/ajax/getIntradayPriceFilteredData/", the_adn)
#
#     # Headers for the request
#     headers <- list(
#       "accept" = "*/*",
#       "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
#       "content-type" = "application/x-www-form-urlencoded; charset=UTF-8",
#       "sec-fetch-dest" = "empty",
#       "sec-fetch-mode" = "cors",
#       "sec-fetch-site" = "same-origin",
#       "x-requested-with" = "XMLHttpRequest"
#     )
#
#     # Referrer information
#     referrer <- paste0("https://live.euronext.com/en/product/equities/", the_adn)
#
#
#
#     # Make the fetch request
#     response <- httr::POST(url,
#                            referrer = referrer,
#                            body = body,
#                            encode = "form")
#
#     if (status_code(response) == 200) {
#
#       # Parse the JSON content
#       content <- httr::content(response, "text", encoding = "UTF-8")
#       data <- jsonlite::fromJSON(content)
#
#       # Get the Data
#       data <- data$rows
#
#       # TUrn to title the column name
#       names(data) <- str_to_title(names(data))
#
#       return(data)
#
#
#     } else {
#       warning("Error fetching data. HTTP status code: ", status_code(response))
#       return(NULL)
#     }
#   } else {
#
#     return("Ticker not found")
#   }
#
# }
