#' Get the list of Bonds quoted on Euronext markets (Bis)
#'
#' This function retrieves information about Bonds quoted on Euronext markets.
#'
#' @param target_page Target page to retrieve. It can be a numerical value, 'Max' to designate the last pages, or the default value is 1 (which means first page).
#'
#' Unlike the function \code{\link{EN_Bonds_List}}, this function allows you to specify a target page to retrieve from the list
#' of Bonds. For example, \code{EN_Bonds_List_bis(5)} fetches only the fifth page of the Bonds list, providing a more granular
#' control over the data retrieval process.
#'
#' @family Infos Retrieval
#' @seealso \code{\link{EN_Stocks_List}} to get the list tickers infos quoted on a given Euronext Stock,
#'  \code{\link{EN_Funds_List}} for Funds list,  \code{\link{EN_Indices_List}} for Indexes list,
#'  \code{\link{EN_Etfs_List}}  for Etfs list
#'
#' @return A data frame containing information about Bonds, including name, ticker, ISIN code, market, last price, percentage change, and URL.
#'
#' @examples
#'
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#'
#' dt_ = EN_Bonds_List_bis()  # To show only the 1st page, it is the defaut paramater
#' print(dt_)
#'
#' \donttest{
#'
#' dt_ = EN_Bonds_List_bis(10) # To show only the 10th page
#' print(dt_)
#'
#'
#' dt_ = EN_Bonds_List_bis('Max') # To show only last page
#' print(dt_)
#'}
#'
#' @import httr
#' @import jsonlite
#' @import rvest
#' @import stringr
#'
#' @export
#'

EN_Bonds_List_bis <- function(target_page = 1) {
  # URL de la requête
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
    # Faire un filtre qui recupère tous les éléments qui viennent après
    # https://live.euronext.com/en/product/bonds/
    les_code_isin <- gsub("https://live.euronext.com/en/product/bonds/", "", urls)
    les_code_isin <- str_extract(les_code_isin, "^[^/]+")

    Ticker_adn <- les_code_isin

    les_code_isin <- strsplit(les_code_isin, "-")[[1]][1]


    # Les Issuers
    les_issuers <- data[["aaData"]][,2]
    les_issuers <- gsub("</div>", "", les_issuers)

    # Market
    # Mieux étudier cette partie
    les_markets = data[["aaData"]][,3]

    # Utiliser str_match pour capturer le contenu entre les balises
    matched_markets <- str_match(les_markets, ">([^<]+)</div>")
    # Sélectionner la deuxième colonne du résultat
    extracted_markets <- matched_markets[, 2]

    les_maturity = data[["aaData"]][,4]
    les_maturity = gsub('<div class=\"text-right nowrap\">', "",les_maturity)
    les_maturity = gsub('</div>', "", les_maturity)

    les_coupons = data[["aaData"]][,5]
    # Je peux faire le même filtre comme pour les maturités
    les_coupons = gsub('<div class=\"text-right nowrap\">', "",les_coupons)
    les_coupons = gsub('</div>', "", les_coupons)
    # Or
    # les_coupons = str_match(les_coupons, ">([^<]+)</div>")
    # les_coupons = les_coupons[,2]

    # Closing price in percentage
    Closing_Prices = data[["aaData"]][,7]
    # Utiliser str_extract avec regex pour capturer les chiffres
    # extracted_prices <- str_extract(Closing_Prices, "[0-9]+\\.?[0-9]*")
    extracted_prices <- gsub("<div class='text-right pd_currency'>-</span></div>", '', Closing_Prices)
    extracted_prices <- gsub("<div class='text-right pd_currency'>% <span class='pd_last_price'>", '', extracted_prices)
    extracted_prices <- gsub("</span></div>", '', extracted_prices)
    extracted_prices <- gsub(",", '.', extracted_prices)
    extracted_prices <- ifelse(extracted_prices == "", "-", extracted_prices)

    # Or
    # extracted_prices <- ifelse(extracted_prices == "", NA, extracted_prices)
    # Convertir en nombre
    # extracted_prices_numeric <- as.numeric(extracted_prices)


    # Percentage change
    les_pchange = data[["aaData"]][,8]
    # Utiliser str_extract avec regex pour capturer le nombre avant "</span></div>"
    extracted_pchange <- gsub("<div class='text-right pd_percent'>-</div>", '', les_pchange)
    extracted_pchange <- gsub("<div class='text-right pd_percent'><span class=text-brand-kelly-green>", '', extracted_pchange)
    extracted_pchange <- gsub("<div class='text-right pd_percent'><span class=red>", '', extracted_pchange)
    extracted_pchange <- gsub("</span></div>", '', extracted_pchange)
    extracted_pchange <- gsub(",", '.', extracted_pchange)
    extracted_pchange <- ifelse(extracted_pchange == "", "-", extracted_pchange)

    # Enlever les pourcentages
    # extracted_pchange <- gsub("%", "", extracted_pchange)

    Issued_Amount = data[["aaData"]][,10]
    Issued_Amount <- gsub('<div class=\"text-right nowrap\">', '', Issued_Amount)
    Issued_Amount <- gsub('</div>', '', Issued_Amount)

    # Last update hours
    les_LastupDate = data[["aaData"]][,9]
    # Utiliser str_match avec regex pour extraire la date et l'heure
    Clean_Date <- gsub("<span class=\"tooltiptext\">", "-", les_LastupDate)
    sav_Clean_Date <- str_split(Clean_Date, "-", simplify = TRUE)

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
    Clean_Date <- ifelse(Clean_Date == "--", "-", Clean_Date)

    sav_Clean_Date <- str_split(Clean_Date, "-", simplify = TRUE)

    for (i in 1:nrow(sav_Clean_Date)){
      # Remettre en ordre la date
      if (nchar(sav_Clean_Date[i,1])> nchar(sav_Clean_Date[i,2])) {
        Clean_Date[i] = paste0(sav_Clean_Date[i,1]," ", sav_Clean_Date[i,2])
      } else{
        Clean_Date[i] = paste0(sav_Clean_Date[i,2]," ", sav_Clean_Date[i,1])
      }

    }
    Clean_Date <- ifelse(Clean_Date == " ", "-", Clean_Date)



    # Créer la dataframe
    df <- data.frame(Date = Clean_Date,
                     Name = data_order_values,
                     Issuer = les_issuers,
                     "Code_ISIN" = les_code_isin,
                     Market = extracted_markets,
                     Maturity = les_maturity,
                     Coupon = les_coupons,
                     'Last_price' = extracted_prices,
                     'Percentage_change'= extracted_pchange,
                     'Issued_Amount' = Issued_Amount,
                     URL = urls,
                     'Ticker_adn' = Ticker_adn,
                     stringsAsFactors = FALSE)

    # print(head(df))
    # print(start_value)

    result_df <- rbind(result_df, df)

  }

  # result_df$Percentage_change = as.numeric(result_df$Percentage_change)

  # Put Code Isin with the market identifier to create adn of the company
  # result_df$Ticker_adn <- gsub("https://live.euronext.com/en/product/bonds/", "", result_df$URL)

  # result_df$Ticker_adn <- paste0(result_df$Code_ISIN,"-", result_df$Market)

  names(result_df) = c("Date", "Name", "Issuer", "Code_ISIN",
                       "Market", "Maturity", "Coupon", "Last_price",
                       # "Percentage change (in %),
                       "Percentage change" , 'Issued_Amount', "URL", "Ticker_adn")


  return(result_df)

}
