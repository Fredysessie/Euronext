#' Retrieve Summaries of giving Stock Market from Euronext
#'
#' This function retrieves summary data of stock market indices and currency rates from the Euronext website for a selected market. It allows users to obtain real-time information about various financial instruments listed on the Euronext stock exchange, facilitating analysis and decision-making.
#'
#' @param stock_choice A character string specifying the market of interest. Available options include "a" or "amsterdam" for Amsterdam, "b" or "brussels" for Brussels, "d" or "dublin" for Dublin, "l" or "lisbon" for Lisbon, "m" or "milan" for Milan, "p" or "paris" for Paris, and "o" or "oslo" for Oslo.
#'
#' @return A list containing summary data for the selected market, including information on stock indices and currency rates. The list includes the following components:
#' \describe{
#'   \item{Indices_summary}{A data frame summarizing stock market indices for the selected market. It includes columns for the index name, last price, and percentage change. If the summary is not available, this component will be set to NA.}
#'   \item{EU_indices}{A data frame summarizing EURONEXT indices for the selected market. It includes columns for the instrument name, last price, and percentage change. If the summary is not available, this component will be set to NA.}
#'   \item{Currency_rate}{A data frame summarizing currency exchange rates for the selected market. It includes columns for the instrument name, last price, and percentage change. If the summary is not available, this component will be set to NA.}
#' }
#'
#' @examples
#' library(httr)
#' library(rvest)
#' library(magrittr)
#'
#' # Note : 'NA' for a giving summary means the summary is not available
#'
#' # Retrieve summary data for Amsterdam stock
#' En_Market.Sumarry("a")
#' # Or
#' # Retrieve summary data for 'Amsterdam stock indices' only
#' En_Market.Sumarry("a")$Indices_summary
#'
#' # Retrieve summary data for 'EURONEXT indices' only
#' En_Market.Sumarry("a")$EU_indices
#'
#' # Retrieve summary data for 'Currency rate' only
#' En_Market.Sumarry("a")$Currency_rate
#'
#'
#' # Retrieve summary data for 'Brussels stock indices' only
#' En_Market.Sumarry("b")$Indices_summary
#'
#' # Retrieve summary data for 'Dublin stock indices' only
#' En_Market.Sumarry("d")$Indices_summary
#'
#' # Retrieve summary data for 'Lisbon stock indices' only
#' En_Market.Sumarry("l")$Indices_summary
#'
#' # Retrieve summary data for 'Milan stock indices' only
#' En_Market.Sumarry("m")$Indices_summary
#'
#' # Retrieve summary data for 'Paris stock indices' only
#' En_Market.Sumarry("p")$Indices_summary
#'
#' # Retrieve summary data for 'Oslo stock indices' only
#' En_Market.Sumarry("o")$Indices_summary
#'
#' @family Infos Retrieval
#' @family Data Retrieval
#'
#' @seealso \code{\link{EN_Stocks_List}}
#'
#' @importFrom httr GET
#' @importFrom rvest read_html html_table
#' @importFrom magrittr %>%
#'
#' @export

En_Market.Sumarry <- function(stock_choice){

  # Euronext ready to use function
  get_Stocks <- function(url){
    webpage <- read_html(url)

    # Extraire les données en utilisant les sélecteurs CSS
    euro_infos <- webpage %>%
      html_table()

    # FRENCH INDICES
    Indices_summary <- euro_infos[[1]]
    if(length(Indices_summary)==3){

      # We can format the first summary ie data1
      names(Indices_summary) <- c("Index", "Last price",  "Change (%)")
      Indices_summary$`Change (%)` <- as.numeric(gsub("\n\t\t\t\t\t\t\t\t\t\t\t%", "", Indices_summary$`Change (%)`))
      Indices_summary$`Last price` <- as.numeric(gsub(",", "", Indices_summary$`Last price`))
    }else{
      Indices_summary <- NA
    }

    # EU INDICES
    EU_indices <- euro_infos[[2]]
    # length(EU_indices)==3
    if(length(EU_indices)==3){

      # We can format the second summary data ie data2
      names(EU_indices) <- c("Instrument name", "Last price",  "Day change relative (%)")
      EU_indices$`Day change relative (%)` <- as.numeric(gsub("\n\t\t\t\t\t\t\t\t\t\t\t%", "", EU_indices$`Day change relative (%)`))
      EU_indices$`Last price` <- as.numeric(gsub(",", "", EU_indices$`Last price`))

    }else{
      EU_indices <- NA
    }


    # CURRENCY RATES
    Currency_rate <- euro_infos[[3]]
    # length(Currency_rate)==3
    if(length(Currency_rate)==3){

      # We can format the third summary data ie data3
      names(Currency_rate) <- c("Instrument name", "Last price",  "Day change relative (%)")
      Currency_rate$`Day change relative (%)` <- as.numeric(gsub("\n\t\t\t\t\t\t\t\t\t\t\t%", "", Currency_rate$`Day change relative (%)`))
      Currency_rate$`Last price` <- as.numeric(gsub(",", "", Currency_rate$`Last price`))

    }else{
      Currency_rate <- NA
    }

    return(list(Indices_summary = Indices_summary,
                EU_indices = EU_indices,
                Currency_rate = Currency_rate))

  }


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

  # URL de la requête
  stock_url <- paste0("https://live.euronext.com/en/markets/", stock_choice)

  # In cas currency rate is not existing

  return(get_Stocks(stock_url))
}




# get_Stocks_bis <- function(url){
#   webpage <- read_html(url)
#
#   # Extraire les données en utilisant les sélecteurs CSS
#   euro_infos <- webpage %>%
#     # html_nodes(".quotes") %>%
#     html_table()
#
#   # FRENCH INDICES
#
#   # fr_indices = euro_infos[[1]]
#   # names(fr_indices) = c("Index", "Last price",  "Change (%)")
#   # fr_indices$`Change (%)` = as.numeric(gsub("\n\t\t\t\t\t\t\t\t\t\t\t%", "", fr_indices$`Change (%)`))
#   # fr_indices$`Last price` = as.numeric(gsub(",", "", fr_indices$`Last price`))
#
#   # EU INDICES
#
#   # EU_indices = euro_infos[[2]]
#   # names(EU_indices) = c("Instrument name", "Last price",  "Day change relative (%)")
#   # EU_indices$`Day change relative (%)` = as.numeric(gsub("\n\t\t\t\t\t\t\t\t\t\t\t%", "", EU_indices$`Day change relative (%)`))
#   # EU_indices$`Last price` = as.numeric(gsub(",", "", EU_indices$`Last price`))
#
#
#   # CURRENCY RATES
#   # Currency_rate = euro_infos[[3]]
#   # names(Currency_rate) = c("Instrument name", "Last price",  "Day change relative (%)")
#   # Currency_rate$`Day change relative (%)` = as.numeric(gsub("\n\t\t\t\t\t\t\t\t\t\t\t%", "", Currency_rate$`Day change relative (%)`))
#   # Currency_rate$`Last price` = as.numeric(gsub(",", "", Currency_rate$`Last price`))
#
#   # return(list(fr_indices = fr_indices,
#   #             EU_indices = EU_indices,
#   #             Currency_rate = Currency_rate))
#
#   return(euro_infos)
#
#
# }
#
# # brussels
# # dtaaa = get_Stocks_bis('https://live.euronext.com/en/markets/brussels')
#
# dtaaa = get_Stocks_bis('https://live.euronext.com/en/markets/paris')
#
# dtaaa[[3]]
#
# # Load the necessary library
# library(rvest)
#
# # Define the URL
# # url <- "https://live.euronext.com/en/markets/brussels"
#
# url <- "https://live.euronext.com/en/markets/paris"
#
# # Read the HTML content of the webpage
# page <- read_html(url)
#
# # Extract the text from the specified node ie first node, ie data[[1]]
# node_text1 <- page %>%
#   html_node("#block-belgianindiceslastandchange > div.card-header > h3") %>%
#   html_text()
#
# node_text1 <- gsub("\n|\t", "", node_text1)
#
# # Test if 'indices' is in the text
# if(grepl("indices",node_text1)){
#   # We can format the first summary data1
#
# }
#
# # Print the extracted text
# print(node_text1)
#
# # Extract the text from the specified node second node ie data[[2]]
# node_text2 <- page %>%
#   html_node("#block-euindiceslastandchange > div.card-header > h3") %>%
#   html_text()
#
# node_text2 <- gsub("\n|\t", "", node_text2)
#
# if(grepl("EU indices", node_text2)){
#   # We can format the first summary data2
#
# }
#
# # Extract the table elements from the specified nodes
# node_text3 <- page %>%
#   html_nodes("#content > section > div:nth-child(7) > div:nth-child(3) > div > div > div > div > div.viewsreference--view-title") %>%
#   html_text()
#
# node_text3 <- gsub("\n|\t", "", node_text3)
#
# if(grepl("Highlight", node_text3)){
#   # We can format the first summary data2
#
#
# }else{
#
# }
#
# # Extract the table elements from the specified nodes
# draft_text <- page %>%
#   html_nodes("#content > section > div:nth-child(7)") %>%
#   html_table()

