#' Get Ticker latest news (recent information)
#'
#' This function retrieves the update information of a company listed on the Euronext exchange
#' based on its ticker symbol. It returns a table with details such as its real Name, ISIN,
#' Last traded Price, Date of last update, and other relevant informations.
#'
#'
#' @param ticker A character string representing the company's ticker, name, or ISIN.
#' @param stock_type   The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers,
#'                    'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
#' @param escape Boolean, either TRUE or FALSE. If escape is True, it means you're providing the DNA
#'               (ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming
#'               operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN
#'               and the type of market to which it belongs.
#'
#' @return A data frame containing historical performance data of the specified company.
#' If the ticker is not found, it returns the message "Ticker not found."
#'
#' @examples
#' \donttest{
#' library(httr)
#' library(httr2)
#' library(rvest)
#' library(jsonlite)
#' library(stringr)
#' library(rlang)
#'
#' # Equities ex "NL0000852564-XAMS"
#' # Stock AALBERTS N.V.
#' equity_new <- EN_Get_News("NL0000852564-XAMS", escape = TRUE)
#' print(equity_new)
#'
#' #ABO GROUP ENVIRONMENT Stock
#' equity_new1 <- EN_Get_News("ABO")
#' print(equity_new1)
#'
#' # Indexes
#' # AEX All-Share Index GR
#' index_new <- EN_Get_News("QS0011224977-XAMS", escape = TRUE)
#' print(index_new)
#' # AEX X12 Short GR Index
#' index_new1 <- EN_Get_News("AE12S")
#' print(index_new1)
#'
#' # Fund
#' # Fund KEMPEN ORANGE FUND N.V.
#' fund_new <- EN_Get_News("KORAF", stock_type = "F")
#' print(fund_new)
#'
#' # Fund of ASN DUURZAAM MIXFONDS ZEER DEFENSIEF
#' fund_new1 <- EN_Get_News("NL0014270274-XAMS", escape = TRUE, stock_type = "F")
#' print(fund_new1)
#'
#' # Etfs cases
#' # 21Shares Stacks Staking ETP
#' etf_new <- EN_Get_News("CH1258969042-XAMS", escape = TRUE, stock_type = 'E')
#'
#' # Leverage Shares 2x Long Berkshire Hathaway (BRK-B) ETP Securities
#' etf_new1 <- EN_Get_News("2BRK", stock_type = "E")
#'
#' # Bond A2A 1.75% CALL 25FB25
#' bd_new <- EN_Get_News("XS1195347478-ETLX", escape = TRUE)
#' print(bd_new)
#' # Bond AAB0.45%12DEC2036
#' bd_new1 <- EN_Get_News("XS2093705064-XAMS", escape = TRUE)
#' print(bd_new1)
#' }
#'
#' @family Infos Retrieval
#' @family Euronext
#'
#' @seealso \code{\link{EN_GetISIN}} to get DNA of a giving Company or Index Ticker/Name/ISIN
#'          (Fund, Bond, and ETF are excluded), \code{\link{EN_GetISIN_Etf}} to get the ISIN of
#'          a giving ETFs DNA, \code{\link{EN_GetISIN_B}} to get a giving Bond DNA,
#'          \code{\link{EN_GetISIN_F}} to get a giving Fund DNA.
#'
#' @import httr
#' @importFrom magrittr %>%
#' @importFrom stringr str_split
#' @export

EN_Get_News <- function(ticker, escape = FALSE, stock_type = 'Eq_Ind') {

  test_ready <- function(the_adn) {

    url <- paste0("https://live.euronext.com/en/ajax/getDetailedQuote/", the_adn)

    headers <- c(
      "accept" = "*/*",
      "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
      "content-type" = "application/x-www-form-urlencoded; charset=UTF-8",
      "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
      "sec-ch-ua-mobile" = "?0",
      "sec-ch-ua-platform" = "\"Android\"",
      "sec-fetch-dest" = "empty",
      "sec-fetch-mode" = "cors",
      "sec-fetch-site" = "same-origin",
      "x-requested-with" = "XMLHttpRequest"
    )


    body <- list(
      "theme_name"="euronext_live")

    response <- httr::POST(url,
                           headers = headers,
                           # referrer = referrer,
                           body = body,
                           encode = "form"
                           # mode = "cors",
                           # credentials = "include"
    )

    # Effectuer la requête POST
    # response <- httr::POST(url, body = params, encode = "form")

    if (status_code(response) == 200) {

      # Make the GET request
      content <- httr::content(response, "text", encoding = "UTF-8")

      doc <- read_html(content)

      # Chaque test
      # Tester si ça donne NA
      # Par exemple
      # is.na(doc %>%
      #         html_node("#header-instrument-price1") %>%
      #         html_text(trim = TRUE))

      # Debut de l'extration
      # Cours qui s'affiche en haut
      # 1-a Extraire les informations ie Labels pour chaque devise ie tous les nodes html_nodes
      banner_info  <- doc %>%
        html_nodes(".d-inline-block strong") %>%
        html_text(trim = TRUE)

      # [1] "AEX"       "EUR / USD" "EUR / GBP" "AMX"

      # 1-b Extraire les informations pour chaque devise
      currency_info <- doc %>%
        html_nodes(".d-inline-block") %>%
        html_text(trim = TRUE)

      # 1-c Utiliser une expression régulière pour extraire les chiffres, points, tirets et pourcentages
      numbers <- gsub("[^0-9.%-]+", "", currency_info)

      # 1-d Create a data frame
      # currency_df <- data.frame(Currency = banner_info, Value = numbers, stringsAsFactors = FALSE)
      # Les élements du premiers dataframe
      currency_df <- data.frame(Information = banner_info, Value = numbers, stringsAsFactors = FALSE)

      # Print the data frame
      # print(currency_df)

      # Or Create a named list
      # currency_list <- setNames(numbers, banner_info)
      # print(currency_list)

      All_labels = c()
      All_values = c()

      # Les élements du deuxième dataframe

      # 2-a Extraire les données "Header Instrument Name" ie mettre le Label "Name"
      # The "#" before the character means type id
      header_instrument_name <- doc %>%
        html_node("#header-instrument-name strong") %>%
        html_text(trim = TRUE)
      # [1] "AALBERTS N.V."

      if (!is.na(header_instrument_name)) {
        All_labels = c(All_labels, "Name")
        All_values = c(All_values, header_instrument_name)
      }

      # 2-b Extraire les données "address__text" ie Market, ISIN and type

      address_text <- doc %>%
        html_node(".address__text") %>%
        html_text(trim = TRUE)
      # [1] "Euronext Amsterdam\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tNL0000852564\n\t\t\t\t\t\t\t\t\t-\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tStock"
      address_text <- gsub("\t", "", address_text)
      address_text <- str_split(address_text, "\n")

      # address_text[c(2,4)]
      address_text <- address_text[[1]]
      # address_text <- gsub("\n", " ", address_text)
      # Ne considérer

      if(length(address_text)==4){

        belong_the_lab = address_text[1]
        # All_labels = c(All_labels, "Belongs to", "ISIN", "Type")
        All_values = c(All_values, belong_the_lab, address_text[c(2,4)])

      } else if(length(address_text)==5){

        belong_the_lab = address_text[1]
        # All_labels = c(All_labels, "Belongs to" "ISIN", "Type")

        All_values = c(All_values, belong_the_lab, address_text[c(2,4)])

      } else if(length(address_text)==6){

        belong_the_lab = paste0(address_text[1], " and ", address_text[3])
        # All_labels = c(All_labels, "Belongs to" "ISIN", "Type")

        All_values = c(All_values, belong_the_lab, address_text[c(4,6)])
      }

      All_labels = c(All_labels, "Belongs to", "ISIN", "Type")

      # 3- Extraire les données mettre le Label "Last traded Price"
      header_instrument_price <- doc %>%
        html_node("#header-instrument-price") %>%
        html_text(trim = TRUE)

      # [1] "36.73"
      if (!is.na(header_instrument_price)) {
        All_labels = c(All_labels, "Last traded Price")
        All_values = c(All_values, header_instrument_price)
      }

      # # 2b- Extraire les données "Symbol" ie Ticker equivalent de 2-a #Ne fonctionne pas pour tous donc tester pour voir
      # # The "." before the character means type classe
      # symbol <- doc %>%
      #   html_node(".enx-symbol-top-custom") %>%
      #   html_text(trim = TRUE)

      # 4- Extraire les données "Last Level" ie Time of Last update
      last_level <- doc %>%
        html_node(".last-price-date-time") %>%
        html_text(trim = TRUE)
      # [1] "01/02/2024 - 17:35\n\t\t\t\t\t\t\t\t\t\t\t\t CET"

      last_level <- gsub("\t", "", last_level)
      last_level <- gsub("\n", "", last_level)
      # [1] "01/02/2024 - 17:35 CET"

      if (!is.na(last_level)) {
        All_labels = c(All_labels, "Date of last update")
        All_values = c(All_values, last_level)
      }

      # 5- Extraire tous les nodes ".text-ui-grey-1" ie depuis Since open to best bid ans sell
      all_elts = doc %>%
        html_nodes(".text-ui-grey-1") %>%
        html_text(trim = TRUE)

      # [1] "Since Open"
      # [2] "(-0.19%)"
      # [3] "Since Previous Close"
      # [4] "(-0.68%)"
      # [5] "Valuation Close"
      # [6] "01/02/2024 - 17:55\n  \t\t\t\t\t\t\t\t\t\t\t\t\t\t CET"
      # [7] "Best Bid"
      # [8] "Best Ask"
      # [9] "01/02/2024 - 17:40\n\t\t\t\t\t\t\t\t\t\t\t\t\t CET"


      # 6- Extraire les données "Since Open"
      since_open_value <- doc %>%
        html_node(".text-ui-grey-1:contains('Since Open') + span") %>%
        html_text(trim = TRUE)

      if(!is.na(since_open_value)){
        # Tester s'il existe "Since Open"
        if ("Since Open" %in% all_elts) {
          nber_ = which(all_elts == "Since Open")
          final_since_open_value = paste0(since_open_value, " ", all_elts[nber_+1])

        }else{
          final_since_open_value = since_open_value

        }
        All_labels = c(All_labels, "Since Open")
        All_values = c(All_values, final_since_open_value)

      }


      # 7- Extraire les données "Since Previous Close"
      since_prev_close_value <- doc %>%
        html_node(".text-ui-grey-1:contains('Since Previous Close') + span") %>%
        html_text(trim = TRUE)

      if(!is.na(since_prev_close_value)){
        # Tester s'il existe "Since Previous Close"
        if ("Since Previous Close" %in% all_elts) {
          nber_1 = which(all_elts == "Since Previous Close")
          final_since_prev_close_value = paste0(since_prev_close_value, " ", all_elts[nber_1+1])

        } else{
          final_since_prev_close_value = since_prev_close_value

        }
        All_labels = c(All_labels, "Since Previous Close")
        All_values = c(All_values, final_since_prev_close_value)

      }

      # Tester s'il existe "Valuation Close"
      test_val = doc %>%
        html_node("#col-header-instrument-price") %>%
        html_text(trim = TRUE)

      if (!is.na(test_val)) {
        # Val_close = test_val
        All_labels = c(All_labels, "Valuation Close")
        All_values = c(All_values, test_val)
      }

      the_bid = doc %>%
        html_node(".text-ui-grey-1:contains('Best Bid') + span") %>%
        html_text(trim = TRUE)

      if (!is.na(the_bid)) {
        All_labels = c(All_labels, "Best Bid")
        All_values = c(All_values, the_bid)
      }

      the_ask = doc %>%
        html_node(".text-ui-grey-1:contains('Best Ask') + span") %>%
        html_text(trim = TRUE)

      if (!is.na(the_bid)) {
        All_labels = c(All_labels, "Best Ask")
        All_values = c(All_values, the_ask)
      }


      # Equities ex "NL0000852564-XAMS"
      # Name, ISIN, Type, Since Previous Close, Since Open, Last traded Price, Best Bid, Best Ask

      # Indexes et Funds ie 2 indices "QS0011224977-XAMS" "NL0011515408-XAMS" et Fund "NL0014270274-XAMS"
      # Name, ISIN, Type, Since Previous Close, Since Open, Last level(Indice) mais Last traded Price(Funds)

      # Etf,  "CH1304867455-XAMS"
      # Name, ISIN, Type, Since Previous Close, Since Open, Valuation trade, Valuation Close

      # Bonds "IT0005386724-XMOT"
      # Name, ISIN, Type, Last traded Price, Valuation Close

      final_df <- data.frame(Information = All_labels, Detail = All_values, stringsAsFactors = FALSE)


      return(final_df)

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
          final_dt = test_ready(the_adn)

          # A new test
          if (final_dt[4,2] == "Index"){
            # if ("Index" %in% final_dt$Detail) {
            final_dt[5,1] = "Last level"

          } else if (final_dt[4,2] == "Trackers") {
            final_dt[5,1] = "Valuation trade"

          } else {
            if (final_dt[4,2] == "Bond" && nrow(final_dt) == 5) {
              final_dt[5,1] = "Valuation Close"
            }else{
              final_dt[5,1] = "Last traded Price"
            }


          }

          return(final_dt)
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
