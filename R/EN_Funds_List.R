#' Get the list of funds quoted on Euronext markets
#'
#' This function retrieves information about funds quoted on Euronext markets.
#' No input parameters are required for this function. It retrieves information about Funds quoted on Euronext markets
#'
#' @family Infos Retrieval
#' @seealso \code{\link{EN_Stocks_List}} to get the list tickers infos quoted on a given Euronext Stock,
#'  \code{\link{EN_Bonds_List}} for Bonds list,  \code{\link{EN_Indices_List}} for Indexes list,
#'  \code{\link{EN_Etfs_List}}  for Etfs list
#'
#' @return A data frame containing information about funds, including name, ticker, ISIN code, market, last price, percentage change, and URL.
#'
#' @examples
#'\donttest{
#'
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#'
#' dt_ = EN_Funds_List()
#' print(dt_)
#'}
#'
#' @import httr
#' @import jsonlite
#' @import rvest
#' @import stringr
#'
#' @export

EN_Funds_List <- function() {
  # URL de la requête
  url = "https://live.euronext.com/en/pd_es/data/funds?mics=XAMS%2CXBRU%2CXLIS%2CXPAR%2CXMLI%2CATFX"


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

  # Effectuer la requête POST
  response <- httr::POST(url, body = params, encode = "form")

  # Lire le contenu JSON de la réponse
  content <- httr::content(response, "text", encoding = "UTF-8")
  data <- jsonlite::fromJSON(content)

  length_rows <- data$iTotalDisplayRecords
  nb_pages <- ceiling(length_rows/100)

  # print(nb_pages)


  result_df <- as.data.frame(matrix(NA, ncol = 8, nrow = 0))

  start_values = seq(0, nb_pages*100, 100)

  the_length_ = length(start_values)

  start_values = seq(0, nb_pages*100, 100)[-the_length_]

  # print(start_values)

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
    les_markets = data[["aaData"]][,8]

    # Utiliser str_match pour capturer le contenu entre les balises
    matched_markets <- str_match(les_markets, ">([^<]+)</div>")
    # Sélectionner la deuxième colonne du résultat
    extracted_markets <- matched_markets[, 2]

    # Percentage change
    les_pchange = data[["aaData"]][,11]
    # Utiliser str_extract avec regex pour capturer le nombre avant "</span></div>"
    extracted_pchange <- str_extract(les_pchange, "([0-9.-]+)%")
    # Enlever les pourcentages
    extracted_pchange <- gsub("%", "", extracted_pchange)

    # Last update hours
    les_LastupDate = data[["aaData"]][,13]
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


    # Closing price
    Closing_Prices = data[["aaData"]][,9]
    # Utiliser str_extract avec regex pour capturer les chiffres
    extracted_prices <- str_extract(Closing_Prices, "[0-9]+\\.?[0-9]*")
    # Convertir en nombre
    extracted_prices_numeric <- as.numeric(extracted_prices)

    # Créer la dataframe
    df <- data.frame(Date = Clean_Date,
                     Name = data_order_values,
                     Ticker = les_tickers,
                     "Code_ISIN" = les_code_isin,
                     Market = extracted_markets,
                     'Last_price' = extracted_prices_numeric,
                     'Percentage_change'= extracted_pchange,
                     URL = urls,
                     stringsAsFactors = FALSE)


    # print(head(df))
    # print(start_value)

    result_df <- rbind(result_df, df)

  }

  result_df$Percentage_change = as.numeric(result_df$Percentage_change)

  # Put Code Isin with the market identifier to create adn of the company
  result_df$Ticker_adn <- gsub("https://live.euronext.com/en/product/funds/", "", result_df$URL)
  # result_df$Ticker_adn <- paste0(result_df$Code_ISIN,"-", result_df$Market)

  return(result_df)

}
