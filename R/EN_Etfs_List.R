#' Get the list of Etfs quoted on Euronext markets
#'
#' This function retrieves information about Etfs quoted on Euronext markets.
#'
#' @param tot_page Total number of pages to retrieve. It can be a numerical value, 'Max' to designate the maximum number of pages, or the default value is 5.
#'
#' @family Infos Retrieval
#'
#' @seealso \code{\link{EN_Stocks_List}} to get the list tickers infos quoted on a given Euronext Stock,
#'  \code{\link{EN_Bonds_List}} for Bonds list,  \code{\link{EN_Indices_List}} for Indexes list,
#'  \code{\link{EN_GetISIN_Etf}}  to get the ADN(Isin and Market indentifier) of a givin Etf.
#'
#' @return A data frame containing information about Etfs, including name, ticker, ISIN code, market, last price, percentage change, and URL.
#'
#' @examples
#'
#' \donttest{
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#'
#' dt_ = EN_Etfs_List(1) # To show only 1 page ie recent 100 bonds list
#' print(dt_)
#'
#' dt_1 = EN_Etfs_List() # To show only 5 pages ; defaut parameter
#' tail(dt_1)
#'
#' dt_max = EN_Etfs_List("Max") # To show the list of all Etfs listed on Euronext
#' head(dt_max)
#'}
#'
#' @import httr
#' @import jsonlite
#' @import rvest
#' @import stringr
#'
#' @export
#'


EN_Etfs_List <- function(tot_page = 5) {
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


  is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) abs(x - round(x)) < tol

  if (is.character(tot_page)) {
    if (str_to_title(tot_page) == 'Max') {
      response <- httr::POST(url, body = params, encode = "form")

      # Lire le contenu JSON de la réponse
      content <- httr::content(response, "text", encoding = "UTF-8")
      data <- jsonlite::fromJSON(content)

      length_rows <- data$iTotalDisplayRecords
      nb_pages <- ceiling(length_rows/100)

      start_values <- seq(0, nb_pages*100, 100)
      the_length_ <- length(start_values)
      start_values <- seq(0, nb_pages*100, 100)[-the_length_]
    } else {
      rlang::abort("The total number of pages must be a numerical value or 'Max' to designate the maximum number of pages.")
    }
  } else if (is.numeric(tot_page)) {
    if (tot_page > 0 && is.wholenumber(tot_page)) {
      # Effectuer la requête POST
      response <- httr::POST(url, body = params, encode = "form")

      # Lire le contenu JSON de la réponse
      content <- httr::content(response, "text", encoding = "UTF-8")
      data <- jsonlite::fromJSON(content)

      length_rows <- data$iTotalDisplayRecords
      nb_pages <- ceiling(length_rows/100)

      if (tot_page > nb_pages) {
        rlang::abort(paste0('Only total number of pages less than or equal to ', nb_pages, ' are allowed.'))
      } else {
        start_values <- seq(0, tot_page*100, 100)
        the_length_ <- length(start_values)
        start_values <- seq(0, tot_page*100, 100)[-the_length_]
      }
    } else {
      rlang::abort('The total page must be a positive whole number!')
    }
  } else {
    rlang::abort('The total page must be a positive whole number!')
  }

  # print(nb_pages)

  # print(start_values)
  result_df <- as.data.frame(matrix(NA, ncol = 8, nrow = 0))

  for (start_value in start_values) {

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
      "iDisplayStart" = start_value,
      "sSortDir_0" = "asc",
      "sSortField" = "name"
    )

    # Effectuer la requête POST
    response <- httr::POST(url, body = params, encode = "form")

    # Lire le contenu JSON de la réponse
    content <- httr::content(response, "text", encoding = "UTF-8")
    data <- jsonlite::fromJSON(content)

    # Les liens https des sociétés
    les_link = data[["aaData"]][,1]
    # les_link = data[["aaData"]][,2]
    # Extraire les URL avec une expression régulière
    urls <- paste0("https://live.euronext.com", regmatches(les_link, regexpr("(?<=href=')(.*?)(?=')", les_link, perl=TRUE)))

    data_order_values <- str_extract_all(les_link, "data-order='([^']+)'")
    data_order_values <- gsub("data-order='", "",data_order_values)
    data_order_values <- gsub("'", "",data_order_values)


    # Le code ISIN
    les_code_isin = data[["aaData"]][,2]

    # Les Tickers
    les_tickers = data[["aaData"]][,3]

    # Market
    # Mieux étudier cette partie
    les_markets = data[["aaData"]][,4]

    # Utiliser str_match pour capturer le contenu entre les balises
    matched_markets <- str_match(les_markets, ">([^<]+)</div>")
    # Sélectionner la deuxième colonne du résultat
    extracted_markets <- matched_markets[, 2]

    les_BidAsk= data[["aaData"]][,5]
    les_BidAsk= str_extract(les_BidAsk, ">([^<]+)<")
    les_BidAsk = gsub(">", "", les_BidAsk)
    les_BidAsk = gsub("<", "", les_BidAsk)

    # Créer deux nouvelles variables Bid et Ask
    the_Bid = ifelse(les_BidAsk == "/", "-", str_extract(les_BidAsk, "^[^/]+"))
    the_Ask = ifelse(les_BidAsk == "/", "-", str_extract(les_BidAsk, "[^/]+$"))

    # Closing price
    Closing_Prices = data[["aaData"]][,6]
    # Utiliser str_extract avec regex pour capturer les chiffres
    # Get the symbol of currency
    extracted_currencies <- str_extract(Closing_Prices, "(USD|EUR)")

    # Old version
    # extracted_currencies <- ifelse(extracted_currencies == "EUR", "€", "$")

    # Gerer les caractère non-ASCII
    extracted_currencies <- ifelse(extracted_currencies == "EUR", "\u20AC", "\u24")
    extracted_prices <- str_extract(Closing_Prices, "[0-9]+\\.?[0-9]*")

    # Convertir en nombre et symbole
    extracted_prices_numeric <- paste0(extracted_currencies, extracted_prices)
    # extracted_prices_numeric <- as.numeric(extracted_prices)

    # Percentage change
    les_pchange = data[["aaData"]][,7]
    # Utiliser str_extract avec regex pour capturer le nombre avant "</span></div>"
    extracted_pchange <- str_extract(les_pchange, "([0-9.-]+)%")
    # Enlever les pourcentages
    extracted_pchange <- gsub("%", "", extracted_pchange)

    # Last update hours
    les_LastupDate = data[["aaData"]][,8]
    # Utiliser str_match avec regex pour extraire la date et l'heure
    Clean_Date <- gsub("<span class=\"tooltiptext\">", "-", les_LastupDate)
    sav_Clean_Date <- str_split(Clean_Date, "-", simplify = TRUE)

    # for (i in 1:nrow(sav_Clean_Date)){
    #   # Remettre en ordre la date
    #   if (nchar(sav_Clean_Date[i,1])> nchar(sav_Clean_Date[i,2])) {
    #     Clean_Date[i] = paste0(sav_Clean_Date[i,1]," ", sav_Clean_Date[i,2])
    #   } else{
    #     Clean_Date[i] = paste0(sav_Clean_Date[i,2]," ", sav_Clean_Date[i,1])
    #   }
    # }

    # Define elements to remove
    elements_to_remove <- c(
      "<div class='text-right pointer tooltipDesign' >",
      # '<span class=\"tooltiptext\">',
      "</span></div>"
    )

    # Remove the elements
    # Apply the remove_elements function to each component
    for (element in elements_to_remove) {
      les_LastupDate <- gsub(element, "", les_LastupDate)
    }

    # Jusqu'ici tout va bien
    Clean_Date <- gsub("<span class=\"tooltiptext\">", "-", les_LastupDate)

    sav_Clean_Date <- str_split(Clean_Date, "-", simplify = TRUE)

    for (i in 1:nrow(sav_Clean_Date)){
      # Remettre en ordre la date
      if (nchar(sav_Clean_Date[i,1])> nchar(sav_Clean_Date[i,2])) {
        Clean_Date[i] = paste0(sav_Clean_Date[i,1]," ", sav_Clean_Date[i,2])
      } else{
        Clean_Date[i] = paste0(sav_Clean_Date[i,2]," ", sav_Clean_Date[i,1])
      }

    }

    # Créer la dataframe
    df <- data.frame(Date = Clean_Date,
                     Name = data_order_values,
                     Ticker = les_tickers,
                     "Code_ISIN" = les_code_isin,
                     Market = extracted_markets,
                     Bid = the_Bid,
                     Ask = the_Ask,
                     'Last_price' = extracted_prices_numeric,
                     'Percentage_change'= extracted_pchange,
                     URL = urls,
                     stringsAsFactors = FALSE)


    # print(head(df))
    # print(start_value)

    result_df <- rbind(result_df, df)

  }

  # result_df$Percentage_change = as.numeric(result_df$Percentage_change)

  # Put Code Isin with the market identifier to create adn of the company
  result_df$Ticker_adn <- gsub("https://live.euronext.com/en/product/etfs/", "", result_df$URL)
  # result_df$Ticker_adn <- paste0(result_df$Code_ISIN,"-", result_df$Market)

  return(result_df)

}


# EN_Etfs_List <- function() {
#   # URL de la requête
#   url <- "https://live.euronext.com/en/pd_es/data/track?mics=XAMS%2CXBRU%2CXLIS%2CXPAR%2CXLDN%2CXMSM%2CXOSL%2CETFP"
#
#
#   # Get numbers rows to calculate number on possible pages
#   params <- list(
#     "draw" = 3, #Permet de récupérer tout le tableau de la page
#     "columns[0][data]" = 0,
#     "columns[0][name]" = "",
#     "search[value]" = "",
#     "search[regex]" = "false",
#     "args[initialLetter]" = "",
#     # "start" = ifelse(start_value == 800, 800, 0),
#     # "length" = 100,
#     "iDisplayLength" = 100,
#     "iDisplayStart" = 0,
#     "sSortDir_0" = "asc",
#     "sSortField" = "name"
#   )
#
#   # Effectuer la requête POST
#   response <- httr::POST(url, body = params, encode = "form")
#
#   # Lire le contenu JSON de la réponse
#   content <- httr::content(response, "text", encoding = "UTF-8")
#   data <- jsonlite::fromJSON(content)
#
#   length_rows <- data$iTotalDisplayRecords
#   nb_pages <- ceiling(length_rows/100)
#
#   # print(nb_pages)
#
#
#   result_df <- as.data.frame(matrix(NA, ncol = 8, nrow = 0))
#
#   start_values = seq(0, nb_pages*100, 100)
#
#   the_length_ = length(start_values)
#
#   start_values = seq(0, nb_pages*100, 100)[-the_length_]
#
#   # print(start_values)
#
#   for (start_value in start_values) {
#
#     params <- list(
#       "draw" = 3, #Permet de récupérer tout le tableau de la page
#       "columns[0][data]" = 0,
#       "columns[0][name]" = "",
#       "search[value]" = "",
#       "search[regex]" = "false",
#       "args[initialLetter]" = "",
#       # "start" = ifelse(start_value == 800, 800, 0),
#       # "length" = 100,
#       "iDisplayLength" = 100,
#       "iDisplayStart" = start_value,
#       "sSortDir_0" = "asc",
#       "sSortField" = "name"
#     )
#
#     # Effectuer la requête POST
#     response <- httr::POST(url, body = params, encode = "form")
#
#     # Lire le contenu JSON de la réponse
#     content <- httr::content(response, "text", encoding = "UTF-8")
#     data <- jsonlite::fromJSON(content)
#
#     # Les liens https des sociétés
#     les_link = data[["aaData"]][,1]
#     # les_link = data[["aaData"]][,2]
#     # Extraire les URL avec une expression régulière
#     urls <- paste0("https://live.euronext.com", regmatches(les_link, regexpr("(?<=href=')(.*?)(?=')", les_link, perl=TRUE)))
#
#     data_order_values <- str_extract_all(les_link, "data-order='([^']+)'")
#     data_order_values <- gsub("data-order='", "",data_order_values)
#     data_order_values <- gsub("'", "",data_order_values)
#
#
#     # Le code ISIN
#     les_code_isin = data[["aaData"]][,2]
#
#     # Les Tickers
#     les_tickers = data[["aaData"]][,3]
#
#     # Market
#     # Mieux étudier cette partie
#     les_markets = data[["aaData"]][,4]
#
#     # Utiliser str_match pour capturer le contenu entre les balises
#     matched_markets <- str_match(les_markets, ">([^<]+)</div>")
#     # Sélectionner la deuxième colonne du résultat
#     extracted_markets <- matched_markets[, 2]
#
#     les_BidAsk= data[["aaData"]][,5]
#     les_BidAsk= str_extract(les_BidAsk, ">([^<]+)<")
#     les_BidAsk = gsub(">", "", les_BidAsk)
#     les_BidAsk = gsub("<", "", les_BidAsk)
#
#     # Créer deux nouvelles variables Bid et Ask
#     the_Bid = ifelse(les_BidAsk == "/", "-", str_extract(les_BidAsk, "^[^/]+"))
#     the_Ask = ifelse(les_BidAsk == "/", "-", str_extract(les_BidAsk, "[^/]+$"))
#
#     # Closing price
#     Closing_Prices = data[["aaData"]][,6]
#     # Utiliser str_extract avec regex pour capturer les chiffres
#     # Get the symbol of currency
#     extracted_currencies <- str_extract(Closing_Prices, "(USD|EUR)")
#
#     # Old version
#     # extracted_currencies <- ifelse(extracted_currencies == "EUR", "€", "$")
#
#     # Gerer les caractère non-ASCII
#     extracted_currencies <- ifelse(extracted_currencies == "EUR", "\u20AC", "\u24")
#     extracted_prices <- str_extract(Closing_Prices, "[0-9]+\\.?[0-9]*")
#
#     # Convertir en nombre et symbole
#     extracted_prices_numeric <- paste0(extracted_currencies, extracted_prices)
#     # extracted_prices_numeric <- as.numeric(extracted_prices)
#
#     # Percentage change
#     les_pchange = data[["aaData"]][,7]
#     # Utiliser str_extract avec regex pour capturer le nombre avant "</span></div>"
#     extracted_pchange <- str_extract(les_pchange, "([0-9.-]+)%")
#     # Enlever les pourcentages
#     extracted_pchange <- gsub("%", "", extracted_pchange)
#
#     # Last update hours
#     les_LastupDate = data[["aaData"]][,8]
#     # Utiliser str_match avec regex pour extraire la date et l'heure
#     Clean_Date <- gsub("<span class=\"tooltiptext\">", "-", les_LastupDate)
#     sav_Clean_Date <- str_split(Clean_Date, "-", simplify = TRUE)
#
#     # for (i in 1:nrow(sav_Clean_Date)){
#     #   # Remettre en ordre la date
#     #   if (nchar(sav_Clean_Date[i,1])> nchar(sav_Clean_Date[i,2])) {
#     #     Clean_Date[i] = paste0(sav_Clean_Date[i,1]," ", sav_Clean_Date[i,2])
#     #   } else{
#     #     Clean_Date[i] = paste0(sav_Clean_Date[i,2]," ", sav_Clean_Date[i,1])
#     #   }
#     # }
#
#     # Define elements to remove
#     elements_to_remove <- c(
#       "<div class='text-right pointer tooltipDesign' >",
#       # '<span class=\"tooltiptext\">',
#       "</span></div>"
#     )
#
#     # Remove the elements
#     # Apply the remove_elements function to each component
#     for (element in elements_to_remove) {
#       les_LastupDate <- gsub(element, "", les_LastupDate)
#     }
#
#     # Jusqu'ici tout va bien
#     Clean_Date <- gsub("<span class=\"tooltiptext\">", "-", les_LastupDate)
#
#     sav_Clean_Date <- str_split(Clean_Date, "-", simplify = TRUE)
#
#     for (i in 1:nrow(sav_Clean_Date)){
#       # Remettre en ordre la date
#       if (nchar(sav_Clean_Date[i,1])> nchar(sav_Clean_Date[i,2])) {
#         Clean_Date[i] = paste0(sav_Clean_Date[i,1]," ", sav_Clean_Date[i,2])
#       } else{
#         Clean_Date[i] = paste0(sav_Clean_Date[i,2]," ", sav_Clean_Date[i,1])
#       }
#
#     }
#
#     # Créer la dataframe
#     df <- data.frame(Date = Clean_Date,
#                      Name = data_order_values,
#                      Ticker = les_tickers,
#                      "Code_ISIN" = les_code_isin,
#                      Market = extracted_markets,
#                      Bid = the_Bid,
#                      Ask = the_Ask,
#                      'Last_price' = extracted_prices_numeric,
#                      'Percentage_change'= extracted_pchange,
#                      URL = urls,
#                      stringsAsFactors = FALSE)
#
#
#     # print(head(df))
#     # print(start_value)
#
#     result_df <- rbind(result_df, df)
#
#   }
#
#   # result_df$Percentage_change = as.numeric(result_df$Percentage_change)
#
#   # Put Code Isin with the market identifier to create adn of the company
#   result_df$Ticker_adn <- gsub("https://live.euronext.com/en/product/etfs/", "", result_df$URL)
#   # result_df$Ticker_adn <- paste0(result_df$Code_ISIN,"-", result_df$Market)
#
#   return(result_df)
#
# }
