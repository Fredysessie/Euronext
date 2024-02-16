#' Get Ticker Historical Performance
#'
#' This function retrieves the historical performance data of a company listed on the Euronext exchange
#' based on its ticker symbol. It returns a table with details such as the highest and lowest stock prices,
#' date of the highest and lowest prices, and other relevant information.
#'
#' @param ticker A character string representing the company's ticker symbol.
#' @param stock_type   The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
#' @param escape Boolean, either TRUE or FALSE. If escape is True, it means you're providing the DNA (ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN and the type of market to which it belongs.
#'
#' @return A data frame containing historical performance data of the specified company.
#' If the ticker is not found, it returns the message "Ticker not found."
#'
#' @examples
#'
#' library(httr)
#' library(httr2)
#' library(rvest)
#' library(jsonlite)
#' library(stringr)
#' library(magrittr)
#'
#' # Get Performance of Bond issued by A2A S.p.A.
#' dt1 = EN_Ticker_Performance("XS1195347478-ETLX", escape = TRUE)
#' #print(dt1[, c(1:6,8,12)])
#'
#' \donttest{
#' # Get Performance of Ticker ABCA
#' dt = EN_Ticker_Performance("ABCA")
#' print(dt)
#' # Get Performance of ETF AAPL
#' EN_Ticker_Performance("AAPL", stock_type = "E")
#'
#' # Get Performance of ACOMEA EMERGING Q2 Fund
#' dt2 = EN_Ticker_Performance("IT0005091126", stock_type ='F')
#' print(dt2[, c(1:6,8,12)])
#'
#' # Get Performance of AEX All-Share Index
#' dt3 = EN_Ticker_Performance("AEX All-Share Index GR")
#' print(dt3[, c(1:6,8,12)])
#'
#' }
#'
#' @import httr
#' @import rvest
#' @importFrom magrittr %>%
#'
#' @family Data Retrieval
#' @family Euronext
#'
#' @seealso \code{\link{EN_GetISIN}} to retrieve the ISIN for a given ticker.
#'
#' @export


EN_Ticker_Performance <- function(ticker,
                                 escape = FALSE,
                                 stock_type = 'Eq_Ind') {
  ready_to_use <- function(the_DNA) {
    url <- paste0("https://live.euronext.com/en/ajax/getPerformancesExtended/", the_DNA)

    headers <- c(
      accept = "*/*",
      `accept-language` = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
      `sec-fetch-dest` = "empty",
      `sec-fetch-mode` = "cors",
      `sec-fetch-site` = "same-origin",
      `x-requested-with` = "XMLHttpRequest"
    )

    referrer <- paste0("https://live.euronext.com/en/product/equities/", the_DNA)

    response <- GET(
      url,
      add_headers(.headers = headers),
      referrer = referrer,
      encode = "form"
    )

    if (status_code(response) == 200) {
      # Best method to get the historical performance data
      histo_perf_data <- content(response, encoding = "UTF-8") %>%
        rvest::html_nodes('table') %>%
        rvest::html_table()

      histo_perf_data <- histo_perf_data[[1]]

      # Rename some cells elements
      histo_perf_data[2, 1] <- "Date of the highest"
      histo_perf_data[4, 1] <- "Date of the lowest"

      # Turn "," to ""
      histo_perf_data[7, ] <- lapply(histo_perf_data[7, ], function(x) gsub(",", "", x))
      histo_perf_data[8, ] <- lapply(histo_perf_data[8, ], function(x) gsub(",", "", x))
      histo_perf_data[9, ] <- lapply(histo_perf_data[9, ], function(x) gsub(",", "", x))

      return(histo_perf_data)

    } else {
      stop("Error fetching data. HTTP status code: ", status_code(response))
    }
  }

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
          return(ready_to_use(the_adn))
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



# Old code
# EN_Ticker_Performance <- function(ticker){
#   ticker <- toupper(ticker)
#
#   the_adn <-  EN_GetISIN(ticker)
#
#   if (the_adn != "Ticker not found") {
#     url <- paste0("https://live.euronext.com/en/ajax/getPerformancesExtended/", the_adn)
#
#     headers <- c(
#       accept = "*/*",
#       `accept-language` = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
#       `sec-fetch-dest` = "empty",
#       `sec-fetch-mode` = "cors",
#       `sec-fetch-site` = "same-origin",
#       `x-requested-with` = "XMLHttpRequest"
#     )
#
#     referrer <- paste0("https://live.euronext.com/en/product/equities/", the_adn)
#
#     response <- GET(url,
#                     add_headers(.headers = headers),
#                     referrer = referrer,
#                     # set_cookies("your_cookie_name" = "your_cookie_value"),
#                     # verbose(),
#                     encode = "form"
#     )
#
#     if (status_code(response) == 200) {
#
#       # Best methode to get the historical performance data
#       histo_perf_data <- content(response, encoding = "UTF-8") %>%
#         rvest::html_nodes('table') %>%
#         rvest::html_table()
#
#       histo_perf_data <- histo_perf_data[[1]]
#
#       # Rename some cells elements
#       histo_perf_data[2,1] <- "Date of the highest"
#       histo_perf_data[4,1] <- "Date of the lowest"
#
#       # Turn "," to ""
#       histo_perf_data[7, ] <- lapply(histo_perf_data[7, ], function(x) gsub(",", "", x))
#       histo_perf_data[8, ] <- lapply(histo_perf_data[8, ], function(x) gsub(",", "", x))
#       histo_perf_data[9, ] <- lapply(histo_perf_data[9, ], function(x) gsub(",", "", x))
#
#       return(histo_perf_data)
#
#     } else {
#       warning("Error fetching data. HTTP status code: ", status_code(response))
#       return(NULL)
#     }
#
#   } else {
#     return("Ticker not found")
#   }
#
#
# }
#
