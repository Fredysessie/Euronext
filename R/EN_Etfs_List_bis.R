#' Get the list of Etfs quoted on Euronext markets (bis)
#'
#' This function retrieves information about Etfs quoted on Euronext markets.
#'
#' @param target_page Target page to retrieve. It can be a numerical value, 'Max' to designate the last pages, or the default value is 1 (which means first page).
#'
#' Unlike the function \code{\link{EN_Etfs_List}}, this function allows you to specify a target page to retrieve from the list
#' of Etfs. For example, \code{EN_Etfs_List_bis(5)} fetches only the fifth page of the Etfs list, providing a more granular
#' control over the data retrieval process.
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
#' \donttest{
# library(httr)
# library(jsonlite)
# library(rvest)
# library(stringr)
#'
#' dt_ = EN_Etfs_List_bis(5) # To show only the 5th page of Etfs (100 Etfs)
#' print(dt_)
#'
#' dt_1 = EN_Etfs_List_bis() # To show the 1st page of Etfs List
#' tail(dt_1)
#'
#' dt_max = EN_Etfs_List_bis("Max") #To show only the last page of quoted Etfs
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


EN_Etfs_List_bis <- function(target_page = 1) {
  # URL de la requête
  # url <- "https://live.euronext.com/en/pd_es/data/track?mics=XAMS%2CXBRU%2CXLIS%2CXPAR%2CXLDN%2CXMSM%2CXOSL%2CETFP"

  url <- "https://live.euronext.com/en/product_directory/data/etf-all-markets?mics=ALXA%2CALXB%2CALXL%2CALXP%2CATFX%2CBGEM%2CENXB%2CENXL%2CETFP%2CETLX%2CEXGM%2CMERK%2CMIVX%2CMLXB%2CMOTX%2CMTAA%2CMTAH%2CMTCH%2CSEDX%2CTNLA%2CTNLB%2CVPXB%2CWOMF%2CXACD%2CXAMS%2CXATL%2CXBRU%2CXDUB%2CXESM%2CXLDN%2CXLIS%2CXMLI%2CXMOT%2CXMSM%2CXOAM%2CXOAS%2CXOBD%2CXOSL%2CXPAR"
  # Get numbers rows to calculate number on possible pages
  params <- list(
    "draw" = 3, #Permet de récupérer tout le tableau de la page
    `columns[0][data]` = "0",
    `columns[0][name]` = "",
    `columns[0][searchable]` = "true",
    `columns[0][orderable]` = "false",
    `columns[0][search][value]` = "",
    `columns[0][search][regex]` = "false",
    `columns[1][data]` = "1",
    `columns[1][name]` = "",
    `columns[1][searchable]` = "true",
    `columns[1][orderable]` = "true",
    `columns[1][search][value]` = "",
    `columns[1][search][regex]` = "false",
    `columns[2][data]` = "2",
    `columns[2][name]` = "",
    `columns[2][searchable]` = "true",
    `columns[2][orderable]` = "false",
    `columns[2][search][value]` = "",
    `columns[2][search][regex]` = "false",
    `columns[3][data]` = "3",
    `columns[3][name]` = "",
    `columns[3][searchable]` = "true",
    `columns[3][orderable]` = "false",
    `columns[3][search][value]` = "",
    `columns[3][search][regex]` = "false",
    `columns[4][data]` = "4",
    `columns[4][name]` = "",
    `columns[4][searchable]` = "true",
    `columns[4][orderable]` = "false",
    `columns[4][search][value]` = "",
    `columns[4][search][regex]` = "false",
    `columns[5][data]` = "5",
    `columns[5][name]` = "",
    `columns[5][searchable]` = "true",
    `columns[5][orderable]` = "false",
    `columns[5][search][value]` = "",
    `columns[5][search][regex]` = "false",
    `columns[6][data]` = "6",
    `columns[6][name]` = "",
    `columns[6][searchable]` = "true",
    `columns[6][orderable]` = "false",
    `columns[6][search][value]` = "",
    `columns[6][search][regex]` = "false",
    `columns[7][data]` = "7",
    `columns[7][name]` = "",
    `columns[7][searchable]` = "true",
    `columns[7][orderable]` = "false",
    `columns[7][search][value]` = "",
    `columns[7][search][regex]` = "false",
    `order[0][column]` = "0",
    `order[0][dir]` = "asc",
    start = "0",
    length = "100",
    `search[value]` = "",
    `search[regex]` = "false",
    `args[display_datapoints]` = "logo,name,isin,symbol,market,lastPrice,precentDayChange,lastTradeTime",
    iDisplayLength = "100",
    iDisplayStart = "0",
    sSortDir_0 = "asc",
    sSortField = "name"
  )


  is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) abs(x - round(x)) < tol

  if (is.character(target_page)) {
    if (str_to_title(target_page) == 'Max') {
      response <- httr::POST(url, body = params, encode = "form")

      # Lire le contenu JSON de la réponse
      content <- httr::content(response, "text", encoding = "UTF-8")
      data <- jsonlite::fromJSON(content)

      length_rows <- data$iTotalDisplayRecords
      nb_pages <- ceiling(length_rows/100)

      start_values <- seq(0, nb_pages*100, 100)
      the_length_ <- length(start_values)
      start_values <- seq(0, nb_pages*100, 100)[the_length_ - 1]
    } else {
      rlang::abort("The total number of pages must be a numerical value or 'Max' to designate the maximum number of pages.")
    }
  } else if (is.numeric(target_page)) {
    if (target_page > 0 && is.wholenumber(target_page)) {
      # Effectuer la requête POST
      response <- httr::POST(url, body = params, encode = "form")

      # Lire le contenu JSON de la réponse
      content <- httr::content(response, "text", encoding = "UTF-8")
      data <- jsonlite::fromJSON(content)

      length_rows <- data$iTotalDisplayRecords
      nb_pages <- ceiling(length_rows/100)

      if (target_page > nb_pages) {
        rlang::abort(paste0('Only total number of pages less than or equal to ', nb_pages, ' are allowed.'))
      } else {
        start_values <- seq(0, target_page*100, 100)
        the_length_ <- length(start_values)
        start_values <- seq(0, target_page*100, 100)[the_length_ - 1]
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

    # params <- list(
    #   "draw" = 3, #Permet de récupérer tout le tableau de la page
    #   "columns[0][data]" = 0,
    #   "columns[0][name]" = "",
    #   "search[value]" = "",
    #   "search[regex]" = "false",
    #   "args[initialLetter]" = "",
    #   # "start" = ifelse(start_value == 800, 800, 0),
    #   # "length" = 100,
    #   "iDisplayLength" = 100,
    #   "iDisplayStart" = start_value,
    #   "sSortDir_0" = "asc",
    #   "sSortField" = "name"
    # )

    params <- list(
      "draw" = 3, #Permet de récupérer tout le tableau de la page
      "columns[0][data]" = 0,
      `columns[0][name]` = "",
      `columns[0][searchable]` = "true",
      `columns[0][orderable]` = "false",
      `columns[0][search][value]` = "",
      `columns[0][search][regex]` = "false",
      `columns[1][data]` = "1",
      `columns[1][name]` = "",
      `columns[1][searchable]` = "true",
      `columns[1][orderable]` = "true",
      `columns[1][search][value]` = "",
      `columns[1][search][regex]` = "false",
      `columns[2][data]` = "2",
      `columns[2][name]` = "",
      `columns[2][searchable]` = "true",
      `columns[2][orderable]` = "false",
      `columns[2][search][value]` = "",
      `columns[2][search][regex]` = "false",
      `columns[3][data]` = "3",
      `columns[3][name]` = "",
      `columns[3][searchable]` = "true",
      `columns[3][orderable]` = "false",
      `columns[3][search][value]` = "",
      `columns[3][search][regex]` = "false",
      `columns[4][data]` = "4",
      `columns[4][name]` = "",
      `columns[4][searchable]` = "true",
      `columns[4][orderable]` = "false",
      `columns[4][search][value]` = "",
      `columns[4][search][regex]` = "false",
      `columns[5][data]` = "5",
      `columns[5][name]` = "",
      `columns[5][searchable]` = "true",
      `columns[5][orderable]` = "false",
      `columns[5][search][value]` = "",
      `columns[5][search][regex]` = "false",
      `columns[6][data]` = "6",
      `columns[6][name]` = "",
      `columns[6][searchable]` = "true",
      `columns[6][orderable]` = "false",
      `columns[6][search][value]` = "",
      `columns[6][search][regex]` = "false",
      `columns[7][data]` = "7",
      `columns[7][name]` = "",
      `columns[7][searchable]` = "true",
      `columns[7][orderable]` = "false",
      `columns[7][search][value]` = "",
      `columns[7][search][regex]` = "false",
      `order[0][column]` = "0",
      `order[0][dir]` = "asc",
      start = as.character(start_value),
      length = "100",
      `search[value]` = "",
      `search[regex]` = "false",
      `args[initialLetter]` = "",
      `args[display_datapoints]` = "logo,name,isin,symbol,market,lastPrice,precentDayChange,lastTradeTime",
      iDisplayLength = "100",
      iDisplayStart = as.character(start_value),
      sSortDir_0 = "asc",
      sSortField = "name"
    )

    # Effectuer la requête POST
    response <- httr::POST(url, body = params, encode = "form")

    # Lire le contenu JSON de la réponse
    content <- httr::content(response, "text", encoding = "UTF-8")
    data <- jsonlite::fromJSON(content)

    # Les liens https des sociétés
    les_link = data[["aaData"]][,1]

    # Extraction des URLs et des noms (méthode mise à jour)
    urls <- sub('.*href="/en/product/etfs/([^"]+)".*',
                'https://live.euronext.com/en/product/etfs/\\1', les_link)

    data_order_values <- sub('.*>([^<]+)<.*', '\\1', les_link)

    # Le code ISIN
    # les_code_isin = data[["aaData"]][,1]
    # récupérer l'adn
    les_code_isin = gsub("https://live.euronext.com/en/product/etfs/", "", urls)
    # Extraction des ISINs (avant le tiret)
    les_code_isin <- sub("-.*", "", les_code_isin)

    # Les Tickers
    les_tickers = data[["aaData"]][,2]

    # Market
    les_markets = data[["aaData"]][,3]

    # Utiliser str_match pour capturer le contenu entre les balises
    matched_markets <- str_match(les_markets, ">([^<]+)</div>")
    # Sélectionner la deuxième colonne du résultat
    extracted_markets <- matched_markets[, 2]

    # Bid/Ask
    les_BidAsk = data[["aaData"]][,4] #A vérifier
    les_BidAsk = str_extract(les_BidAsk, ">([^<]+)<")
    les_BidAsk = gsub(">", "", les_BidAsk)
    les_BidAsk = gsub("<", "", les_BidAsk)

    # Créer deux nouvelles variables Bid et Ask
    the_Bid = ifelse(les_BidAsk == "/", "-", str_extract(les_BidAsk, "^[^/]+"))
    the_Ask = ifelse(les_BidAsk == "/", "-", str_extract(les_BidAsk, "[^/]+$"))

    # Closing price
    Closing_Prices = data[["aaData"]][,5]

    # Extraction des devises et prix (méthode mise à jour)
    extracted_currencies <- str_extract(Closing_Prices, "(USD|EUR|GBP|NOK|DKK|SEK|CHF)")
    extracted_currencies <- ifelse(extracted_currencies == "EUR", "\u20AC",
                                   ifelse(extracted_currencies == "USD", "$",
                                          ifelse(extracted_currencies == "GBP", "\u00A3",
                                                 ifelse(extracted_currencies == "NOK", "kr",
                                                        ifelse(extracted_currencies == "DKK", "kr",
                                                               ifelse(extracted_currencies == "SEK", "kr",
                                                                      ifelse(extracted_currencies == "CHF", "CHF", "")))))))

    extracted_prices <- str_extract(Closing_Prices, "[0-9]+\\.?[0-9]*")
    # Convertir en chaîne avec symbole de devise
    extracted_prices <- paste0(extracted_currencies, extracted_prices)

    # Percentage change
    les_pchange = data[["aaData"]][,6]
    # Utiliser str_extract avec regex pour capturer le nombre avant "</span></div>"
    extracted_pchange <- str_extract(les_pchange, "([0-9.-]+)%")
    # Enlever les pourcentages
    extracted_pchange <- gsub("%", "", extracted_pchange)

    # Last update hours
    les_LastupDate = data[["aaData"]][,7]

    # Nettoyage des dates (méthode simplifiée)
    Clean_Date <- gsub("<span class=\"tooltiptext\">", "-", les_LastupDate)
    Clean_Date <- gsub("<div class=\"text-right pointer tooltipDesign\">", "", Clean_Date)
    Clean_Date <- gsub("</span></div>", "", Clean_Date)

    sav_Clean_Date <- str_split(Clean_Date, "-", simplify = TRUE)

    for (i in 1:nrow(sav_Clean_Date)){
      # Remettre en ordre la date
      if (nchar(sav_Clean_Date[i,1])> nchar(sav_Clean_Date[i,2])) {
        Clean_Date[i] = paste0(sav_Clean_Date[i,1]," - ", sav_Clean_Date[i,2])
      } else{
        Clean_Date[i] = paste0(sav_Clean_Date[i,2]," - ", sav_Clean_Date[i,1])
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
                     'Last_price' = extracted_prices,
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
