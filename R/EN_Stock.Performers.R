#' Retrieve performance data for stocks from various markets on the Euronext exchange.
#'
#'  This function retrieves performance data for stocks from different markets on the Euronext exchange.
#'
#' @param direction (character) Direction of the stock performance data. Can be one of 'MostActive', 'Risers' (or 'R' or 'Up') , 'Fallers' (or 'F' or 'Down').
#' @param since (character) Duration since when the performance data is requested. Allowed values: "1D" (1 day), "1M" (1 month), "1Y" (1 year), "1Jan" (since January 1st).
#' @param stock_choice (character) Choice of the stock market. Allowed values: 'All', 'Amsterdam' (or 'A'), 'Brussels' (or 'B'), 'Dublin' (or 'D'), 'Lisbon' (or 'L'), 'Milan' (or 'M'), 'Paris' (or 'P'), 'Oslo' (or 'O').
#' @param capitalization (character) Capitalization filter for stocks. Allowed values: 'All', 'Large Caps' (or 'LC'), 'Mid Caps' (or 'MC'), 'Small Caps' (or 'SC').
#' @param belongs_to (character) Ownership filter for stocks. Depends on the chosen `stock_choice`. Consult the function documentation for valid values.
#' @param eligibility (character) Eligibility criteria for stocks. Depends on the chosen `stock_choice`. Consult the function documentation for valid values. Default value: 'all'.
#' @param icb_sector (character) ICB sector filter for stocks.
#'
#' @family Data Retrieval
#' @family Euronext
#'
#' @author Koffi Frederic SESSIE
#'
#' @return A dataframe containing performance data for the specified stocks. Columns include: 'Name', 'Symbol', 'Price', 'Change %', 'Volume', 'Turnover', 'Market Cap (M)'. If no data is available, it returns `NULL`.
#'
#' @import httr
#' @import rvest
#' @import stringr
#'
#' @examples
#' \donttest{
#' library(httr)
#' library(httr2)
#' library(rvest)
#' library(stringr)
#'
#' # Retrieve performance data for Brussels market
#' b_perf_data <- EN_Stock.Performers(direction = 'MostActive',
#'                                     since = "1D",
#'                                     stock_choice = "Brussels",
#'                                     capitalization = 'All',
#'                                     belongs_to = "All",
#'                                     eligibility = "all",
#'                                     icb_sector = "")
#'
#'
#' # Retrieve performance data for Oslo market with Euronext expand filter for fallers
#' o_perf_data <- EN_Stock.Performers(direction = 'f',
#'                                     since = "1M",
#'                                     stock_choice = "Oslo",
#'                                     capitalization = 'All',
#'                                     belongs_to = "EuronextExpand",
#'                                     eligibility = "all",
#'                                     icb_sector = "")
#'
#'
#' # Retrieve performance data for Paris market with specific filters
#' p_perf_data <- EN_Stock.Performers(direction = 'R',
#'                                    since = "1Jan",
#'                                    stock_choice = "Paris",
#'                                    capitalization = 1,
#'                                    belongs_to = "CACLARGE60",
#'                                    eligibility = "PEA",
#'                                    icb_sector = "")
#'
#'
#' # Retrieve performance data for all markets with specific filters
#' all_perf_data <- EN_Stock.Performers(direction = 'MostActive',
#'                                      since = "1D",
#'                                      stock_choice = "all",
#'                                      capitalization = 3,
#'                                      belongs_to = "Euro100",
#'                                      eligibility = "all",
#'                                      icb_sector = "")
#'
#'}
#'
#'@export
#'

EN_Stock.Performers <- function(direction = 'MostActive',
                                since,
                                stock_choice = 'All',
                                capitalization = 'All',
                                belongs_to = "All",
                                eligibility = "all",
                                icb_sector = '') {

  direction = str_to_title(direction)

  # Direction param
  if( is.character(direction) && direction %in% str_to_title(c('MostActive', 'R', 'Risers', 'Up', 'F', 'Fallers', 'Down'))){
    if (direction %in% str_to_title(c('MostActive'))) {
      direction <- 'MostActive'
    } else if (direction %in% c('R', 'Risers', 'Up')) {
      direction <- 'Risers'
    } else {
      # (direction %in% c('F', 'Fallers', 'Down'))
      direction <- 'Fallers'
    }
  } else {
    stop("Invalid direction parameter")
  }

  # Since param
  # since_list = c("Yesterday", "OneMonth", "OneYear", "Jan1st")
  # since = str_to_title(since)
  # if(since %in% since_list){
  #   since = since
  #
  # }else{
  #   stop("Invalid 'since' parameter")
  # }

  # Since param
  since = toupper(since)

  if(since %in% toupper(c("1D", "1M", "1Y", "1Jan"))){
    if(since == "1D"){
      since = "Yesterday"
    } else if(since == "1M"){
      since = "OneMonth"
    } else if(since == "1Y"){
      since = "OneYear"
    } else{
      since = "Jan1st"
    }

  } else{
    stop("Invalid 'Since' parameter")
  }


  # Market parameter
  stock_choice = str_to_lower(stock_choice)

  if( stock_choice == "all"){
    stock_choice = "all"

    belongs_to.list = c("All", "Euronext", "Alternext", "Alternext400", "Alternext500",
                        "Euro100", "Next150")

    if(belongs_to %in% belongs_to.list){

      belongs_to = belongs_to
    }else{
      stop("Invalid 'belongs_to' parameter")
    }

  } else{
    if( stock_choice %in%  c("a", "amsterdam")){
      stock_choice = "amsterdam"

      belongs_to.list = c("All", "Euronext", "Euronext100", "Euronext200", "Euronext300",
                          "Alternext", "Alternext400", "Alternext500", "TNLA", "AEX", "AMX",
                          "ASCX", "ADam")

      if(belongs_to %in% belongs_to.list){

        belongs_to = belongs_to
      }else{
        stop("Invalid 'belongs_to' parameter")
      }

    } else if( stock_choice %in% c("b", "brussels") ){
      stock_choice = "brussels"

      belongs_to.list = c("All", "Euronext", "Euronext100", "Euronext200", "Euronext300",
                          "Alternext", "Alternext400", "Alternext500", "MarcheLibre", "TNLB",
                          "Euronext700", "BEL20", "BEL20GR", "BEL20NR", "BELMID", "BELSMALL",
                          "BAS", "BASNR", "BECONTINUOUS", "BELMIDNR", "BELSMALLNR")

      if(belongs_to %in% belongs_to.list){
        belongs_to = belongs_to

      }else{
        stop("Invalid 'belongs_to' parameter")
      }

    } else if( stock_choice %in% c("d", "dublin") ){
      stock_choice = "dublin"

      belongs_to.list = c("All", "EuronextDublin", "EuronextGrowth", "ISEQ20", "ISEQALL",
                          "ISEQSMALL")

      if(belongs_to %in% belongs_to.list){
        belongs_to = belongs_to

      }else{
        stop("Invalid 'belongs_to' parameter")

      }

    } else if( stock_choice %in% c("l", "lisbon") ){
      stock_choice = "lisbon"

      belongs_to.list = c("All", "Euronext", "Euronext100", "Euronext200", "Euronext300",
                          "Alternext", "Easynext", "PSI20", "PSI20GR", "PSIGERAL")

      if(belongs_to %in% belongs_to.list){
        belongs_to = belongs_to

      }else{
        stop("Invalid 'belongs_to' parameter")

      }


    } else if( stock_choice %in% c("m", "milan") ){
      stock_choice = "milan"

      belongs_to.list = c("All", "EuronextMilan", "EuronextGrowthMilan", "MIBESG")

      if(belongs_to %in% belongs_to.list){
        belongs_to = belongs_to

      }else{
        stop("Invalid 'belongs_to' parameter")

      }

    } else if( stock_choice %in% c("p", "paris")  ){
      stock_choice = "paris"

      belongs_to.list = c("All", "Euronext", "Euronext100", "Euronext200", "Euronext300",
                          "Euronext600", "Alternext", "Alternext400", "Alternext500", "MarcheLibre",
                          "CAC40", "CACNEXT20", "CACLARGE60", "CACMID60", "CACSMALL", "CACMIDSMALL",
                          "SBF120", "CACALLTRADABLE", "CACALLSHARES", "EuronextFASIAS",
                          "IEIF")

      if(belongs_to %in% belongs_to.list){
        belongs_to = belongs_to

      }else{
        stop("Invalid 'belongs_to' parameter")

      }

    } else if( stock_choice %in% c("o", "oslo") ){
      stock_choice = "oslo"

      belongs_to.list = c("All", "EuronextBors", "EuronextGrowth", "EuronextExpand",
                          "OBXTOTAL", "OSEBX")

      if(belongs_to %in% belongs_to.list){
        belongs_to = belongs_to

      }else{
        stop("Invalid 'belongs_to' parameter")

      }

    } else {
      stop("Invalid 'stock_choice' parameter")
    }
  }

  stock_choice = str_to_title(stock_choice)

  # cap_list = c("", "1", "2", "3")
  capitalization = toupper(capitalization)
  # capitalization parameter
  if(capitalization == 'ALL'){
    capitalization = ''

  }else if(capitalization %in% toupper(c(1, 'Large Caps', 'LC'))){
    capitalization = 1

  }else if(capitalization %in% toupper(c(2, 'Mid Caps', 'MC'))){
    capitalization = 2

  }else if(capitalization %in% toupper(c(3, 'Small Caps', 'SC'))){
    capitalization = 3

  }else{
    stop("Invalid 'capitalization' parameter")
  }


  # belongs_to.list = c("All", "Euronext", "Alternext", "Alternext400", "Alternext500",
  #                     "Euro100", "Next150")


  url <- paste0("https://live.euronext.com/en/ajax/getTopPerformersPopup/", direction, "?a=true&tp_type=STOCK")

  # Définir les paramètres de la requête POST
  # url <- "https://live.euronext.com/en/ajax/getTopPerformersPopup/MostActive?a=true&tp_type=STOCK"
  body <- list(
    since = since,
    market = stock_choice,
    capitalization = capitalization,
    belongs_to = belongs_to,
    eligibility = eligibility,
    icb_sector = icb_sector
  )

  # Faire la requête POST
  response <- POST(url, body = body, encode = "form")

  data <- content(response, encoding = "UTF-8") %>%
    rvest::html_nodes('table') %>%
    rvest::html_table()

  data = data[[2]]

  if(nrow(data) == 0){
    message("Sorry, the content is currently unavailable. Please try using a different filter.")
    return(NULL)
  }else{
    return(data)

  }

  # It will be useful to customise function later
  # paste("'Content unavailable', try other filter") == "'Content unavailable', try other filter"

  # print(since)
  # print(direction)
  # print(stock_choice)
  # print(capitalization)
  # print(belongs_to)
  # print(eligibility)
  # print(icb_sector)


}
