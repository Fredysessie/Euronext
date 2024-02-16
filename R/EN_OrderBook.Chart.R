#' Plot Order Book Chart for a Given Ticker
#'
#' This function plots an order book chart for a given ticker. It retrieves the order book data using the `EN_Get_OB` function and then creates a Highchart plot displaying bid and ask prices along with their respective quantities.
#'
#' @param ticker The ticker symbol for which the order book chart will be plotted.
#' @param bid.col Color for bid prices in the chart. Default is '#00FF00' (green).
#' @param ask.col Color for ask prices in the chart. Default is '#FF0000' (red).
#'
#' @return A Highchart plot displaying the order book for the provided ticker.
#'
#' @seealso \code{\link{EN_Get_OB}} to retrieve the Order Book of a given ticker.
#'
#'
#' @import httr
#' @import jsonlite
#' @import rvest
#' @import rlang
#' @importFrom magrittr %>%
#' @importFrom grDevices col2rgb
#' @import highcharter
#'
#' @examples
#'
#'\donttest{
#' library(httr)
#' library(highcharter)
#' library(jsonlite)
#' library(dplyr)
#' library(magrittr)
#' library(rvest)
#' library(grDevices)
#' library(stringr)
#' library(rlang)
#'
#' # Plot ABC ARBITRAGE ticker Order Book chart
#' ABCA_OB = EN_OrderBook.Chart("ABCA") #using default colors
#' ABCA_OB
#'
#' # Plot LEBON ticker Order Book Chart
#' ALBON_OB = EN_OrderBook.Chart("ALBON", bid.col = 'cyan', ask.col ='gold')
#' ALBON_OB
#'
#' # The following code Will return an error because the "Ticker" is invalid
#' # EN_OrderBook.Chart("ALBONgdg")
#'}
#'
#' @family Data Retrieval
#' @family Plot
#' @family Euronext
#' @author Koffi Frederic SESSIE
#'
#' @export

EN_OrderBook.Chart <- function(ticker,
                               bid.col = '#00FF00',
                               ask.col ='#FF0000') {
  # Obtenez les données de l'order book avec la fonction EN_Get_OB

  areColors <- function(x) {
    sapply(x, function(X) {
      tryCatch(is.matrix(col2rgb(X)),
               error = function(e) FALSE)
    })[!is.na(x)]  # Filter out NA values from the result
  }

  if(!all(areColors(c(bid.col, ask.col)))){
    rlang::abort(
      "Please provide a valid color format. For example, you can use names like 'red' or hexadecimal codes like '#F05090'."
    )
  }


  order_book <- EN_Get_OB(ticker)

  if(length(order_book) == 1){
    stop('Invalid ticker parameter.')

  }else{

    lastrow = nrow(order_book)

    order_book <- order_book[-lastrow,]

    order_book$Bid_Price = as.numeric(gsub(",", "", order_book$Bid_Price))
    order_book$Ask_Price = as.numeric(gsub(",", "", order_book$Ask_Price))

    # infos_tic = EN_Ticker_infos(ticker)
    #
    # if("Last Traded" %in% infos_tic$Information){
    #   the.nb = which(infos_tic$Information == "Last Traded")
    #
    #   last_price = as.numeric(infos_tic[[the.nb,2]])
    #
    # }

    # Get the news data
    news_data <- EN_Get_News(ticker)

    # Extract the Detail element corresponding to "Name"
    name_detail <- news_data$Detail[news_data$Information == "Name"]

    # Extract the Detail element corresponding to last price
    last_price = as.numeric(news_data$Detail[news_data$Information == "Last traded Price"])

    # Créez les données pour les offres d'achat (bids) et de vente (asks)
    bids_data <- lapply(1:nrow(order_book), function(i) {
      list(x = order_book$Bid_Price[i], y = order_book$B_quantity[i])
    })

    asks_data <- lapply(1:nrow(order_book), function(i) {
      list(x = order_book$Ask_Price[i], y = order_book$A_quantity[i])
    })

    the_title = paste0(name_detail, " Market Depth")

    # Créez le graphique Highchart
    highchart() %>%
      hc_chart(type = "area", zoomType = "xy") %>%
      hc_title(text = the_title) %>%
      hc_xAxis(
        minPadding = 0,
        maxPadding = 0,
        plotLines = list(
          list(
            color = '#FF0000', # Assuming the color intended was red
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
      hc_tooltip(headerFormat = '<span style="font-size=10px;">Price: {point.key}</span><br/>', valueDecimals = 2) %>%
      hc_add_series(
        name = "Bids",
        data = bids_data,
        color = bid.col # Using the provided bid.col
      ) %>%
      hc_add_series(
        name = "Asks",
        data = asks_data,
        color = ask.col # Using the provided ask.col
      )

  }


}



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

