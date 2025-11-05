# # https://rstudio-pubs-static.s3.amazonaws.com/363773_2382648d32f748b2a7549816de5ea377.html
#
# # https://github.com/dataman-git/codes_for_articles/blob/master/TA%20in%C2%A0R%20for%20article.md
#
# # https://www.quantstart.com/articles/ARIMA-GARCH-Trading-Strategy-on-the-SP500-Stock-Market-Index-Using-R/
#
# # https://towardsdatascience.com/implementing-a-trading-algorithm-with-r-315a175538bd
#
# # https://medium.com/analytics-vidhya/algorithmic-trading-with-technical-indicators-in-r-6883b07cd067
#
#
# library(quantmod)
# library(TTR)
# library(PerformanceAnalytics)
#
# # Step-1 : Importing required libraries
#
# # Getting stock prices of AAPL, TSLA and NFLX
# getSymbols('AAPL', src = 'yahoo', from = '2019-01-01')
# getSymbols('TSLA', src = 'yahoo', from = '2019-01-01')
# getSymbols('NFLX', src = 'yahoo', from = '2019-01-01')
#
# # Step-2 : Extracting Data from Yahoo and Basic Plotting
# # Basic plot of our data
# barChart(AAPL, theme = chartTheme('black'))
# barChart(TSLA, theme = chartTheme('black'))
# barChart(NFLX, theme = chartTheme('black'))
#
# # Step-3: Creating Technical Indicators
# # There are many technical indicators used for financial analysis but, for our analysis we are going to use six of the most famous technical indicators namely : Simple Moving Average (SMA), Parabolic Stop And Reverse (SAR), Commodity Channel Index (CCI), Rate Of Change (ROC), Stochastic Momentum Index (SMI) and finally Williams %R
#
# # Simple Moving Average (SMA) :
#
# # 1. AAPL
# sma20_aapl <- SMA(AAPL$AAPL.Close, n = 20)
# sma50_aapl <- SMA(AAPL$AAPL.Close, n = 50)
# lineChart(AAPL, theme = chartTheme('black'))
# addSMA(n = 20, col = 'blue')
# addSMA(n = 50, col = 'orange')
# legend('left', col = c('green','blue','orange'),
#        legend = c('AAPL','SMA20','SMA50'), lty = 1, bty = 'n',
#        text.col = 'white', cex = 0.8)
#
# # 2. TSLA
# sma20_tsla <- SMA(TSLA$TSLA.Close, n = 20)
# sma50_tsla <- SMA(TSLA$TSLA.Close, n = 50)
# lineChart(TSLA, theme = 'black')
# addSMA(n = 20, col = 'blue')
# addSMA(n = 50, col = 'orange')
# legend('left', col = c('green','blue','orange'),
#        legend = c('AAPL','SMA20','SMA50'), lty = 1, bty = 'n',
#        text.col = 'white', cex = 0.8)
#
# # 3. NFLX
# sma20_nflx <- SMA(NFLX$NFLX.Close, n = 20)
# sma50_nflx <- SMA(NFLX$NFLX.Close, n = 50)
# lineChart(NFLX, theme = 'black')
# addSMA(n = 20, col = 'blue')
# addSMA(n = 50, col = 'orange')
# legend('left', col = c('green','blue','orange'),
#        legend = c('AAPL','SMA20','SMA50'), lty = 1, bty = 'n',
#        text.col = 'white', cex = 0.8)
#
#
# # Parabolic Stop And Reverse (SAR) :
# # To calculate Parabolic SAR, we have to pass on daily High and Low prices of the companies along with a given acceleration value.
#
# # The following code will calculate the companies’ Parabolic SAR along with a plot:
#
# # 1. AAPL
# sar_aapl <- SAR(cbind(Hi(AAPL),Lo(AAPL)), accel = c(0.02, 0.2))
# barChart(AAPL, theme = 'black')
# addSAR(accel = c(0.02, 0.2), col = 'lightblue')
#
# # 2. TSLA
# sar_tsla <- SAR(cbind(Hi(TSLA),Lo(TSLA)), accel = c(0.02, 0.2))
# barChart(TSLA, theme = 'black')
# addSAR(accel = c(0.02, 0.2), col = 'lightblue')
#
# # 3. NFLX
# sar_nflx <- SAR(cbind(Hi(NFLX),Lo(NFLX)), accel = c(0.02, 0.2))
# barChart(NFLX, theme = 'black')
# addSAR(accel = c(0.02, 0.2), col = 'lightblue')
#
# # Commodity Channel Index (CCI) :
# # To calculate CCI, we have to pass on daily High, Low and Close prices of companies along with a specified time period and a constant value. In this step, we are going to take 20 days as time period and 0.015 as the constant value.
#
# # The following code will calculate the companies’ CCI along with a plot:
#
# # 1. AAPL
# cci_aapl <- CCI(HLC(AAPL), n = 20, c = 0.015)
# barChart(AAPL, theme = 'black')
# addCCI(n = 20, c = 0.015)
#
# # 2. TSLA
# cci_tsla <- CCI(HLC(TSLA), n = 20, c = 0.015)
# barChart(TSLA, theme = 'black')
# addCCI(n = 20, c = 0.015)
#
# # 3. NFLX
# cci_nflx <- CCI(HLC(NFLX), n = 20, c = 0.015)
# barChart(NFLX, theme = 'black')
# addCCI(n = 20, c = 0.015)
#
# # Rate Of Change (ROC)
#
# # To calculate ROC, we have to pass on a specified interval of time and there is no restrictions in using any number of period. In this step, we are going to use 25 days as the period of time.
#
# # The following code will calculate the companies’ ROC along with a plot:
#
#
# # 1. AAPL
# roc_aapl <- ROC(AAPL$AAPL.Close, n = 25)
# barChart(AAPL, theme = 'black')
# addROC(n = 25)
# legend('left', col = 'red', legend = 'ROC(25)', lty = 1, bty = 'n',
#        text.col = 'white', cex = 0.8)
#
# # 2. TSLA
# roc_tsla <- ROC(TSLA$TSLA.Close, n = 25)
# barChart(TSLA, theme = 'black')
# addROC(n = 25)
# legend('left', col = 'red', legend = 'ROC(25)', lty = 1, bty = 'n',
#        text.col = 'white', cex = 0.8)
#
# # 3. NFLX
# roc_nflx <- ROC(NFLX$NFLX.Close, n = 25)
# barChart(NFLX, theme = 'black')
# addROC(n = 25)
# legend('right', col = 'red', legend = 'ROC(25)', lty = 1, bty = 'n',
#        text.col = 'white', cex = 0.8)
#
#
# # Stochastic Momentum Index (SMI) :
#
# # To calculate SMI, we have to pass on daily High, Low and Close prices of companies, a specified interval of time, two smoothing parameters and a signal value.
#
# # The following code will calculate companies’ SMI along with a plot:
#
# # 1. AAPL
# smi_aapl <- SMI(HLC(AAPL),
#                 n = 13, nFast = 2, nSlow = 25, nSig = 9)
# barChart(AAPL, theme = 'black')
# addSMI(n = 13, fast = 2, slow = 2, signal = 9)
#
# # 2. TSLA
# smi_tsla <- SMI(HLC(TSLA),
#                 n = 13, nFast = 2, nSlow = 25, nSig = 9)
# barChart(TSLA, theme = 'black')
# addSMI(n = 13, fast = 2, slow = 2, signal = 9)
#
# # 3. NFLX
# smi_nflx <- SMI(HLC(NFLX),
#                 n = 13, nFast = 2, nSlow = 25, nSig = 9)
# barChart(NFLX, theme = 'black')
# addSMI(n = 13, fast = 2, slow = 2, signal = 9)
#
#
# # Williams %R
#
# # To calculate Williams %R, we have to pass on the daily High, Low and Close prices of companies along with a specified number of periods.
#
# # The following code will calculate the companies’ Williams %R along with a plot:
#
# # 1. AAPL
# wpr_aapl <- WPR(HLC(AAPL), n = 14)
# colnames(wpr_aapl) <- 'wpr'
# barChart(AAPL, theme = 'black')
# addWPR(n = 14)
#
# # 2. TSLA
# wpr_tsla <- WPR(HLC(TSLA), n = 14)
# colnames(wpr_tsla) <- 'wpr'
# barChart(TSLA, theme = 'black')
# addWPR(n = 14)
#
# # 3. NFLX
# wpr_nflx <- WPR(HLC(NFLX), n = 14)
# colnames(wpr_nflx) <- 'wpr'
# barChart(NFLX, theme = 'black')
# addWPR(n = 14)
#
#
# # Step-4 : Creating Trading Signals
#
# # In this step, we are going to use the previously created indicators to build ‘BUY’ or ‘SELL’ trading signals. Basically, we will pass on specific conditions and if the condition satisfies a ‘BUY’ signal our created trading signal will turn to 1 which means a buy. If the condition satisfies a ‘SELL’ signal our created trading signal will turn to -1 which means a sell. If it doesn’t satisfies any of the mentioned conditions, then it will turn to 0 which means nothing. It might sounds like a whole bunch of fuzz but, it will be clear once we dive into the coding section. After coding your trading signals, you can use the ‘which’ command in R to see how may ‘BUY’ signals and how many ‘SELL’ signals.
#
# # Simple Moving Average
#
# # The following code will create SMA trading signals for companies if it satisfies our given condition:
#
# # SMA
#
# # a. AAPL
# # SMA 20 Crossover Signal
# sma20_aapl_ts <- Lag(
#   ifelse(Lag(Cl(AAPL)) < Lag(sma20_aapl) & Cl(AAPL) > sma20_aapl,1,
#          ifelse(Lag(Cl(AAPL)) > Lag(sma20_aapl) & Cl(AAPL) < sma20_aapl,-1,0)))
# sma20_aapl_ts[is.na(sma20_aapl_ts)] <- 0
# # SMA 50 Crossover Signal
# sma50_aapl_ts <- Lag(
#   ifelse(Lag(Cl(AAPL)) < Lag(sma50_aapl) & Cl(AAPL) > sma50_aapl,1,
#          ifelse(Lag(Cl(AAPL)) > Lag(sma50_aapl) & Cl(AAPL) < sma50_aapl,-1,0)))
# sma50_aapl_ts[is.na(sma50_aapl_ts)] <- 0
# # SMA 20 and SMA 50 Crossover Signal
# sma_aapl_ts <- Lag(
#   ifelse(Lag(sma20_aapl) < Lag(sma50_aapl) & sma20_aapl > sma50_aapl,1,
#          ifelse(Lag(sma20_aapl) > Lag(sma50_aapl) & sma20_aapl < sma50_aapl,-1,0)))
# sma_aapl_ts[is.na(sma_aapl_ts)] <- 0
#
# # b. TSLA
# # SMA 20 Crossover Signal
# sma20_tsla_ts <- Lag(
#   ifelse(Lag(Cl(TSLA)) < Lag(sma20_tsla) & Cl(TSLA) > sma20_tsla,1,
#          ifelse(Lag(Cl(TSLA)) > Lag(sma20_tsla) & Cl(TSLA) < sma20_tsla,-1,0)))
# sma20_tsla_ts[is.na(sma20_tsla_ts)] <- 0
# # SMA 50 Crossover Signal
# sma50_tsla_ts <- Lag(
#   ifelse(Lag(Cl(TSLA)) < Lag(sma50_tsla) & Cl(TSLA) > sma50_tsla,1,
#          ifelse(Lag(Cl(TSLA)) > Lag(sma50_tsla) & Cl(TSLA) < sma50_tsla,-1,0)))
# sma50_tsla_ts[is.na(sma50_tsla_ts)] <- 0
# # SMA 20 and SMA 50 Crossover Signal
# sma_tsla_ts <- Lag(
#   ifelse(Lag(sma20_tsla) < Lag(sma50_tsla) & sma20_tsla > sma50_tsla,1,
#          ifelse(Lag(sma20_tsla) > Lag(sma50_tsla) & sma20_tsla < sma50_tsla,-1,0)))
# sma_tsla_ts[is.na(sma_tsla_ts)] <- 0
#
# # c. NFLX
# # SMA 20 Crossover Signal
# sma20_nflx_ts <- Lag(
#   ifelse(Lag(Cl(NFLX)) < Lag(sma20_nflx) & Cl(NFLX) > sma20_nflx,1,
#          ifelse(Lag(Cl(NFLX)) > Lag(sma20_nflx) & Cl(NFLX) < sma20_nflx,-1,0)))
# sma20_nflx_ts[is.na(sma20_nflx_ts)] <- 0
# # SMA 50 Crossover Signal
# sma50_nflx_ts <- Lag(
#   ifelse(Lag(Cl(NFLX)) < Lag(sma50_nflx) & Cl(NFLX) > sma50_nflx,1,
#          ifelse(Lag(Cl(NFLX)) > Lag(sma50_nflx) & Cl(NFLX) < sma50_nflx,-1,0)))
# sma50_nflx_ts[is.na(sma50_nflx_ts)] <- 0
# # SMA 20 and SMA 50 Crossover Signal
# sma_nflx_ts <- Lag(
#   ifelse(Lag(sma20_nflx) < Lag(sma50_nflx) & sma20_nflx > sma50_nflx,1,
#          ifelse(Lag(sma20_nflx) > Lag(sma50_nflx) & sma20_nflx < sma50_nflx,-1,0)))
# sma_nflx_ts[is.na(sma_nflx_ts)] <- 0
#
# # Parabolic Stop and Reverse (SAR)
#
# # The following code will create Parabolic SAR trading signal for companies if it satisfies our conditions:
# # Parabolic Stop And Reverse (SAR)
#
# # a. AAPL
# sar_aapl_ts <- Lag(
#   ifelse(Lag(Cl(AAPL)) < Lag(sar_aapl) & Cl(AAPL) > sar_aapl,1,
#          ifelse(Lag(Cl(AAPL)) > Lag(sar_aapl) & Cl(AAPL) < sar_aapl,-1,0)))
# sar_aapl_ts[is.na(sar_aapl_ts)] <- 0
#
# # b. TSLA
# sar_tsla_ts <- Lag(
#   ifelse(Lag(Cl(TSLA)) < Lag(sar_tsla) & Cl(TSLA) > sar_tsla,1,
#          ifelse(Lag(Cl(TSLA)) > Lag(sar_tsla) & Cl(TSLA) < sar_tsla,-1,0)))
# sar_tsla_ts[is.na(sar_tsla_ts)] <- 0
#
# # c. NFLX
# sar_nflx_ts <- Lag(
#   ifelse(Lag(Cl(NFLX)) < Lag(sar_nflx) & Cl(NFLX) > sar_nflx,1,
#          ifelse(Lag(Cl(NFLX)) > Lag(sar_nflx) & Cl(NFLX) < sar_nflx,-1,0)))
# sar_nflx_ts[is.na(sar_nflx_ts)] <- 0
#
# # Commodity Channel Index (CCI)
#
# # The following code will create CCI trading signals for companies if it satisfies our conditions:
#
# # Commodity Channel Index  (CCI)
#
# # a. AAPL
# cci_aapl_ts <- Lag(
#   ifelse(Lag(cci_aapl) < (-100) & cci_aapl > (-100),1,
#          ifelse(Lag(cci_aapl) < (100) & cci_aapl > (100),-1,0)))
# cci_aapl_ts[is.na(cci_aapl_ts)] <- 0
#
# # b. TSLA
# cci_tsla_ts <- Lag(
#   ifelse(Lag(cci_tsla) < (-100) & cci_tsla > (-100),1,
#          ifelse(Lag(cci_tsla) < (100) & cci_tsla > (100),-1,0)))
# cci_tsla_ts[is.na(cci_tsla_ts)] <- 0
#
# # c. NFLX
# cci_nflx_ts <- Lag(
#   ifelse(Lag(cci_nflx) < (-100) & cci_nflx > (-100),1,
#          ifelse(Lag(cci_nflx) < (100) & cci_nflx > (100),-1,0)))
# cci_nflx_ts[is.na(cci_nflx_ts)] <- 0
#
# # Rate of Change (ROC)
#
# # The following code will create Rate Of Change (ROC) trading signals for companies if it satisfies our conditions:
#
# # Rate of Change (ROC)
#
# # a. AAPL
# roc_aapl_ts <- Lag(
#   ifelse(Lag(roc_aapl) < (-0.05) & roc_aapl > (-0.05),1,
#          ifelse(Lag(roc_aapl) < (0.05) & roc_aapl > (0.05),-1,0)))
# roc_aapl_ts[is.na(roc_aapl_ts)] <- 0
#
# # b. TSLA
# roc_tsla_ts <- Lag(
#   ifelse(Lag(roc_tsla) < (-0.05) & roc_tsla > (-0.05),1,
#          ifelse(Lag(roc_tsla) < (0.05) & roc_tsla > (0.05),-1,0)))
# roc_tsla_ts[is.na(roc_tsla_ts)] <- 0
#
# # c. NFLX
# roc_nflx_ts <- Lag(
#   ifelse(Lag(roc_nflx) < (-0.05) & roc_nflx > (-0.05),1,
#          ifelse(Lag(roc_nflx) < (0.05) & roc_nflx > (0.05),-1,0)))
# roc_nflx_ts[is.na(roc_nflx_ts)] <- 0
#
# # Stochastic Momentum Index (SMI)
#
# # The following code will create Stochastic Momentum Index (SMI) trading signals for companies if it satisfies our conditions:
#
# # Stochastic Momentum Index (SMI)
#
# # a. AAPL
# smi_aapl_ts <- Lag(
#   ifelse(Lag(smi_aapl[,1]) < Lag(smi_aapl[,2]) & smi_aapl[,1] > smi_aapl[,2],1,
#          ifelse(Lag(smi_aapl[,1]) > Lag(smi_aapl[,2]) & smi_aapl[,1] < smi_aapl[,2],-1,0)))
# smi_aapl_ts[is.na(smi_aapl_ts)] <- 0
#
# # b. TSLA
# smi_tsla_ts <- Lag(
#   ifelse(Lag(smi_tsla[,1]) < Lag(smi_tsla[,2]) & smi_tsla[,1] > smi_tsla[,2],1,
#          ifelse(Lag(smi_tsla[,1]) > Lag(smi_tsla[,2]) & smi_tsla[,1] < smi_tsla[,2],-1,0)))
# smi_tsla_ts[is.na(smi_tsla_ts)] <- 0
#
# # a. NFLX
# smi_nflx_ts <- Lag(
#   ifelse(Lag(smi_nflx[,1]) < Lag(smi_nflx[,2]) & smi_nflx[,1] > smi_nflx[,2],1,
#          ifelse(Lag(smi_nflx[,1]) > Lag(smi_nflx[,2]) & smi_nflx[,1] < smi_nflx[,2],-1,0)))
# smi_nflx_ts[is.na(smi_nflx_ts)] <- 0
#
# # Williams %R
#
# # The following code will create Williams %R trading signals for companies if it satisfies our conditions:
#
# # Williams %R
#
# # a. AAPL
# wpr_aapl_ts <- Lag(
#   ifelse(Lag(wpr_aapl) > 0.8 & wpr_aapl < 0.8,1,
#          ifelse(Lag(wpr_aapl) > 0.2 & wpr_aapl < 0.2,-1,0)))
# wpr_aapl_ts[is.na(wpr_aapl_ts)] <- 0
#
# # b. TSLA
# wpr_tsla_ts <- Lag(
#   ifelse(Lag(wpr_tsla) > 0.8 & wpr_tsla < 0.8,1,
#          ifelse(Lag(wpr_tsla) > 0.2 & wpr_tsla < 0.2,-1,0)))
# wpr_tsla_ts[is.na(wpr_tsla_ts)] <- 0
#
# # c. NFLX
# wpr_nflx_ts <- Lag(
#   ifelse(Lag(wpr_nflx) > 0.8 & wpr_nflx < 0.8,1,
#          ifelse(Lag(wpr_nflx) > 0.2 & wpr_nflx < 0.2,-1,0)))
# wpr_nflx_ts[is.na(wpr_nflx_ts)] <- 0
#
#
# # Step-5 : Creating Trading Strategies
# # This is the most interesting step in our process as we are going to create Trading Strategies using our previously created Trading Signals. In our previous step, we created signals whether to buy or sell and in this step we are going to create conditions to check our holding position in that stock (i.e., whether we hold, bought or sold the stock). The trading strategy we are about to code will return 1 if we hold the stock or returns 0 if we don’t own the stock.
#
# # Simple Moving Average
#
# # The following code will create a SMA trading strategy if satisfies our given conditions:
#
# # SMA 20 and SMA 50 Crossover Strategy
#
# # a. AAPL
#
# sma_aapl_strat <- ifelse(sma_aapl_ts > 1,0,1)
# for (i in 1 : length(Cl(AAPL))) {
#   sma_aapl_strat[i] <- ifelse(sma_aapl_ts[i] == 1,1,ifelse(sma_aapl_ts[i] == -1,0,sma_aapl_strat[i-1]))
# }
# sma_aapl_strat[is.na(sma_aapl_strat)] <- 1
# sma_aapl_stratcomp <- cbind(sma20_aapl, sma50_aapl, sma_aapl_ts, sma_aapl_strat)
# colnames(sma_aapl_stratcomp) <- c('SMA(20)','SMA(50)','SMA SIGNAL','SMA POSITION')
#
# # b. TSLA
# sma_tsla_strat <- ifelse(sma_tsla_ts > 1,0,1)
# for (i in 1 : length(Cl(TSLA))) {
#   sma_tsla_strat[i] <- ifelse(sma_tsla_ts[i] == 1,1,ifelse(sma_tsla_ts[i] == -1,0,sma_tsla_strat[i-1]))
# }
# sma_tsla_strat[is.na(sma_tsla_strat)] <- 1
# sma_tsla_stratcomp <- cbind(sma20_tsla, sma50_tsla, sma_tsla_ts, sma_tsla_strat)
# colnames(sma_tsla_stratcomp) <- c('SMA(20)','SMA(50)','SMA SIGNAL','SMA POSITION')
#
# # c. NFLX
# sma_nflx_strat <- ifelse(sma_nflx_ts > 1,0,1)
# for (i in 1 : length(Cl(NFLX))) {
#   sma_nflx_strat[i] <- ifelse(sma_nflx_ts[i] == 1,1,ifelse(sma_nflx_ts[i] == 'SEL',0,sma_nflx_strat[i-1]))
# }
# sma_nflx_strat[is.na(sma_nflx_strat)] <- 1
# sma_nflx_stratcomp <- cbind(sma20_nflx, sma50_nflx, sma_nflx_ts, sma_nflx_strat)
# colnames(sma_nflx_stratcomp) <- c('SMA(20)','SMA(50)','SMA SIGNAL','SMA POSITION')
#
# # Parabolic Stop And Reverse (SAR)
#
# # The following code will create a Parabolic SAR trading strategy if satisfies our given conditions:
#
#
# # Parabolic SAR Strategy
#
# # a. AAPL
# sar_aapl_strat <- ifelse(sar_aapl_ts > 1,0,1)
# for (i in 1 : length(Cl(AAPL))) {
#   sar_aapl_strat[i] <- ifelse(sar_aapl_ts[i] == 1,1,ifelse(sar_aapl_ts[i] == -1,0,sar_aapl_strat[i-1]))
# }
# sar_aapl_strat[is.na(sar_aapl_strat)] <- 1
# sar_aapl_stratcomp <- cbind(Cl(AAPL), sar_aapl, sar_aapl_ts, sar_aapl_strat)
# colnames(sar_aapl_stratcomp) <- c('Close','SAR','SAR SIGNAL','SAR POSITION')
#
# # b. TSLA
# sar_tsla_strat <- ifelse(sar_tsla_ts > 1,0,1)
# for (i in 1 : length(Cl(TSLA))) {
#   sar_tsla_strat[i] <- ifelse(sar_tsla_ts[i] == 1,1,ifelse(sar_tsla_ts[i] == -1,0,sar_tsla_strat[i-1]))
# }
# sar_tsla_strat[is.na(sar_tsla_strat)] <- 1
# sar_tsla_stratcomp <- cbind(Cl(TSLA), sar_tsla, sar_tsla_ts, sar_tsla_strat)
# colnames(sar_tsla_stratcomp) <- c('Close','SAR','SAR SIGNAL','SAR POSITION')
#
# # c. NFLX
# sar_nflx_strat <- ifelse(sar_nflx_ts > 1,0,1)
# for (i in 1 : length(Cl(NFLX))) {
#   sar_nflx_strat[i] <- ifelse(sar_nflx_ts[i] == 1,1,ifelse(sar_nflx_ts[i] == -1,0,sar_nflx_strat[i-1]))
# }
# sar_nflx_strat[is.na(sar_nflx_strat)] <- 1
# sar_nflx_stratcomp <- cbind(Cl(NFLX), sar_nflx, sar_nflx_ts, sar_nflx_strat)
# colnames(sar_nflx_stratcomp) <- c('Close','SAR','SAR SIGNAL','SAR POSITION')
#
#
# # Commodity Channel Index (CCI) :
#
# # The following code will create a CCI trading strategy if satisfies our given conditions:
#
# # CCI
#
# # a. AAPL
# cci_aapl_strat <- ifelse(cci_aapl_ts > 1,0,1)
# for (i in 1 : length(Cl(AAPL))) {
#   cci_aapl_strat[i] <- ifelse(cci_aapl_ts[i] == 1,1,ifelse(cci_aapl_ts[i] == -1,0,cci_aapl_strat[i-1]))
# }
# cci_aapl_strat[is.na(cci_aapl_strat)] <- 1
# cci_aapl_stratcomp <- cbind(cci_aapl, cci_aapl_ts, cci_aapl_strat)
# colnames(cci_aapl_stratcomp) <- c('CCI','CCI SIGNAL','CCI POSITION')
#
# # b. TSLA
# cci_tsla_strat <- ifelse(cci_tsla_ts > 1,0,1)
# for (i in 1 : length(Cl(TSLA))) {
#   cci_tsla_strat[i] <- ifelse(cci_tsla_ts[i] == 1,1,ifelse(cci_tsla_ts[i] == -1,0,cci_tsla_strat[i-1]))
# }
# cci_tsla_strat[is.na(cci_tsla_strat)] <- 1
# cci_tsla_stratcomp <- cbind(cci_tsla, cci_tsla_ts, cci_tsla_strat)
# colnames(cci_tsla_stratcomp) <- c('CCI','CCI SIGNAL','CCI POSITION')
#
# # c. NFLX
# cci_nflx_strat <- ifelse(cci_nflx_ts > 1,0,1)
# for (i in 1 : length(Cl(NFLX))) {
#   cci_nflx_strat[i] <- ifelse(cci_nflx_ts[i] == 1,1,ifelse(cci_nflx_ts[i] == -1,0,cci_nflx_strat[i-1]))
# }
# cci_nflx_strat[is.na(cci_nflx_strat)] <- 1
# cci_nflx_stratcomp <- cbind(cci_nflx, cci_nflx_ts, cci_nflx_strat)
# colnames(cci_nflx_stratcomp) <- c('CCI','CCI SIGNAL','CCI POSITION')
#
#
# # Rate Of Change (ROC)
#
# # The following code will create a Rate Of Change (ROC) trading strategy if satisfies our given conditions:
#
# # ROC
#
# # a. AAPL
# roc_aapl_strat <- ifelse(roc_aapl_ts > 1,0,1)
# for (i in 1 : length(Cl(AAPL))) {
#   roc_aapl_strat[i] <- ifelse(roc_aapl_ts[i] == 1,1,ifelse(roc_aapl_ts[i] == -1,0,roc_aapl_strat[i-1]))
# }
# roc_aapl_strat[is.na(roc_aapl_strat)] <- 1
# roc_aapl_stratcomp <- cbind(roc_aapl, roc_aapl_ts, roc_aapl_strat)
# colnames(roc_aapl_stratcomp) <- c('ROC(25)','ROC SIGNAL','ROC POSITION')
#
# # b. TSLA
# roc_tsla_strat <- ifelse(roc_tsla_ts > 1,0,1)
# for (i in 1 : length(Cl(TSLA))) {
#   roc_tsla_strat[i] <- ifelse(roc_tsla_ts[i] == 1,1,ifelse(roc_tsla_ts[i] == -1,0,roc_tsla_strat[i-1]))
# }
# roc_tsla_strat[is.na(roc_tsla_strat)] <- 1
# roc_tsla_stratcomp <- cbind(roc_tsla, roc_tsla_ts, roc_tsla_strat)
# colnames(roc_tsla_stratcomp) <- c('ROC(25)','ROC SIGNAL','ROC POSITION')
#
# # c. NFLX
# roc_nflx_strat <- ifelse(roc_nflx_ts > 1,0,1)
# for (i in 1 : length(Cl(NFLX))) {
#   roc_nflx_strat[i] <- ifelse(roc_nflx_ts[i] == 1,1,ifelse(roc_nflx_ts[i] == -1,0,roc_nflx_strat[i-1]))
# }
# roc_nflx_strat[is.na(roc_nflx_strat)] <- 1
# roc_nflx_stratcomp <- cbind(roc_nflx, roc_nflx_ts, roc_nflx_strat)
# colnames(roc_nflx_stratcomp) <- c('ROC(25)','ROC SIGNAL','ROC POSITION')
#
#
#
# # Stochastic Momentum Index (SMI)
#
# # The following code will create a SMI trading strategy if it satisfies our given conditions:
#
# # SMI
#
# # a. AAPL
# smi_aapl_strat <- ifelse(smi_aapl_ts > 1,0,1)
# for (i in 1 : length(Cl(AAPL))) {
#   smi_aapl_strat[i] <- ifelse(smi_aapl_ts[i] == 1,1,ifelse(smi_aapl_ts[i] == -1,0,smi_aapl_strat[i-1]))
# }
# smi_aapl_strat[is.na(smi_aapl_strat)] <- 1
# smi_aapl_stratcomp <- cbind(smi_aapl[,1],smi_aapl[,2],smi_aapl_ts,smi_aapl_strat)
# colnames(smi_aapl_stratcomp) <- c('SMI','SMI(S)','SMI SIGNAL','SMI POSITION')
#
# # b. TSLA
# smi_tsla_strat <- ifelse(smi_tsla_ts > 1,0,1)
# for (i in 1 : length(Cl(TSLA))) {
#   smi_tsla_strat[i] <- ifelse(smi_tsla_ts[i] == 1,1,ifelse(smi_tsla_ts[i] == -1,0,smi_tsla_strat[i-1]))
# }
# smi_tsla_strat[is.na(smi_tsla_strat)] <- 1
# smi_tsla_stratcomp <- cbind(smi_tsla[,1],smi_tsla[,2],smi_tsla_ts,smi_tsla_strat)
# colnames(smi_tsla_stratcomp) <- c('SMI','SMI(S)','SMI SIGNAL','SMI POSITION')
#
# # c. NFLX
# smi_nflx_strat <- ifelse(smi_nflx_ts > 1,0,1)
# for (i in 1 : length(Cl(NFLX))) {
#   smi_nflx_strat[i] <- ifelse(smi_nflx_ts[i] == 1,1,ifelse(smi_nflx_ts[i] == -1,0,smi_nflx_strat[i-1]))
# }
# smi_nflx_strat[is.na(smi_nflx_strat)] <- 1
# smi_nflx_stratcomp <- cbind(smi_nflx[,1],smi_nflx[,2],smi_nflx_ts,smi_nflx_strat)
# colnames(smi_nflx_stratcomp) <- c('SMI','SMI(S)','SMI SIGNAL','SMI POSITION')
#
#
# # Williams %R
#
# # The following code will create a Williams %R trading strategy if it satisfies our given conditions:
#
# # WPR
#
# # a. AAPL
# wpr_aapl_strat <- ifelse(wpr_aapl_ts > 1,0,1)
# for (i in 1 : length(Cl(AAPL))) {
#   wpr_aapl_strat[i] <- ifelse(wpr_aapl_ts[i] == 1,1,ifelse(wpr_aapl_ts[i] == -1,0,wpr_aapl_strat[i-1]))
# }
# wpr_aapl_strat[is.na(wpr_aapl_strat)] <- 1
# wpr_aapl_stratcomp <- cbind(wpr_aapl, wpr_aapl_ts, wpr_aapl_strat)
# colnames(wpr_aapl_stratcomp) <- c('WPR(14)','WPR SIGNAL','WPR POSITION')
#
# # b. TSLA
# wpr_tsla_strat <- ifelse(wpr_tsla_ts > 1,0,1)
# for (i in 1 : length(Cl(TSLA))) {
#   wpr_tsla_strat[i] <- ifelse(wpr_tsla_ts[i] == 1,1,ifelse(wpr_tsla_ts[i] == -1,0,wpr_tsla_strat[i-1]))
# }
# wpr_tsla_strat[is.na(wpr_tsla_strat)] <- 1
# wpr_tsla_stratcomp <- cbind(wpr_tsla, wpr_tsla_ts, wpr_tsla_strat)
# colnames(wpr_tsla_stratcomp) <- c('WPR(14)','WPR SIGNAL','WPR POSITION')
#
# # c. NFLX
# wpr_nflx_strat <- ifelse(wpr_nflx_ts > 1,0,1)
# for (i in 1 : length(Cl(NFLX))) {
#   wpr_nflx_strat[i] <- ifelse(wpr_nflx_ts[i] == 1,1,ifelse(wpr_nflx_ts[i] == -1,0,wpr_nflx_strat[i-1]))
# }
# wpr_nflx_strat[is.na(wpr_nflx_strat)] <- 1
# wpr_nflx_stratcomp <- cbind(wpr_nflx, wpr_nflx_ts, wpr_nflx_strat)
# colnames(wpr_nflx_stratcomp) <- c('WPR(14)','WPR SIGNAL','WPR POSITION')
#
#
# # Step-6 : Backtesting and Comparing the Results
# # In this step we are going to conduct backtests on our created trading strategies vs our created trading strategies commission adjusted (0.5%) vs the companies’ benchmark returns. Before conducting our backtests, we have calculate our daily benchmark returns i.e., daily returns of Apple, Tesla and Netflix. Let’s do it!
#
# # Calculating Returns & setting Benchmark for companies
#
# ret_aapl <- diff(log(Cl(AAPL)))
# ret_tsla <- diff(log(Cl(TSLA)))
# ret_nflx <- diff(log(Cl(NFLX)))
#
# benchmark_aapl <- ret_aapl
# benchmark_tsla <- ret_tsla
# benchmark_nflx <- ret_nflx
#
#
# # Now, we are set to conduct our backtests.
#
# # Simple Moving Average (SMA)
#
# # The following code will first calculate SMA strategy daily returns, commission adjusted SMA daily returns and finally runs the backtest (Comparison chart and an Annualized returns table) :
#
# # SMA
#
# # 1. AAPL
# sma_aapl_ret <- ret_aapl*sma_aapl_strat
# sma_aapl_ret_commission_adj <- ifelse((sma_aapl_ts == 1|sma_aapl_ts == -1) & sma_aapl_strat != Lag(sma_aapl_ts), (ret_aapl-0.05)*sma_aapl_strat, ret_aapl*sma_aapl_strat)
# sma_aapl_comp <- cbind(sma_aapl_ret, sma_aapl_ret_commission_adj, benchmark_aapl)
# colnames(sma_aapl_comp) <- c('SMA','SMA Commission Adj','Apple Benchmark')
# charts.PerformanceSummary(sma_aapl_comp, main = 'Apple SMA Performance')
# sma_aapl_comp_table <- table.AnnualizedReturns(sma_aapl_comp)
#
# # 2. TSLA
# sma_tsla_ret <- ret_tsla*sma_tsla_strat
# sma_tsla_ret_commission_adj <- ifelse((sma_tsla_ts == 1|sma_tsla_ts == -1) & sma_tsla_strat != Lag(sma_tsla_ts), (ret_tsla-0.05)*sma_tsla_strat, ret_tsla*sma_tsla_strat)
# sma_tsla_comp <- cbind(sma_tsla_ret, sma_tsla_ret_commission_adj, benchmark_tsla)
# colnames(sma_tsla_comp) <- c('SMA','SMA Commission Adj','Tesla Benchmark')
# charts.PerformanceSummary(sma_tsla_comp, main = 'Tesla SMA Performance')
# sma_tsla_comp_table <- table.AnnualizedReturns(sma_tsla_comp)
#
# # 3. NFLX
# sma_nflx_ret <- ret_nflx*sma_nflx_strat
# sma_nflx_ret_commission_adj <- ifelse((sma_nflx_ts == 1|sma_nflx_ts == -1) & sma_nflx_strat != Lag(sma_nflx_ts), (ret_nflx-0.05)*sma_nflx_strat, ret_nflx*sma_nflx_strat)
# sma_nflx_comp <- cbind(sma_nflx_ret, sma_nflx_ret_commission_adj, benchmark_nflx)
# colnames(sma_nflx_comp) <- c('SMA','SMA Commission Adj','Netflix Benchmark')
# charts.PerformanceSummary(sma_nflx_comp, main = 'Netflix SMA Performance')
# sma_nflx_comp_table <- table.AnnualizedReturns(sma_nflx_comp)
#
#
# # Parabolic SAR
#
# # The following code will first calculate Parabolic SAR strategy daily returns, commission adjusted Parabolic SAR daily returns and finally runs the backtest (Comparison chart and an Annualized returns table) :
#
# # Parabolic SAR
#
# # 1. AAPL
# sar_aapl_ret <- ret_aapl*sar_aapl_strat
# sar_aapl_ret_commission_adj <- ifelse((sar_aapl_ts == 1|sar_aapl_ts == -1) & sar_aapl_strat != Lag(sar_aapl_ts), (ret_aapl-0.05)*sar_aapl_strat, ret_aapl*sar_aapl_strat)
# sar_aapl_comp <- cbind(sar_aapl_ret, sar_aapl_ret_commission_adj, benchmark_aapl)
# colnames(sar_aapl_comp) <- c('SAR','SAR Commission Adj','Apple Benchmark')
# charts.PerformanceSummary(sar_aapl_comp, main = 'Apple Parabolic SAR Performance')
# sar_aapl_comp_table <- table.AnnualizedReturns(sar_aapl_comp)
#
# # 2. TSLA
# sar_tsla_ret <- ret_tsla*sar_tsla_strat
# sar_tsla_ret_commission_adj <- ifelse((sar_tsla_ts == 1|sar_tsla_ts == -1) & sar_tsla_strat != Lag(sar_tsla_ts), (ret_tsla-0.05)*sar_tsla_strat, ret_tsla*sar_tsla_strat)
# sar_tsla_comp <- cbind(sar_tsla_ret, sar_tsla_ret_commission_adj, benchmark_tsla)
# colnames(sar_tsla_comp) <- c('SAR','SAR Commission Adj','Tesla Benchmark')
# charts.PerformanceSummary(sar_tsla_comp, main = 'Tesla Parabolic SAR Performance')
# sar_tsla_comp_table <- table.AnnualizedReturns(sar_tsla_comp)
#
# # 3. NFLX
# sar_nflx_ret <- ret_nflx*sar_nflx_strat
# sar_nflx_ret_commission_adj <- ifelse((sar_nflx_ts == 1|sar_nflx_ts == -1) & sar_nflx_strat != Lag(sar_nflx_ts), (ret_nflx-0.05)*sar_nflx_strat, ret_nflx*sar_nflx_strat)
# sar_nflx_comp <- cbind(sar_nflx_ret, sar_nflx_ret_commission_adj, benchmark_nflx)
# colnames(sar_nflx_comp) <- c('SAR','SAR Commission Adj','Netflix Benchmark')
# charts.PerformanceSummary(sar_nflx_comp, main = 'Netflix Parabolic SAR Performance')
# sar_nflx_comp_table <- table.AnnualizedReturns(sar_nflx_comp)
#
#
# # Commodity Channel Index (CCI)
#
# # The following code will first calculate CCI strategy daily returns, commission adjusted CCI daily returns and finally runs the backtest (Comparison chart and an Annualized returns table) :
#
# # CCI
#
# # 1. AAPL
# cci_aapl_ret <- ret_aapl*cci_aapl_strat
# cci_aapl_ret_commission_adj <- ifelse((cci_aapl_ts == 1|cci_aapl_ts == -1) & cci_aapl_strat != Lag(cci_aapl_ts), (ret_aapl-0.05)*cci_aapl_strat, ret_aapl*cci_aapl_strat)
# cci_aapl_comp <- cbind(cci_aapl_ret, cci_aapl_ret_commission_adj, benchmark_aapl)
# colnames(cci_aapl_comp) <- c('CCI','CCI Commission Adj','Apple Benchmark')
# charts.PerformanceSummary(cci_aapl_comp, main = 'Apple CCI Performance')
# cci_aapl_comp_table <- table.AnnualizedReturns(cci_aapl_comp)
#
# # 2. TSLA
# cci_tsla_ret <- ret_tsla*cci_tsla_strat
# cci_tsla_ret_commission_adj <- ifelse((cci_tsla_ts == 1|cci_tsla_ts == -1) & cci_tsla_strat != Lag(cci_tsla_ts), (ret_tsla-0.05)*cci_tsla_strat, ret_tsla*cci_tsla_strat)
# cci_tsla_comp <- cbind(cci_tsla_ret, cci_tsla_ret_commission_adj, benchmark_tsla)
# colnames(cci_tsla_comp) <- c('CCI','CCI Commission Adj','Tesla Benchmark')
# charts.PerformanceSummary(cci_tsla_comp, main = 'Tesla CCI Performance')
# cci_tsla_comp_table <- table.AnnualizedReturns(cci_tsla_comp)
#
# # 3. NFLX
# cci_nflx_ret <- ret_nflx*cci_nflx_strat
# cci_nflx_ret_commission_adj <- ifelse((cci_nflx_ts == 1|cci_nflx_ts == -1) & cci_nflx_strat != Lag(cci_nflx_ts), (ret_nflx-0.05)*cci_nflx_strat, ret_nflx*cci_nflx_strat)
# cci_nflx_comp <- cbind(cci_nflx_ret, cci_nflx_ret_commission_adj, benchmark_nflx)
# colnames(cci_nflx_comp) <- c('CCI','CCI Commission Adj','Netflix Benchmark')
# charts.PerformanceSummary(cci_nflx_comp, main = 'Netflix CCI Performance')
# cci_nflx_comp_table <- table.AnnualizedReturns(cci_nflx_comp)
#
#
# # Rate Of Change (ROC)
#
# # The following code will first calculate ROC strategy daily returns, commission adjusted ROC daily returns and finally runs the backtest (Comparison chart and an Annualized returns table) :
#
# # ROC
#
# # 1. AAPL
# roc_aapl_ret <- ret_aapl*roc_aapl_strat
# roc_aapl_ret_commission_adj <- ifelse((roc_aapl_ts == 1|roc_aapl_ts == -1) & roc_aapl_strat != Lag(roc_aapl_ts), (ret_aapl-0.05)*roc_aapl_strat, ret_aapl*roc_aapl_strat)
# roc_aapl_comp <- cbind(roc_aapl_ret, roc_aapl_ret_commission_adj, benchmark_aapl)
# colnames(roc_aapl_comp) <- c('ROC','ROC Commission Adj','Apple Benchmark')
# charts.PerformanceSummary(roc_aapl_comp, main = 'Apple ROC Performance')
# roc_aapl_comp_table <- table.AnnualizedReturns(roc_aapl_comp)
#
# # 2. TSLA
# roc_tsla_ret <- ret_tsla*roc_tsla_strat
# roc_tsla_ret_commission_adj <- ifelse((roc_tsla_ts == 1|roc_tsla_ts == -1) & roc_tsla_strat != Lag(roc_tsla_ts), (ret_tsla-0.05)*roc_tsla_strat, ret_tsla*roc_tsla_strat)
# roc_tsla_comp <- cbind(roc_tsla_ret, roc_tsla_ret_commission_adj, benchmark_tsla)
# colnames(roc_tsla_comp) <- c('ROC','ROC Commission Adj','Tesla Benchmark')
# charts.PerformanceSummary(roc_tsla_comp, main = 'Tesla ROC Performance')
# roc_tsla_comp_table <- table.AnnualizedReturns(roc_tsla_comp)
#
# # 3. NFLX
# roc_nflx_ret <- ret_nflx*roc_nflx_strat
# roc_nflx_ret_commission_adj <- ifelse((roc_nflx_ts == 1|roc_nflx_ts == -1) & roc_nflx_strat != Lag(roc_nflx_ts), (ret_nflx-0.05)*roc_nflx_strat, ret_nflx*roc_nflx_strat)
# roc_nflx_comp <- cbind(roc_nflx_ret, roc_nflx_ret_commission_adj, benchmark_nflx)
# colnames(roc_nflx_comp) <- c('ROC','ROC Commission Adj','Netflix Benchmark')
# charts.PerformanceSummary(roc_nflx_comp, main = 'Netflix ROC Performance')
# roc_nflx_comp_table <- table.AnnualizedReturns(roc_nflx_comp)
#
#
# # Stochastic Momentum Index (SMI)
#
# # The following code will first calculate SMI strategy daily returns, commission adjusted SMI daily returns and finally runs the backtest (Comparison chart and an Annualized returns table) :
#
# # SMI
#
# # 1. AAPL
# smi_aapl_ret <- ret_aapl*smi_aapl_strat
# smi_aapl_ret_commission_adj <- ifelse((smi_aapl_ts == 1|smi_aapl_ts == -1) & smi_aapl_strat != Lag(smi_aapl_ts), (ret_aapl-0.05)*smi_aapl_strat, ret_aapl*smi_aapl_strat)
# smi_aapl_comp <- cbind(smi_aapl_ret, smi_aapl_ret_commission_adj, benchmark_aapl)
# colnames(smi_aapl_comp) <- c('SMI','SMI Commission Adj','Apple Benchmark')
# charts.PerformanceSummary(smi_aapl_comp, main = 'Apple SMI Performance')
# smi_aapl_comp_table <- table.AnnualizedReturns(smi_aapl_comp)
#
# # 2. TSLA
# smi_tsla_ret <- ret_tsla*smi_tsla_strat
# smi_tsla_ret_commission_adj <- ifelse((smi_tsla_ts == 1|smi_tsla_ts == -1) & smi_tsla_strat != Lag(smi_tsla_ts), (ret_tsla-0.05)*smi_tsla_strat, ret_tsla*smi_tsla_strat)
# smi_tsla_comp <- cbind(smi_tsla_ret, smi_tsla_ret_commission_adj, benchmark_tsla)
# colnames(smi_tsla_comp) <- c('SMI','SMI Commission Adj','Tesla Benchmark')
# charts.PerformanceSummary(smi_tsla_comp, main = 'Tesla SMI Performance')
# smi_tsla_comp_table <- table.AnnualizedReturns(smi_tsla_comp)
#
# # 3. NFLX
# smi_nflx_ret <- ret_nflx*smi_nflx_strat
# smi_nflx_ret_commission_adj <- ifelse((smi_nflx_ts == 1|smi_nflx_ts == -1) & smi_nflx_strat != Lag(smi_nflx_ts), (ret_nflx-0.05)*smi_nflx_strat, ret_nflx*smi_nflx_strat)
# smi_nflx_comp <- cbind(smi_nflx_ret, smi_nflx_ret_commission_adj, benchmark_nflx)
# colnames(smi_nflx_comp) <- c('SMI','SMI Commission Adj','Netflix Benchmark')
# charts.PerformanceSummary(smi_nflx_comp, main = 'Netflix SMI Performance')
# smi_nflx_comp_table <- table.AnnualizedReturns(smi_nflx_comp)
#
#
# # Williams %R
#
# # The following code will first calculate Williams %R strategy daily returns, commission adjusted Williams %R daily returns and finally runs the backtest (Comparison chart and an Annualized returns table) :
#
# # WPR
#
# # 1. AAPL
# wpr_aapl_ret <- ret_aapl*wpr_aapl_strat
# wpr_aapl_ret_commission_adj <- ifelse((wpr_aapl_ts == 1|wpr_aapl_ts == -1) & wpr_aapl_strat != Lag(wpr_aapl_ts), (ret_aapl-0.05)*wpr_aapl_strat, ret_aapl*wpr_aapl_strat)
# wpr_aapl_comp <- cbind(wpr_aapl_ret, wpr_aapl_ret_commission_adj, benchmark_aapl)
# colnames(wpr_aapl_comp) <- c('WPR','WPR Commission Adj','Apple Benchmark')
# charts.PerformanceSummary(wpr_aapl_comp, main = 'Apple WPR Performance')
# wpr_aapl_comp_table <- table.AnnualizedReturns(wpr_aapl_comp)
#
# # 2. TSLA
# wpr_tsla_ret <- ret_tsla*wpr_tsla_strat
# wpr_tsla_ret_commission_adj <- ifelse((wpr_tsla_ts == 1|wpr_tsla_ts == -1) & wpr_tsla_strat != Lag(wpr_tsla_ts), (ret_tsla-0.05)*wpr_tsla_strat, ret_tsla*wpr_tsla_strat)
# wpr_tsla_comp <- cbind(wpr_tsla_ret, wpr_tsla_ret_commission_adj, benchmark_tsla)
# colnames(wpr_tsla_comp) <- c('WPR','WPR Commission Adj','Tesla Benchmark')
# charts.PerformanceSummary(wpr_tsla_comp, main = 'Tesla WPR Performance')
# wpr_tsla_comp_table <- table.AnnualizedReturns(wpr_tsla_comp)
#
# # 3. NFLX
# wpr_nflx_ret <- ret_nflx*wpr_nflx_strat
# wpr_nflx_ret_commission_adj <- ifelse((wpr_nflx_ts == 1|wpr_nflx_ts == -1) & wpr_nflx_strat != Lag(wpr_nflx_ts), (ret_nflx-0.05)*wpr_nflx_strat, ret_nflx*wpr_nflx_strat)
# wpr_nflx_comp <- cbind(wpr_nflx_ret, wpr_nflx_ret_commission_adj, benchmark_nflx)
# colnames(wpr_nflx_comp) <- c('WPR','WPR Commission Adj','Netflix Benchmark')
# charts.PerformanceSummary(wpr_nflx_comp, main = 'Netflix WPR Performance')
# wpr_nflx_comp_table <- table.AnnualizedReturns(wpr_nflx_comp)
#
#
# ########################################################################
# ##CHATGPT Parfait
#
# # Installer et charger les packages nécessaires
# install.packages("quantmod")
# library(quantmod)
#
# # Définir les dates de début et de fin pour les données historiques
# start_date <- as.Date("2021-01-01")
# end_date <- as.Date("2021-12-31")
#
# # Récupérer les données historiques du cours de l'action AAPL depuis Yahoo Finance
# getSymbols("AAPL", src = "yahoo", from = start_date, to = end_date)
#
# # Calculer la moyenne mobile simple sur 50 jours
# AAPL$SMA50 <- SMA(Cl(AAPL), n = 50)
#
# # Définir les règles de trading
# AAPL$Signal <- ifelse(Cl(AAPL) > AAPL$SMA50, "Buy", "Sell")
#
# # Définir les règles de trading en excluant les valeurs NA
# AAPL$Signal <- ifelse(!is.na(Cl(AAPL)) & !is.na(AAPL$SMA50), ifelse(Cl(AAPL) > AAPL$SMA50, "Buy", "Sell"), NA)
#
# # Afficher les données avec les signaux de trading
# head(AAPL)
#
#
#
#
#
# #########################################################""
# ## GEMINI
# # Importer les packages nécessaires
# library(quantmod)
# library(ggplot2)
# library(tseries)
#
# # Téléchargement des données historiques
# # , source = "yahoo"
# aapl_data <- get.hist.quote("AAPL", quote = c("Cl", "Vol") , start = "2010-01-01", end = "2024-02-20")
#
# # Calcul des moyennes mobiles
# ma50 <- SMA(aapl_data$Close, n = 50)
# ma200 <- SMA(aapl_data$Close, n = 200)
#
# # Créer un signal de trading
# signal <- ifelse(ma50 > ma200, 1, -1)
#
# aapl_data_df <- as.data.frame(aapl_data)
#
# ggplot(aapl_data_df) +
#   geom_line(aes(x = index, y = Close)) +
#   geom_line(aes(x = index, y = ma50), color = "MA50") +
#   geom_line(aes(x = index, y = ma200), color = "MA200") +
#   geom_point(aes(x = index, y = Close, color = signal), size = 3) +
#   labs(color = NULL)
#
# # Visualiser les données et le signal
# ggplot(aapl_data) +
#   geom_line(aes(x = Index, y = Close)) +
#   geom_line(aes(x = Index, y = ma50), color = "MA50") +
#   geom_line(aes(x = Index, y = ma200), color = "MA200") +
#   geom_point(aes(x = Index, y = Close, color = signal), size = 3) +
#   labs(color = NULL)
#
# # Stratégie de trading
# strategie <- function(data) {
#   positions <- c()
#   for (i in 2:length(data)) {
#     if (data$signal[i] == 1 && data$signal[i - 1] == -1) {
#       positions <- c(positions, 1) # Acheter
#     } else if (data$signal[i] == -1 && data$signal[i - 1] == 1) {
#       positions <- c(positions, -1) # Vendre
#     } else {
#       positions <- c(positions, 0) # Ne rien faire
#     }
#   }
#   return(positions)
# }
#
# # Supprimer les lignes avec des valeurs manquantes
# aapl_data <- na.omit(aapl_data)
#
# # Tester la stratégie
# positions <- strategie(data = aapl_data)
#
# # Analyser les résultats
# performance <- cumsum(positions * aapl_data$Close)
#
# # Visualiser la performance
# ggplot(data.frame(performance = performance)) +
#   geom_line(aes(x = Index, y = performance)) +
#   labs(x = "Date", y = "Performance")
#
