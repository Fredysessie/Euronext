#' Retrieve the profile (characteristics) of a specified Equity, Index, Fund, ETF, or Bond listed on Euronext.
#'
#' This function retrieves the characteristic elements of a a Stock, Index, Etfs, Fund or Bond listed on Euronext
#' using the provided Symbol/Name/ISIN or DNA.
#'
#' @param ticker A character string representing the Stock's or an Index's ticker, name, or ISIN.
#' @param stock_type The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
#' @return A List (Name, ISIN, DNA, Symbol) representing the DNA of the Stock or an Index.
#' @examples
#'
#' library(httr)
#' library(jsonlite)
#' library(rvest)
#' library(stringr)
#' library(magrittr)
#'
#' # Note: For Equity, Index, Fund, and ETF, provide the giving Symbol, ISIN,
#' # Name, or DNA for best results, but for a Bond, provide its DNA and
#' # sometimes its Name for best results because a company or country
#' # can issue more than one Bond.
#'
#' ## Equities
#' # Example a : '3D SYSTEMS CORP' equity
#' EN_GetProfile("4ddd")  # By providing Symbol
#'
#' # Example b : 'ALFEN' equity
#' EN_GetProfile("NL0012817175") # By providing ISIN
#'
#' # Example c : 'LES HOTELS BAVEREZ' equity
#' EN_GetProfile("LES HOTELS BAVEREZ") # By providing Name
#'
#' # Example d : 'BE SEMICONDUCTOR' equity
#' EN_GetProfile("NL0012866412-XAMS") # By providing DNA
#'
#' ## Indices
#' # Example a : 'AEX CONS STAPL GR' Index
#' EN_GetProfile("NLCSG") # By providing Symbol
#'
#' # Example b : 'AEX All-Share Index' Index
#' EN_GetProfile("NL0000249100") # By providing ISIN
#'
#' # Example c : 'Euronext Core Europe 30 EW Decrement 5% NR' Index
#' EN_GetProfile("EN CE EW30 D 5% NR") # By providing Name
#'
#' # Example d : 'SBF 120 NR' Index
#' EN_GetProfile("QS0011131842-XPAR") # By providing DNA
#'
#' \donttest{
#'
#' # Funds
#' # Example a : 'ACOMEA PERFORMANCE' Fund
#' EN_GetProfile("ACAPER", stock_type = 'F') # By providing Symbol
#'
#' # Example b : 'BNP ESGNL' Fund
#' EN_GetProfile("BNP ESGNL", stock_type = 'F') # By providing Name
#'
#' # Example c : 'SWIF2' Fund
#' EN_GetProfile("NL0015000W40", stock_type = 'F') # By providing ISIN of SWIF2
#'
#' # Example d : 'GOLDMAN SACHS PARAPLUFONDS 2 N' Fund
#' EN_GetProfile("NL0000293181-XAMS", stock_type = 'F') # By providing DNA of GSDM5
#'
#'
#' ## ETFs
#' # Example a : 'Asia IG Corp US A' Etf
#' EN_GetProfile("$Asia IG Corp US A", stock_type = 'E') # By providing Name
#'
#' # Example b : '1X MSFT' Etf
#' EN_GetProfile("MSFT", stock_type = 'E') # By providing Symbol
#'
#' # Example c : '3X LONG COINBASE' Etf
#' EN_GetProfile("XS2399367254", stock_type = 'E') # By providing ISIN of 3X LONG COINBASE
#'
#' # Example d : '3X PLTR' Etf
#' EN_GetProfile("XS2663694680-XAMS", stock_type = 'E') # By providing DNA
#'
#'
#' # Examples for Bonds
#' # Example a: 'A2A SLB TF 0,625%' Bond
#' EN_GetProfile("XS2364001078-XMOT", stock_type = 'B') # By providing DNA
#'
#' # Example b: 'AAB1.50%30SEP30' Bond
#' EN_GetProfile("AAB1.50%30SEP30", stock_type = 'B') # By providing Name
#' }
#'
#' @import httr
#' @importFrom magrittr %>%
#' @export
#'

EN_GetProfile <- function(ticker, stock_type = 'Eq_Ind') {
  # Format the ticker to uppercase
  ticker <- toupper(unique(ticker))

  if(length(ticker)!=1){
    stop('Only unique ticker is allowed')
  }

  if(stock_type %in% c('Fund', "F")){
    dt_List <- EN_Funds_List()
    if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name, dt_List$Ticker_adn))) {
      # Replace "column_name" with the actual column name you want to retrieve
      the_adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
      the_symbol <- na.omit(dt_List$Ticker[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
      the_name <- na.omit(dt_List$Name[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
      the_isin <- na.omit(dt_List$Code_ISIN[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]

      return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))

    } else {
      return("Ticker not found")
    }

  } else if(stock_type %in% c('Bond', "B")){
    # Utiliser la nouvelle structure pour les bonds
    # Récupérer toutes les pages de bonds
    all_bonds <- data.frame()

    # Récupérer le nombre total de pages
    url <- "https://live.euronext.com/en/pd/data/bond"

    headers = c(
      accept = "application/json, text/javascript, */*; q=0.01",
      `accept-language` = "fr,fr-FR;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6",
      `content-type` = "application/x-www-form-urlencoded; charset=UTF-8",
      origin = "https://live.euronext.com",
      priority = "u=1, i",
      referer = "https://live.euronext.com/en/bonds/list",
      `sec-ch-ua` = '"Microsoft Edge";v="141", "Not?A_Brand";v="8", "Chromium";v="141"',
      `sec-ch-ua-mobile` = "?0",
      `sec-ch-ua-platform` = '"Windows"',
      `sec-fetch-dest` = "empty",
      `sec-fetch-mode` = "cors",
      `sec-fetch-site` = "same-origin",
      `user-agent` = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0",
      `x-requested-with` = "XMLHttpRequest"
    )

    params <- list(mics = "ALXB,ALXL,ALXP,XPAR,XAMS,XBRU,XLIS,XMLI,MLXB,ENXB,ENXL,TNLA,TNLB,XLDN,XHFT,VPXB,XOSL,XOAM,EXGM,ETLX,MOTX,XMOT")

    data_first <- list(
      draw = "1",
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

    response <- httr::POST(
      url = url,
      httr::add_headers(.headers = headers),
      query = params,
      body = data_first,
      encode = "form"
    )

    content <- httr::content(response, "text", encoding = "UTF-8")
    data <- jsonlite::fromJSON(content)

    length_rows <- data$iTotalDisplayRecords
    nb_pages <- ceiling(length_rows/100)

    # Parcourir toutes les pages
    for (page in 1:nb_pages) {
      start_value <- (page - 1) * 100

      data_page <- list(
        draw = as.character(page + 1),
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

      response <- httr::POST(
        url = url,
        httr::add_headers(.headers = headers),
        query = params,
        body = data_page,
        encode = "form"
      )

      content <- httr::content(response, "text", encoding = "UTF-8")
      data <- jsonlite::fromJSON(content)

      # Extraire les données des bonds (structure similaire aux autres fonctions)
      # Cette partie nécessiterait une adaptation spécifique pour les bonds
      # Pour l'instant, nous retournons un message d'erreur

      length_rows <- data$iTotalDisplayRecords
      nb_pages <- ceiling(length_rows/100)

      start_values <- seq(0, nb_pages*100, 100)
      the_length_ <- length(start_values)
      start_values <- seq(0, nb_pages*100, 100)


      max_pages <- start_values[the_length_ - 1]  # Nombre maximum de pages à vérifier

      for (i in 1:(max_pages/100)) {
        dt_List <- EN_Bonds_List_bis(target_page = i)

        ticker = gsub("$","", toupper(ticker))

        dt_List$Name = gsub("$","", toupper(dt_List$Name))

        # dt_List$Name = gsub("-|$","", toupper(dt_List$Name))

        if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Issuer, dt_List$Name, dt_List$Ticker_adn))) {
          # adn <- na.omit(dt_List$Ticker_adn[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]

          the_adn <- na.omit(dt_List$Ticker_adn[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
          the_issuer <- na.omit(dt_List$Issuer[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
          the_name <- na.omit(dt_List$Name[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
          the_isin <- na.omit(dt_List$Code_ISIN[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]

          return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Issuer = the_issuer))
        }
      }

      return("Ticker not found")


    #   Sys.sleep(0.5) # Pause pour éviter de surcharger le serveur
    }
    #
    # return("Bond search functionality needs to be updated with specific bond data extraction")

  } else if(stock_type %in% c('Etfs', "E")){
    ticker <- toupper(ticker)

    # URL de la requête
    url <- "https://live.euronext.com/en/pd_es/data/track?mics=XAMS%2CXBRU%2CXLIS%2CXPAR%2CXLDN%2CXMSM%2CXOSL%2CETFP"

    # Get numbers rows to calculate number on possible pages
    # params <- list(
    #   "draw" = 3, #Permet de récupérer tout le tableau de la page
    #   "columns[0][data]" = 0,
    #   "columns[0][name]" = "",
    #   "search[value]" = "",
    #   "search[regex]" = "false",
    #   "args[initialLetter]" = "",
    #   "iDisplayLength" = 100,
    #   "iDisplayStart" = 0,
    #   "sSortDir_0" = "asc",
    #   "sSortField" = "name"
    # )

    # Headers fixes
    headers = c(
      accept = "application/json, text/javascript, */*; q=0.01",
      `accept-language` = "fr,fr-FR;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6",
      `content-type` = "application/x-www-form-urlencoded; charset=UTF-8",
      origin = "https://live.euronext.com",
      priority = "u=1, i",
      referer = "https://live.euronext.com/en/products/etfs/list",
      `sec-ch-ua` = '"Microsoft Edge";v="141", "Not?A_Brand";v="8", "Chromium";v="141"',
      `sec-ch-ua-mobile` = "?0",
      `sec-ch-ua-platform` = '"Windows"',
      `sec-fetch-dest` = "empty",
      `sec-fetch-mode` = "cors",
      `sec-fetch-site` = "same-origin",
      `user-agent` = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0",
      `x-requested-with` = "XMLHttpRequest"
    )

    # Parameters for the request
    params <- list(mics = "ALXA,ALXB,ALXL,ALXP,ATFX,BGEM,ENXB,ENXL,ETFP,ETLX,EXGM,MERK,MIVX,MLXB,MOTX,MTAA,MTAH,MTCH,SEDX,TNLA,TNLB,VPXB,WOMF,XACD,XAMS,XATL,XBRU,XDUB,XESM,XLDN,XLIS,XMLI,XMOT,XMSM,XOAM,XOAS,XOBD,XOSL,XPAR")

    data_first <- list(
      draw = "1",
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

    # response <- httr::POST(url, body = params, encode = "form")
    response <- httr::POST(
      url = url,
      httr::add_headers(.headers = headers),
      query = params,
      body = data_first,
      encode = "form"
    )
    # Lire le contenu JSON de la réponse
    content <- httr::content(response, "text", encoding = "UTF-8")
    data <- jsonlite::fromJSON(content)

    length_rows <- data$iTotalDisplayRecords
    nb_pages <- ceiling(length_rows/100)

    start_values <- seq(0, nb_pages*100, 100)
    the_length_ <- length(start_values)
    start_values <- seq(0, nb_pages*100, 100)


    max_pages <- start_values[the_length_ - 1]  # Nombre maximum de pages à vérifier

    for (i in 1:(max_pages/100)) {
      # print(i)
      dt_List <- EN_Etfs_List_bis(target_page = i)
      # dt_List <- EN_Etfs_List(target_page = i)

      if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name, dt_List$Ticker_adn))) {
        # print('ok')
        # Filter
        ticker = gsub("$","", toupper(ticker))
        # ticker = gsub("-|$","", toupper(ticker))

        dt_List$Name = gsub("$","", toupper(dt_List$Name))
        # dt_List$Name = gsub("-|$","", toupper(dt_List$Name))

        the_adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
        the_symbol <- na.omit(dt_List$Ticker[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
        the_name <- na.omit(dt_List$Name[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
        the_isin <- na.omit(dt_List$Code_ISIN[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]

        return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))

      }
    }

    return("Ticker not found")

  } else if(stock_type == 'Eq_Ind'){
    # Utiliser la nouvelle API de recherche
    url <- paste0("https://live.euronext.com/en/instrumentSearch/searchJSON?q=", URLencode(ticker))

    headers = c(
      accept = "application/json, text/javascript, */*; q=0.01",
      `accept-language` = "fr,fr-FR;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6",
      `sec-ch-ua` = '"Microsoft Edge";v="141", "Not?A_Brand";v="8", "Chromium";v="141"',
      `sec-ch-ua-mobile` = "?0",
      `sec-ch-ua-platform` = '"Windows"',
      `sec-fetch-dest` = "empty",
      `sec-fetch-mode` = "cors",
      `sec-fetch-site` = "same-origin",
      `user-agent` = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0",
      `x-requested-with` = "XMLHttpRequest"
    )

    response <- httr::GET(url, httr::add_headers(.headers = headers))

    if (status_code(response) == 200) {
      content <- httr::content(response, "text", encoding = "UTF-8")
      data <- jsonlite::fromJSON(content)

      if (!is.null(data) && length(data) > 0 && data$value[1] != "") {
        if(nrow(data) > 1){
          data = data[which(data$name != ""),]

          if(nrow(data) == 1){
            the_isin = data$value
            the_name  = data$name
            the_adn <- paste0(data$value, "-", data$mic)
            the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label)

            return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))

          } else {
            good_index = grep("equities", data$label)
            if(length(good_index) > 0) {
              data = data[good_index, ]
            }

            data$adn <- paste0(data$value, "-", data$mic)
            good_list = NULL

            for (ticks in data$adn) {
              perf_test = suppressWarnings(EN_Ticker_Performance(ticks, escape = TRUE))
              if(!is.null(dim(perf_test))){
                good_list = append(good_list, ticks)
              }
            }

            if(length(good_list) == 1){
              best_index = grep(good_list, data$adn)
              data = data[best_index, ]

              the_isin = data$value
              the_name  = data$name
              the_adn <- paste0(data$value, "-", data$mic)
              the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label)

              return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
            }
          }
        } else {
          the_isin = data$value[1]
          the_name  = data$name[1]
          the_adn <- paste0(data$value[1], "-", data$mic[1])
          the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label[1])

          return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
        }
      } else {
        # Essayer avec seulement la partie avant le tiret
        ticker1 <- sub("-.*", "", ticker)
        url <- paste0("https://live.euronext.com/en/instrumentSearch/searchJSON?q=", URLencode(ticker1))

        response <- httr::GET(url, httr::add_headers(.headers = headers))

        if (status_code(response) == 200) {
          content <- httr::content(response, "text", encoding = "UTF-8")
          data <- jsonlite::fromJSON(content)

          if (!is.null(data) && length(data) > 0 && data$value[1] != "") {
            the_isin = data$value[1]
            the_name  = data$name[1]
            the_adn <- paste0(data$value[1], "-", data$mic[1])
            the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label[1])

            return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
          } else {
            return("Ticker not found")
          }
        } else {
          warning("Error fetching data. HTTP status code: ", status_code(response))
          return(NULL)
        }
      }
    } else {
      warning("Error fetching data. HTTP status code: ", status_code(response))
      return(NULL)
    }
  } else {
    rlang::abort(
      "Only parameters such us 'Eq_Ind' for Stocks and Indexes, 'Fund' or 'F' for Fund tickers, 'Bond' or 'B' for Bond tickers, and 'Etfs' or 'E' for EFTs are allowed."
    )
  }
}


# Old version
# EN_GetProfile <- function(ticker, stock_type = 'Eq_Ind') {
#   # Format the ticker to uppercase
#   ticker <- toupper(unique(ticker))
#
#   if(length(ticker)!=1){
#     stop('Only unique ticker is allowed')
#   }
#
#
#   if(stock_type %in% c('Fund', "F")){
#     dt_List <- EN_Funds_List()
#     if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name, dt_List$Ticker_adn))) {
#       # Replace "column_name" with the actual column name you want to retrieve
#       the_adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#       the_symbol <- na.omit(dt_List$Ticker[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#       the_name <- na.omit(dt_List$Name[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#       the_isin <- na.omit(dt_List$Code_ISIN[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#
#
#       return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
#
#     } else {
#       return("Ticker not found")
#     }
#
#   } else if(stock_type %in% c('Bond', "B")){
#
#     url = "https://live.euronext.com/en/pd/data/bond?mics=ALXB%2CALXL%2CALXP%2CXPAR%2CXAMS%2CXBRU%2CXLIS%2CXMLI%2CMLXB%2CENXB%2CENXL%2CTNLA%2CTNLB%2CXLDN%2CXHFT%2CVPXB%2CXOSL%2CXOAM%2CEXGM%2CETLX%2CMOTX%2CXMOT&display_datapoints=dp_bond&display_filters=df_bond"
#
#
#     # Get numbers rows to calculate number on possible pages
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
#       "iDisplayStart" = 0,
#       "sSortDir_0" = "asc",
#       "sSortField" = "name"
#     )
#
#     response <- httr::POST(url, body = params, encode = "form")
#
#     # Lire le contenu JSON de la réponse
#     content <- httr::content(response, "text", encoding = "UTF-8")
#     data <- jsonlite::fromJSON(content)
#
#     length_rows <- data$iTotalDisplayRecords
#     nb_pages <- ceiling(length_rows/100)
#
#     start_values <- seq(0, nb_pages*100, 100)
#     the_length_ <- length(start_values)
#     start_values <- seq(0, nb_pages*100, 100)
#
#
#     max_pages <- start_values[the_length_ - 1]  # Nombre maximum de pages à vérifier
#
#     for (i in 1:(max_pages/100)) {
#       dt_List <- EN_Bonds_List_bis(target_page = i)
#
#       ticker = gsub("$","", toupper(ticker))
#
#       dt_List$Name = gsub("$","", toupper(dt_List$Name))
#
#       # dt_List$Name = gsub("-|$","", toupper(dt_List$Name))
#
#       if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Issuer, dt_List$Name, dt_List$Ticker_adn))) {
#         # adn <- na.omit(dt_List$Ticker_adn[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#
#         the_adn <- na.omit(dt_List$Ticker_adn[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#         the_issuer <- na.omit(dt_List$Issuer[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#         the_name <- na.omit(dt_List$Name[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#         the_isin <- na.omit(dt_List$Code_ISIN[dt_List$Issuer == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#
#         return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Issuer = the_issuer))
#       }
#     }
#
#     return("Ticker not found")
#
#
#   } else if(stock_type %in% c('Etfs', "E")){
#     ticker <- toupper(ticker)
#
#     # URL de la requête
#     url <- "https://live.euronext.com/en/pd_es/data/track?mics=XAMS%2CXBRU%2CXLIS%2CXPAR%2CXLDN%2CXMSM%2CXOSL%2CETFP"
#
#     # Get numbers rows to calculate number on possible pages
#     params <- list(
#       "draw" = 3, #Permet de récupérer tout le tableau de la page
#       "columns[0][data]" = 0,
#       "columns[0][name]" = "",
#       "search[value]" = "",
#       "search[regex]" = "false",
#       "args[initialLetter]" = "",
#       "iDisplayLength" = 100,
#       "iDisplayStart" = 0,
#       "sSortDir_0" = "asc",
#       "sSortField" = "name"
#     )
#
#     response <- httr::POST(url, body = params, encode = "form")
#
#     # Lire le contenu JSON de la réponse
#     content <- httr::content(response, "text", encoding = "UTF-8")
#     data <- jsonlite::fromJSON(content)
#
#     length_rows <- data$iTotalDisplayRecords
#     nb_pages <- ceiling(length_rows/100)
#
#     start_values <- seq(0, nb_pages*100, 100)
#     the_length_ <- length(start_values)
#     start_values <- seq(0, nb_pages*100, 100)
#
#
#     max_pages <- start_values[the_length_ - 1]  # Nombre maximum de pages à vérifier
#
#     for (i in 1:(max_pages/100)) {
#       # print(i)
#       dt_List <- EN_Etfs_List_bis(target_page = i)
#       # dt_List <- EN_Etfs_List(target_page = i)
#
#       if (ticker %in% toupper(c(dt_List$Code_ISIN, dt_List$Ticker, dt_List$Name, dt_List$Ticker_adn))) {
#         # print('ok')
#         # Filter
#         ticker = gsub("$","", toupper(ticker))
#         # ticker = gsub("-|$","", toupper(ticker))
#
#         dt_List$Name = gsub("$","", toupper(dt_List$Name))
#         # dt_List$Name = gsub("-|$","", toupper(dt_List$Name))
#
#         the_adn <- na.omit(dt_List$Ticker_adn[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#         the_symbol <- na.omit(dt_List$Ticker[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#         the_name <- na.omit(dt_List$Name[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#         the_isin <- na.omit(dt_List$Code_ISIN[dt_List$Ticker == ticker | dt_List$Code_ISIN == ticker | dt_List$Name == ticker | dt_List$Ticker_adn == ticker])[1]
#
#         return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
#
#       }
#     }
#
#     return("Ticker not found")
#
#   } else if(stock_type == 'Eq_Ind'){
#
#     # Construct the URL for the API request
#     url <- paste0("https://live.euronext.com/en/instrumentSearch/searchJSON?q=", ticker)
#
#     # Make the fetch request
#     response <- httr::GET(url,
#                           add_headers(
#                             "accept" = "application/json, text/javascript, */*; q=0.01",
#                             "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
#                             "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
#                             "sec-ch-ua-mobile" = "?0",
#                             "sec-ch-ua-platform" = "\"Windows\"",
#                             "sec-fetch-dest" = "empty",
#                             "sec-fetch-mode" = "cors",
#                             "sec-fetch-site" = "same-origin",
#                             "x-requested-with" = "XMLHttpRequest"
#                           ),
#                           # referrer = "https://live.euronext.com/en/search_instruments/us88554d2053?restMic",
#                           referrerPolicy = "strict-origin-when-cross-origin"
#     )
#
#     # Check if the request was successful (status code 200)
#     if (status_code(response) == 200) {
#       # Parse the JSON content
#       content <- httr::content(response, "text", encoding = "UTF-8")
#       data <- jsonlite::fromJSON(content)
#
#       # Extract and return the ISIN
#       if (!is.null(data) && data$value[1] != "") {
#         # print(length(data))
#         # print(data$value[1])
#         # print(data$mic[1])
#         # Tester la performance
#         if(nrow(data) > 1){
#           data = data[which(data$name != ""),]
#
#           if(nrow(data) == 1){
#             the_isin = data$value
#             the_name  = data$name
#             the_adn <- paste0(data$value, "-", data$mic)
#             # Extract 'symbol' using regular expressions
#             the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label)
#
#             return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
#
#           }else{
#             good_index = grep("equities", data$label)
#             data = data[good_index, ]
#             # For each elem tester if performance exist
#             good_list = NULL
#
#             data$adn <- paste0(data$value, "-", data$mic)
#
#             for (ticks in data$adn) {
#               perf_test = suppressWarnings(EN_Ticker_Performance(ticks, escape = TRUE))
#
#               if(!is.null(dim(perf_test))){
#                 good_list = append(good_list, ticks)
#
#               }
#             }
#
#             if(length(good_list==1)){
#               best_index = grep(good_list, data$adn)
#               data = data[best_index, ]
#
#               the_isin = data$value
#               the_name  = data$name
#               the_adn <- paste0(data$value, "-", data$mic)
#               # Extract 'symbol' using regular expressions
#               the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label)
#
#               return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
#
#             }
#
#           }
#
#         }else{
#           the_isin = data$value[1]
#           the_name  = data$name[1]
#           the_adn <- paste0(data$value[1], "-", data$mic[1])
#           # Extract 'symbol' using regular expressions
#           the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label[1])
#
#           return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
#         }
#
#
#
#
#         return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
#       } else {
#         ticker1 <- sub("-.*", "", ticker)
#         # Construct the URL for the API request
#         url <- paste0("https://live.euronext.com/en/instrumentSearch/searchJSON?q=", ticker1)
#
#         # Make the fetch request
#         response <- httr::GET(url,
#                               add_headers(
#                                 "accept" = "application/json, text/javascript, */*; q=0.01",
#                                 "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
#                                 "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
#                                 "sec-ch-ua-mobile" = "?0",
#                                 "sec-ch-ua-platform" = "\"Windows\"",
#                                 "sec-fetch-dest" = "empty",
#                                 "sec-fetch-mode" = "cors",
#                                 "sec-fetch-site" = "same-origin",
#                                 "x-requested-with" = "XMLHttpRequest"
#                               ),
#                               # referrer = "https://live.euronext.com/en/search_instruments/us88554d2053?restMic",
#                               referrerPolicy = "strict-origin-when-cross-origin"
#         )
#
#         # Check if the request was successful (status code 200)
#         if (status_code(response) == 200) {
#           # Parse the JSON content
#           content <- httr::content(response, "text", encoding = "UTF-8")
#           data <- jsonlite::fromJSON(content)
#           # Extract and return the ISIN
#           if (!is.null(data) && data$value[1] != "") {
#             # print(length(data))
#             # print(data$value[1])
#             # print(data$mic[1])
#             the_isin = data$value[1]
#             the_name  = data$name[1]
#             the_adn <- paste0(data$value[1], "-", data$mic[1])
#             # Extract 'symbol' using regular expressions
#             the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label[1])
#
#
#             return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
#
#           } else{
#             return("Ticker not found")
#           }
#         } else {
#           # If the request was not successful, print a warning and return NULL
#           warning("Error fetching data. HTTP status code: ", status_code(response))
#           return(NULL)
#         }
#
#       }
#
#     } else {
#       # If the request was not successful, print a warning and return NULL
#       warning("Error fetching data. HTTP status code: ", status_code(response))
#       return(NULL)
#     }
#   } else{
#     rlang::abort(
#       "Only parameters such us 'Eq_Ind' for Stocks and Indexes, 'Fund' or 'F' for Fund tickers, 'Bond' or 'B' for Bond tickers, and 'Etfs' or 'E' for EFTs are allowed."
#     )
#   }
#
#
# }


# EN_GetISIN_bis <- function(ticker) {
#   # Format the ticker to uppercase
#   ticker <- toupper(ticker)
#
#   # Construct the URL for the API request
#   url <- paste0("https://live.euronext.com/en/instrumentSearch/searchJSON?q=", ticker)
#
#   # Make the fetch request
#   response <- httr::GET(url,
#                         add_headers(
#                           "accept" = "application/json, text/javascript, */*; q=0.01",
#                           "accept-language" = "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
#                           "sec-ch-ua" = "\"Not_A Brand\";v=\"8\", \"Chromium\";v=\"120\", \"Google Chrome\";v=\"120\"",
#                           "sec-ch-ua-mobile" = "?0",
#                           "sec-ch-ua-platform" = "\"Windows\"",
#                           "sec-fetch-dest" = "empty",
#                           "sec-fetch-mode" = "cors",
#                           "sec-fetch-site" = "same-origin",
#                           "x-requested-with" = "XMLHttpRequest"
#                         ),
#                         # referrer = "https://live.euronext.com/en/search_instruments/us88554d2053?restMic",
#                         referrerPolicy = "strict-origin-when-cross-origin"
#   )
#
#   # Check if the request was successful (status code 200)
#   if (status_code(response) == 200) {
#     # Parse the JSON content
#     content <- httr::content(response, "text", encoding = "UTF-8")
#     data <- jsonlite::fromJSON(content)
#
#     # Extract and return the ISIN
#     if (!is.null(data) && data$value[1] != "") {
#       # print(length(data))
#       # print(data$value[1])
#       # print(data$mic[1])
#       the_isin = data$value[1]
#       the_name  = data$name[1]
#       the_adn <- paste0(data$value[1], "-", data$mic[1])
#       # Extract 'symbol' using regular expressions
#       the_symbol <- gsub('.*<span class=\'symbol\'>(.*?)</span>.*', '\\1', data$label[1])
#
#       return(list(Name = the_name, ISIN = the_isin, DNA = the_adn, Symbol=the_symbol))
#     } else {
#       return("Ticker not found")
#     }
#   } else {
#     # If the request was not successful, print a warning and return NULL
#     warning("Error fetching data. HTTP status code: ", status_code(response))
#     return(NULL)
#   }
# }
