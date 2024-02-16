#' Get Highchart Data : Price and Volume
#'
#' This function retrieves historical price and volume data for a given stock ticker on the Euronext exchange.
#' The data is returned as a tibble with columns for Date, Price, Volume, and Ticker. You can specify the date range
#' for which you want to retrieve the data using the 'from' and 'to' parameters.
#'
#' @param ticker A character string or vector representing the company's ticker, name, or ISIN. If providing a vector, at least one ticker must be specified.
#' @param from A Date object specifying the start date for the data. Default is `NULL`, which retrieves data from the earliest available date. Users can adjust the value of `from` to specify a different start date. Only dates in the format "%Y-%m-%d" are allowed.
#' @param to A Date object specifying the end date for the data. Default is the current date. Users can adjust the value of `to` to specify a different end date. Only dates in the format "%Y-%m-%d" are allowed.
#' @param stock_type The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
#' @param escape Boolean, either TRUE or FALSE. If escape is True, it means you're providing the DNA (ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN and the type of market to which it belongs.
#'
#' @return If a single ticker is provided, a tibble containing historical price and volume data for the specified stock ticker within the specified date range. If multiple tickers are provided, a list containing data frames for each ticker is returned. If the specified ticker(s) is not found, the function returns an error message.
#'
#' @examples
#' library(httr)
#' library(jsonlite)
#' library(rlang)
#'
#' # Get company ABC ARBITRAGE share hc data
#' dt_ABCA = EN_Ticker_hcData("ABca")
#' head(dt_ABCA)
#'
#' dt_EOS = EN_Ticker_hcData("EOS", from = "2000-10-30", to = "2024-01-27")
#' head(dt_EOS)
#'
#' # Get hc data of Fund KEMPEN GBL HDiv N
#' dt_kem = EN_Ticker_hcData("US88554D2053-ETLX", escape = TRUE)
#' head(dt_kem)
#'
#' #To get hc data of Bond issued by A2A S.p.A.
#' hc_RMBS <- EN_Ticker_hcData("XS1195347478-ETLX", escape = TRUE)
#' head(hc_RMBS)
#'
#' \donttest{
#'
#' # Get hc data for ETF AAPL from December 15, 2023 to now
#' hc_aapl <- EN_Ticker_hcData("AAPL", stock_type = "E", from = "2023-12-15", to = Sys.Date())
#' tail(hc_aapl)
#'
#' # Get indices such us AEX All-Tradable Alternative Weight NR, AEX Equal Weight NR,
#' # AEX Short GR and AEX X2 Short GR hc data (Date, Price, volume)
#' hc_list = EN_Ticker_hcData(c("NL0010614533", "QS0011211206", "QS0011095914", "QS0011146899"))
#' head(hc_list)
#'
#' # Example to retrieve Etfs hc data
#' dt_etf = EN_Ticker_hcData(c("IE0007G78AC4", "MANA", "3TSM"), stock_type = 'E')
#' head (dt_etf)
#' tail(dt_etf)
#'
#' # Example to retrieve Bonds hc data
#' dt_bonds = EN_Ticker_hcData(c("XS2364001078-XMOT", "AAB1.50%30SEP30"), stock_type = 'B')
#' head(dt_bonds)
#' tail(dt_bonds)
#' }
#'
#' @seealso \code{\link{EN_GetISIN}} to retrieve the ISIN for a given ticker,
#' \code{\link{EN_HistData}} to retrieve daily data for a given ticker.
#'
#' @import httr
#' @import jsonlite
#' @import httr
#'
#' @family Data Retrieval
#' @family Euronext
#'
#' @export


EN_Ticker_hcData <- function(ticker, from = NULL, to = Sys.Date(), stock_type = 'Eq_Ind', escape = FALSE) {

  Ready.HcData.func <- function(ticker, escape = FALSE, stock_type = 'Eq_Ind', from = NULL, to = Sys.Date()){

    if (is.null(from)) {
      from <- as.Date("1970-01-01")  # Set a default value
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
    if (escape %in% c(TRUE, FALSE)) {
      if(escape == TRUE){
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

          # data <- dplyr::as_tibble(data) %>%
          #   dplyr::filter(Date >= from) %>%
          #   dplyr::filter(Date <= to)

          data <- as.data.frame(data)

          # Filter rows based on Date
          data <- data[data$Date >= from & data$Date <= to, ]

          return(data)

        } else {
          warning("Error fetching data. HTTP status code: ", status_code(response))
          return(NULL)
        }


      }else {
        # In case escape is False
        ticker <- toupper(ticker)

        if(stock_type %in% c('Fund', "F",'Bond', "B",'Etfs', "E",'Eq_Ind')){

          test_data = EN_GetProfile(ticker = ticker, stock_type = stock_type)


        }else{
          rlang::abort(
            "Only parameters such us 'Eq_Ind' for Stocks and Indexes, 'Fund' or 'F' for Fund tickers, 'Bond' or 'B' for Bond tickers, and 'Etfs' or 'E' for EFTs are allowed."
          )
        }


        # if(stock_type %in% c('Fund', "F")){
        #   the_adn <-  EN_GetISIN_F(ticker)
        #
        # } else if(stock_type %in% c('Bond', "B")){
        #   the_adn <-  EN_GetISIN_B(ticker)
        #
        # } else if(stock_type %in% c('Etfs', "E")){
        #   the_adn <-  EN_GetISIN_Etf(ticker)
        #
        # } else if(stock_type == 'Eq_Ind'){
        #   the_adn <-  EN_GetISIN(ticker)
        #
        # }
        # else{
        #   rlang::abort(
        #     "Only parameters such us 'Eq_Ind' for Stocks and Indexes, 'Fund' or 'F' for Fund tickers, 'Bond' or 'B' for Bond tickers, and 'Etfs' or 'E' for EFTs are allowed."
        #   )
        # }

        # Mettre tout le code ici
        if (length(test_data) == 4 ) {
          the_adn = test_data$DNA

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

            # data <- dplyr::as_tibble(data) %>%
            #   dplyr::filter(Date >= from) %>%
            #   dplyr::filter(Date <= to)

            data <- as.data.frame(data)

            # Filter rows based on Date
            data <- data[data$Date >= from & data$Date <= to, ]

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


  # Add EN_Ticker_hcData function
  # Créer une fonction pour récupérer les données historiques pour un seul ticker
  # Ready.HcData.func <- function(tick, from, to, stock_type, escape) {
  #   # Appeler EN_Ticker_hcData pour un seul ticker
  #   temp_data <- EN_Ticker_hcData(tick, from = from, to = to, stock_type = stock_type, escape = escape)
  #   # Ajouter la colonne Ticker au résultat
  #   # temp_data$Ticker <- tick
  #   return(temp_data)
  # }

  # End of EN_Ticker_hcData function
  ####


  if (is.null(from)) {
    from <- as.Date("1970-01-01")  # Set a default value
  } else {
    from <- as.Date(strftime(from, format="%Y-%m-%d"))
  }

  to <- as.Date(strftime(to, format="%Y-%m-%d"))

  if (from > to){
    rlang::abort(
      "The 'from' parameter must be equal to or less than 'to' parameter"
    )
  }

  ticker = unique(toupper(ticker))

  # Check if ticker is a list
  if (length(ticker) > 1) {
    # Verify each ticker in the list
    available_tickers <- c()
    DNA_available_tickers <- c()
    invalid_tickers <- c()
    for(elm in ticker){

      test_tickers <- EN_GetProfile(elm, stock_type = stock_type)

      # if (test_tickers != "Ticker not found") {
      if(length(test_tickers) == 4) {
        DNA_available_tickers  <- c(test_tickers$DNA, DNA_available_tickers)

        if('Symbol' %in% names(test_tickers)){
          test_tickers = test_tickers$Symbol


        }else{
          # test_tickers = test_tickers$Issuer
          test_tickers = test_tickers$DNA
        }

        available_tickers  <- c( test_tickers, available_tickers)


      }else{
        invalid_tickers <- c(elm, invalid_tickers)
      }


    }

    # if (length(ticker) ==length(available_tickers)) {
    #   ticker <- available_tickers
    # }



    # available_tickers <- EN_GetProfile()$Ticker
    # invalid_tickers <- ticker[!(ticker %in% available_tickers)]
    if (length(invalid_tickers) > 0) {

      if(length(invalid_tickers) == 1){
        rlang::abort(paste("The following ticker is not found:", paste(invalid_tickers, collapse = ", ")))

      } else{
        rlang::abort(paste("The following tickers are not found:", paste(invalid_tickers, collapse = ", ")))
      }

    }

    ticker <- available_tickers
    # savedticker <- DNA_available_tickers
    # print(ticker)

    # Proceed with data retrieval for valid tickers
    combined_data <- as.data.frame(matrix(NA, ncol = 4, nrow = 0))
    names(combined_data) <- c("Date", "Price", "Volume", "Ticker")
    # print(length(combined_data))

    for (elm in 1:length(ticker)) {
      temp_data <- Ready.HcData.func(DNA_available_tickers[elm], from = from, to = to, stock_type = stock_type, escape = TRUE)

      if ("Volume" %in% names(temp_data)) {
        if(stock_type %in%  c('Fund', "F",'Etfs', "E",'Eq_Ind')){
          temp_data$Ticker <- ticker[elm]

        }else{
          temp_data$Ticker <- DNA_available_tickers[elm]
        }


      }else{
        temp_data$Volume  <- NA
        if(stock_type %in%  c('Fund', "F",'Etfs', "E",'Eq_Ind')){
          temp_data$Ticker <- ticker[elm]

        }else{
          temp_data$Ticker <- DNA_available_tickers[elm]
        }

      }



      # print(length(temp_data))
      # print(names(temp_data))
      combined_data <- rbind(combined_data, temp_data)
    }

    # data_list <- lapply(ticker, function(tick) {
    #   temp_data <- Ready.HcData.func(tick, from = from, to = to, stock_type = stock_type, escape = escape)
    #   temp_data$Ticker <- tick
    #   return(temp_data)
    # })



    # Combine the data frames
    # combined_data <- do.call(rbind, data_list)

    combined_data$Price = as.numeric(gsub(',|-',"", combined_data$Price))
    combined_data$Volume = as.numeric(gsub(',|-',"", combined_data$Volume))



    return(combined_data)

  } else {

    ticker <- toupper(ticker)
    # print(ticker)

    combined_data <- Ready.HcData.func(ticker = ticker, from = from, to = to, stock_type = stock_type, escape = escape)

    # print(head(combined_data))

    # If data is NULL, return error message
    if (length(combined_data) == 1) {
      # error_msg <- paste("Ticker", ticker, "not found")
      # return(list(error = error_msg, data = NULL))
      message("Ticker not found, please use an appropriate ticker!")
      return("Ticker not found")

    } else {
      # Otherwise, return the data
      # print(head(combined_data))

      return(combined_data)
    }

    return(combined_data)
  }
}




###################
# EN_Ticker_hcData <- function(ticker, escape = FALSE, stock_type = 'Eq_Ind', from = NULL, to = Sys.Date()){
#
#   if (is.null(from)) {
#     from <- as.Date("1970-01-01")  # Set a default value
#   } else {
#     from <- as.Date(strftime(from, format="%Y-%m-%d"))
#   }
#
#   # if (is.null(to)) {
#   #   to <- Sys.Date()
#   # } else {
#     to <- as.Date(strftime(to, format="%Y-%m-%d"))
#   # }
#
#     # if (!is.null(from)) {
#     #   if (!is.Date(from) || !is.Date(to)) {
#     #     rlang::abort("Both 'from' and 'to' must be of type Date.")
#     #   }
#     # }
#
#   if (from > to){
#     rlang::abort(
#       "The 'from' parameter must be equal to or less than 'to' parameter"
#     )
#   }
#
#
#   # Test if escape is True or False
#   if (escape %in% c(TRUE, FALSE)) {
#     if(escape == TRUE){
#       the_adn <- toupper(ticker)
#       # We can directly start
#       # Mettre tout le code ici
#
#       url <- paste0("https://live.euronext.com/intraday_chart/getChartData/",
#                     the_adn,
#                     "/max")
#
#       response <- httr::GET(url,
#                             # referrer = paste0("https://live.euronext.com/en/product/equities/",
#                             #                   the_adn),
#                             headers = list(
#                               "accept" = "*/*",
#                               "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
#                               "if-none-match" = "\"d49f47bc\"",
#                               "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
#                               "sec-ch-ua-mobile" = "?0",
#                               "sec-ch-ua-platform" = "\"Windows\"",
#                               "sec-fetch-dest" = "empty",
#                               "sec-fetch-mode" = "cors",
#                               "sec-fetch-site" = "same-origin",
#                               "x-requested-with" = "XMLHttpRequest"
#                             )
#                             # referrerPolicy = "strict-origin-when-cross-origin",
#                             # method = "GET",
#                             # mode = "cors",
#                             # credentials = "include"
#       )
#
#       if (status_code(response) == 200) {
#         # print("Statut ok")
#         # Best methode to get the ticker informations table
#         content <- httr::content(response, "text", encoding = "UTF-8")
#         data <- jsonlite::fromJSON(content)
#
#         data$time <- as.Date(data$time)
#
#         names(data) <- c("Date", "Price", "Volume")
#
#         data <- dplyr::as_tibble(data) %>%
#           dplyr::filter(Date >= from) %>%
#           dplyr::filter(Date <= to)
#
#         return(data)
#
#       } else {
#         warning("Error fetching data. HTTP status code: ", status_code(response))
#         return(NULL)
#       }
#
#
#     }else {
#       # In case escape is False
#       ticker <- toupper(ticker)
#
#       if(stock_type %in% c('Fund', "F")){
#         the_adn <-  EN_GetISIN_F(ticker)
#
#       } else if(stock_type %in% c('Bond', "B")){
#         the_adn <-  EN_GetISIN_B(ticker)
#
#       } else if(stock_type %in% c('Etfs', "E")){
#         the_adn <-  EN_GetISIN_Etf(ticker)
#
#       } else if(stock_type == 'Eq_Ind'){
#         the_adn <-  EN_GetISIN(ticker)
#
#       } else{
#         rlang::abort(
#           "Only parameters such us 'Eq_Ind' for Stocks and Indexes, 'Fund' or 'F' for Fund tickers, 'Bond' or 'B' for Bond tickers, and 'Etfs' or 'E' for EFTs are allowed."
#         )
#       }
#
#       # Mettre tout le code ici
#       if (the_adn != "Ticker not found") {
#         url <- paste0("https://live.euronext.com/intraday_chart/getChartData/",
#                       the_adn,
#                       "/max")
#
#         response <- httr::GET(url,
#                               headers = list(
#                                 "accept" = "*/*",
#                                 "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
#                                 "if-none-match" = "\"d49f47bc\"",
#                                 "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
#                                 "sec-ch-ua-mobile" = "?0",
#                                 "sec-ch-ua-platform" = "\"Windows\"",
#                                 "sec-fetch-dest" = "empty",
#                                 "sec-fetch-mode" = "cors",
#                                 "sec-fetch-site" = "same-origin",
#                                 "x-requested-with" = "XMLHttpRequest"
#                               ),
#                               referrer = paste0("https://live.euronext.com/en/product/equities/", the_adn),
#                               # referrerPolicy = "strict-origin-when-cross-origin",
#                               # method = "GET",
#                               # mode = "cors",
#                               # credentials = "include"
#         )
#
#         if (status_code(response) == 200) {
#           # print("Statut ok")
#           # Best methode to get the ticker informations table
#           content <- httr::content(response, "text", encoding = "UTF-8")
#           data <- jsonlite::fromJSON(content)
#
#           data$time <- as.Date(data$time)
#
#           names(data) <- c("Date", "Price", "Volume")
#
#           data <- dplyr::as_tibble(data) %>%
#             dplyr::filter(Date >= from) %>%
#             dplyr::filter(Date <= to)
#
#           return(data)
#
#         } else {
#           warning("Error fetching data. HTTP status code: ", status_code(response))
#           return(NULL)
#         }
#
#       } else {
#         return("Ticker not found")
#       }
#
#
#       # In case escape is False
#     }
#
#   } else{
#     rlang::abort(
#       "Only parameters T or F are allowed"
#     )
#   }
#
# }
#
###################
