#' Euronext OVERVIEW PLOT
#'
#' @description This function will get Ticker(s) data and then plot it.
#'
#' @family Data Retrieval
#' @family Plot
#' @family Euronext
#' @author Koffi Frederic SESSIE
#'
#' @param ticker is the Ticker(s) name(s)
#' @param from A quoted start date, ie. "2020-01-01" or "2020/01/01". The date
#' must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".
#' @param to A quoted end date, ie. "2022-01-31" or "2022/01/31". The date must
#' be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD"
#' @param stock_type   The type of the ticker: 'Eq_Ind' for Stocks and Indexes,
#'                     'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers,
#'                     and 'Etfs' or "E" for ETFs.
#' @param up.col is the up color
#' @param down.col is down color
#' @param escape Boolean, either TRUE or FALSE. If escape is TRUE, it means you're providing
#'               the DNA (ISIN-Market identifier) directly. Giving TRUE to escape is helpful
#'               to avoid time-consuming operations; otherwise, FALSE means you need to provide
#'               the Ticker symbol, name, or ISIN and the type of market to which it belongs.
#' @seealso `EN_HistData()` and `EN_HistData_bis()`
#' @seealso `EN_Ticker_hcData()`
#'
#' @return
#' An interactive chart
#'
#'
#' @importFrom xts as.xts
#' @importFrom dplyr last
#' @import flextable
#' @import magrittr
#' @importFrom grDevices col2rgb
#' @importFrom highcharter highchart hc_title hc_add_series hc_add_yAxis hc_add_series hc_yAxis_multiples hc_colors hc_exporting
#'
#' @examples
#'
#'\donttest{
#' library(highcharter)
#' library(lubridate)
#' library(rlang)
#' library(httr2)
#' library(dplyr)
#' library(stringr)
#' library(xts)
#' library(flextable)
#' library(grDevices)
#'
#' #Highchart of 4DDD (area chart for Last price and column chart for volume)
#' # Default up.col = "darkgreen", down.col = "red"
#' EN_Overview_plot(c("4DDD"), to = Sys.Date())
#'
#' # You can change the up and down colors as follow
#' EN_Overview_plot("AAX", up.col = "blue", down.col = "pink")
#'
#' # Plot the closing price of a group of 3 tickers
#' EN_Overview_plot(c("AAX", "QS0011016480", "AEX2S", "ADIDAS", "ADOBE", "ALFEN BEHEER", "1GOOGL"))
#'
#' # AEX All-Tradable Alternative Weight NR, AEX Equal Weight NR,
#' # AEX Short GR and AEX X2 Short GR plot overview
#' EN_Overview_plot(c("NL0010614533", "QS0011211206", "QS0011095914", "QS0011146899"))
#'
#' # Bond
#' EN_Overview_plot(c("XS2364001078-XMOT"), stock_type = 'B')
#'
#'}
#'
#' @export
#'

EN_Overview_plot <- function(ticker,
                             from = NULL,
                             to = Sys.Date() - 1,
                   stock_type = 'Eq_Ind',
                   escape = FALSE,
                   up.col = "darkgreen",
                   down.col = "red") {
  #  message('It possible to plot each sector chart line. You can use as argument .sectors$Agriculture to plot. Example EN_Overview_plot(.sector$Agriculture)')
  # date1<- from

  areColors <- function(x) {
    sapply(x, function(X) {
      tryCatch(is.matrix(col2rgb(X)),
               error = function(e) FALSE)
    })[!is.na(x)]  # Filter out NA values from the result
  }

  if(!all(areColors(c(up.col, down.col)))){
    rlang::abort(
      "Please provide a valid color format. For example, you can use names like 'red' or hexadecimal codes like '#F05090'."
    )
  }

  if (is.null(from)) {
    date1 <- as.Date("1970-01-01")  # Set a default value
  } else {
    date1 <- as.Date(strftime(from, format="%Y-%m-%d"))
  }

  date2 = to
  # Evaluate input parameters ----
  ticker <- unique(toupper(ticker))

  stock_type = stock_type

  Global.returns <- EN_Ticker_hcData(ticker = ticker,
                                    from = date1,
                                    to = date2,
                                    stock_type = stock_type,
                                    escape = escape)



  # print(length(Global.returns))

  # print(names(Global.returns))

  # print(dim(Global.returns))

  # print(length(Global.returns))
  # print(dim(Global.returns))
  if(length(Global.returns) == 1){
    rlang::abort("Ticker not found, please use an appropriate ticker")

  } else if (length(Global.returns) == 3) {
    # In cas it is only one ticker

    Global.returns <- Global.returns[order(Global.returns$Date), ]

    Global.returns <- na.omit(Global.returns)

    ticker.name <- ticker
    Global.returns1 <- Global.returns

    date1 = min(Global.returns1$Date)

    date2 = max(Global.returns1$Date)

    Global.returns <- xts::as.xts(Global.returns[,-c(1)],
                            order.by=Global.returns$Date)
    Global.returns1$direction <-NA

    for (i in 2:nrow(Global.returns1)) {
      i1<- i-1
      ifelse (Global.returns1[[i,"Volume"]] >= Global.returns1[[i1,"Volume"]],
              Global.returns1[[i, "direction"]] <- "up",
              Global.returns1[[i, "direction"]] <- "down")
    }

    brvm.plot <- highchart(type = "stock") %>%
      hc_title(text = paste0(ticker.name," chart : from ", date1, " to ", date2),
               style = list(fontWeight = "bold", fontSize = "17px"),
               align = "center") %>%
      hc_add_series(Global.returns$Price,
                    name = "Prices",
                    yAxis = 0,
                    showInLegend = FALSE,
                    # upColor= up.col,
                    # color = down.col,
                    type = "area",
                    color = up.col
      )%>%
      hc_add_yAxis (nid = 1L,
                    relative = 1)%>%
      hc_add_series (name = "Volume",
                     data = Global.returns1[, c("Date", "Volume", "direction")],
                     yAxis = 1,
                     showInLegend= FALSE,
                     type="column",
                     hcaes(x = Date,
                           y = Volume,
                           group = direction ))%>%
      hc_add_yAxis (nid = 2L,
                    relative = 1) %>%
      hc_yAxis_multiples(
        list(title = list(
          style=list(color='#333333',
                     fontSize = "20px",
                     fontFamily= "Erica One"),
          text = "Price"), top = "-10%", height = "90%", opposite = FALSE),
        list(title = list(
          style=list(color='gray',
                     fontSize = "20px",
                     fontFamily= "Erica One"),
          text = "Volume"), top = "80%", height = "20%")
      )%>%
      hc_colors(colors = c(down.col, up.col))%>%
      hc_exporting(
        enabled = TRUE, # always enabled,
        filename = paste0(ticker.name," chart : from ", date1, " to ", date2))


    return(brvm.plot)

  } else {

    # } else if (length(Global.returns) > 9) {
    ####
    # Global.returns <- Global.returns[order(Global.returns$Date), ]
    #
    # ticker = paste0(unique(Global.returns$Ticker), collapse = ", ")
    #
    # Global.returns <- Global.returns[, c("Date", "Price", "Ticker")]
    #
    # Global.returns <- na.omit(Global.returns)
    #
    # # ticker = unique(Global.returns$Ticker)
    # # print(ticker)
    # brvm.plot<- highchart(type = "stock") %>%
    #   hc_add_series(data = Global.returns,
    #                 type = "line",
    #                 hcaes(x = Date, y = Close, group = Ticker))%>%
    #   hc_xAxis(title = list(text = ""))%>%
    #   hc_title(text = paste0("Tickers (", ticker, ") line chart from ", date1, " to ", date2)) %>%
    #   hc_exporting(
    #     enabled = TRUE, # always enabled,
    #     filename = paste0("Tickers line chart from ", date1, " to ", date2)
    #   )
    ####

    Global.returns <- Global.returns[order(Global.returns$Date), ]

    ticker = paste0(unique(Global.returns$Ticker), collapse = ", ")

    Global.returns <- Global.returns[, c("Date", "Price", "Ticker")]

    Global.returns <- na.omit(Global.returns)


    # setDT(Global.returns)

    # Global.returns <- as.data.table(Global.returns)

    Global.returns <- as.data.frame(Global.returns)


    # Global.returns$Price = gsub(",", "", Global.returns$Price)
    # Global.returns$Price = as.numeric(Global.returns$Price)

    # Group by Ticker and compute 'Last Price' and 'Price'
    # result <- Global.returns[, .(Last_Price = Price[which.max(Date)], Price = list(.SD$Price)), by = Ticker]

    # result <- Global.returns %>%
    #   group_by(Ticker) %>%
    #   summarise(Last_Price = last(Price))
    # Group by Ticker and compute 'Last Price' and create a list of all prices

    result <- Global.returns %>%
      dplyr::group_by(Ticker) %>%
      dplyr::summarise('Last Price' = dplyr::last(Price),
                'Price evolution' = list(Price))

    # result <- Global.returns %>%
    #   dplyr::group_by(Ticker) %>%
    #   dplyr::reframe('Last Price' = data.table::last(Price),
    #                  'Price evolution' = list(Price))

    # result <- Global.returns[, list(
    #   'Last Price' = dplyr::last(Price),
    #   'Price evolution' = list(Price)
    # ), by = Ticker]



    # Global.returnsist <- Global.returns[, list(
    #   'Last price' = last(Price, na.rm = TRUE),
    #   Price = list(.SD$Price)
    # ), by = "Ticker"]

    # brvm.plot <- flextable(data = result) %>%
    #   mk_par(j = "Price", value = as_paragraph(
    #     plot_chunk(value = Price, type = "dens", col = "blue",
    #                width = 1.5, height = .4, free_scale = TRUE)
    #   )) %>%
    #   # colformat_double(big.mark = " ", suffix = " $") %>%
    #   set_header_labels(box = "composite content", density = "density") %>%
    #   autofit()

    brvm.plot <- flextable(data = result) %>%
      mk_par(j = 'Price evolution', value = as_paragraph(
        plot_chunk(value = `Price evolution`, type = "dens",
                   # col = "blue",
                   col = up.col,
                   width = 1.7, height = .9, free_scale = TRUE)
      )) %>%
      # colformat_double(big.mark = " ", suffix = " $") %>%
      set_header_labels(box = "composite content", density = "density") %>%
      set_caption("Overview of price evolution and last price") %>%
      autofit()


    return(brvm.plot)
  }

}
