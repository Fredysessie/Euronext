#' Get a caracteristic (Name, ISIN, DNA, Symbol) of a Stock or an Index listed on Euronext
#'
#' This function retrieves the caracteristic elements of a Stock or an Index listed on Euronext
#' using the provided Symbol/Name/ISIN of a Stock or an Index. The function formats the ticker to uppercase
#' and makes an API request to Euronext to get the corresponding caracteristics.
#'
#' @param ticker A character string representing the Stock's or an Index's ticker, name, or ISIN.
#' @return A List (Name, ISIN, DNA, Symbol) representing the DNA of the Stock or an Index.
#' @examples
#'
#' \dontrun{
#' library(httr)
#' # Get caracteristics for the ticker "4DDD"
#' EN_GetISIN_bis("4DDD")
#'
#' # Get caracteristics for the ticker "ADS MARITIME HOLD"
#' EN_GetISIN_bis("ADS MARITIME HOLD")
#'
#' # Get caracteristics for ATENOR company
#' EN_GetISIN_bis("BE0003837540")
#'
#' # Get caracteristics for AEX All-Share Index GR
#' EN_GetISIN_bis("AEX All-Share Index GR")
#'
#' # Get caracteristics of AEX Health Care Index
#' EN_GetISIN_bis("NLHC")
#' }
#'
#' @import httr
#' @importFrom magrittr %>%
#' @export

EN_GetISIN_bis <- function(ticker) {
  # Format the ticker to uppercase
  ticker <- toupper(ticker)

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
      return("Ticker not found")
    }
  } else {
    # If the request was not successful, print a warning and return NULL
    warning("Error fetching data. HTTP status code: ", status_code(response))
    return(NULL)
  }
}

