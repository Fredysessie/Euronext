#' Get information about indices listed on Euronext.
#'
#' This function retrieves information about indices available on Euronext.
#'
#' @family Infos Retrieval
#'
#' @seealso \code{\link{EN_Stocks_List}} to get the list of tickers quoted on a given Euronext Stock,
#'   \code{\link{EN_Funds_List}} for Funds list, \code{\link{EN_Etfs_List}} for Etfs list.
#'
#' @examples
#'
#' \donttest{
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#' library(magrittr)
#' library(rlang)
#'
#' list_ind <- EN_Indices_List()
#' head(list_ind[, c(1:5)])
#' }
#'
#' @import httr
#' @import jsonlite
#' @import rvest
#' @import stringr
#'
#' @return A data frame containing information about the indices, including Name,
#'   ISIN, Symbol, Last price, Percentage change, Date and time, Year-to-date percentage change,
#'   and a composite Ticker_adn.
#'
#' @export




EN_Indices_List <- function() {
  url <- "https://live.euronext.com/en/products/indices/list"

  # Lire le contenu de la page
  page <- read_html(url)


  # Utiliser rvest pour extraire le lien du bouton "Last »"
  # page <- read_html(content(response, as = "text", encoding = "UTF-8"))
  last_button <- page %>% html_node("ul.pagination li:last-child a") %>% html_attr("href")

  # Trouver le nombre total de page
  # Extraire les derniers nombres après "page="
  # Extraire le nombre de pages à partir de l'URL
  last_number = str_match(last_button, "page=(\\d+)")[, 2] %>% as.integer()

  result_df <- as.data.frame(matrix(NA, ncol = 7, nrow = 0))


  for (elm in 0:last_number) {
    url = paste0("https://live.euronext.com/en/products/indices/list?field_featured_indices_is_flagsh_value=All&field_featured_indices_type_target_id=All&field_featured_indices_is_esg_value=All&field_featured_indices_industry_target_id=All&field_featured_indices_region_target_id=All&field_featured_indices_country_target_id=All&field_dataprovider=All&combine=&page=",
                 elm)

    # Lire le contenu de la page
    page <- read_html(url)

    # Extraire les données de la table
    table_data <- page %>%
      html_table(fill = TRUE)

    table_data = table_data[[1]]

    result_df <- rbind(result_df, table_data)

  }

  names(result_df) <- c("Name", "Isin", "Symbol", "Last",
                        "Percentage change (in %)", "Date_Time", "YTD%")

  result_df$Last <- gsub(",", "", result_df$Last)

  # Old version
  # result_df$Last <- gsub("EUR ", "€", result_df$Last)
  result_df$Last <- gsub("USD ", "$", result_df$Last)

  # Gerer les caractère non-ASCII
  result_df$Last <- gsub("EUR ", "\u20AC", result_df$Last)
  result_df$Last <- gsub("USD ", "\u24", result_df$Last)


  result_df$Ticker_adn <- paste0(result_df$Isin, "-", result_df$Symbol)



  return(result_df)

}
