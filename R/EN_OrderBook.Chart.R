#' Plot Order Book Chart for a Given Ticker
#'
#' This function plots an order book chart for a given ticker. It retrieves the order book data using the `EN_Get_OB` function and then creates a Highchart plot displaying bid and ask prices along with their respective quantities.
#'
#' @param ticker The ticker symbol for which the order book chart will be plotted.
#' @param bid.col Color for bid prices in the chart. Default is '#00FF00' (green).
#' @param ask.col Color for ask prices in the chart. Default is '#FF0000' (red).
#' @param plot_type Type of visualization (‘depth’ or ‘barh’).
#' @param stock_type   The type of the ticker: 'Equity' for Stocks and 'Etf' for EFTs.
#'
#' @return A Highchart plot displaying the order book for the provided ticker.
#'
#' @seealso \code{\link{EN_Get_OB}} to retrieve the Order Book of a given ticker.
#'
#' @author Koffi Frederic SESSIE
#'
#'
#' @import httr
#' @import jsonlite
#' @import rvest
#' @importFrom magrittr %>%
#' @importFrom grDevices col2rgb
#' @importFrom highcharter hc_chart highchart hc_title hc_xAxis hc_yAxis_multiples hc_legend hc_plotOptions hc_tooltip hc_add_series hc_yAxis hc_credits hc_series hc_subtitle hc_exporting
#'
#' @examples
#'
#'\donttest{
#'
#' # Notes : Usually , the function will work perfectly if the ticker is an Equity,
#' library(httr)
#' library(highcharter)
#' library(jsonlite)
#' library(dplyr)
#' library(magrittr)
#' library(rvest)
#' library(grDevices)
#' library(stringr)
#'
#' # Plot ABC ARBITRAGE ticker Order Book BarH chart by providing ISIN
#' ABCA_OB.chart = EN_OrderBook.Chart("FR0004040608", plot_type = 'barh') #using default colors
#' ABCA_OB.chart
#'
#' # Plot LEBON ticker Order Book Chart
#' ALBON_OB.chart = EN_OrderBook.Chart("ALBON", bid.col = 'cyan', ask.col ='gold')
#' ALBON_OB.chart
#'
#' # Order Book depth chart of 'AAPL' Etf
#' AAPL_OB.chart = EN_OrderBook.Chart("XS2337099563", stock_type = 'Etf')
#'
#' # Order Book bar chart of 'LEVERAGE SHARES PLC' Etf
#' LEV_OB.chart = EN_OrderBook.Chart("XS2663694847", stock_type = 'Etf', plot_type = 'barh')
#'
#'
#' # The following code Will return an error because the "Ticker" is invalid
#' # EN_OrderBook.Chart("ALBONgdg")
#'
#'}
#'
#' @family Data Retrieval
#' @family Plot
#' @family Euronext
#' @author Koffi Frederic SESSIE
#'
#' @export
#'


EN_OrderBook.Chart <- function(ticker,
                               stock_type = 'Equity',
                               bid.col = 'darkgreen',
                               ask.col ='#FF0000',
                               plot_type = 'depth') {

  if (plot_type != 'depth' && plot_type != 'barh') {
    stop("Invalid plot type. Please choose 'depth' or 'barh'.")
  }

  areColors <- function(x) {
    sapply(x, function(X) {
      tryCatch(is.matrix(col2rgb(X)),
               error = function(e) FALSE)
    })[!is.na(x)]  # Filter out NA values from the result
  }


  if(!all(areColors(c(bid.col, ask.col)))){
    stop(
      "Please provide a valid color format. For example, you can use names like 'red' or hexadecimal codes like '#F05090'."
    )
  }

  if (length(bid.col) != 1 && length(ask.col) != 1) {
    stop("Please provide a unique color format.")
  }


  ticker <- tolower(ticker)

  stock_type <- tolower(stock_type)

  if (length(ticker)!=1) {
    stop("Please provide a unique ticker.")
  }

  if (length(stock_type)!=1) {
    stop("Please provide a unique stock_type.")
  }

  # print(stock_type)
  if (stock_type %in% c('equity', 'etf')) {
    # print("ok")

    if (stock_type == 'equity') {
      # print("good")
      order_book <- EN_Get_OB(ticker, stock_type = 'Equity')
    } else {
      order_book <- EN_Get_OB(ticker, stock_type = 'Etf')
    }
  } else {
    stop("Only parameters such as 'Equity' for Stocks and 'Etf' for EFTs are allowed.")
  }



  # order_book <- EN_Get_OB(ticker)

  if(length(order_book) == 1){
    stop('Invalid ticker parameter.')

  } else {
    lastrow <- nrow(order_book)
    order_book <- order_book[-lastrow,]
    # order_book$Bid_Price <- gsub('<NA>', NA, order_book$Bid_Price)
    order_book$Bid_Price <- as.numeric(gsub(",", "", order_book$Bid_Price))

    # order_book$Ask_Price <- gsub('<NA>', NA, order_book$Ask_Price)
    order_book$Ask_Price <- as.numeric(gsub(",", "", order_book$Ask_Price))

    order_book$B_quantity <- round(order_book$B_quantity, 0)
    order_book$A_quantity <- round(order_book$A_quantity, 0)

    # Get the news data
    # news_data <- EN_Get_News(ticker, stock_type = 'E')

    if (stock_type == 'equity') {
      news_data <- EN_Get_News(ticker)
      last_price <- as.numeric(news_data$Detail[news_data$Information == "Last traded Price"])

    } else {
      news_data <- EN_Get_News(ticker, stock_type = 'E')
      last_price <- as.numeric(news_data$Detail[news_data$Information == "Valuation trade"])

    }

    name_detail <- news_data$Detail[news_data$Information == "Name"]


    if (plot_type == 'depth') {
      bids_data <- lapply(1:nrow(order_book), function(i) {
        list(x = order_book$Bid_Price[i], y = order_book$B_quantity[i])
      })

      asks_data <- lapply(1:nrow(order_book), function(i) {
        list(x = order_book$Ask_Price[i], y = order_book$A_quantity[i])
      })

      the_title <- paste0(name_detail, " Market Depth")
      the_title1 <- gsub(" & |$| : | ", "_", the_title)

      the_plot <- highchart() %>%
        hc_chart(type = "area", zoomType = "xy") %>%
        hc_title(text = the_title) %>%
        hc_xAxis(
          minPadding = 0,
          maxPadding = 0,
          plotLines = list(
            list(
              color = '#FF0000',
              value = last_price,
              width = 1,
              label = list(text = "Actual price", rotation = 90)
            )
          ),
          title = list(text = "Price")
        ) %>%
        hc_yAxis_multiples(
          list(
            lineWidth = 1,
            gridLineWidth = 1,
            title = list(text = NULL),
            tickWidth = 1,
            tickLength = 5,
            tickPosition = "inside",
            labels = list(align = "left", x = 8)
          ),
          list(
            opposite = TRUE,
            linkedTo = 0,
            lineWidth = 1,
            gridLineWidth = 0,
            title = list(text = NULL),
            tickWidth = 1,
            tickLength = 5,
            tickPosition = "inside",
            labels = list(align = "right", x = -8)
          )
        ) %>%
        hc_legend(enabled = FALSE) %>%
        hc_plotOptions(
          area = list(
            fillOpacity = 0.2,
            lineWidth = 1,
            step = "center"
          )
        ) %>%
        hc_tooltip(headerFormat = '<span style="font-size=10px;">Price: {point.key}</span><br/>', valueDecimals = 0) %>%
        hc_add_series(
          name = "Bids",
          data = bids_data,
          color = bid.col
        ) %>%
        hc_add_series(
          name = "Asks",
          data = asks_data,
          color = ask.col
        )%>%
        hc_exporting(
          enabled = TRUE, # always enabled,
          filename = the_title1)

    } else if (plot_type == 'barh') {
      # length_dta <- nrow(order_book[-nrow(order_book),])

      length_dta <- nrow(order_book)

      # order_book$Ask_Price <- na.omit(order_book$Ask_Price)
      #
      # order_book$Bid_Price <- na.omit(order_book$Bid_Price)


      dt_type <- c(rep("Ask", length_dta), rep("Bid", length_dta))
      dt_price <- c(order_book$Ask_Price, order_book$Bid_Price)
      dt_qty <- c(order_book$A_quantity, order_book$B_quantity)

      final_dt <- data.frame(Price = dt_price, Type = dt_type, Quantity = dt_qty)
      final_dt$Price <- as.numeric(final_dt$Price)

      final_dt <- na.omit(final_dt)

      final_dt <- final_dt[order(final_dt$Price, decreasing = TRUE), ]

      # Find if unique element 'Type'
      if(length(unique(final_dt$Type)) !=1){

        length_ask <- length(final_dt$Quantity[final_dt$Type=="Ask"])
        length_bid <- length(final_dt$Quantity[final_dt$Type=="Bid"])

        max_bids <- max(final_dt$Quantity[-c(1:length_ask)])
        max_asks <- max(final_dt$Quantity[1:length_ask])

        the_title <- paste0(name_detail, " Buy & Sell Orders")

        the_title1 <- gsub("$| & | : | ", "_", the_title)

        the_plot <- highchart() %>%
          # hc_chart(type = "bar", margin = c(100, 25, 40, 50)) %>%
          hc_chart(type = "bar", margin = c(60, 25, 50, 50)) %>%
          hc_legend(enabled = TRUE, align = "left", verticalAlign = "top", y = -15) %>%
          hc_title(text = the_title) %>%
          # hc_legend(enabled = TRUE, verticalAlign = "top", y = 50) %>%
          hc_tooltip(formatter = JS("function () { return '<b>' + this.series.name + ' : ' + this.point.category + '</b><br/>' + 'Quantity: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0); }")) %>%
          # hc_tooltip(shared = TRUE, crosshairs = TRUE
          #            # , borderColor = highchart_colors()[3]
          # ) %>%
          hc_plotOptions(series = list()) %>%
          hc_xAxis(categories = final_dt$Price,
                   labels = list(useHTML = TRUE, formatter = JS("function() { return '<div class=\"xlabel\">'+ this.value +'</div>'; }")),
                   lineWidth = 0, tickWidth = 0, offset = -240) %>%
          hc_yAxis_multiples(
            # For the left barh
            list(max = max_bids, title = list(text = NULL), width = 175, reversed = TRUE),
            # For the right barh
            list(max = max_asks, offset = 0, title = list(text = NULL), left = 300, width = 175)
          ) %>%
          # Ask comes before Bids
          hc_add_series(data = c(final_dt$Quantity[1:length_ask], rep(NA, length_bid)),
                        yAxis = 1,
                        name = "Sell Orders",
                        color = ask.col)%>%
          hc_add_series(data = c(rep(NA, length_ask), final_dt$Quantity[-c(1:(length_ask))]),
                        yAxis = 0,
                        name = "Buy Orders",
                        color = bid.col)%>%
          hc_exporting(
            enabled = TRUE, # always enabled,
            filename = the_title1)


      }else{
        the_type = unique(final_dt$Type)
        if (the_type == 'Ask') {
          the_title <- paste0(name_detail, " : Sell Orders")
          the_col <- ask.col

        }else{
          the_title <- paste0(name_detail, " : Buy Orders")
          the_col <- bid.col
        }

        the_title1 <- gsub(" & | : | ", "_", the_title)

        the_plot <- highchart() %>%
          hc_chart(type = "bar") %>%
          hc_title(text = the_title) %>%
          hc_subtitle(text = 'Source: <a href="https://live.euronext.com/en">Euronext</a>') %>%
          hc_xAxis(categories = final_dt$Price) %>%
          hc_yAxis(min = 0, title = list(text = 'Quantity', align = 'middle'),
                   labels = list(overflow = 'justify', formatter = JS("function() { return Highcharts.numberFormat(this.value,0); }"))) %>%
          # hc_tooltip(formatter = JS("function() { return '<b>' + this.x + ' : </b>' + Highcharts.numberFormat(this.y,0); }")) %>%
          hc_plotOptions(bar = list(final_dtLabels = list(enabled = TRUE, formatter = JS("function() { return Highcharts.numberFormat(this.y,0); }")))) %>%
          hc_legend(enabled = FALSE) %>%
          hc_credits(enabled = FALSE) %>%
          hc_series(list(name = 'Quantity ', data = final_dt$Quantity, color = the_col))%>%
          hc_exporting(
            enabled = TRUE, # always enabled,
            filename = the_title1)

      }

    }

    return(the_plot)
  }
}

# EN_OrderBook.Chart <- function(ticker,
#                                bid.col = '#00FF00',
#                                ask.col ='#FF0000') {
#   # Obtenez les données de l'order book avec la fonction EN_Get_OB
#
#   areColors <- function(x) {
#     sapply(x, function(X) {
#       tryCatch(is.matrix(col2rgb(X)),
#                error = function(e) FALSE)
#     })[!is.na(x)]  # Filter out NA values from the result
#   }
#
#   if(!all(areColors(c(bid.col, ask.col)))){
#     stop(
#       "Please provide a valid color format. For example, you can use names like 'red' or hexadecimal codes like '#F05090'."
#     )
#   }
#
#
#   order_book <- EN_Get_OB(ticker)
#
#   if(length(order_book) == 1){
#     stop('Invalid ticker parameter.')
#
#   }else{
#
#     lastrow = nrow(order_book)
#
#     order_book <- order_book[-lastrow,]
#
#     order_book$Bid_Price = as.numeric(gsub(",", "", order_book$Bid_Price))
#     order_book$Ask_Price = as.numeric(gsub(",", "", order_book$Ask_Price))
#
#     # Round then
#     order_book$B_quantity = round(order_book$B_quantity, 0)
#     order_book$A_quantity = round(order_book$A_quantity, 0)
#
#     # infos_tic = EN_Ticker_infos(ticker)
#     #
#     # if("Last Traded" %in% infos_tic$Information){
#     #   the.nb = which(infos_tic$Information == "Last Traded")
#     #
#     #   last_price = as.numeric(infos_tic[[the.nb,2]])
#     #
#     # }
#
#     # Get the news data
#     news_data <- EN_Get_News(ticker)
#
#     # Extract the Detail element corresponding to "Name"
#     name_detail <- news_data$Detail[news_data$Information == "Name"]
#
#     # Extract the Detail element corresponding to last price
#     last_price = as.numeric(news_data$Detail[news_data$Information == "Last traded Price"])
#
#     # Créez les données pour les offres d'achat (bids) et de vente (asks)
#     bids_data <- lapply(1:nrow(order_book), function(i) {
#       list(x = order_book$Bid_Price[i], y = order_book$B_quantity[i])
#     })
#
#     asks_data <- lapply(1:nrow(order_book), function(i) {
#       list(x = order_book$Ask_Price[i], y = order_book$A_quantity[i])
#     })
#
#     the_title = paste0(name_detail, " Market Depth")
#
#     # Créez le graphique Highchart
#     highchart() %>%
#       hc_chart(type = "area", zoomType = "xy") %>%
#       hc_title(text = the_title) %>%
#       hc_xAxis(
#         minPadding = 0,
#         maxPadding = 0,
#         plotLines = list(
#           list(
#             color = '#FF0000', # Assuming the color intended was red
#             value = last_price,
#             width = 1,
#             label = list(text = "Actual price", rotation = 90)
#           )
#         ),
#         title = list(text = "Price")
#       ) %>%
#       hc_yAxis_multiples(
#         list(
#           lineWidth = 1,
#           gridLineWidth = 1,
#           title = list(text = NULL),
#           tickWidth = 1,
#           tickLength = 5,
#           tickPosition = "inside",
#           labels = list(align = "left", x = 8)
#         ),
#         list(
#           opposite = TRUE,
#           linkedTo = 0,
#           lineWidth = 1,
#           gridLineWidth = 0,
#           title = list(text = NULL),
#           tickWidth = 1,
#           tickLength = 5,
#           tickPosition = "inside",
#           labels = list(align = "right", x = -8)
#         )
#       ) %>%
#       hc_legend(enabled = FALSE) %>%
#       hc_plotOptions(
#         area = list(
#           fillOpacity = 0.2,
#           lineWidth = 1,
#           step = "center"
#         )
#       ) %>%
#       hc_tooltip(headerFormat = '<span style="font-size=10px;">Price: {point.key}</span><br/>', valueDecimals = 0) %>%
#       hc_add_series(
#         name = "Bids",
#         data = bids_data,
#         color = bid.col # Using the provided bid.col
#       ) %>%
#       hc_add_series(
#         name = "Asks",
#         data = asks_data,
#         color = ask.col # Using the provided ask.col
#       )
#
#   }
#
#
# }
#


# https://www.highcharts.com/demo/stock/depth-chart

# https://www.codeconvert.ai/python-to-r-converter

# This is the highcharter code javascript
# Highcharts.chart('container', {
#   chart: {
#     type: 'area',
#     zoomType: 'xy'
#   },
#   title: {
#     text: 'ETH-BTC Market Depth'
#   },
#   xAxis: {
#     minPadding: 0,
#     maxPadding: 0,
#     plotLines: [{
#       color: '#888',
#       value: 0.1523,
#       width: 1,
#       label: {
#         text: 'Actual price',
#         rotation: 90
#       }
#     }],
#     title: {
#       text: 'Price'
#     }
#   },
#   yAxis: [{
#     lineWidth: 1,
#     gridLineWidth: 1,
#     title: null,
#     tickWidth: 1,
#     tickLength: 5,
#     tickPosition: 'inside',
#     labels: {
#       align: 'left',
#       x: 8
#     }
#   }, {
#     opposite: true,
#     linkedTo: 0,
#     lineWidth: 1,
#     gridLineWidth: 0,
#     title: null,
#     tickWidth: 1,
#     tickLength: 5,
#     tickPosition: 'inside',
#     labels: {
#       align: 'right',
#       x: -8
#     }
#   }],
#   legend: {
#     enabled: false
#   },
#   plotOptions: {
#     area: {
#       fillOpacity: 0.2,
#       lineWidth: 1,
#       step: 'center'
#     }
#   },
#   tooltip: {
#     headerFormat: '<span style="font-size=10px;">Price: {point.key}</span><br/>',
#     valueDecimals: 2
#   },
#   series: [{
#     name: 'Bids',
#     data: [[0.1524,0.94],[0.1539,35.51],[0.154,39.88]],
#     color: '#03a7a8'
#   }, {
#     name: 'Asks',
#     data: [[0.1435,242.52],[0.1436,206.49],[0.1437,205.82]],
#     color: '#fc5857'
#   }]
# });

