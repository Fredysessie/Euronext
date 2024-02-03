#' Get Highchart Data: Price and Volume
#'
#' This function retrieves historical price and volume data for a given stock ticker on the Euronext exchange.
#' The data is returned as a tibble with columns for Date, Price, and Volume. You can specify the date range
#' for which you want to retrieve the data using the 'from' and 'to' parameters.
#'
#' @param ticker A character string representing the company's ticker, name, or ISIN.
#' @param from A Date object specifying the start date for the data. Default is `NULL`, which retrieves data from the earliest available date. Users can adjust the value of `from` to specify a different start date. Only dates in the format "%Y-%m-%d" are allowed.
#' @param to A Date object specifying the end date for the data. Default is the current date. Users can adjust the value of `to` to specify a different end date. Only dates in the format "%Y-%m-%d" are allowed.
#' @param stock_type   The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
#' @param escape Boolean, either T or F. If escape is True, it means you're providing the DNA (ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN and the type of market to which it belongs.
#'
#' @return A tibble containing historical price and volume data for the specified stock ticker within the specified date range.
#' If the specified ticker is not found, the function returns an error message.
#'
#' @examples
#' \dontrun{
#' library(dplyr)
#' # Get company ABC ARBITRAGE share hc data
#' dt_ABCA = EN_Ticker_hcData("ABca")
#' print(dt_ABCA)
#'
#' dt_EOS = EN_Ticker_hcData("EOS", from = "2000-10-30", to = "2024-01-27")
#' print(dt_EOS)
#'
#' # Get hc data for ETF AAPL from December 15, 2023 to now
#' hc_aapl <- EN_Ticker_hcData("AAPL", stock_type = "E", from = "2023-12-15", to = Sys.Date())
#' head(hc_aapl)
#'
#' # Get hc data of Fund KEMPEN GBL HDiv N
#' dt_kem = EN_Ticker_hcData("US88554D2053-ETLX", escape = T)
#' print(dt_kem)
#'
#' #' #To get hc data of Bond issued by A2A S.p.A.
#' hc_RMBS <- EN_Ticker_hcData("XS1195347478-ETLX", escape = T)
#' head(hc_RMBS)
#'
#' }
#'
#' @seealso \code{\link{EN_GetISIN}} to retrieve the ISIN for a given ticker,
#' \code{\link{EN_HistData}} to retrieve daily data for a given ticker.
#'
#' @import httr
#' @import jsonlite
#' @import dplyr
#'
#' @family Data Retrieval
#' @family Euronext
#'
#' @export

EN_Ticker_hcData <- function(ticker, escape = F, stock_type = 'Eq_Ind', from = NULL, to = Sys.Date()){

  if (is.null(from)) {
    from <- as.Date("1970-01-01")  # Set a default value or adjust as needed
  } else {
    from <- as.Date(strftime(from, format="%Y-%m-%d"))
  }

  # if (is.null(to)) {
  #   to <- Sys.Date()
  # } else {
    to <- as.Date(strftime(to, format="%Y-%m-%d"))
  # }

    # if (!is.null(from)) {
    #   if (!is.Date(from) || !is.Date(to)) {
    #     rlang::abort("Both 'from' and 'to' must be of type Date.")
    #   }
    # }

  if (from > to){
    rlang::abort(
      "The 'from' parameter must be equal to or less than 'to' parameter"
    )
  }


  # Test if escape is True or False
  if (escape %in% c(T, F)) {
    if(escape == T){
      the_adn <- toupper(ticker)
      # We can directly start
      # Mettre tout le code ici

      url <- paste0("https://live.euronext.com/intraday_chart/getChartData/",
                    the_adn,
                    "/max")

      response <- httr::GET(url,
                            # referrer = paste0("https://live.euronext.com/en/product/equities/",
                            #                   the_adn),
                            headers = list(
                              "accept" = "*/*",
                              "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
                              "if-none-match" = "\"d49f47bc\"",
                              "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
                              "sec-ch-ua-mobile" = "?0",
                              "sec-ch-ua-platform" = "\"Windows\"",
                              "sec-fetch-dest" = "empty",
                              "sec-fetch-mode" = "cors",
                              "sec-fetch-site" = "same-origin",
                              "x-requested-with" = "XMLHttpRequest"
                            )
                            # referrerPolicy = "strict-origin-when-cross-origin",
                            # method = "GET",
                            # mode = "cors",
                            # credentials = "include"
      )

      if (status_code(response) == 200) {
        # print("Statut ok")
        # Best methode to get the ticker informations table
        content <- httr::content(response, "text", encoding = "UTF-8")
        data <- jsonlite::fromJSON(content)

        data$time <- as.Date(data$time)

        names(data) <- c("Date", "Price", "Volume")

        data <- dplyr::as_tibble(data) %>%
          dplyr::filter(Date >= from) %>%
          dplyr::filter(Date <= to)

        return(data)

      } else {
        warning("Error fetching data. HTTP status code: ", status_code(response))
        return(NULL)
      }


    }else {
      # In case escape is False
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

      # Mettre tout le code ici
      if (the_adn != "Ticker not found") {
        url <- paste0("https://live.euronext.com/intraday_chart/getChartData/",
                      the_adn,
                      "/max")

        response <- httr::GET(url,
                              headers = list(
                                "accept" = "*/*",
                                "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
                                "if-none-match" = "\"d49f47bc\"",
                                "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
                                "sec-ch-ua-mobile" = "?0",
                                "sec-ch-ua-platform" = "\"Windows\"",
                                "sec-fetch-dest" = "empty",
                                "sec-fetch-mode" = "cors",
                                "sec-fetch-site" = "same-origin",
                                "x-requested-with" = "XMLHttpRequest"
                              ),
                              referrer = paste0("https://live.euronext.com/en/product/equities/", the_adn),
                              # referrerPolicy = "strict-origin-when-cross-origin",
                              # method = "GET",
                              # mode = "cors",
                              # credentials = "include"
        )

        if (status_code(response) == 200) {
          # print("Statut ok")
          # Best methode to get the ticker informations table
          content <- httr::content(response, "text", encoding = "UTF-8")
          data <- jsonlite::fromJSON(content)

          data$time <- as.Date(data$time)

          names(data) <- c("Date", "Price", "Volume")

          data <- dplyr::as_tibble(data) %>%
            dplyr::filter(Date >= from) %>%
            dplyr::filter(Date <= to)

          return(data)

        } else {
          warning("Error fetching data. HTTP status code: ", status_code(response))
          return(NULL)
        }

      } else {
        return("Ticker not found")
      }


      # In case escape is False
    }

  } else{
    rlang::abort(
      "Only parameters T or F are allowed"
    )
  }

}

