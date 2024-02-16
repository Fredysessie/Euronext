#' Get Ticker Information
#'
#' This function retrieves detailed information for a given stock ticker on the Euronext exchange.
#' It includes information such as currency, last traded price, valuation close, volume, turnover,
#' transactions, VWAP (Volume Weighted Average Price), open, high, low, threshold, previous close,
#' 52-week range, and market capitalization.
#' The data is returned as a data frame.
#'
#' @param ticker A character string representing the company's ticker, name, or ISIN.
#' @param stock_type   The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
#' @param escape Boolean, either TRUE or FALSE. If escape is True, it means you're providing the DNA (ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN and the type of market to which it belongs.
#'
#' @return A data frame containing detailed information for the specified stock ticker.
#' If the specified ticker is not found, the function returns an error message.
#'
#' @examples
#'
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#' library(rlang)
#' library(magrittr)
#'
#' #Get ABCA informations
#' dt_ABCA = EN_Ticker_infos("ABca")
#' print(dt_ABCA)
#'
#' dt_EOS = EN_Ticker_infos("EOS")
#' print(dt_EOS)
#'
#'
#  #To Get 21S AMKR's Fund informations
#' dt_fund = EN_Ticker_infos("CH1135202138-XPAR", stock_type = "F", escape = TRUE)
#' print(dt_fund)
#' \donttest{
#'
#' dt_new = EN_Ticker_infos("AAPL", stock_type = "E") # To Get ETF AAPL informations
#' print(dt_new)
#'
#' # To show only 5 pages of bonds list and select directly the bond DNA
#' dt_ = EN_Bonds_List()
#' # To Get informations about BOND issued in 2019 by POPOLARE BARI RMBS
#' dt_new1 = EN_Ticker_infos("IT0005386716-XMOT", stock_type = "B", escape = TRUE)
#' print(dt_new1)
#'
#  #To Get KGHDF's Fund informations
#' dt_newfund = EN_Ticker_infos("KGHDF", stock_type = "F")
#' print(dt_newfund)
#'
#'}
#'
#' @seealso \code{\link{EN_GetISIN}} to retrieve the ISIN for a given ticker.
#'
#' @import httr
#' @import rvest
#' @importFrom magrittr %>%
#'
#' @family Data Retrieval
#' @family Euronext
#'
#' @export

EN_Ticker_infos <- function(ticker, escape = FALSE, stock_type = 'Eq_Ind') {

  # Test if escape is True or False
  if (is.logical(escape)) {
    if(escape == TRUE){
      the_adn <- toupper(ticker)
      # We can directly start

      url <- paste0("https://live.euronext.com/en/intraday_chart/getDetailedQuoteAjax/",
                    the_adn,
                    "/full")

      response <- httr::GET(url,
                            # referrer = paste0("https://live.euronext.com/en/product/equities/", the_adn),
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
        the_ticker_infos <- content(response, encoding = "UTF-8") %>%
          rvest::html_nodes('table') %>%
          rvest::html_table()

        the_ticker_infos <- the_ticker_infos[[1]]

        if('Threshold' %in% the_ticker_infos$X1){
          row_number <- which(the_ticker_infos$X1 == "Threshold")
          the_ticker_infos[row_number,2] = gsub("\n\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t", "      -      ", the_ticker_infos[row_number,2])
        }

        if('52 Week' %in% the_ticker_infos$X1){
          row_number1 <- which(the_ticker_infos$X1 == "52 Week")



          if (the_ticker_infos[row_number1,2] ==	'-\n\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t-') {
            the_ticker_infos[row_number1,2] = "  -     -   "
          } else{
            the_ticker_infos[row_number1,2] = gsub("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t", "      -      ", the_ticker_infos[row_number1,2])
          }


        }


        # Remove blank space

        # the_ticker_infos[13,2] = gsub("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t", "     -      ", the_ticker_infos[13,2])

        names(the_ticker_infos) <- c("Information", "Detail", "Update date/Time")
        return(the_ticker_infos)

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

        url <- paste0("https://live.euronext.com/en/intraday_chart/getDetailedQuoteAjax/",
                      the_adn,
                      "/full")

        response <- httr::GET(url,
                              # referrer = paste0("https://live.euronext.com/en/product/equities/", the_adn),
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
        )

        if (status_code(response) == 200) {
          # print("Statut ok")
          # Best methode to get the ticker informations table
          the_ticker_infos <- content(response, encoding = "UTF-8") %>%
            rvest::html_nodes('table') %>%
            rvest::html_table()

          the_ticker_infos <- the_ticker_infos[[1]]

          if('Threshold' %in% the_ticker_infos$X1){
            row_number <- which(the_ticker_infos$X1 == "Threshold")
            the_ticker_infos[row_number,2] = gsub("\n\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t", "      -      ", the_ticker_infos[row_number,2])
          }

          if('52 Week' %in% the_ticker_infos$X1){
            row_number1 <- which(the_ticker_infos$X1 == "52 Week")



            if (the_ticker_infos[row_number1,2] ==	'-\n\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t-') {
              the_ticker_infos[row_number1,2] = "  -     -   "
            } else{
              the_ticker_infos[row_number1,2] = gsub("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t", "      -      ", the_ticker_infos[row_number1,2])
            }


          }


          # Remove blank space

          # the_ticker_infos[13,2] = gsub("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t", "     -      ", the_ticker_infos[13,2])

          names(the_ticker_infos) <- c("Information", "Detail", "Update date/Time")

          return(the_ticker_infos)

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
      "Only parameters 'TRUE' or 'FALSE' are allowed"
    )
  }

}

# EN_Ticker_infos <- function(ticker, stock_type = 'Eq_Ind'){
#
#   ticker <- toupper(ticker)
#
#   if(stock_type %in% c('Fund', "F")){
#     the_adn <-  EN_GetISIN_F(ticker)
#
#   } else if(stock_type %in% c('Bond', "B")){
#     the_adn <-  EN_GetISIN_B(ticker)
#
#   } else if(stock_type %in% c('Etfs', "E")){
#     the_adn <-  EN_GetISIN_Etf(ticker)
#
#   } else {
#     the_adn <-  EN_GetISIN(ticker)
#   }
#
#
#   # the_adn <-  EN_GetISIN(ticker)
#
#   if (the_adn != "Ticker not found") {
#     url <- paste0("https://live.euronext.com/en/intraday_chart/getDetailedQuoteAjax/",
#                   the_adn,
#                   "/full")
#
#     response <- httr::GET(url,
#                           headers = list(
#                             "accept" = "*/*",
#                             "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
#                             "if-none-match" = "\"d49f47bc\"",
#                             "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
#                             "sec-ch-ua-mobile" = "?0",
#                             "sec-ch-ua-platform" = "\"Windows\"",
#                             "sec-fetch-dest" = "empty",
#                             "sec-fetch-mode" = "cors",
#                             "sec-fetch-site" = "same-origin",
#                             "x-requested-with" = "XMLHttpRequest"
#                           ),
#                           referrer = paste0("https://live.euronext.com/en/product/equities/", the_adn),
#                           # referrerPolicy = "strict-origin-when-cross-origin",
#                           # method = "GET",
#                           # mode = "cors",
#                           # credentials = "include"
#     )
#
#     if (status_code(response) == 200) {
#       # print("Statut ok")
#       # Best methode to get the ticker informations table
#       the_ticker_infos <- content(response, encoding = "UTF-8") %>%
#         rvest::html_nodes('table') %>%
#         rvest::html_table()
#
#       the_ticker_infos <- the_ticker_infos[[1]]
#
#       if('Threshold' %in% the_ticker_infos$X1){
#         row_number <- which(the_ticker_infos$X1 == "Threshold")
#         the_ticker_infos[row_number,2] = gsub("\n\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t", "      -      ", the_ticker_infos[row_number,2])
#       }
#
#       if('52 Week' %in% the_ticker_infos$X1){
#         row_number1 <- which(the_ticker_infos$X1 == "52 Week")
#
#
#
#         if (the_ticker_infos[row_number1,2] ==	'- -') {
#           the_ticker_infos[row_number1,2] = "  -     -   "
#         } else{
#           the_ticker_infos[row_number1,2] = gsub("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t", "      -      ", the_ticker_infos[row_number1,2])
#         }
#
#
#       }
#
#
#       # Remove blank space
#
#       # the_ticker_infos[13,2] = gsub("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t", "     -      ", the_ticker_infos[13,2])
#
#       return(the_ticker_infos)
#
#     } else {
#       warning("Error fetching data. HTTP status code: ", status_code(response))
#       return(NULL)
#     }
#
#   } else {
#     return("Ticker not found")
#   }
# }
