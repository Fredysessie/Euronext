#' Retrieve Historical Stock Data from Euronext (Bis)
#'
#' This function fetches historical stock data from Euronext based on the given list of
#' tickers or ISINs. You can specify a date range using the 'from' and 'to' parameters.
#' Additionally, provide the type of the ticker as 'Eq_Ind' for Stocks and Indexes,
#' 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers,
#' and 'Etfs' or "E" for ETFs.
#'
#' @param ticker A character vector or list representing the company's ticker, name, or ISIN.
#'               It can be a single ticker or a list of tickers.
#' @param from   The start date for historical data (default: 2 years ago).
#'               Only dates not exceeding 2 years ago are allowed for the 'from' parameter.
#' @param to     The end date for historical data (default: yesterday).
#' @param stock_type   The type of the ticker: 'Eq_Ind' for Stocks and Indexes,
#'                     'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers,
#'                     and 'Etfs' or "E" for ETFs.
#' @param escape Boolean, either TRUE or FALSE. If escape is TRUE, it means you're providing
#'               the DNA (ISIN-Market identifier) directly. Giving TRUE to escape is helpful
#'               to avoid time-consuming operations; otherwise, FALSE means you need to provide
#'               the Ticker symbol, name, or ISIN and the type of market to which it belongs.
#'
#' @return A data frame containing historical stock data, including columns for Date,
#'         Open, High, Low, Last, Close, 'Number of shares', Turnover, and VWAP.
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
#' # Fetch historical data for ABCA , AEDIFICA and BM3EAC stocks from October 30, 2023
#' hc_List1 <- EN_HistData_bis(c("ABCA", "AEDIFICA", "BM3EAC"), from = "2023-10-30", to = "2024-01-27")
#' head(hc_List1)
#'
#' # Fetch historical data for Indices such us AEX All-Share Index, AEX2S and AEX Basic Materials
#' hc_List2 <- EN_HistData_bis(c("AAX", "QS0011016480", "AEX2S"), from = "2023-12-15", to = Sys.Date())
#' head(hc_List2)
#'
#' #To get historical data of Bond issued by IT0005386716-XMOT
#' hc_List3 <-EN_HistData_bis("XS1548458014-XAMS", escape = TRUE, from = "2022-10-30",stock_type = "B")
#' head(hc_List3)
#'
#' # Fetch historical data for ABCA with the default date range
#' hc_List3 <-  EN_HistData_bis("ABCA")
#' head(hc_List3)
#'
#' # To Get KGHDF's Fund data
#' hc_List4 <- EN_HistData_bis("KGHDF", stock_type = "F", from = "2022-10-30")
#' head(hc_List4)
#'
#' #Providing Etfs vector
#' hc_etf <- EN_HistData_bis(c("IE0007G78AC4", "MANA", "3TSM"), stock_type = 'E')
#' head(hc_etf)
#'
#' EN_HistData_bis("ABCAhh") # Will return "Ticker not found"
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

EN_HistData_bis <- function(ticker, from = Sys.Date() - 365*2, to = Sys.Date() - 1, stock_type = 'Eq_Ind', escape = FALSE) {

  # Créer une fonction pour récupérer les données historiques pour un seul ticker
  get_single_hist_data <- function(tick, from, to, stock_type, escape) {
    # Appeler EN_HistData pour un seul ticker
    temp_data <- EN_HistData(tick, from = from, to = to, stock_type = stock_type, escape = escape)
    # Ajouter la colonne Ticker au résultat
    temp_data$Ticker <- tick
    return(temp_data)
  }


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

  ticker = unique(toupper(ticker))

  # Check if ticker is a list
  if (length(ticker) > 1) {
    # Verify each ticker in the list
    available_tickers <- c()
    DNA_available_tickers <- c()
    invalid_tickers <- c()
    for (elm in ticker) {

      test_tickers <- EN_GetProfile(elm, stock_type = stock_type)

      # if (test_tickers != "Ticker not found") {
      if (length(test_tickers) == 4) {
        # test_tickers = test_tickers$Symbol
        # available_tickers  <- c( test_tickers, available_tickers)

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



    # available_tickers <- EN_GetISIN_bis()$Ticker
    # invalid_tickers <- ticker[!(ticker %in% available_tickers)]
    if (length(invalid_tickers) > 0) {
      if(length(invalid_tickers) == 1){
        rlang::abort(paste("The following ticker is not found:", paste(invalid_tickers, collapse = ", ")))

      } else{
        rlang::abort(paste("The following tickers are not found:", paste(invalid_tickers, collapse = ", ")))
      }
    }

    ticker <- available_tickers
    # print(ticker)

    # Proceed with data retrieval for valid tickers
    combined_data <- as.data.frame(matrix(NA, ncol = 10, nrow = 0))
    names(combined_data) <- c("Date", "Open", "High", "Low", "Last", "Close", "Number of shares",
      "Turnover", "VWAP", "Ticker")
    # print(length(combined_data))

    for (elm in 1:length(ticker)) {
      # CHange to
      # temp_data <- get_single_hist_data(element, from = from, to = to, stock_type = stock_type, escape = escape)
      #
      # if ("VWAP" %in% names(temp_data)) {
      #   temp_data$Ticker <- element
      #
      # }else{
      #   temp_data$VWAP  <- NA
      #   temp_data$Ticker <- element
      #
      # }

      temp_data <- get_single_hist_data(DNA_available_tickers[elm], from = from, to = to, stock_type = stock_type, escape = TRUE)

      if ("VWAP" %in% names(temp_data)) {
        if(stock_type %in%  c('Fund', "F",'Etfs', "E",'Eq_Ind')){
          temp_data$Ticker <- ticker[elm]

        }else{
          temp_data$Ticker <- DNA_available_tickers[elm]
        }


      }else{
        temp_data$VWAP  <- NA
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
    #   temp_data <- get_single_hist_data(tick, from = from, to = to, stock_type = stock_type, escape = escape)
    #   temp_data$Ticker <- tick
    #   return(temp_data)
    # })



    # Combine the data frames
    # combined_data <- do.call(rbind, data_list)

    combined_data$Open = as.numeric(gsub(',|-',"", combined_data$Open))
    combined_data$High = as.numeric(gsub(',|-',"", combined_data$High))
    combined_data$Low = as.numeric(gsub(',|-',"", combined_data$Low))
    combined_data$Last = as.numeric(gsub(',|-',"", combined_data$Last))
    combined_data$Close = as.numeric(gsub(',|-',"", combined_data$Close))


    return(combined_data)

  } else {

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

          stock_data$Open = as.numeric(gsub(',|-',"", stock_data$Open))
          stock_data$High = as.numeric(gsub(',|-',"", stock_data$High))
          stock_data$Low = as.numeric(gsub(',|-',"", stock_data$Low))
          stock_data$Last = as.numeric(gsub(',|-',"", stock_data$Last))
          stock_data$Close = as.numeric(gsub(',|-',"", stock_data$Close))

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

            stock_data$Open = as.numeric(gsub(',|-',"", stock_data$Open))
            stock_data$High = as.numeric(gsub(',|-',"", stock_data$High))
            stock_data$Low = as.numeric(gsub(',|-',"", stock_data$Low))
            stock_data$Last = as.numeric(gsub(',|-',"", stock_data$Last))
            stock_data$Close = as.numeric(gsub(',|-',"", stock_data$Close))


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
        "Only parameters T or F are allowed"
      )
    }
  }
}
