#' Euronext Stocks List
#'
#' This function retrieves a list of companies listed on the Euronext stock exchanges,
#' filtered by the initial letter of their names. It provides information such as the
#' company name, ticker symbol, ISIN code, market, last closing price, percentage change,
#' and a link to the company's details on the Euronext website.
#'
#' @param stock_choice A character string specifying the stock exchange. Options include "A" or "Amsterdam," "B" or "Brussels," "D" or "Dublin", "L" or "Lisbon," "M" or "Milan," "P" or "Paris," and "O" or "Oslo."
#'
#' @family Infos Retrieval
#'
#' @seealso \code{\link{EN_Ticker_Performance}}
#'
#' @family Companies List by stock
#'
#' @return A data frame containing information about companies listed on the specified stock exchange.
#'  If the stock exchange choice is invalid, the function returns an error message.
#'
#' @examples
#' \donttest{
#' # Example usage:
#' a_result_df <- EN_Stocks_List("A") # For Amsterdam Stock
#' head(a_result_df[, c(1:5)])
#'
#' b_result_df <- EN_Stocks_List("B") # For Brussels Stock
#' p_result_df <- EN_Stocks_List("P") # For Paris Stock
#' l_result_df <- EN_Stocks_List("L") # For Lisbon Stock
#' m_result_df <- EN_Stocks_List("M") # For Milan Stock
#' d_result_df <- EN_Stocks_List("D") # For Dublin Stock
#' o_result_df <- EN_Stocks_List("O") # For Oslo Stock
#' }
#'
#'
#' @import httr
#' @import httr2
#' @import rvest
#' @import jsonlite
#' @import stringr
#'
#' @export

EN_Stocks_List <- function(stock_choice) {
  # Initialize an empty data frame to store results
  stock_choice = str_to_lower(stock_choice)

  if( stock_choice %in%  c("a", "amsterdam")){
    stock_choice = "amsterdam"
  } else if( stock_choice %in% c("b", "brussels") ){
    stock_choice = "brussels"
  } else if( stock_choice %in% c("d", "dublin") ){
    stock_choice = "dublin"
  } else if( stock_choice %in% c("l", "lisbon") ){
    stock_choice = "lisbon"
  } else if( stock_choice %in% c("m", "milan") ){
    stock_choice = "milan"
  } else if( stock_choice %in% c("p", "paris")  ){
    stock_choice = "paris"
  } else if( stock_choice %in% c("o", "oslo") ){
    stock_choice = "oslo"
  } else {
    rlang::abort(
      "THe stock you've selected doesn't exist"
    )
  }

  Stocks_list_parms = list(amsterdam = "XAMS%2CTNLA",
                           brussels = "XBRU%2CALXB%2CMLXB%2CTNLB%2CENXB",
                           dublin = "XESM%2CXMSM%2CXATL",
                           lisbon = "XLIS%2CALXL%2CENXL",
                           milan = "MTAA%2CEXGM%2CMTAH%2CMIVX%2CBGEM%2CETLX",
                           paris = "XPAR%2CALXP%2CXMLI",
                           oslo = "XOSL%2CMERK%2CXOAS")

  stk_params = Stocks_list_parms[[stock_choice]]

  # URL de la requête
  url <- paste0("https://live.euronext.com/en/pd_es/data/stocks?mics=", stk_params)

  # result_df <- as.data.frame(matrix(NA, ncol = 8, nrow = 0))

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
    les_link = data[["aaData"]][,2]
    # Extraire les URL avec une expression régulière
    urls <- paste0("https://live.euronext.com", regmatches(les_link, regexpr("(?<=href=')(.*?)(?=')", les_link, perl=TRUE)))

    data_order_values <- str_extract_all(les_link, "data-order='([^']+)'")
    data_order_values <- gsub("data-order='", "",data_order_values)
    data_order_values <- gsub("'", "",data_order_values)


    # Le code ISIN
    les_code_isin = data[["aaData"]][,3]

    # Les Tickers
    les_tickers = data[["aaData"]][,4]

    # Market
    les_markets = data[["aaData"]][,5]

    # Utiliser str_match pour capturer le contenu entre les balises
    matched_markets <- str_match(les_markets, ">([^<]+)</div>")
    # Sélectionner la deuxième colonne du résultat
    extracted_markets <- matched_markets[, 2]

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


    # Closing price
    # Closing_Prices = data[["aaData"]][,9]
    # Essayon le numero 6 voir
    Closing_Prices = data[["aaData"]][,6]

    # Utiliser str_extract avec regex pour capturer les chiffres
    # extracted_prices <- str_extract(Closing_Prices, "[0-9]+\\.?[0-9]*")
    # Convertir en nombre
    # extracted_prices_numeric <- as.numeric(extracted_prices)

    # Utiliser str_extract avec regex pour capturer les chiffres
    # Get the symbol of currency
    # stringi::stri_escape_unicode("€")
    # stringi::stri_escape_unicode("$")

    extracted_currencies <- str_extract(Closing_Prices, "(USD|EUR)")

    # Gerer les caractère non-ASCII
    # First version
    # extracted_currencies <- ifelse(extracted_currencies == "EUR", "€", "$")

    # Gerer les caractère non-ASCII
    extracted_currencies <- ifelse(extracted_currencies == "EUR", "\u20AC", "\u24")

    extracted_prices <- str_extract(Closing_Prices, "[0-9]+\\.?[0-9]*")
    # Convertir en nombre et symbole
    extracted_prices <- paste0(extracted_currencies, extracted_prices)
    # extracted_prices_numeric = as.numeric(extracted_prices)


    # Créer la dataframe
    df <- data.frame(Date = Clean_Date,
                     Name = data_order_values,
                     Ticker = les_tickers,
                     "Code_ISIN" = les_code_isin,
                     Market = extracted_markets,
                     # 'Last_price' = extracted_prices_numeric,
                     'Last_price' = extracted_prices,
                     'Percentage_change'= extracted_pchange,

                     URL = urls,
                     stringsAsFactors = FALSE)


    # print(head(df))
    # print(start_value)

    result_df <- rbind(result_df, df)

  }

  result_df$Percentage_change = as.numeric(result_df$Percentage_change)

  # Put Code Isin with the market identifier to create adn of the company
  # result_df$Ticker_adn <- paste0(result_df$Code_ISIN,"-", result_df$Market)
  result_df$Ticker_adn <- gsub("https://live.euronext.com/en/product/equities/", "", result_df[, 8])

  names(result_df) = c("Date", "Name", "Ticker", "Code_ISIN", "Market", "Last_price",
                     "Percentage change (in %)" , "URL", "Ticker_adn")

  return(result_df)

}
