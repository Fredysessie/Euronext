#####################################################################################
################################ GEt daily stock data ###############################
#####################################################################################

#' Retrieve Historical Stock Data from Euronext
#'
#' This function fetches historical stock data from Euronext based on the given
#' ticker symbol. You can specify a date range using the 'from' and 'to'
#' parameters. Additionally, provide the type of the ticker as 'Eq_Ind' for Stocks and Indexes,
#' 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers,
#' and 'Etfs' or "E" for EFTs.
#'
#' @param ticker A character string representing the company's ticker, name, or ISIN.
#' @param from   The start date for historical data (default: 91 days ago). Only dates not exceeding 2 years ago are allowed for the 'from' parameter.
#' @param to     The end date for historical data (default: yesterday).
#' @param stock_type   The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
#' @param escape Boolean, either TRUE or FALSE. If escape is True, it means you're providing the DNA (ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN and the type of market to which it belongs.
#'
#' @family Data Retrieval
#'
#' @return A data frame containing historical stock data, including columns for Date,
#' Open, High, Low, Last, Close, 'Number of shares', Turnover, and VWAP.
#'
#' @examples
#'
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#' library(magrittr)
#' library(rlang)
#'
#' #To get historical data of Bond issued by IT0005386716-XMOT
#' hc_RMBS <- EN_HistData("XS1548458014-XAMS", escape = TRUE, from = "2022-10-30",stock_type = "B")
#' head(hc_RMBS)
#'
#' \donttest{
#'
#' # Fetch historical data for ABCA from October 30, 2023, to January 27, 2024
#' hc_abca <- EN_HistData("ABCA", from = "2023-10-30", to = "2024-01-27")
#' head(hc_abca)
#'
#' # Fetch historical data for ETF AAPL from December 15, 2023, to now
#' hc_aapl <- EN_HistData("AAPL", stock_type = "E", from = "2023-12-15", to = Sys.Date())
#' head(hc_aapl)
#'
#'
#' # Fetch historical data for ABCA with the default date range
#' hc_ABCA <-  EN_HistData("ABCA")
#' head(hc_ABCA)
#'
#' # To Get KGHDF's Fund data
#' hc_KGHDF <- EN_HistData("KGHDF", stock_type = "F", from = "2022-10-30")
#' head(hc_KGHDF)
#'
#' EN_HistData("ABCAhh") # Will return "Ticker not found"
#' }
#'
#' @family Data Retrieval
#' @family Euronext
#'
#' @seealso \code{\link{EN_GetISIN}} to retrieve the ISIN for a given ticker.
#'
#' @export

EN_HistData <- function(ticker, from = Sys.Date() - 91, to = Sys.Date() - 1, stock_type = 'Eq_Ind', escape = FALSE) {

  from <- as.Date(strftime(from, format="%Y-%m-%d"))
  to <- as.Date(strftime(to, format="%Y-%m-%d"))

  if (from > to){
    rlang::abort(
      "The 'from' parameter must be equal to or less than 'to' parameter"
    )
  }

  # Check if 'from' is less than 2 years ago
  max_allowed_from <- Sys.Date() - 365 * 2
  if (from < max_allowed_from) {
    rlang::abort("Only dates not exceeding 2 years ago are allowed for the 'from' parameter.")
  }

  # Test if escape is True or False
  if (is.logical(escape)) {
    if(isTRUE(escape)){
      the_adn <- toupper(ticker)
      # We can directly start
      url <- paste0("https://live.euronext.com/en/ajax/getHistoricalPricePopup/", the_adn)

      headers <- c(
        "accept" = "*/*",
        "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
        "content-type" = "application/x-www-form-urlencoded; charset=UTF-8",
        "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
        "sec-ch-ua-mobile" = "?0",
        "sec-ch-ua-platform" = "\"Windows\"",
        "sec-fetch-dest" = "empty",
        "sec-fetch-mode" = "cors",
        "sec-fetch-site" = "same-origin",
        "x-requested-with" = "XMLHttpRequest"
      )

      params <- list(
        "adjusted" = "Y",
        "startdate" = from,
        "enddate" = to,
        "nbSession" = "10"
      )

      response <- POST(url, body = params, encode = "form")
      # response <- httr::POST(url,
      #                        headers = headers,
      #                        body = params,
      #                        # httr::add_headers(.headers = headers), httr::referrer(referrer),
      #                        encode = "form")

      # Check the response
      if (status_code(response) == 200) {
        # The status is 200

        # Best methode to get the stock data
        stock_data <- content(response, encoding = "UTF-8") %>%
          rvest::html_nodes('table') %>%
          rvest::html_table()

        stock_data <- stock_data[[1]]

        # Turn some columns to numeric value
        stock_data$`Number of shares` <-  as.numeric(gsub(",", "", stock_data$`Number of shares`))
        stock_data$Turnover <- as.numeric(gsub(",", "", stock_data$Turnover))

        # Turn Date column to date format
        stock_data$Date <- as.Date(stock_data$Date, format = "%d/%m/%Y")

        return(stock_data)

      } else {
        warning("Error fetching data. HTTP status code: ", status_code(response))
        return(NULL)
      }

    }else {
      ticker <- toupper(ticker)

      if(stock_type %in% c('Fund', "F")){
        the_adn <-  EN_GetISIN_F(ticker)

      } else if(stock_type %in% c('Bond', "B")){
        the_adn <-  EN_GetISIN_B(ticker)

      } else if(stock_type %in% c('Etfs', "E")){
        the_adn <-  EN_GetISIN_Etf(ticker)

      } else if(stock_type == 'Eq_Ind'){
        the_adn <-  EN_GetISIN(ticker)
      } else{
        rlang::abort(
          "Only parameters such us 'Eq_Ind' for Stocks and Indexes, 'Fund' or 'F' for Fund tickers, 'Bond' or 'B' for Bond tickers, and 'Etfs' or 'E' for EFTs are allowed."
        )
      }

      if (the_adn != "Ticker not found") {

        # We can now start the code
        url <- paste0("https://live.euronext.com/en/ajax/getHistoricalPricePopup/", the_adn)

        headers <- c(
          "accept" = "*/*",
          "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
          "content-type" = "application/x-www-form-urlencoded; charset=UTF-8",
          "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
          "sec-ch-ua-mobile" = "?0",
          "sec-ch-ua-platform" = "\"Windows\"",
          "sec-fetch-dest" = "empty",
          "sec-fetch-mode" = "cors",
          "sec-fetch-site" = "same-origin",
          "x-requested-with" = "XMLHttpRequest"
        )

        params <- list(
          "adjusted" = "Y",
          "startdate" = from,
          "enddate" = to,
          "nbSession" = "10"
        )

        response <- POST(url, body = params, encode = "form")
        # response <- httr::POST(url,
        #                        headers = headers,
        #                        body = params,
        #                        # httr::add_headers(.headers = headers), httr::referrer(referrer),
        #                        encode = "form")

        # Check the response
        if (status_code(response) == 200) {
          # The status is 200

          # Best methode to get the stock data
          stock_data <- content(response, encoding = "UTF-8") %>%
            rvest::html_nodes('table') %>%
            rvest::html_table()

          stock_data <- stock_data[[1]]

          # Turn some columns to numeric value
          stock_data$`Number of shares` <-  as.numeric(gsub(",", "", stock_data$`Number of shares`))
          stock_data$Turnover <- as.numeric(gsub(",", "", stock_data$Turnover))

          # Turn Date column to date format
          stock_data$Date <- as.Date(stock_data$Date, format = "%d/%m/%Y")

          return(stock_data)

        } else {
          warning("Error fetching data. HTTP status code: ", status_code(response))
          return(NULL)
        }

      } else {
        return("Ticker not found")
      }


    }

  } else{
    rlang::abort(
      "Only parameters TRUE or FALSE are allowed"
    )
  }

}

