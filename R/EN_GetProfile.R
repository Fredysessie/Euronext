#' Retrieve the profile (characteristics) of a specified Equity, Index, Fund, ETF, or Bond listed on Euronext.
#'
#' This function retrieves the characteristic elements of a a Stock, Index, Etfs, Fund or Bond listed on Euronext
#' using the provided Symbol/Name/ISIN or DNA.
#'
#' @param ticker A character string representing the Stock's or an Index's ticker, name, or ISIN.
#' @param stock_type The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
#' @return A List (Name, ISIN, DNA, Symbol) representing the DNA of the Stock or an Index.
#' @examples
#'
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#' library(magrittr)
#'
#' # Note: For Equity, Index, Fund, and ETF, provide the giving Symbol, ISIN,
#' # Name, or DNA for best results, but for a Bond, provide its DNA and
#' # sometimes its Name for best results because a company or country
#' # can issue more than one Bond.
#'
#' ## Equities
#' # Example a : '3D SYSTEMS CORP' equity
#' EN_GetProfile("4ddd")  # By providing Symbol
#'
#' # Example b : 'ALFEN' equity
#' EN_GetProfile("NL0012817175") # By providing ISIN
#'
#' # Example c : 'LES HOTELS BAVEREZ' equity
#' EN_GetProfile("LES HOTELS BAVEREZ") # By providing Name
#'
#' # Example d : 'BE SEMICONDUCTOR' equity
#' EN_GetProfile("NL0012866412-XAMS") # By providing DNA
#'
#' ## Indices
#' # Example a : 'AEX CONS STAPL GR' Index
#' EN_GetProfile("NLCSG") # By providing Symbol
#'
#' # Example b : 'AEX All-Share Index' Index
#' EN_GetProfile("NL0000249100") # By providing ISIN
#'
#' # Example c : 'Euronext Core Europe 30 EW Decrement 5% NR' Index
#' EN_GetProfile("EN CE EW30 D 5% NR") # By providing Name
#'
#' # Example d : 'SBF 120 NR' Index
#' EN_GetProfile("QS0011131842-XPAR") # By providing DNA
#'
#' \donttest{
#'
#' # Funds
#' # Example a : 'ACOMEA PERFORMANCE' Fund
#' EN_GetProfile("ACAPER", stock_type = 'F') # By providing Symbol
#'
#' # Example b : 'BNP ESGNL' Fund
#' EN_GetProfile("BNP ESGNL", stock_type = 'F') # By providing Name
#'
#' # Example c : 'SWIF2' Fund
#' EN_GetProfile("NL0015000W40", stock_type = 'F') # By providing ISIN of SWIF2
#'
#' # Example d : 'GOLDMAN SACHS PARAPLUFONDS 2 N' Fund
#' EN_GetProfile("NL0000293181-XAMS", stock_type = 'F') # By providing DNA of GSDM5
#'
#'
#' ## ETFs
#' # Example a : 'Asia IG Corp US A' Etf
#' EN_GetProfile("$Asia IG Corp US A", stock_type = 'E') # By providing Name
#'
#' # Example b : '1X MSFT' Etf
#' EN_GetProfile("MSFT", stock_type = 'E') # By providing Symbol
#'
#' # Example c : '3X LONG COINBASE' Etf
#' EN_GetProfile("XS2399367254", stock_type = 'E') # By providing ISIN of 3X LONG COINBASE
#'
#' # Example d : '3X PLTR' Etf
#' EN_GetProfile("XS2663694680-XAMS", stock_type = 'E') # By providing DNA
#'
#'
#' # Examples for Bonds
#' # Example a: 'A2A SLB TF 0,625%' Bond
#' EN_GetProfile("XS2364001078-XMOT", stock_type = 'B') # By providing DNA
#'
#' # Example b: 'AAB1.50%30SEP30' Bond
#' EN_GetProfile("AAB1.50%30SEP30", stock_type = 'B') # By providing Name
#' }
#'
#' @import httr
#' @importFrom magrittr %>%
#' @export
#'

EN_GetProfile <- function(ticker, stock_type = 'Eq_Ind') {
  # Format the ticker to uppercase
  ticker <- toupper(unique(ticker))


  if(stock_type %in% c('Fund', "F")){
    dt_List <- EN_Funds_List()
    if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name, dt_List$Ticker_adn))) {
      # Replace "column_name" with the actual column name you want to retrieve
      the_adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
      the_symbol <- na.omit(dt_List$Ticker[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
      the_name <- na.omit(dt_List$Name[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
      the_isin <- na.omit(dt_List$Code_ISIN[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]


      return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))

    } else {
      return("Ticker not found")
    }

  } else if(stock_type %in% c('Bond', "B")){

    url = "https://live.euronext.com/en/pd/data/bond?mics=ALXB%2CALXL%2CALXP%2CXPAR%2CXAMS%2CXBRU%2CXLIS%2CXMLI%2CMLXB%2CENXB%2CENXL%2CTNLA%2CTNLB%2CXLDN%2CXHFT%2CVPXB%2CXOSL%2CXOAM%2CEXGM%2CETLX%2CMOTX%2CXMOT&display_datapoints=dp_bond&display_filters=df_bond"


    # Get numbers rows to calculate number on possible pages
    params <- list(
      "draw" = 3, #Permet de récupérer tout le tableau de la page
      "columns[0][data]" = 0,
      "columns[0][name]" = "",
      "search[value]" = "",
      "search[regex]" = "false",
      "args[initialLetter]" = "",
      # "start" = ifelse(start_value == 800, 800, 0),
      # "length" = 100,
      "iDisplayLength" = 100,
      "iDisplayStart" = 0,
      "sSortDir_0" = "asc",
      "sSortField" = "name"
    )

    response <- httr::POST(url, body = params, encode = "form")

    # Lire le contenu JSON de la réponse
    content <- httr::content(response, "text", encoding = "UTF-8")
    data <- jsonlite::fromJSON(content)

    length_rows <- data$iTotalDisplayRecords
    nb_pages <- ceiling(length_rows/100)

    start_values <- seq(0, nb_pages*100, 100)
    the_length_ <- length(start_values)
    start_values <- seq(0, nb_pages*100, 100)


    max_pages <- start_values[the_length_ - 1]  # Nombre maximum de pages à vérifier

    for (i in 1:(max_pages/100)) {
      dt_List <- EN_Bonds_List_bis(target_page = i)

      ticker = gsub("$","", toupper(ticker))

      dt_List$Name = gsub("$","", toupper(dt_List$Name))

      # dt_List$Name = gsub("-|$","", toupper(dt_List$Name))

      if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Issuer, dt_List$Name, dt_List$Ticker_adn))) {
        # adn <- na.omit(dt_List$Ticker_adn[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]

        the_adn <- na.omit(dt_List$Ticker_adn[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
        the_issuer <- na.omit(dt_List$Issuer[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
        the_name <- na.omit(dt_List$Name[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
        the_isin <- na.omit(dt_List$Code_ISIN[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]

        return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Issuer = the_issuer))
      }
    }

    return("Ticker not found")


  } else if(stock_type %in% c('Etfs', "E")){
    ticker <- toupper(ticker)

    # URL de la requête
    url <- "https://live.euronext.com/en/pd_es/data/track?mics=XAMS%2CXBRU%2CXLIS%2CXPAR%2CXLDN%2CXMSM%2CXOSL%2CETFP"

    # Get numbers rows to calculate number on possible pages
    params <- list(
      "draw" = 3, #Permet de récupérer tout le tableau de la page
      "columns[0][data]" = 0,
      "columns[0][name]" = "",
      "search[value]" = "",
      "search[regex]" = "false",
      "args[initialLetter]" = "",
      "iDisplayLength" = 100,
      "iDisplayStart" = 0,
      "sSortDir_0" = "asc",
      "sSortField" = "name"
    )

    response <- httr::POST(url, body = params, encode = "form")

    # Lire le contenu JSON de la réponse
    content <- httr::content(response, "text", encoding = "UTF-8")
    data <- jsonlite::fromJSON(content)

    length_rows <- data$iTotalDisplayRecords
    nb_pages <- ceiling(length_rows/100)

    start_values <- seq(0, nb_pages*100, 100)
    the_length_ <- length(start_values)
    start_values <- seq(0, nb_pages*100, 100)


    max_pages <- start_values[the_length_ - 1]  # Nombre maximum de pages à vérifier

    for (i in 1:(max_pages/100)) {
      # print(i)
      dt_List <- EN_Etfs_List_bis(target_page = i)

      if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name, dt_List$Ticker_adn))) {
        # print('ok')
        # Filter
        ticker = gsub("$","", toupper(ticker))
        # ticker = gsub("-|$","", toupper(ticker))

        dt_List$Name = gsub("$","", toupper(dt_List$Name))
        # dt_List$Name = gsub("-|$","", toupper(dt_List$Name))

        the_adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
        the_symbol <- na.omit(dt_List$Ticker[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
        the_name <- na.omit(dt_List$Name[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
        the_isin <- na.omit(dt_List$Code_ISIN[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]

        return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))

      }
    }

    return("Ticker not found")

  } else if(stock_type == 'Eq_Ind'){

    # Construct the URL for the API request
    url <- paste0("https://live.euronext.com/en/instrumentSearch/searchJSON?q=", ticker)

    # Make the fetch request
    response <- httr::GET(url,
                          add_headers(
                            "accept" = "application/json, text/javascript, */*; q=0.01",
                            "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
                            "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
                            "sec-ch-ua-mobile" = "?0",
                            "sec-ch-ua-platform" = "\"Windows\"",
                            "sec-fetch-dest" = "empty",
                            "sec-fetch-mode" = "cors",
                            "sec-fetch-site" = "same-origin",
                            "x-requested-with" = "XMLHttpRequest"
                          ),
                          # referrer = "https://live.euronext.com/en/search_instruments/us88554d2053?restMic",
                          referrerPolicy = "strict-origin-when-cross-origin"
    )

    # Check if the request was successful (status code 200)
    if (status_code(response) == 200) {
      # Parse the JSON content
      content <- httr::content(response, "text", encoding = "UTF-8")
      data <- jsonlite::fromJSON(content)

      # Extract and return the ISIN
      if (!is.null(data) && data$value[1] != "") {
        # print(length(data))
        # print(data$value[1])
        # print(data$mic[1])
        the_isin = data$value[1]
        the_name  = data$name[1]
        the_adn <- paste0(data$value[1], "-", data$mic[1])
        # Extract 'symbol' using regular expressions
        the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label[1])


        return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
      } else {
        ticker1 <- sub("-.*", "", ticker)
        # Construct the URL for the API request
        url <- paste0("https://live.euronext.com/en/instrumentSearch/searchJSON?q=", ticker1)

        # Make the fetch request
        response <- httr::GET(url,
                              add_headers(
                                "accept" = "application/json, text/javascript, */*; q=0.01",
                                "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
                                "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
                                "sec-ch-ua-mobile" = "?0",
                                "sec-ch-ua-platform" = "\"Windows\"",
                                "sec-fetch-dest" = "empty",
                                "sec-fetch-mode" = "cors",
                                "sec-fetch-site" = "same-origin",
                                "x-requested-with" = "XMLHttpRequest"
                              ),
                              # referrer = "https://live.euronext.com/en/search_instruments/us88554d2053?restMic",
                              referrerPolicy = "strict-origin-when-cross-origin"
        )

        # Check if the request was successful (status code 200)
        if (status_code(response) == 200) {
          # Parse the JSON content
          content <- httr::content(response, "text", encoding = "UTF-8")
          data <- jsonlite::fromJSON(content)
          # Extract and return the ISIN
          if (!is.null(data) && data$value[1] != "") {
            # print(length(data))
            # print(data$value[1])
            # print(data$mic[1])
            the_isin = data$value[1]
            the_name  = data$name[1]
            the_adn <- paste0(data$value[1], "-", data$mic[1])
            # Extract 'symbol' using regular expressions
            the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label[1])


            return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))

          } else{
            return("Ticker not found")
          }
        } else {
          # If the request was not successful, print a warning and return NULL
          warning("Error fetching data. HTTP status code: ", status_code(response))
          return(NULL)
        }

    }

  } else {
    # If the request was not successful, print a warning and return NULL
    warning("Error fetching data. HTTP status code: ", status_code(response))
    return(NULL)
  }
    } else{
    rlang::abort(
      "Only parameters such us 'Eq_Ind' for Stocks and Indexes, 'Fund' or 'F' for Fund tickers, 'Bond' or 'B' for Bond tickers, and 'Etfs' or 'E' for EFTs are allowed."
    )
  }


}


# EN_GetISIN_bis <- function(ticker) {
#   # Format the ticker to uppercase
#   ticker <- toupper(ticker)
#
#   # Construct the URL for the API request
#   url <- paste0("https://live.euronext.com/en/instrumentSearch/searchJSON?q=", ticker)
#
#   # Make the fetch request
#   response <- httr::GET(url,
#                         add_headers(
#                           "accept" = "application/json, text/javascript, */*; q=0.01",
#                           "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
#                           "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
#                           "sec-ch-ua-mobile" = "?0",
#                           "sec-ch-ua-platform" = "\"Windows\"",
#                           "sec-fetch-dest" = "empty",
#                           "sec-fetch-mode" = "cors",
#                           "sec-fetch-site" = "same-origin",
#                           "x-requested-with" = "XMLHttpRequest"
#                         ),
#                         # referrer = "https://live.euronext.com/en/search_instruments/us88554d2053?restMic",
#                         referrerPolicy = "strict-origin-when-cross-origin"
#   )
#
#   # Check if the request was successful (status code 200)
#   if (status_code(response) == 200) {
#     # Parse the JSON content
#     content <- httr::content(response, "text", encoding = "UTF-8")
#     data <- jsonlite::fromJSON(content)
#
#     # Extract and return the ISIN
#     if (!is.null(data) && data$value[1] != "") {
#       # print(length(data))
#       # print(data$value[1])
#       # print(data$mic[1])
#       the_isin = data$value[1]
#       the_name  = data$name[1]
#       the_adn <- paste0(data$value[1], "-", data$mic[1])
#       # Extract 'symbol' using regular expressions
#       the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label[1])
#
#       return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
#     } else {
#       return("Ticker not found")
#     }
#   } else {
#     # If the request was not successful, print a warning and return NULL
#     warning("Error fetching data. HTTP status code: ", status_code(response))
#     return(NULL)
#   }
# }

