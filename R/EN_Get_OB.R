#' Get Order Book Data
#'
#' This function retrieves the order book data for a given stock or Etf ticker on the Euronext exchange.
#' It provides information about the buy and sell orders, including the order quantity and price.
#' The data is returned as a data frame with columns representing buy (bid) and sell (ask) orders.
#' The last row of the data frame contains the sum of elements for each column (excluding "Bid_Price" and "Ask_Price" columns marked with "-").
#'
#' @param ticker A character string representing the company's (Equity or Etf) ticker, name, or ISIN.
#' @param stock_type   The type of the ticker: 'Equity' for Stocks and 'Etf' for EFTs.
#'
#' @return A data frame containing order book data with columns:
#'   - B_order: Buy order number
#'   - B_quantity: Buy order quantity
#'   - Bid_Price: Bid price
#'   - Ask_Price: Ask price
#'   - A_quantity: Ask order quantity
#'   - A_order: Ask order number
#'   If the specified ticker is not found, the function returns an error message.
#'
#' @examples
#'
#' library(httr)
#' library(jsonlite)
#' library(dplyr)
#' library(magrittr)
#' library(rvest)
#' library(stringr)
#'
#' ABCA_OB = EN_Get_OB("ABCA") # Get ABC ARBITRAGE ticker ORDER BOOK
#' print(ABCA_OB)
#'
#' MSFT_OB = EN_Get_OB("MSFT", stock_type = 'Etf')
#' print(MSFT_OB)
#'
#' # Get ETf 'AAPL' ORDER BOOK by providing its DNA
#' # EN_Get_OB("XS2337099563-XAMS", stock_type = 'Etf')
#'
#' # Get ETf 'LEVERAGE SHARES PLC' ORDER BOOK by providing its DNA
#' # EN_Get_OB("XS2663694847-XAMS", stock_type = 'Etf')
#'
#' ALBON_OB = EN_Get_OB("ALBON") # Get LEBON ticker ORDER BOOK
#' print(ALBON_OB)
#'
#' EN_Get_OB("ALBONgdg") # Will return "Ticker not found"
#'
#' @import httr
#' @import jsonlite
#' @import rvest
#' @importFrom magrittr %>%
#'
#' @family Data Retrieval
#' @family Euronext
#'
#' @seealso \code{\link{EN_GetProfile}} to retrieve the ISIN or DNA for a given ticker.
#' @export
#'


EN_Get_OB <- function(ticker,
                      stock_type = 'Equity'){

  ticker <- tolower(ticker)

  stock_type <- tolower(stock_type)

  if (length(ticker)!=1) {
    stop("Please provide a unique ticker.")
  }

  if (length(stock_type)!=1) {
    stop("Please provide a unique stock_type.")
  }

  # print(stock_type)
  if (stock_type %in% c('equity', 'etf')) {
    # print("ok")

    if (stock_type == 'equity') {
      # print("good")
      test_data <- EN_GetProfile(ticker, stock_type = 'Eq_Ind')
    } else {
      test_data <- EN_GetProfile(ticker, stock_type = 'Etfs')
    }
  } else {
    stop("Only parameters such as 'Equity' for Stocks and 'Etf' for EFTs are allowed.")
  }

  # # the_adn <-  EN_GetISIN(ticker)
  # if(stock_type %in% c('Equity', 'Etf')){
  #
  #   if(stock_type =='Equity'){
  #     test_data <-  EN_GetProfile(ticker, stock_type = 'Eq_Ind')
  #
  #     }else{
  #       test_data <-  EN_GetProfile(ticker, stock_type = 'Etfs')
  #       }
  #
  #   }else{
  #   stop("Only parameters such us 'Equity' for Stocks and 'Etf' for EFTs are allowed.")
  # }



  if (length(test_data)!=1) {

    the_adn <- test_data$DNA

    url <- paste0("https://live.euronext.com/en/ajax/getOrderBookCanvas/", the_adn)

    params <- c(
      # headers <- c(
      "accept" = "*/*",
      "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
      "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
      "sec-ch-ua-mobile" = "?0",
      "sec-ch-ua-platform" = "\"Windows\"",
      "sec-fetch-dest" = "empty",
      "sec-fetch-mode" = "cors",
      "sec-fetch-site" = "same-origin",
      "x-requested-with" = "XMLHttpRequest"
    )
    # Effectuer la requête POST
    response <- httr::POST(url, body = params, encode = "form")

    if (status_code(response) == 200) {

      # Make the GET request
      content <- httr::content(response, "text", encoding = "UTF-8")

      # Get the json data
      data <- jsonlite::fromJSON(content)

      # # Buy and sell order data
      # th_data <-  data$chart_data
      # names(th_data) <- c("Price", "Quantities")
      #
      # # Slip the buy and sell order data into bid and ask and their Qt
      # sell_order <-  th_data[1:10, ] #The ask
      # buy_order <-  th_data[11:20, ] #The bid


      if(length(data$table) == 0){
        stop("Unfortunately, despite the existence of the ticker, there is no order book available for it.")

      } else{
        the_table <- data$table
      }


      # Turn the_table into html form so that it will be easy to get each td element
      f_table <- read_html(the_table)

      tb_succes <- f_table %>% html_nodes("td.table-success") %>% html_text()
      tb_danger <- f_table %>% html_nodes("td.table-danger") %>% html_text()

      # To exclude all ask price and bid price td elements

      ## In case I need only Shares quantities
      # td_elm = f_table %>%html_nodes("td:not(.table-success):not(.table-danger)")%>% html_text()

      # Get all td elements
      all_td_elm = f_table %>%html_nodes("td")%>% html_text()

      # Replace thousand separator ","
      all_td_elm <- gsub(",", "", all_td_elm)

      all_td_elm <- gsub('<NA>', NA, all_td_elm)

      # Turn into numeric
      # all_td_elm <- as.numeric(all_td_elm)

      # Convert the vector to a matrix with 6 columns
      mat <- matrix(all_td_elm, ncol = 6, byrow = TRUE)

      # Convert the matrix to a data frame
      df <- as.data.frame(mat)

      # Rename the columns
      colnames(df) <- c("B_order", "B_quantity", "Bid_Price", "Ask_Price", "A_quantity", "A_order")

      df <- df %>%
        mutate_all(as.numeric)

      len_df <- nrow(df)
      add_row_df <- len_df + 1

      df[add_row_df, ] = NA

      df[add_row_df, 1] = sum(na.omit(df[1:len_df, 1]))
      df[add_row_df, 2] = sum(na.omit(df[1:len_df, 2]))
      df[add_row_df, 3] = "-"
      df[add_row_df, 4] = "-"
      df[add_row_df, 5] = sum(na.omit(df[1:len_df, 5]))
      df[add_row_df, 6] = sum(na.omit(df[1:len_df, 6]))

      # Deal with '<NA>' elements
      # df$Ask_Price <- gsub('<NA>', NA, df$Ask_Price)
      # df$Bid_Price <- gsub('<NA>', NA, df$Bid_Price)



      return(df)

    } else {
      warning("Error fetching data. HTTP status code: ", status_code(response))
      return(NULL)
    }

  } else {
    return("Ticker not found")
  }

}
