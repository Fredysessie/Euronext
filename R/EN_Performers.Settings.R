#' Retrieve settings for stock performers.
#'
#' This function retrieves settings for stock performers, including the acceptable values for 'belongs_to' and 'eligibility' attributes.
#'
#' @param stock_choice A character string specifying the stock market. Allowed values: 'All', 'Amsterdam' (or 'A'), 'Brussels' (or 'B'), 'Dublin' (or 'D'), 'Lisbon' (or 'L'), 'Milan' (or 'M'), 'Paris' (or 'P'), 'Oslo' (or 'O').
#'
#' @return A list containing two data frames: 'belongs_to' and 'eligibility'. Each data frame has two columns: 'Information' (the text of the option) and 'Code' (the value of the attribute).
#'
#' @seealso \code{\link{EN_Stock.Performers}} for retrieving performance data for stocks.
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @import stringr
#' @importFrom magrittr %>%
#'
#' @examples
#'
#' library(httr)
#' library(jsonlite)
#' library(stringr)
#' library(magrittr)
#'
#' # Amsterdam stock setting:
#' amsterdam_settings <- EN_Performers.Settings("a")
#' print(amsterdam_settings)
#'
#' # Brussels stock setting:
#' b_settings <- EN_Performers.Settings("b")
#' print(b_settings)
#'
#' # To get all acceptable 'belongs_to' attribute code of Brussels stock
#' EN_Performers.Settings("b")$belongs_to$Code
#'
#' # To get all acceptable 'eligibility' Code of Brussels stock
#' EN_Performers.Settings("b")$eligibility$Code
#'
#' # To get all acceptable 'belongs_to' attribute code of Paris stock
#' EN_Performers.Settings("p")$belongs_to$Code
#'
#' # To get all acceptable 'eligibility' Code of Paris stock
#' EN_Performers.Settings("p")$eligibility$Code
#'
#'
#' @export



EN_Performers.Settings <- function(stock_choice) {

  extract_options <- function(html_string) {
    options <- unlist(regmatches(html_string, gregexpr("<option[^>]*>.*?</option>", html_string)))
    return(options)
  }

  if(is.character(stock_choice)){

    stock_choice = tolower(stock_choice)

    if( stock_choice == "all"){
      stock_choice = "All"

    } else{

      if( stock_choice %in%  c("a", "amsterdam")){
        stock_choice = "Amsterdam"
      } else if( stock_choice %in% c("b", "brussels") ){
        stock_choice = "Brussels"
      } else if( stock_choice %in% c("d", "dublin") ){
        stock_choice = "Dublin"
      } else if( stock_choice %in% c("l", "lisbon") ){
        stock_choice = "Lisbon"
      } else if( stock_choice %in% c("m", "milan") ){
        stock_choice = "Lilan"
      } else if( stock_choice %in% c("p", "paris")  ){
        stock_choice = "Paris"
      } else if( stock_choice %in% c("o", "oslo") ){
        stock_choice = "Oslo"
      } else {
        stop("Invalid 'stock_choice' parameter")
      }

    }

  }else{

    stop("Invalid 'stock_choice' parameter")

  }


  url <- paste0("https://live.euronext.com/ajax/getTopPerformersSettings/", stock_choice)

  headers <- c(
    "accept" = "*/*",
    "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
    "sec-ch-ua" = "\"Not A(Brand\";v=\"99\", \"Google Chrome\";v=\"121\", \"Chromium\";v=\"121\"",
    "sec-ch-ua-mobile" = "?0",
    "sec-ch-ua-platform" = "\"Android\"",
    "sec-fetch-dest" = "empty",
    "sec-fetch-mode" = "cors",
    "sec-fetch-site" = "same-origin",
    "x-requested-with" = "XMLHttpRequest"
  )

  # response <- GET(url, add_headers(.headers=headers))
  response <- GET(url)


  if (status_code(response) == 200) {
    settings <- content(response, as = "text", encoding = "UTF-8") %>%
      fromJSON(simplifyVector = FALSE)

    belongsTo_options <- extract_options(settings$belongsTo)

    eligibility_options <- extract_options(settings$eligibility)

    # Customize belong to elements
    # Initialise deux vecteurs pour stocker les valeurs des attributs et les textes correspondants
    attribute_values <- character(length(belongsTo_options))
    option_texts <- character(length(belongsTo_options))

    for (i in seq_along(belongsTo_options)) {
      # Utilisez une expression régulière pour extraire la valeur de l'attribut "value"
      attribute_match <- regexec("value=([^>]+)", belongsTo_options[i])
      attribute_value <- regmatches(belongsTo_options[i], attribute_match)[[1]][2]

      # Utilisez une expression régulière pour extraire le texte entre les balises <option> et </option>
      option_text <- gsub("<.*?>", "", belongsTo_options[i])

      # Stocke les valeurs dans les vecteurs correspondants
      attribute_values[i] <- attribute_value
      option_texts[i] <- option_text
    }

    # Customize eligibility_options to elements
    attribute_values1 <- character(length(eligibility_options))
    option_texts1 <- character(length(eligibility_options))

    for (i in seq_along(eligibility_options)) {
      # Utilisez une expression régulière pour extraire la valeur de l'attribut "value"
      attribute_match <- regexec("value=([^>]+)", eligibility_options[i])
      attribute_value <- regmatches(eligibility_options[i], attribute_match)[[1]][2]

      # Utilisez une expression régulière pour extraire le texte entre les balises <option> et </option>
      option_text <- gsub("<.*?>", "", eligibility_options[i])

      # Stocke les valeurs dans les vecteurs correspondants
      attribute_values1[i] <- attribute_value
      option_texts1[i] <- option_text
    }


    belongsTo_df <- data.frame(Information = option_texts, Code = attribute_values)

    eligibility_df <- data.frame(Information = option_texts1, Code = attribute_values1)



    return(list(belongs_to = belongsTo_df,
                eligibility = eligibility_df))
  } else {
    stop("Failed to fetch settings.")
  }
}



# # Fonction pour extraire les options et leurs valeurs à partir d'une chaîne HTML
# extract_options <- function(html_string) {
#   options <- gsub("<option value=([^>]*)>([^<]*)<\\/option>", "\\1 - \\2", html_string)
#   options <- strsplit(options, " - ")[[1]]
#   values <- options[seq(1, length(options), by = 2)]
#   texts <- options[seq(2, length(options), by = 2)]
#   return(data.frame(Information = values, text = texts))
# }
#
# # Extrait les options et leurs valeurs de $belongsTo
# belongsTo_options <- extract_options(amsterdam_settings$belongsTo)
#
# # Fonction pour extraire les options à partir d'une chaîne HTML
# extract_options <- function(html_string) {
#   options <- unlist(regmatches(html_string, gregexpr("<option[^>]*>.*?</option>", html_string)))
#   return(options)
# }
#
# # Extrait les options de $belongsTo
# belongsTo_options <- extract_options(amsterdam_settings$belongsTo)
# # print("Options de Belongs To:")
# # print(belongsTo_options)
#
#
# # Initialise deux vecteurs pour stocker les valeurs des attributs et les textes correspondants
# attribute_values <- character(length(belongsTo_options))
# option_texts <- character(length(belongsTo_options))
#
#
# # Boucle à travers les options pour extraire les valeurs et les textes
# for (i in seq_along(belongsTo_options)) {
#   # Utilisez une expression régulière pour extraire la valeur de l'attribut "value"
#   attribute_match <- regexec("value=([^>]+)", belongsTo_options[i])
#   attribute_value <- regmatches(belongsTo_options[i], attribute_match)[[1]][2]
#
#   # Utilisez une expression régulière pour extraire le texte entre les balises <option> et </option>
#   option_text <- gsub("<.*?>", "", belongsTo_options[i])
#
#   # Stocke les valeurs dans les vecteurs correspondants
#   attribute_values[i] <- attribute_value
#   option_texts[i] <- option_text
# }
#
# # Crée un dataframe à partir des valeurs extraites
# options_df <- data.frame(Information = option_texts, Attribute_code = attribute_values)
# print(options_df)
