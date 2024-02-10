---
title: "Library Euronext"
date: "10 février,2024"
output:
  html_document:
    toc: yes
    fig_caption: yes
    keep_md: yes
    fig_width: 8
    fig_height: 6
  word_document:
    toc: yes
  pdf_document:
    toc: yes
  latex_engine: lualatex
  always_allow_html: true
---

<!-- badges: start -->
[![CRAN Status](http://www.r-pkg.org/badges/version/Euronext)](https://cran.r-project.org/package=Euronext)
![](https://cranlogs.r-pkg.org/badges/Euronext)
![](https://cranlogs.r-pkg.org/badges/grand-total/Euronext)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html##experimental)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com)
<!-- badges: end -->




<!-- <img src="man/figures/EN_good_Logo.png" width="147" height="170" align="right"/> -->
<!-- <img src="man/figures/EN_good1_Logo.png" width="250" height="250" align="right"/> -->
<img src="man/figures/EN_good2_Logo.png" width="200" height="250" align="right"/>


## Overview {.tabset}
# Description:
Unlock the power of financial data from the Euronext stock exchange with the Euronext R package. Dive into the world of stocks, indices, funds, ETFs, and bonds, and harness the convenience of a user-friendly interface for seamless data retrieval. Whether you're a researcher, investor, or financial enthusiast, this package provides a valuable resource for accessing and analyzing historical data, share prices, trading volumes, and more.

# Disclaimer:
Please note that the Euronext R package is a tool designed to access and retrieve public financial information from the Euronext stock exchange. The data returned by the Euronext R package originates from Euronext, and the package author is not the source of this data. All information is derived from the public domain, and users are advised to refer to the official [Euronext website](https://live.euronext.com/en) for specific data needs.

# Get in touch with the Euronext package and elevate your understanding of financial markets through the lens of R.


### Description {.tabset}
#### English

The Euronext R Package is a powerful tool for accessing and retrieving financial information from the Euronext stock exchange. Whether you are interested in stocks, indexes, funds, ETFs, or bonds, this package provides a convenient interface to gather essential data for analysis and decision-making in the financial domain. With user-friendly functionalities, it simplifies the process of collecting historical data on share prices, trading volumes, and other financial indicators. Researchers, investors, and other users can extract valuable insights and make informed decisions based on the comprehensive information available. In essence, the 'Euronext' library is a valuable asset for those seeking a deeper understanding of Euronext and the financial markets in Europe.

#### Français
Le package R Euronext est un outil puissant pour accéder et récupérer des informations financières de la bourse Euronext. Que vous soyez intéressé par les actions, les indices, les fonds, les ETF ou les obligations, ce package offre une interface pratique pour collecter des données essentielles pour l'analyse et la prise de décision dans le domaine financier. Avec des fonctionnalités conviviales, il simplifie le processus de collecte de données historiques sur les prix des actions, les volumes de transactions et d'autres indicateurs financiers. Les chercheurs, les investisseurs et d'autres utilisateurs peuvent extraire des informations précieuses et prendre des décisions éclairées en se basant sur les informations complètes disponibles. En somme, la bibliothèque 'Euronext' est un atout précieux pour ceux qui cherchent à approfondir leur compréhension d'Euronext et des marchés financiers en Europe.

## Html version of the Readme Since the size of the readme is huge due to the charts, you can visit the html version of the readme on [RPubs](https://rpubs.com/Fredysessie/euronext)

## Installation {.tabset}

## Installation guidelines
You can install the development version of EURONEXT from [github](https://github.com/Fredysessie/Euronext) with:





```r
# github dev version
## We can use devtools
# Install the development version from GitHub
devtools::install_github("Fredysessie/Euronext")

# Or use remotes
# install.packages("remotes")

remotes::install_github("Fredysessie/Euronext")
```

## **EN_GetProfile()** function

To better utilize the various functions of the 'Euronext' package, it is crucial to provide accurate information (such as ticker Name, ISIN, Symbol, or DNA) to the functions.

This function retrieves the profile of a given ticker - Equity, Index, Fund, ETF, or Bond - listed on the Euronext exchange based on its ticker Name, ISIN, Symbol, or DNA. It returns a list with details such as Name, ISIN, Symbol, and DNA information. It receives two (2) parameters:
- 'ticker' : A character string representing the company's ticker Name, ISIN, Symbol or DNA,
- 'stock_type' : The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.

### *Example 1.a* : Retrieve the *profile* (*characteristics*) of a specified Equity, Index, Fund, ETF, or Bond listed on Euronext.

Please refer to the respective functions **EN_GetISIN()**, **EN_GetISIN_Etf()**, **EN_GetISIN_F()**, and **EN_GetISIN_B()** if you wish to obtain the DNA of a giving Equity or Index, ETF, Fund, and Bond listed on Euronext (retrieving DNA is useful in case you decide to use 'escape = T' option).


```r
# Note: For Equity, Index, Fund, and ETF, provide the giving Symbol, ISIN, Name, or DNA for best results, but for a Bond, provide its DNA and sometimes its Name for best results because a company or country can issue more than one Bond.

 ## Equities
 # Example a : '3D SYSTEMS CORP' equity
 EN_GetProfile("4ddd")  # By providing Symbol
#> $Name
#> [1] "3D SYSTEMS CORP"
#> 
#> $ISIN
#> [1] "US88554D2053"
#> 
#> $DNA
#> [1] "US88554D2053-ETLX"
#> 
#> $Symbol
#> [1] "4DDD"

 # Example b : 'ALFEN' equity
 EN_GetProfile("NL0012817175") # By providing ISIN
#> $Name
#> [1] "ALFEN"
#> 
#> $ISIN
#> [1] "NL0012817175"
#> 
#> $DNA
#> [1] "NL0012817175-XAMS"
#> 
#> $Symbol
#> [1] "ALFEN"

 # Example c : 'LES HOTELS BAVEREZ' equity
 EN_GetProfile("LES HOTELS BAVEREZ") # By providing Name
#> $Name
#> [1] "LES HOTELS BAVEREZ"
#> 
#> $ISIN
#> [1] "FR0007080254"
#> 
#> $DNA
#> [1] "FR0007080254-ALXP"
#> 
#> $Symbol
#> [1] "ALLHB"
 
 # Example d : 'BE SEMICONDUCTOR' equity
 EN_GetProfile("NL0012866412-XAMS") # By providing DNA
#> $Name
#> [1] "BE SEMICONDUCTOR"
#> 
#> $ISIN
#> [1] "NL0012866412"
#> 
#> $DNA
#> [1] "NL0012866412-XAMS"
#> 
#> $Symbol
#> [1] "BESI"
 
 ## Indices 
 # Example a : 'AEX CONS STAPL GR' Index
 EN_GetProfile("NLCSG") # By providing Symbol
#> $Name
#> [1] "AEX CONS STAPL GR"
#> 
#> $ISIN
#> [1] "QS0011225420"
#> 
#> $DNA
#> [1] "QS0011225420-XAMS"
#> 
#> $Symbol
#> [1] "NLCSG"
 
 # Example b : 'AEX All-Share Index' Index
 EN_GetProfile("NL0000249100") # By providing ISIN
#> $Name
#> [1] "AEX ALL-SHARE"
#> 
#> $ISIN
#> [1] "NL0000249100"
#> 
#> $DNA
#> [1] "NL0000249100-XAMS"
#> 
#> $Symbol
#> [1] "AAX"

 # Example c : 'Euronext Core Europe 30 EW Decrement 5% NR' Index
 EN_GetProfile("EN CE EW30 D 5% NR") # By providing Name
#> $Name
#> [1] "EN CE EW30 D 5% NR"
#> 
#> $ISIN
#> [1] "NL0012483929"
#> 
#> $DNA
#> [1] "NL0012483929-XAMS"
#> 
#> $Symbol
#> [1] "COR30"
 
 # Example d : 'SBF 120 NR' Index
 EN_GetProfile("QS0011131842-XPAR") # By providing DNA
#> $Name
#> [1] "SBF 120 NR"
#> 
#> $ISIN
#> [1] "QS0011131842"
#> 
#> $DNA
#> [1] "QS0011131842-XPAR"
#> 
#> $Symbol
#> [1] "PX4NR"
 
 ## ETFs 
 # Example a : 'Asia IG Corp US A' Etf
 EN_GetProfile("$Asia IG Corp US A", stock_type = 'E') # By providing Name
#> $Name
#> [1] "$ASIA IG CORP US A"
#> 
#> $ISIN
#> [1] "IE0007G78AC4"
#> 
#> $DNA
#> [1] "IE0007G78AC4-XAMS"
#> 
#> $Symbol
#> [1] "ASIG"
 
 # Example b : '1X MSFT' Etf
 EN_GetProfile("MSFT", stock_type = 'E') # By providing Symbol
#> $Name
#> [1] "1X MSFT"
#> 
#> $ISIN
#> [1] "XS2337100320"
#> 
#> $DNA
#> [1] "XS2337100320-XAMS"
#> 
#> $Symbol
#> [1] "MSFT"
 
 # Example c : '3X LONG COINBASE' Etf
 EN_GetProfile("XS2399367254", stock_type = 'E') # By providing ISIN of 3X LONG COINBASE
#> $Name
#> [1] "3X LONG COINBASE"
#> 
#> $ISIN
#> [1] "XS2399367254"
#> 
#> $DNA
#> [1] "XS2399367254-XAMS"
#> 
#> $Symbol
#> [1] "3CON"
 
 # Example d : '3X PLTR' Etf
 EN_GetProfile("XS2663694680-XAMS", stock_type = 'E') # By providing DNA
#> $Name
#> [1] "3X PLTR"
#> 
#> $ISIN
#> [1] "XS2663694680"
#> 
#> $DNA
#> [1] "XS2663694680-XAMS"
#> 
#> $Symbol
#> [1] "3PLT"

 # Funds
 # Example a : 'ACOMEA PERFORMANCE' Fund
 EN_GetProfile("ACAPER", stock_type = 'F') # By providing Symbol
#> $Name
#> [1] "ACOMEA PERFORMANCE"
#> 
#> $ISIN
#> [1] "IT0005090912"
#> 
#> $DNA
#> [1] "IT0005090912-ATFX"
#> 
#> $Symbol
#> [1] "ACAPER"
 
 # Example b : 'BNP ESGNL' Fund
 EN_GetProfile("BNP ESGNL", stock_type = 'F') # By providing Name
#> $Name
#> [1] "BNP ESGNL"
#> 
#> $ISIN
#> [1] "NL0012727432"
#> 
#> $DNA
#> [1] "NL0012727432-XAMS"
#> 
#> $Symbol
#> [1] "ESGNL"
 
 # Example c : 'SWIF2' Fund
 EN_GetProfile("NL0015000W40", stock_type = 'F') # By providing ISIN of SWIF2
#> $Name
#> [1] "SWIF2"
#> 
#> $ISIN
#> [1] "NL0015000W40"
#> 
#> $DNA
#> [1] "NL0015000W40-XAMS"
#> 
#> $Symbol
#> [1] "SWIF2"

 # Example d : 'GOLDMAN SACHS PARAPLUFONDS 2 N' Fund
 EN_GetProfile("NL0000293181-XAMS", stock_type = 'F') # By providing DNA of GSDM5
#> $Name
#> [1] "GS DYN MIX FD V"
#> 
#> $ISIN
#> [1] "NL0000293181"
#> 
#> $DNA
#> [1] "NL0000293181-XAMS"
#> 
#> $Symbol
#> [1] "GSDM5"

 # Examples for Bonds
 # Example a: 'A2A SLB TF 0,625%' Bond
 EN_GetProfile("XS2364001078-XMOT", stock_type = 'B') # By providing DNA
#> $Name
#> [1] "A2A SLB TF 0,625%"
#> 
#> $ISIN
#> [1] "IT0005386724"
#> 
#> $DNA
#> [1] "XS2364001078-XMOT"
#> 
#> $Issuer
#> [1] "A2A S.p.A."

 # Example b: 'AAB1.50%30SEP30' Bond
 EN_GetProfile("AAB1.50%30SEP30", stock_type = 'B') # By providing Name
#> $Name
#> [1] "AAB1.50%30SEP30"
#> 
#> $ISIN
#> [1] "IT0005386724"
#> 
#> $DNA
#> [1] "XS1298431799-XAMS"
#> 
#> $Issuer
#> [1] "ABN AMRO BANK N.V."
```

## **EN_Get_News()** function
This function retrieves the update information of a company listed on the Euronext exchange
based on its ticker symbol. It returns a table with details such as its real Name, ISIN,
Last traded Price, Date of last update, and other relevant informations.

*Inputs* :
- *ticker* A character string representing the company's ticker, name, or ISIN.
- *stock_type*   The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers,'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
- *escape* Boolean, either T or F. If escape is True, it means you're providing the DNA
(ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming
operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN
and the type of market to which it belongs.


### *Example 1.b* : Get Latest News for an Equity

```r
# Retrieve news for the equity "AALBERTS N.V." using its DNA
equity_news <- EN_Get_News("NL0000852564-XAMS", escape = TRUE)
print(equity_news)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Information </th>
   <th style="text-align:left;"> Detail </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Name </td>
   <td style="text-align:left;"> AALBERTS N.V. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Belongs to </td>
   <td style="text-align:left;"> Euronext Amsterdam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ISIN </td>
   <td style="text-align:left;"> NL0000852564 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Type </td>
   <td style="text-align:left;"> Stock </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Last traded Price </td>
   <td style="text-align:left;"> 36.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of last update </td>
   <td style="text-align:left;"> 09/02/2024 - 17:35 CET </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Since Open </td>
   <td style="text-align:left;"> -0.14 (-0.39%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Since Previous Close </td>
   <td style="text-align:left;"> -0.07 (-0.19%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Valuation Close </td>
   <td style="text-align:left;"> 36.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Best Bid </td>
   <td style="text-align:left;"> 35.86 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Best Ask </td>
   <td style="text-align:left;"> 36.50 </td>
  </tr>
</tbody>
</table>

### *Example 1.c* : Get Latest News for an Index

```r
# Retrieve news for the index "AEX All-Share Index GR" using its symbol
index_news <- EN_Get_News("QS0011224977-XAMS", escape = TRUE)
print(index_news)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Information </th>
   <th style="text-align:left;"> Detail </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Name </td>
   <td style="text-align:left;"> AEX All-Share Index GR </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Belongs to </td>
   <td style="text-align:left;"> Euronext Amsterdam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ISIN </td>
   <td style="text-align:left;"> QS0011224977 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Type </td>
   <td style="text-align:left;"> Index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Last level </td>
   <td style="text-align:left;"> 4,532.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of last update </td>
   <td style="text-align:left;"> 09/02/2024 - 18:05 CET </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Since Open </td>
   <td style="text-align:left;"> +35.42 (+0.79%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Since Previous Close </td>
   <td style="text-align:left;"> +35.42 (+0.79%) </td>
  </tr>
</tbody>
</table>

### *Example 1.d* : Get Latest News for a Bond

```r
# Retrieve news for the bond "AAB0.45%12DEC2036" using its DNA
bond_news <- EN_Get_News("XS2093705064-XAMS", escape = TRUE)
print(bond_news)

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Information </th>
   <th style="text-align:left;"> Detail </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Name </td>
   <td style="text-align:left;"> AAB0.45%12DEC2036 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Belongs to </td>
   <td style="text-align:left;"> Euronext Amsterdam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ISIN </td>
   <td style="text-align:left;"> XS2093705064 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Type </td>
   <td style="text-align:left;"> Bond </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Valuation Close </td>
   <td style="text-align:left;"> 100.00 </td>
  </tr>
</tbody>
</table>

## **EN_Stocks_List()** function

This function receives as input **stock_choice** and then retrieves a list of companies listed on the provided Euronext stock exchanges, filtered by the initial letter of their names. It provides information such as the company name, ticker symbol, ISIN code, market, last closing price, percentage change, and a link to the company's details on the Euronext website.
- stock_choice A character string specifying the stock exchange. Options include "A" or "Amsterdam," "B" or "Brussels," "D" or "Dublin", "L" or "Lisbon," "M" or "Milan," "P" or "Paris," and "O" or "Oslo."

### *Example 2.a* : Get Euronext Stocks List


```r
# The columns names of the initial dataframe is c("Date", "Name", "Ticker", "Code_ISIN", "Market", "Last_price", "Percentage change (in %)", "URL", "Ticker_adn")

# So I will only display columns "Name", "Ticker", "Code_ISIN", "Market", "Last_price" and "Percentage change (in %)"

# For Amsterdam Stock
a_result_df <- EN_Stocks_List("A")
head(a_result_df)[,c(2:6)]

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Last_price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> AALBERTS NV </td>
   <td style="text-align:left;"> AALB </td>
   <td style="text-align:left;"> NL0000852564 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €36.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> ABN </td>
   <td style="text-align:left;"> NL0011540547 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €13.08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACCSYS </td>
   <td style="text-align:left;"> AXS </td>
   <td style="text-align:left;"> GB00BQQFX454 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €0.66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACOMO </td>
   <td style="text-align:left;"> ACOMO </td>
   <td style="text-align:left;"> NL0000313286 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €17.52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ADUX </td>
   <td style="text-align:left;"> ADUX </td>
   <td style="text-align:left;"> FR0012821890 </td>
   <td style="text-align:left;"> XPAR, XAMS </td>
   <td style="text-align:left;"> €1.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ADYEN </td>
   <td style="text-align:left;"> ADYEN </td>
   <td style="text-align:left;"> NL0012969182 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €1 </td>
  </tr>
</tbody>
</table>



```r
# For Brussels Stock
b_result_df <- EN_Stocks_List("B")[,c(2:6)]
tail(b_result_df)
```


<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Last_price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 137 </td>
   <td style="text-align:left;"> WDP </td>
   <td style="text-align:left;"> WDP </td>
   <td style="text-align:left;"> BE0974349814 </td>
   <td style="text-align:left;"> XBRU, XAMS </td>
   <td style="text-align:left;"> €25.76 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 138 </td>
   <td style="text-align:left;"> WERELDHAVE BELGIUM </td>
   <td style="text-align:left;"> WEHB </td>
   <td style="text-align:left;"> BE0003724383 </td>
   <td style="text-align:left;"> XBRU </td>
   <td style="text-align:left;"> €47.60 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 139 </td>
   <td style="text-align:left;"> WHAT </td>
   <td style="text-align:left;"> WHATS </td>
   <td style="text-align:left;"> BE0003573814 </td>
   <td style="text-align:left;"> XBRU </td>
   <td style="text-align:left;"> €56.40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 140 </td>
   <td style="text-align:left;"> WHITESTONE GROUP </td>
   <td style="text-align:left;"> ROCK </td>
   <td style="text-align:left;"> BE0974401334 </td>
   <td style="text-align:left;"> ALXB </td>
   <td style="text-align:left;"> €10.40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 141 </td>
   <td style="text-align:left;"> XIOR </td>
   <td style="text-align:left;"> XIOR </td>
   <td style="text-align:left;"> BE0974288202 </td>
   <td style="text-align:left;"> XBRU </td>
   <td style="text-align:left;"> €27.10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 142 </td>
   <td style="text-align:left;"> ZENOBE GRAMME CERT </td>
   <td style="text-align:left;"> ZEN </td>
   <td style="text-align:left;"> BE0003809267 </td>
   <td style="text-align:left;"> XBRU </td>
   <td style="text-align:left;"> €180.00 </td>
  </tr>
</tbody>
</table>


```r
# For Paris Stock
p_result_df <- EN_Stocks_List("P")[,c(2:6)]
head(p_result_df)

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Last_price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1000MERCIS </td>
   <td style="text-align:left;"> ALMIL </td>
   <td style="text-align:left;"> FR0010285965 </td>
   <td style="text-align:left;"> ALXP </td>
   <td style="text-align:left;"> €26.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2CRSI </td>
   <td style="text-align:left;"> AL2SI </td>
   <td style="text-align:left;"> FR0013341781 </td>
   <td style="text-align:left;"> ALXP </td>
   <td style="text-align:left;"> €4.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> A.S.T. GROUPE </td>
   <td style="text-align:left;"> ALAST </td>
   <td style="text-align:left;"> FR0000076887 </td>
   <td style="text-align:left;"> ALXP </td>
   <td style="text-align:left;"> €0.962 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AB SCIENCE </td>
   <td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> FR0010557264 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> €3.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABC ARBITRAGE </td>
   <td style="text-align:left;"> ABCA </td>
   <td style="text-align:left;"> FR0004040608 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> €4.39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABEO </td>
   <td style="text-align:left;"> ABEO </td>
   <td style="text-align:left;"> FR0013185857 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> €13.15 </td>
  </tr>
</tbody>
</table>



```r
# For Lisbon Stock
l_result_df <- EN_Stocks_List("L")[,c(2:6)]  
head(l_result_df)

```


<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Last_price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> AGUAS DA CURIA </td>
   <td style="text-align:left;"> CUR </td>
   <td style="text-align:left;"> PTCUR0AP0000 </td>
   <td style="text-align:left;"> ENXL </td>
   <td style="text-align:left;"> €1.17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ALTRI SGPS </td>
   <td style="text-align:left;"> ALTR </td>
   <td style="text-align:left;"> PTALT0AE0002 </td>
   <td style="text-align:left;"> XLIS </td>
   <td style="text-align:left;"> €4.402 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ATRIUM BIRE SIGI </td>
   <td style="text-align:left;"> MLATR </td>
   <td style="text-align:left;"> PTTBI0AM0006 </td>
   <td style="text-align:left;"> ENXL </td>
   <td style="text-align:left;"> NANA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> B.COM.PORTUGUES </td>
   <td style="text-align:left;"> BCP </td>
   <td style="text-align:left;"> PTBCP0AM0015 </td>
   <td style="text-align:left;"> XLIS </td>
   <td style="text-align:left;"> €0.2543 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BENFICA </td>
   <td style="text-align:left;"> SLBEN </td>
   <td style="text-align:left;"> PTSLB0AM0010 </td>
   <td style="text-align:left;"> XLIS </td>
   <td style="text-align:left;"> €2.90 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> COFINA,SGPS </td>
   <td style="text-align:left;"> CFN </td>
   <td style="text-align:left;"> PTCFN0AE0003 </td>
   <td style="text-align:left;"> XLIS </td>
   <td style="text-align:left;"> €0.43 </td>
  </tr>
</tbody>
</table>



```r
# For Milan Stock
m_result_df <- EN_Stocks_List("M")[,c(2:6)]  # For Milan Stock
tail(m_result_df)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Last_price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1903 </td>
   <td style="text-align:left;"> ZOETIS </td>
   <td style="text-align:left;"> 4ZTS </td>
   <td style="text-align:left;"> US98978V1035 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> €183.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1904 </td>
   <td style="text-align:left;"> ZOETIS </td>
   <td style="text-align:left;"> 2ZTS </td>
   <td style="text-align:left;"> US98978V1035 </td>
   <td style="text-align:left;"> MTAH </td>
   <td style="text-align:left;"> €173.20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1905 </td>
   <td style="text-align:left;"> ZOOM VIDEO COMM </td>
   <td style="text-align:left;"> 4ZM </td>
   <td style="text-align:left;"> US98980L1017 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> €59.43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1906 </td>
   <td style="text-align:left;"> ZOOM VIDEO COMM </td>
   <td style="text-align:left;"> 1ZM </td>
   <td style="text-align:left;"> US98980L1017 </td>
   <td style="text-align:left;"> BGEM </td>
   <td style="text-align:left;"> €58.78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1907 </td>
   <td style="text-align:left;"> ZOOM VIDEO COMM </td>
   <td style="text-align:left;"> 2ZM </td>
   <td style="text-align:left;"> US98980L1017 </td>
   <td style="text-align:left;"> MTAH </td>
   <td style="text-align:left;"> €64.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1908 </td>
   <td style="text-align:left;"> ZUCCHI </td>
   <td style="text-align:left;"> ZUC </td>
   <td style="text-align:left;"> IT0005395071 </td>
   <td style="text-align:left;"> MTAA </td>
   <td style="text-align:left;"> €2.05 </td>
  </tr>
</tbody>
</table>



```r
# For Dublin Stock
d_result_df <- EN_Stocks_List("D")[,c(2:6)]  
tail(d_result_df)

```


<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Last_price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 28 </td>
   <td style="text-align:left;"> ORIGIN ENT. PLC </td>
   <td style="text-align:left;"> OIZ </td>
   <td style="text-align:left;"> IE00B1WV4493 </td>
   <td style="text-align:left;"> XESM </td>
   <td style="text-align:left;"> €3.40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 29 </td>
   <td style="text-align:left;"> OVOCA BIO PLC </td>
   <td style="text-align:left;"> OVXA </td>
   <td style="text-align:left;"> IE00B4XVDC01 </td>
   <td style="text-align:left;"> XESM </td>
   <td style="text-align:left;"> €0.01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 30 </td>
   <td style="text-align:left;"> PERM. TSB GP. HOLD </td>
   <td style="text-align:left;"> PTSB </td>
   <td style="text-align:left;"> IE00BWB8X525 </td>
   <td style="text-align:left;"> XMSM </td>
   <td style="text-align:left;"> €1.65 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 31 </td>
   <td style="text-align:left;"> RYANAIR HOLD. PLC </td>
   <td style="text-align:left;"> RYA </td>
   <td style="text-align:left;"> IE00BYTBXV33 </td>
   <td style="text-align:left;"> XMSM </td>
   <td style="text-align:left;"> €20.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 32 </td>
   <td style="text-align:left;"> SMURFIT KAPPA GP </td>
   <td style="text-align:left;"> SK3 </td>
   <td style="text-align:left;"> IE00B1RR8406 </td>
   <td style="text-align:left;"> XMSM </td>
   <td style="text-align:left;"> €37.15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 33 </td>
   <td style="text-align:left;"> UNIPHAR PLC </td>
   <td style="text-align:left;"> UPR </td>
   <td style="text-align:left;"> IE00BJ5FQX74 </td>
   <td style="text-align:left;"> XESM </td>
   <td style="text-align:left;"> €2.87 </td>
  </tr>
</tbody>
</table>


```r
# For Oslo Stock
o_result_df <- EN_Stocks_List("O")[,c(2:6)]
head(o_result_df, 10)

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Last_price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> AALBERTS NV </td>
   <td style="text-align:left;"> AALB </td>
   <td style="text-align:left;"> NL0000852564 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €36.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> ABN </td>
   <td style="text-align:left;"> NL0011540547 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €13.08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACCSYS </td>
   <td style="text-align:left;"> AXS </td>
   <td style="text-align:left;"> GB00BQQFX454 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €0.66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACOMO </td>
   <td style="text-align:left;"> ACOMO </td>
   <td style="text-align:left;"> NL0000313286 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €17.52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ADUX </td>
   <td style="text-align:left;"> ADUX </td>
   <td style="text-align:left;"> FR0012821890 </td>
   <td style="text-align:left;"> XPAR, XAMS </td>
   <td style="text-align:left;"> €1.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ADYEN </td>
   <td style="text-align:left;"> ADYEN </td>
   <td style="text-align:left;"> NL0012969182 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €1 </td>
  </tr>
</tbody>
</table>



### *Example 2.b* : Euronext Paris ticker ISIN

```r
# Retrieve the ISIN for a company with ticker "abca"
EN_P_Ticker_adn("abca")
#> [1] "FR0004040608-XPAR"

# Example result for a valid ticker "AAA"
result <- EN_P_Ticker_adn("AAA")
print(result)
#> [1] "FR0000062465-XPAR"

# Example for a non-existing ticker "afsf"
print(EN_P_Ticker_adn("afsf"))  # Ticker is not existing
#> [1] "Ticker not found"
```



## **EN_Indices_List()** function
It receives no argument and retrieves information about all indices available on Euronext. 

### *Example 3* : Get the list of Euronext Indexes

```r
# Get list of Indices available on Euronext
all_indices = EN_Indices_List()
dim(all_indices)
tail(all_indices)
```


```
#> [1] 1263    8
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Isin </th>
   <th style="text-align:left;"> Symbol </th>
   <th style="text-align:left;"> Last </th>
   <th style="text-align:left;"> Percentage change (in %) </th>
   <th style="text-align:left;"> Date_Time </th>
   <th style="text-align:left;"> YTD% </th>
   <th style="text-align:left;"> Ticker_adn </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> SBF Top 50 ESG EW GR </td>
   <td style="text-align:left;"> FR0013371432 </td>
   <td style="text-align:left;"> ESF5G </td>
   <td style="text-align:left;"> €1252.28 </td>
   <td style="text-align:left;"> -0.40% </td>
   <td style="text-align:left;"> 09 Feb 2024 </td>
   <td style="text-align:left;"> -0.74% </td>
   <td style="text-align:left;"> FR0013371432-ESF5G </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 50 ESG EW NR </td>
   <td style="text-align:left;"> FR0013371424 </td>
   <td style="text-align:left;"> ESF5N </td>
   <td style="text-align:left;"> €1193.37 </td>
   <td style="text-align:left;"> -0.40% </td>
   <td style="text-align:left;"> 09 Feb 2024 </td>
   <td style="text-align:left;"> -0.79% </td>
   <td style="text-align:left;"> FR0013371424-ESF5N </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 80 EW </td>
   <td style="text-align:left;"> FR0013017936 </td>
   <td style="text-align:left;"> SBF80 </td>
   <td style="text-align:left;"> €1246.28 </td>
   <td style="text-align:left;"> +0.10% </td>
   <td style="text-align:left;"> 09 Feb 2024 </td>
   <td style="text-align:left;"> -0.46% </td>
   <td style="text-align:left;"> FR0013017936-SBF80 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 80 EW Decrement 50 Points </td>
   <td style="text-align:left;"> FR0013017969 </td>
   <td style="text-align:left;"> SBF8D </td>
   <td style="text-align:left;"> €1001.85 </td>
   <td style="text-align:left;"> +0.08% </td>
   <td style="text-align:left;"> 09 Feb 2024 </td>
   <td style="text-align:left;"> -0.92% </td>
   <td style="text-align:left;"> FR0013017969-SBF8D </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 80 EW GR </td>
   <td style="text-align:left;"> FR0013017951 </td>
   <td style="text-align:left;"> SBF8G </td>
   <td style="text-align:left;"> €1587.18 </td>
   <td style="text-align:left;"> +0.10% </td>
   <td style="text-align:left;"> 09 Feb 2024 </td>
   <td style="text-align:left;"> -0.35% </td>
   <td style="text-align:left;"> FR0013017951-SBF8G </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 80 EW NR </td>
   <td style="text-align:left;"> FR0013017944 </td>
   <td style="text-align:left;"> SBF8N </td>
   <td style="text-align:left;"> €1485.20 </td>
   <td style="text-align:left;"> +0.10% </td>
   <td style="text-align:left;"> 09 Feb 2024 </td>
   <td style="text-align:left;"> -0.38% </td>
   <td style="text-align:left;"> FR0013017944-SBF8N </td>
  </tr>
</tbody>
</table>



## **EN_Etfs_List()** and **EN_Etfs_List_bis** functions

*EN_Etfs_List* receives as input **tot_page** which is the total number of pages to retrieve. 
In contrast, *EN_Etfs_List_bis* receives as input **target_page** which represents the target page.
For example, the function **EN_Etfs_List_bis(5)**, retrieves only the fifth page of the Etfs list, allowing more granular control of the data retrieval process (ordered list of 100 Etfs), whereas **EN_Etfs_List(5)** would return an ordered list of 500 Etfs listed on Euronext (on each page there are 100 Etfs, so for 5 pages 5*100 = 500).

### **Example 4 : Get the list of ETFs** quoted on Euronext markets


```r
# Get 1st 500 Etfs in alphabetic order
dt_ <- EN_Etfs_List()
tail(dt_[, c(2:9)])

# The number of columns and rows
dim(dt_)

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Bid </th>
   <th style="text-align:left;"> Ask </th>
   <th style="text-align:left;"> Last_price </th>
   <th style="text-align:left;"> Percentage_change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 495 </td>
   <td style="text-align:left;"> AMUNDI US MIN VO </td>
   <td style="text-align:left;"> MIVU </td>
   <td style="text-align:left;"> LU1589349734 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> $89.569 </td>
   <td style="text-align:left;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 496 </td>
   <td style="text-align:left;"> AMUNDI US STEEPEN </td>
   <td style="text-align:left;"> STPU </td>
   <td style="text-align:left;"> LU2018762653 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €87.432 </td>
   <td style="text-align:left;"> -0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 497 </td>
   <td style="text-align:left;"> AMUNDI US TIPS </td>
   <td style="text-align:left;"> UIFL </td>
   <td style="text-align:left;"> LU1525419294 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> $58.359 </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 498 </td>
   <td style="text-align:left;"> AMUNDI US-T 10Y+ </td>
   <td style="text-align:left;"> U10HK </td>
   <td style="text-align:left;"> LU2338178648 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> NA674.704 </td>
   <td style="text-align:left;"> 0.10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 499 </td>
   <td style="text-align:left;"> Amundi USASRI </td>
   <td style="text-align:left;"> USRI </td>
   <td style="text-align:left;"> IE000R85HL30 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €102.958 </td>
   <td style="text-align:left;"> 0.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 500 </td>
   <td style="text-align:left;"> Amundi USASRI </td>
   <td style="text-align:left;"> USRI </td>
   <td style="text-align:left;"> IE000R85HL30 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> $111.09 </td>
   <td style="text-align:left;"> 0.34 </td>
  </tr>
</tbody>
</table>

```
#> [1] 500  11
```



```r
# By default, EN_Etfs_List_bis() returns the list of 100 Etfs in alphabetic order
dt_1 <- EN_Etfs_List_bis()  
# The number of columns and rows
dim(dt_1)
# Head
dt_1.h <- head(dt_1[, c(2:9)])

```



```
#> [1] 100  11
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Bid </th>
   <th style="text-align:left;"> Ask </th>
   <th style="text-align:left;"> Last_price </th>
   <th style="text-align:left;"> Percentage_change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> $Asia IG Corp US A </td>
   <td style="text-align:left;"> ASIG </td>
   <td style="text-align:left;"> IE0007G78AC4 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> $4.811 </td>
   <td style="text-align:left;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -1X SHORT DIS </td>
   <td style="text-align:left;"> SDIS </td>
   <td style="text-align:left;"> XS2337085422 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €5.9605 </td>
   <td style="text-align:left;"> 0.36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -1X SHORT PLTR </td>
   <td style="text-align:left;"> SPLR </td>
   <td style="text-align:left;"> XS2337086669 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €1.2642 </td>
   <td style="text-align:left;"> -3.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -1X SHORT PLUG </td>
   <td style="text-align:left;"> SPLU </td>
   <td style="text-align:left;"> XS2336362079 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €4.1274 </td>
   <td style="text-align:left;"> -0.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -3X ARK INNOVATION </td>
   <td style="text-align:left;"> SARKK </td>
   <td style="text-align:left;"> XS2399368906 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €0.5369 </td>
   <td style="text-align:left;"> -7.86 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -3x China Tech </td>
   <td style="text-align:left;"> SKWE </td>
   <td style="text-align:left;"> XS2399370126 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €0.31 </td>
   <td style="text-align:left;"> 1.84 </td>
  </tr>
</tbody>
</table>


## **EN_Bonds_List()** and **EN_Bonds_List_bis** functions

*EN_Bonds_List* receives as input **tot_page** which is the total number of pages to retrieve. 
In contrast, *EN_Bonds_List_bis* receives as input **target_page** which represents the target page.
For example, the function **EN_Bonds_List_bis(5)**, retrieves only the fifth page of the Bonds list, allowing more granular control of the data retrieval process (ordered list of 100 Bonds), whereas **EN_Bonds_List(5)** would return an ordered list of 500 Bonds listed on Euronext (on each page there are 100 Bonds, so for 5 pages 5*100 = 500).


### **Example 5 : Get the list of Bonds** quoted on Euronext markets


```r
# Get 1st 500 Bonds in alphabetic order
dt_b <- EN_Bonds_List()
head(dt_b[, c(2:9)])

tail(dt_b[, c(2:9)])

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Issuer </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Maturity </th>
   <th style="text-align:left;"> Coupon </th>
   <th style="text-align:left;"> Last_price </th>
   <th style="text-align:left;"> Percentage change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 2019 PB RMBS TV EU </td>
   <td style="text-align:left;"> 2019 POPOLARE BARI RMBS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XMOT </td>
   <td style="text-align:left;"> 2069-05-31 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2019 PB RMBS TV EU </td>
   <td style="text-align:left;"> 2019 POPOLARE BARI RMBS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XMOT </td>
   <td style="text-align:left;"> 2069-05-31 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2019 PB RMBS TV EU </td>
   <td style="text-align:left;"> 2019 POPOLARE BARI RMBS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XMOT </td>
   <td style="text-align:left;"> 2069-05-31 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2I RETE GAS TF 2,1 </td>
   <td style="text-align:left;"> 2I RETE GAS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XMOT </td>
   <td style="text-align:left;"> 2025-09-11 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2IRG 1.608% CALL 3 </td>
   <td style="text-align:left;"> 2I RETE GAS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> 2027-10-31 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> 93.65 </td>
   <td style="text-align:left;"> -0.62% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2IRG 1.75% CALL 28 </td>
   <td style="text-align:left;"> 2I RETE GAS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> 2026-08-28 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
</tbody>
</table>

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Issuer </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Maturity </th>
   <th style="text-align:left;"> Coupon </th>
   <th style="text-align:left;"> Last_price </th>
   <th style="text-align:left;"> Percentage change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 495 </td>
   <td style="text-align:left;"> ALPHATHAI8%28JAN25 </td>
   <td style="text-align:left;"> ALPHA THAI BENELUX SA </td>
   <td style="text-align:left;"> NO0012757709 </td>
   <td style="text-align:left;"> VPXB </td>
   <td style="text-align:left;"> 2025-01-28 </td>
   <td style="text-align:left;"> 8.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 496 </td>
   <td style="text-align:left;"> ALSTO0.125%27JUL27 </td>
   <td style="text-align:left;"> ALSTOM </td>
   <td style="text-align:left;"> NO0012757709 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> 2027-07-27 </td>
   <td style="text-align:left;"> 0.125% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 497 </td>
   <td style="text-align:left;"> ALSTOM0%11JAN29 </td>
   <td style="text-align:left;"> ALSTOM </td>
   <td style="text-align:left;"> NO0012757709 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> 2029-01-11 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> 99.22 </td>
   <td style="text-align:left;"> 0.30% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 498 </td>
   <td style="text-align:left;"> ALSTOM0.25%14OCT26 </td>
   <td style="text-align:left;"> ALSTOM </td>
   <td style="text-align:left;"> NO0012757709 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> 2026-10-14 </td>
   <td style="text-align:left;"> 0.25% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 499 </td>
   <td style="text-align:left;"> ALSTOM0.5%27JUL30 </td>
   <td style="text-align:left;"> ALSTOM </td>
   <td style="text-align:left;"> NO0012757709 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> 2030-07-27 </td>
   <td style="text-align:left;"> 0.5% </td>
   <td style="text-align:left;"> 76.70 </td>
   <td style="text-align:left;"> -22.72% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 500 </td>
   <td style="text-align:left;"> ALTARE1.75%16JAN30 </td>
   <td style="text-align:left;"> ALTAREA </td>
   <td style="text-align:left;"> NO0012757709 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> 2030-01-16 </td>
   <td style="text-align:left;"> 1.75% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
</tbody>
</table>


```r
dt_b1 <- EN_Bonds_List_bis() #By default returns the list of 100 Bonds in alphabetic order 
head(dt_b1[, c(2:9)])

tail(dt_b1[, c(2:9)])
```


<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Issuer </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Maturity </th>
   <th style="text-align:left;"> Coupon </th>
   <th style="text-align:left;"> Last_price </th>
   <th style="text-align:left;"> Percentage change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 2019 PB RMBS TV EU </td>
   <td style="text-align:left;"> 2019 POPOLARE BARI RMBS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XMOT </td>
   <td style="text-align:left;"> 2069-05-31 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2019 PB RMBS TV EU </td>
   <td style="text-align:left;"> 2019 POPOLARE BARI RMBS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XMOT </td>
   <td style="text-align:left;"> 2069-05-31 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2019 PB RMBS TV EU </td>
   <td style="text-align:left;"> 2019 POPOLARE BARI RMBS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XMOT </td>
   <td style="text-align:left;"> 2069-05-31 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2I RETE GAS TF 2,1 </td>
   <td style="text-align:left;"> 2I RETE GAS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XMOT </td>
   <td style="text-align:left;"> 2025-09-11 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2IRG 1.608% CALL 3 </td>
   <td style="text-align:left;"> 2I RETE GAS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> 2027-10-31 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> 93.65 </td>
   <td style="text-align:left;"> -0.62% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2IRG 1.75% CALL 28 </td>
   <td style="text-align:left;"> 2I RETE GAS </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> 2026-08-28 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
</tbody>
</table>

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Issuer </th>
   <th style="text-align:left;"> Code_ISIN </th>
   <th style="text-align:left;"> Market </th>
   <th style="text-align:left;"> Maturity </th>
   <th style="text-align:left;"> Coupon </th>
   <th style="text-align:left;"> Last_price </th>
   <th style="text-align:left;"> Percentage change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 95 </td>
   <td style="text-align:left;"> AAB1.95%7DEC2048 </td>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> 2048-12-07 </td>
   <td style="text-align:left;"> 1.95% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 96 </td>
   <td style="text-align:left;"> AAB2.29%29JUL30 </td>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> 2030-07-29 </td>
   <td style="text-align:left;"> 2.29% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 97 </td>
   <td style="text-align:left;"> AAB2.375%1JUN2027 </td>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> 2027-06-01 </td>
   <td style="text-align:left;"> 2.375% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 98 </td>
   <td style="text-align:left;"> AAB2.47%13DEC29 </td>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> 2029-12-13 </td>
   <td style="text-align:left;"> 2.47% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 99 </td>
   <td style="text-align:left;"> AAB2.47%13DEC29RS </td>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> 2029-12-13 </td>
   <td style="text-align:left;"> 2.47% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 100 </td>
   <td style="text-align:left;"> AAB3%1JUN2032 </td>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> IT0005386724 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> 2032-06-01 </td>
   <td style="text-align:left;"> 3.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
</tbody>
</table>

## **EN_GetISIN()** function
The function takes a single parameter, 'ticker,' which can be the symbol, name, or ISIN of a given stock or index, and then returns its DNA.

### *Example 6.a : Get DNA (ISIN-Market identifier)* of a given Stock or Index listed on Euronext by providing the Symbol or Name, or ISIN of a Stock or an Index.
 

To efficiently use the 'Euronext' package, it is important to understand how to handle Ticker Names, ISIN, and DNA, as many functions in the package rely on these. 
Note: There is a small difference between ISIN and DNA. 
Here's a simple example: the ticker "4DDD" has the ISIN "US88554D2053," and its DNA is "US88554D2053-ETLX." As you can see, the DNA is composed of the ISIN and the market identifier "ETLX," preceded by "-".

Please refer to the respective functions **EN_Stocks_List()**, **EN_Indices_List()**, **EN_Etfs_List()** or **EN_Etfs_List_bis()**, **EN_Funds_List()**, and **EN_Bonds_List()** or **EN_Bonds_List_bis()** if you wish to obtain a list of available Stocks, Indices, ETFs, Funds, and Bonds on Euronext.


```r
# Get DNA of ticker "4DDD"
EN_GetISIN("4DDD")
#> [1] "US88554D2053-ETLX"

# Get DNA for the ticker name "ADS MARITIME HOLD"
EN_GetISIN("ADS MARITIME HOLD")
#> [1] "CY0108052115-MERK"

# Get DNA for ATENOR company by providing its ISIN
EN_GetISIN("BE0003837540")
#> [1] "BE0003837540-XBRU"
```

## **EN_GetISIN_F()** function

### *Example 6.b : Get DNA (ISIN-Market identifier)* of a given fund listed on Euronext by providing its symbol, name, or ISIN.



```r
# Get Fund 'ACOMEA GLOBALE' DNA
aco_dna <- EN_GetISIN_F("ACOMEA GLOBALE")

# In case you want the ISI only
sub("-.*", "", aco_dna) #To get only the ISIN
#> [1] "IT0005091100"

# Get Fund 'ASNU SMALL MIDCAPF' DNA
asnu_dna <- EN_GetISIN_F("ASN5")
print(asnu_dna)
#> [1] "NL0014270217-XAMS"

# Get Fund 'COMPAM ACTIVE GLOB' DNA
EN_GetISIN_F("LU1275425897")
#> [1] "LU1275425897-ATFX"
```


## **EN_GetISIN_Etf()** function

### *Example 6.c : Get DNA (ISIN-Market identifier)* of a given ETF listed on Euronext by providing its Symbol or Name, or ISIN of a Stock or an Index.


```r
# Get ETF 'AAPL' DNA
EN_GetISIN_Etf("AAPL")
#> [1] "XS2337099563-XAMS"

# Get ETF '-1X SHORT DIS' DNA
EN_GetISIN_Etf("-1X SHORT DIS")
#> [1] "XS2337085422-XAMS"

# Get ETF '3x Long Coinbase' DNA
EN_GetISIN_Etf("XS2399367254")
#> [1] "XS2399367254-XAMS"
```

## **EN_GetISIN_B()** function

### *Example 6.d : Get DNA (ISIN-Market identifier)* of a given Bond listed on Euronext by providing its Symbol or Name, or ISIN of a Stock or an Index.


```r
#To get only the DNA of all same bonds issued
the_dna1 <- EN_GetISIN_B("ABN AMRO BANK N.V.")
print(the_dna1)
#> [1] "XS1344751968-XAMS"

the_isin1 <- sub("-.*", "", the_dna1) #To get only the ISINs
print(the_isin1)
#> [1] "XS1344751968"

#To get only the DNA of Bond 'A2A GREEN BOND TF'
the_dna2 = EN_GetISIN_B("A2A GREEN BOND TF")
the_isin2 =sub("-.*", "", the_dna2) #To get only the ISIN
print(the_isin2)
#> [1] "XS2403533263"
```

## **EN_Ticker_Perfomance()** function

This function retrieves the historical performance data of a company listed on the Euronext exchange based on its ticker symbol. It returns a table with details such as the highest and lowest stock prices, date of the highest and lowest prices, and other relevant information.
It receives three (3) parameters such us :
* 'ticker' : A character string representing the company's ticker symbol,
* 'stock_type' : The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
* 'escape' : Boolean, either T or F. If escape is True, it means you're providing the DNA (ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN and the type of market to which it belongs. By default, escape = 'FALSE'

### *Example 7* : *Retrieve historical performance*


```r
# Get Performance of Ticker ABCA
dt = EN_Ticker_Perfomance("ABCA")
print(dt)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:left;"> D-1 </th>
   <th style="text-align:left;"> 1W </th>
   <th style="text-align:left;"> 1M </th>
   <th style="text-align:left;"> 3M </th>
   <th style="text-align:left;"> 6M </th>
   <th style="text-align:left;"> YTD </th>
   <th style="text-align:left;"> 52W </th>
   <th style="text-align:left;"> 2Y </th>
   <th style="text-align:left;"> 3Y </th>
   <th style="text-align:left;"> 5Y </th>
   <th style="text-align:left;"> MAX </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Highest </td>
   <td style="text-align:left;"> 4.37 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 4.87 </td>
   <td style="text-align:left;"> 5.12 </td>
   <td style="text-align:left;"> 6.12 </td>
   <td style="text-align:left;"> 4.87 </td>
   <td style="text-align:left;"> 6.64 </td>
   <td style="text-align:left;"> 7.78 </td>
   <td style="text-align:left;"> 8.15 </td>
   <td style="text-align:left;"> 8.15 </td>
   <td style="text-align:left;"> 14.85 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the highest </td>
   <td style="text-align:left;"> 08/02/2024 - 11:39 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/01/2024 </td>
   <td style="text-align:left;"> 29/11/2023 </td>
   <td style="text-align:left;"> 01/09/2023 </td>
   <td style="text-align:left;"> 09/01/2024 </td>
   <td style="text-align:left;"> 09/02/2023 </td>
   <td style="text-align:left;"> 19/04/2022 </td>
   <td style="text-align:left;"> 22/03/2021 </td>
   <td style="text-align:left;"> 22/03/2021 </td>
   <td style="text-align:left;"> 25/02/2000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lowest </td>
   <td style="text-align:left;"> 4.30 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 1.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the lowest </td>
   <td style="text-align:left;"> 08/02/2024 - 13:42 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 11/10/2002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> % </td>
   <td style="text-align:left;"> 0.12 </td>
   <td style="text-align:left;"> 1.86 </td>
   <td style="text-align:left;"> -9.86 </td>
   <td style="text-align:left;"> -6.60 </td>
   <td style="text-align:left;"> -25.72 </td>
   <td style="text-align:left;"> -8.64 </td>
   <td style="text-align:left;"> -33.89 </td>
   <td style="text-align:left;"> -38.34 </td>
   <td style="text-align:left;"> -39.95 </td>
   <td style="text-align:left;"> -28.73 </td>
   <td style="text-align:left;"> -54.74 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> 0.005 </td>
   <td style="text-align:left;"> 0.08 </td>
   <td style="text-align:left;"> -0.48 </td>
   <td style="text-align:left;"> -0.31 </td>
   <td style="text-align:left;"> -1.52 </td>
   <td style="text-align:left;"> -0.415 </td>
   <td style="text-align:left;"> -2.25 </td>
   <td style="text-align:left;"> -2.73 </td>
   <td style="text-align:left;"> -2.92 </td>
   <td style="text-align:left;"> -1.77 </td>
   <td style="text-align:left;"> -5.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 351455.57 </td>
   <td style="text-align:left;"> 2296466.55 </td>
   <td style="text-align:left;"> 5363968.36 </td>
   <td style="text-align:left;"> 11.918M </td>
   <td style="text-align:left;"> 21.231M </td>
   <td style="text-align:left;"> 6555960.33 </td>
   <td style="text-align:left;"> 45.922M </td>
   <td style="text-align:left;"> 104.325M </td>
   <td style="text-align:left;"> 180.230M </td>
   <td style="text-align:left;"> 311.071M </td>
   <td style="text-align:left;"> 1.368B </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 81201 </td>
   <td style="text-align:left;"> 546905 </td>
   <td style="text-align:left;"> 1220692 </td>
   <td style="text-align:left;"> 2564157 </td>
   <td style="text-align:left;"> 4256949 </td>
   <td style="text-align:left;"> 1473361 </td>
   <td style="text-align:left;"> 8307477 </td>
   <td style="text-align:left;"> 16.700M </td>
   <td style="text-align:left;"> 27.194M </td>
   <td style="text-align:left;"> 46.948M </td>
   <td style="text-align:left;"> 82.247B </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Vol </td>
   <td style="text-align:left;"> 81201 </td>
   <td style="text-align:left;"> 91151 </td>
   <td style="text-align:left;"> 50862 </td>
   <td style="text-align:left;"> 39449 </td>
   <td style="text-align:left;"> 32496 </td>
   <td style="text-align:left;"> 50806 </td>
   <td style="text-align:left;"> 32325 </td>
   <td style="text-align:left;"> 32428 </td>
   <td style="text-align:left;"> 35134 </td>
   <td style="text-align:left;"> 36564 </td>
   <td style="text-align:left;"> 12.694M </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Price </td>
   <td style="text-align:left;"> 4.33 </td>
   <td style="text-align:left;"> 4.20 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 4.65 </td>
   <td style="text-align:left;"> 4.99 </td>
   <td style="text-align:left;"> 4.45 </td>
   <td style="text-align:left;"> 5.53 </td>
   <td style="text-align:left;"> 6.25 </td>
   <td style="text-align:left;"> 6.63 </td>
   <td style="text-align:left;"> 6.63 </td>
   <td style="text-align:left;"> 0.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nb days </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 24 </td>
   <td style="text-align:left;"> 65 </td>
   <td style="text-align:left;"> 131 </td>
   <td style="text-align:left;"> 29 </td>
   <td style="text-align:left;"> 257 </td>
   <td style="text-align:left;"> 515 </td>
   <td style="text-align:left;"> 774 </td>
   <td style="text-align:left;"> 1284 </td>
   <td style="text-align:left;"> 6479 </td>
  </tr>
</tbody>
</table>



```r
# Get Performance of ETF AAPL
dt_ = EN_Ticker_Perfomance("AAPL", stock_type = "E")
print(dt_)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:left;"> D-1 </th>
   <th style="text-align:left;"> 1W </th>
   <th style="text-align:left;"> 1M </th>
   <th style="text-align:left;"> 3M </th>
   <th style="text-align:left;"> 6M </th>
   <th style="text-align:left;"> YTD </th>
   <th style="text-align:left;"> 52W </th>
   <th style="text-align:left;"> 2Y </th>
   <th style="text-align:left;"> 3Y </th>
   <th style="text-align:left;"> 5Y </th>
   <th style="text-align:left;"> MAX </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Highest </td>
   <td style="text-align:left;"> 6.979 </td>
   <td style="text-align:left;"> 7.241 </td>
   <td style="text-align:left;"> 7.241 </td>
   <td style="text-align:left;"> 7.271 </td>
   <td style="text-align:left;"> 7.271 </td>
   <td style="text-align:left;"> 7.241 </td>
   <td style="text-align:left;"> 7.271 </td>
   <td style="text-align:left;"> 7.271 </td>
   <td style="text-align:left;"> 7.271 </td>
   <td style="text-align:left;"> 7.271 </td>
   <td style="text-align:left;"> 7.271 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the highest </td>
   <td style="text-align:left;"> 08/02/2024 - 10:21 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 15/12/2023 </td>
   <td style="text-align:left;"> 15/12/2023 </td>
   <td style="text-align:left;"> 06/02/2024 </td>
   <td style="text-align:left;"> 15/12/2023 </td>
   <td style="text-align:left;"> 15/12/2023 </td>
   <td style="text-align:left;"> 15/12/2023 </td>
   <td style="text-align:left;"> 15/12/2023 </td>
   <td style="text-align:left;"> 15/12/2023 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lowest </td>
   <td style="text-align:left;"> 6.924 </td>
   <td style="text-align:left;"> 6.642 </td>
   <td style="text-align:left;"> 6.625 </td>
   <td style="text-align:left;"> 6.532 </td>
   <td style="text-align:left;"> 6.281 </td>
   <td style="text-align:left;"> 6.532 </td>
   <td style="text-align:left;"> 5.35 </td>
   <td style="text-align:left;"> 4.700 </td>
   <td style="text-align:left;"> 4.030 </td>
   <td style="text-align:left;"> 4.030 </td>
   <td style="text-align:left;"> 4.030 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the lowest </td>
   <td style="text-align:left;"> 08/02/2024 - 16:33 </td>
   <td style="text-align:left;"> 02/02/2024 </td>
   <td style="text-align:left;"> 17/01/2024 </td>
   <td style="text-align:left;"> 08/01/2024 </td>
   <td style="text-align:left;"> 27/10/2023 </td>
   <td style="text-align:left;"> 08/01/2024 </td>
   <td style="text-align:left;"> 02/03/2023 </td>
   <td style="text-align:left;"> 06/01/2023 </td>
   <td style="text-align:left;"> 07/06/2021 </td>
   <td style="text-align:left;"> 07/06/2021 </td>
   <td style="text-align:left;"> 07/06/2021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> % </td>
   <td style="text-align:left;"> -0.49 </td>
   <td style="text-align:left;"> 2.17 </td>
   <td style="text-align:left;"> 4.51 </td>
   <td style="text-align:left;"> 2.66 </td>
   <td style="text-align:left;"> 7.97 </td>
   <td style="text-align:left;"> -0.09 </td>
   <td style="text-align:left;"> 21.99 </td>
   <td style="text-align:left;"> 15.25 </td>
   <td style="text-align:left;"> 69.29 </td>
   <td style="text-align:left;"> 69.29 </td>
   <td style="text-align:left;"> 69.29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> -0.034 </td>
   <td style="text-align:left;"> 0.147 </td>
   <td style="text-align:left;"> 0.299 </td>
   <td style="text-align:left;"> 0.179 </td>
   <td style="text-align:left;"> 0.511 </td>
   <td style="text-align:left;"> -0.006 </td>
   <td style="text-align:left;"> 1.247 </td>
   <td style="text-align:left;"> 0.915 </td>
   <td style="text-align:left;"> 2.832 </td>
   <td style="text-align:left;"> 2.832 </td>
   <td style="text-align:left;"> 2.832 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 9985.86 </td>
   <td style="text-align:left;"> 15794.46 </td>
   <td style="text-align:left;"> 19496.90 </td>
   <td style="text-align:left;"> 23239.84 </td>
   <td style="text-align:left;"> 49665.30 </td>
   <td style="text-align:left;"> 19602.17 </td>
   <td style="text-align:left;"> 140167.49 </td>
   <td style="text-align:left;"> 364029.23 </td>
   <td style="text-align:left;"> 438875.72 </td>
   <td style="text-align:left;"> 438875.72 </td>
   <td style="text-align:left;"> 438875.72 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 1432 </td>
   <td style="text-align:left;"> 2273 </td>
   <td style="text-align:left;"> 2816 </td>
   <td style="text-align:left;"> 3359 </td>
   <td style="text-align:left;"> 7345 </td>
   <td style="text-align:left;"> 2832 </td>
   <td style="text-align:left;"> 23074 </td>
   <td style="text-align:left;"> 65146 </td>
   <td style="text-align:left;"> 79423 </td>
   <td style="text-align:left;"> 79423 </td>
   <td style="text-align:left;"> 79423 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Vol </td>
   <td style="text-align:left;"> 1432 </td>
   <td style="text-align:left;"> 379 </td>
   <td style="text-align:left;"> 117 </td>
   <td style="text-align:left;"> 52 </td>
   <td style="text-align:left;"> 57 </td>
   <td style="text-align:left;"> 98 </td>
   <td style="text-align:left;"> 90 </td>
   <td style="text-align:left;"> 127 </td>
   <td style="text-align:left;"> 103 </td>
   <td style="text-align:left;"> 62 </td>
   <td style="text-align:left;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Price </td>
   <td style="text-align:left;"> 6.97 </td>
   <td style="text-align:left;"> 6.95 </td>
   <td style="text-align:left;"> 6.92 </td>
   <td style="text-align:left;"> 6.92 </td>
   <td style="text-align:left;"> 6.76 </td>
   <td style="text-align:left;"> 6.92 </td>
   <td style="text-align:left;"> 6.07 </td>
   <td style="text-align:left;"> 5.59 </td>
   <td style="text-align:left;"> 5.53 </td>
   <td style="text-align:left;"> 5.53 </td>
   <td style="text-align:left;"> 5.53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nb days </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 24 </td>
   <td style="text-align:left;"> 64 </td>
   <td style="text-align:left;"> 130 </td>
   <td style="text-align:left;"> 29 </td>
   <td style="text-align:left;"> 256 </td>
   <td style="text-align:left;"> 514 </td>
   <td style="text-align:left;"> 773 </td>
   <td style="text-align:left;"> 1283 </td>
   <td style="text-align:left;"> 6478 </td>
  </tr>
</tbody>
</table>



```r
# Get Performance of Bond issued by A2A S.p.A.
dt1 = EN_Ticker_Perfomance("XS1195347478-ETLX", escape = TRUE)
print(dt1)
```


<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:left;"> D-1 </th>
   <th style="text-align:left;"> 1W </th>
   <th style="text-align:left;"> 1M </th>
   <th style="text-align:left;"> 3M </th>
   <th style="text-align:left;"> 6M </th>
   <th style="text-align:left;"> YTD </th>
   <th style="text-align:left;"> 52W </th>
   <th style="text-align:left;"> 2Y </th>
   <th style="text-align:left;"> 3Y </th>
   <th style="text-align:left;"> 5Y </th>
   <th style="text-align:left;"> MAX </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Highest </td>
   <td style="text-align:left;"> 98.20 </td>
   <td style="text-align:left;"> 99.25 </td>
   <td style="text-align:left;"> 99.25 </td>
   <td style="text-align:left;"> 99.25 </td>
   <td style="text-align:left;"> 99.25 </td>
   <td style="text-align:left;"> 99.25 </td>
   <td style="text-align:left;"> 99.25 </td>
   <td style="text-align:left;"> 99.28 </td>
   <td style="text-align:left;"> 102.85 </td>
   <td style="text-align:left;"> 107.14 </td>
   <td style="text-align:left;"> 108.98 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the highest </td>
   <td style="text-align:left;"> 02/01/2024 - 09:32 </td>
   <td style="text-align:left;"> 11/01/2024 </td>
   <td style="text-align:left;"> 11/01/2024 </td>
   <td style="text-align:left;"> 11/01/2024 </td>
   <td style="text-align:left;"> 11/01/2024 </td>
   <td style="text-align:left;"> 11/01/2024 </td>
   <td style="text-align:left;"> 11/01/2024 </td>
   <td style="text-align:left;"> 09/08/2022 </td>
   <td style="text-align:left;"> 03/02/2022 </td>
   <td style="text-align:left;"> 11/09/2019 </td>
   <td style="text-align:left;"> 14/07/2016 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lowest </td>
   <td style="text-align:left;"> 98.20 </td>
   <td style="text-align:left;"> 98.45 </td>
   <td style="text-align:left;"> 98.45 </td>
   <td style="text-align:left;"> 97.21 </td>
   <td style="text-align:left;"> 97.02 </td>
   <td style="text-align:left;"> 98.20 </td>
   <td style="text-align:left;"> 96.30 </td>
   <td style="text-align:left;"> 95.38 </td>
   <td style="text-align:left;"> 95.38 </td>
   <td style="text-align:left;"> 95.38 </td>
   <td style="text-align:left;"> 94.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the lowest </td>
   <td style="text-align:left;"> 02/01/2024 - 09:32 </td>
   <td style="text-align:left;"> 11/01/2024 </td>
   <td style="text-align:left;"> 11/01/2024 </td>
   <td style="text-align:left;"> 22/11/2023 </td>
   <td style="text-align:left;"> 06/11/2023 </td>
   <td style="text-align:left;"> 02/01/2024 </td>
   <td style="text-align:left;"> 24/02/2023 </td>
   <td style="text-align:left;"> 20/10/2022 </td>
   <td style="text-align:left;"> 20/10/2022 </td>
   <td style="text-align:left;"> 20/10/2022 </td>
   <td style="text-align:left;"> 24/06/2015 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> % </td>
   <td style="text-align:left;"> -0.06 </td>
   <td style="text-align:left;"> -0.03 </td>
   <td style="text-align:left;"> 0.29 </td>
   <td style="text-align:left;"> 1.02 </td>
   <td style="text-align:left;"> 1.58 </td>
   <td style="text-align:left;"> 0.09 </td>
   <td style="text-align:left;"> 1.01 </td>
   <td style="text-align:left;"> -4.28 </td>
   <td style="text-align:left;"> -8.01 </td>
   <td style="text-align:left;"> -4.46 </td>
   <td style="text-align:left;"> -2.96 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> -0.06 </td>
   <td style="text-align:left;"> -0.03 </td>
   <td style="text-align:left;"> 0.28 </td>
   <td style="text-align:left;"> 0.99 </td>
   <td style="text-align:left;"> 1.53 </td>
   <td style="text-align:left;"> 0.09 </td>
   <td style="text-align:left;"> 0.98 </td>
   <td style="text-align:left;"> -4.40 </td>
   <td style="text-align:left;"> -8.56 </td>
   <td style="text-align:left;"> -4.59 </td>
   <td style="text-align:left;"> -3.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 98200.00 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 296600.00 </td>
   <td style="text-align:left;"> 590560.00 </td>
   <td style="text-align:left;"> 883180.00 </td>
   <td style="text-align:left;"> 394800.00 </td>
   <td style="text-align:left;"> 3128140.00 </td>
   <td style="text-align:left;"> 6824010.00 </td>
   <td style="text-align:left;"> 7029220.00 </td>
   <td style="text-align:left;"> 8402410.00 </td>
   <td style="text-align:left;"> 18.669M </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 100000 </td>
   <td style="text-align:left;"> 300000 </td>
   <td style="text-align:left;"> 600000 </td>
   <td style="text-align:left;"> 900000 </td>
   <td style="text-align:left;"> 1200000 </td>
   <td style="text-align:left;"> 700000 </td>
   <td style="text-align:left;"> 3500000 </td>
   <td style="text-align:left;"> 7300000 </td>
   <td style="text-align:left;"> 7500000 </td>
   <td style="text-align:left;"> 8800000 </td>
   <td style="text-align:left;"> 19.000M </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Vol </td>
   <td style="text-align:left;"> 100000 </td>
   <td style="text-align:left;"> 50000 </td>
   <td style="text-align:left;"> 25000 </td>
   <td style="text-align:left;"> 13636 </td>
   <td style="text-align:left;"> 9091 </td>
   <td style="text-align:left;"> 24138 </td>
   <td style="text-align:left;"> 13410 </td>
   <td style="text-align:left;"> 13985 </td>
   <td style="text-align:left;"> 9579 </td>
   <td style="text-align:left;"> 6748 </td>
   <td style="text-align:left;"> 2902 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Price </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> 0.01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nb days </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 24 </td>
   <td style="text-align:left;"> 66 </td>
   <td style="text-align:left;"> 132 </td>
   <td style="text-align:left;"> 29 </td>
   <td style="text-align:left;"> 261 </td>
   <td style="text-align:left;"> 522 </td>
   <td style="text-align:left;"> 783 </td>
   <td style="text-align:left;"> 1304 </td>
   <td style="text-align:left;"> 6548 </td>
  </tr>
</tbody>
</table>


```r
# Get Performance of ACOMEA EMERGING Q2 Fund
dt2 = EN_Ticker_Perfomance("IT0005091126", 'F', escape = FALSE)
print(dt2)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:left;"> D-1 </th>
   <th style="text-align:left;"> 1W </th>
   <th style="text-align:left;"> 1M </th>
   <th style="text-align:left;"> 3M </th>
   <th style="text-align:left;"> 6M </th>
   <th style="text-align:left;"> YTD </th>
   <th style="text-align:left;"> 52W </th>
   <th style="text-align:left;"> 2Y </th>
   <th style="text-align:left;"> 3Y </th>
   <th style="text-align:left;"> 5Y </th>
   <th style="text-align:left;"> MAX </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Highest </td>
   <td style="text-align:left;"> 10.679 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 10.679 </td>
   <td style="text-align:left;"> 10.847 </td>
   <td style="text-align:left;"> 12.185 </td>
   <td style="text-align:left;"> 12.185 </td>
   <td style="text-align:left;"> 12.185 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the highest </td>
   <td style="text-align:left;"> 06/07/2023 - 15:01 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 06/07/2023 </td>
   <td style="text-align:left;"> 01/06/2022 </td>
   <td style="text-align:left;"> 12/11/2021 </td>
   <td style="text-align:left;"> 12/11/2021 </td>
   <td style="text-align:left;"> 12/11/2021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lowest </td>
   <td style="text-align:left;"> 10.679 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 1.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the lowest </td>
   <td style="text-align:left;"> 06/07/2023 - 15:01 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> % </td>
   <td style="text-align:left;"> 6.59 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> -5.91 </td>
   <td style="text-align:left;"> -15.26 </td>
   <td style="text-align:left;"> -3.84 </td>
   <td style="text-align:left;"> 27.89 </td>
   <td style="text-align:left;"> 28.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> 0.66 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> -0.629 </td>
   <td style="text-align:left;"> -1.804 </td>
   <td style="text-align:left;"> -0.40 </td>
   <td style="text-align:left;"> 2.185 </td>
   <td style="text-align:left;"> 2.196 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 5125.92 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 447.98 </td>
   <td style="text-align:left;"> 447.98 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 7428.04 </td>
   <td style="text-align:left;"> 291434.81 </td>
   <td style="text-align:left;"> 329300.08 </td>
   <td style="text-align:left;"> 781997.34 </td>
   <td style="text-align:left;"> 1027788.16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 480 </td>
   <td style="text-align:left;"> 45 </td>
   <td style="text-align:left;"> 45 </td>
   <td style="text-align:left;"> 90 </td>
   <td style="text-align:left;"> 90 </td>
   <td style="text-align:left;"> 45 </td>
   <td style="text-align:left;"> 750 </td>
   <td style="text-align:left;"> 26941 </td>
   <td style="text-align:left;"> 30249 </td>
   <td style="text-align:left;"> 86122 </td>
   <td style="text-align:left;"> 118276 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Vol </td>
   <td style="text-align:left;"> 480 </td>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 53 </td>
   <td style="text-align:left;"> 39 </td>
   <td style="text-align:left;"> 68 </td>
   <td style="text-align:left;"> 18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Price </td>
   <td style="text-align:left;"> 10.68 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 4.98 </td>
   <td style="text-align:left;"> 4.98 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 9.90 </td>
   <td style="text-align:left;"> 10.82 </td>
   <td style="text-align:left;"> 10.89 </td>
   <td style="text-align:left;"> 9.08 </td>
   <td style="text-align:left;"> 8.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nb days </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 24 </td>
   <td style="text-align:left;"> 64 </td>
   <td style="text-align:left;"> 129 </td>
   <td style="text-align:left;"> 29 </td>
   <td style="text-align:left;"> 255 </td>
   <td style="text-align:left;"> 512 </td>
   <td style="text-align:left;"> 769 </td>
   <td style="text-align:left;"> 1275 </td>
   <td style="text-align:left;"> 6491 </td>
  </tr>
</tbody>
</table>



```r
# Get Performance of AEX All-Share Index
dt3 = EN_Ticker_Perfomance("AEX All-Share Index GR", escape = FALSE)
print(dt3)

```


<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:left;"> D-1 </th>
   <th style="text-align:left;"> 1W </th>
   <th style="text-align:left;"> 1M </th>
   <th style="text-align:left;"> 3M </th>
   <th style="text-align:left;"> 6M </th>
   <th style="text-align:left;"> YTD </th>
   <th style="text-align:left;"> 52W </th>
   <th style="text-align:left;"> 2Y </th>
   <th style="text-align:left;"> 3Y </th>
   <th style="text-align:left;"> 5Y </th>
   <th style="text-align:left;"> MAX </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Highest </td>
   <td style="text-align:left;"> 4,503.19 </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> 4,533.16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the highest </td>
   <td style="text-align:left;"> 08/02/2024 - 15:37 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
   <td style="text-align:left;"> 09/02/2024 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lowest </td>
   <td style="text-align:left;"> 4,439.38 </td>
   <td style="text-align:left;"> 4,376.39 </td>
   <td style="text-align:left;"> 4,053.49 </td>
   <td style="text-align:left;"> 3,848.59 </td>
   <td style="text-align:left;"> 3,719.88 </td>
   <td style="text-align:left;"> 4,053.49 </td>
   <td style="text-align:left;"> 3,696.85 </td>
   <td style="text-align:left;"> 3,164.52 </td>
   <td style="text-align:left;"> 3,164.52 </td>
   <td style="text-align:left;"> 2,001.91 </td>
   <td style="text-align:left;"> 1,271.98 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the lowest </td>
   <td style="text-align:left;"> 08/02/2024 - 09:00 </td>
   <td style="text-align:left;"> 02/02/2024 </td>
   <td style="text-align:left;"> 17/01/2024 </td>
   <td style="text-align:left;"> 09/11/2023 </td>
   <td style="text-align:left;"> 23/10/2023 </td>
   <td style="text-align:left;"> 17/01/2024 </td>
   <td style="text-align:left;"> 20/03/2023 </td>
   <td style="text-align:left;"> 13/10/2022 </td>
   <td style="text-align:left;"> 13/10/2022 </td>
   <td style="text-align:left;"> 16/03/2020 </td>
   <td style="text-align:left;"> 04/06/2012 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> % </td>
   <td style="text-align:left;"> 1.30 </td>
   <td style="text-align:left;"> 3.57 </td>
   <td style="text-align:left;"> 9.89 </td>
   <td style="text-align:left;"> 17.12 </td>
   <td style="text-align:left;"> 13.40 </td>
   <td style="text-align:left;"> 8.42 </td>
   <td style="text-align:left;"> 15.42 </td>
   <td style="text-align:left;"> 18.11 </td>
   <td style="text-align:left;"> 30.15 </td>
   <td style="text-align:left;"> 69.30 </td>
   <td style="text-align:left;"> 248.66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> 57.81 </td>
   <td style="text-align:left;"> 156.17 </td>
   <td style="text-align:left;"> 408.07 </td>
   <td style="text-align:left;"> 662.51 </td>
   <td style="text-align:left;"> 535.70 </td>
   <td style="text-align:left;"> 351.97 </td>
   <td style="text-align:left;"> 605.70 </td>
   <td style="text-align:left;"> 694.92 </td>
   <td style="text-align:left;"> 1,050.05 </td>
   <td style="text-align:left;"> 1,855.39 </td>
   <td style="text-align:left;"> 3,232.66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Vol </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nb days </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 24 </td>
   <td style="text-align:left;"> 64 </td>
   <td style="text-align:left;"> 130 </td>
   <td style="text-align:left;"> 29 </td>
   <td style="text-align:left;"> 256 </td>
   <td style="text-align:left;"> 514 </td>
   <td style="text-align:left;"> 773 </td>
   <td style="text-align:left;"> 1283 </td>
   <td style="text-align:left;"> 6478 </td>
  </tr>
</tbody>
</table>


## **EN_Overview_plot()** function
 As its name suggests, this function retrieves data from the ticker(s) and displays it in graphical form. It offers a convenient method to obtain a quick overview of price trends, facilitating further analysis. 

This function accepts up to seven arguments: 

* ticker: is the name of the ticker(s)
* from: A quotation start date, i.e. "2020-01-01" or "2020/01/01". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".
* until : A quoted end date, i.e. "2022-01-31" or "2022/01/31". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".
* 'stock_type': Ticker type: 'Eq_Ind' for stocks and indices, 'Fund' or "F" for fund tickers, 'Bond' or "B" for bond tickers, and 'Etfs' or "E" for EFTs.
* escape': Boolean, either T or F. If escape is True, this means you're supplying the ISIN-Market identifier (ADN) directly. Giving T to escape is useful to avoid tedious operations; otherwise, F means you must provide the Ticker symbol, the name or ISIN and the type of market to which it belongs. By default, escape = 'FALSE'.
* up.col : is the color of the rise
* down.col : is the color of the fall


```r
# The default colors for the up and down are 'darkgreen' and 'red', respectively.
chart <- EN_Overview_plot("4ddd")  

# chart
```

<div align="center"> 

<img src="man/figures/4DDD_plot.gif" width="100%" height="480" align="center"/>

</div> 



```r
ov_plot  <- EN_Overview_plot(c("NL0010614533", "QS0011211206", "QS0011095914", "QS0011146899"), up.col = "blue")

# ov_plot

```

<div align="center"> 

<img src="man/figures/Rplot.png" width="100%" height="480" align="center"/>

</div>

## **EN_plot()** function
This  **EN_plot()** function is distinct from the **EN_Overview_plot()** function, although they share similar parameters (*ticker*, *from*, *to*, *stock_type*, *escape*, *up.col*, *down.col*)
Note: Important to note that when using *EN_plot()*,only historical data from the past two years is available. This differs from **EN_Overview_plot()**, where data is available from the inception year of the company's listing.

### *Example 8* : Get historical performance


```r
#It is also possible to plot stock data chart for more than one ticker
#Let's plot '3D SYSTEMS CORP' chart

chart1 <- EN_plot("AAX")

# chart1

# You can change up and down colors
# Etf AAPL
# EN_plot("aapl", stock_type = 'E', up.col = "blue", down.col = "pink")

```

<div align="center"> 

<img src="man/figures/AAX_plot.gif" width="100%" height="480" align="center"/>

</div> 


```r
# It is also possible to plot stock data chart for more than one ticker
# Let's plot some equities chart

chart2 <- EN_plot(c("AAX", "QS0011016480", "AEX2S", "ADIDAS", "ADOBE", "ALFEN BEHEER", "1GOOGL"))

# chart2

```
<div align="center"> 

<img src="man/figures/Tickers_plot.gif" width="100%" height="480" align="center"/>

</div> 


```r
# It is also possible to plot stock data chart for more than one ticker
# Let's plot three ETFs chart

chart3 <- EN_plot(c("IE0007G78AC4", "MANA", "3TSM"), stock_type = 'E')

# chart3

```



<div align="center"> 

<img src="man/figures/Etfs_plot.gif" width="100%" height="480" align="center"/>

</div> 

## **EN_Ticker_infos()** function
This function retrieves detailed information for a given stock ticker on the Euronext exchange.
It includes information such as currency, last traded price, valuation close, volume, turnover,
transactions, VWAP (Volume Weighted Average Price), open, high, low, threshold, previous close,
52-week range, and market capitalization.
The data is returned as a data frame.

*Inputs* :
- *ticker* A character string representing the company's ticker, name, or ISIN.
- *stock_type*   The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers,'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
- *escape* Boolean, either T or F. If escape is True, it means you're providing the DNA
(ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming
operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN
and the type of market to which it belongs.

### *Example 9.a* : Get Information for an Equity

```r
# Retrieve news for the equity "AALBERTS N.V." using its DNA
equity_infos <- EN_Ticker_infos("NL0000852564-XAMS", escape = TRUE)
print(equity_infos)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Information </th>
   <th style="text-align:left;"> Detail </th>
   <th style="text-align:left;"> Update date/Time </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Currency </td>
   <td style="text-align:left;"> EUR </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Last Traded </td>
   <td style="text-align:left;"> 36.00 </td>
   <td style="text-align:left;"> [09/02/2024 17:35] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Valuation Close </td>
   <td style="text-align:left;"> 36.00 </td>
   <td style="text-align:left;"> [09/02/2024] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 106,273 </td>
   <td style="text-align:left;"> [09/02/2024 17:35] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 3,829,762 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Transactions </td>
   <td style="text-align:left;"> 790 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VWAP </td>
   <td style="text-align:left;"> 36.0370 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Open </td>
   <td style="text-align:left;"> 36.14 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> High </td>
   <td style="text-align:left;"> 36.35 </td>
   <td style="text-align:left;"> [09:08] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Low </td>
   <td style="text-align:left;"> 35.86 </td>
   <td style="text-align:left;"> [16:31] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Threshold </td>
   <td style="text-align:left;"> 37.80      -      34.20 </td>
   <td style="text-align:left;"> [09/02/2024 17:35] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Previous Close </td>
   <td style="text-align:left;"> 36.07 </td>
   <td style="text-align:left;"> [08/02/2024] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 52 Week </td>
   <td style="text-align:left;"> 28.83      -      48.53 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Market Cap </td>
   <td style="text-align:left;"> 3.981B </td>
   <td style="text-align:left;">  </td>
  </tr>
</tbody>
</table>

### *Example 9.b* : Get Information for an Index

```r
# Retrieve news for the index "AEX All-Share Index GR" using its symbol
index_infos <- EN_Ticker_infos("QS0011224977-XAMS", escape = TRUE)
print(index_infos)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Information </th>
   <th style="text-align:left;"> Detail </th>
   <th style="text-align:left;"> Update date/Time </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Open </td>
   <td style="text-align:left;"> 4,497.27 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> High </td>
   <td style="text-align:left;"> 4,533.16 </td>
   <td style="text-align:left;"> [17:12] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Low </td>
   <td style="text-align:left;"> 4,497.27 </td>
   <td style="text-align:left;"> [09:00] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Previous Close </td>
   <td style="text-align:left;"> 4,497.27 </td>
   <td style="text-align:left;"> [08/02/2024] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 52 Week </td>
   <td style="text-align:left;"> 3,696.85      -      4,533.16 </td>
   <td style="text-align:left;">  </td>
  </tr>
</tbody>
</table>

### *Example 9.c* : Get Information for a Bond

```r
# Retrieve news for the bond "AAB0.45%12DEC2036" using its DNA
bond_infos <- EN_Ticker_infos("XS2093705064-XAMS", escape = TRUE)
print(bond_infos)

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Information </th>
   <th style="text-align:left;"> Detail </th>
   <th style="text-align:left;"> Update date/Time </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Currency </td>
   <td style="text-align:left;"> % </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Last Traded </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Valuation Close </td>
   <td style="text-align:left;"> 100.00 </td>
   <td style="text-align:left;"> [09/02/2024] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Open </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> High </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Low </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Threshold </td>
   <td style="text-align:left;"> 103.00      -      97.00 </td>
   <td style="text-align:left;"> [03/04/2023 03:01] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Previous Close </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 52 Week </td>
   <td style="text-align:left;"> -     - </td>
   <td style="text-align:left;">  </td>
  </tr>
</tbody>
</table>

## **EN_intraday_Data()** function
The *EN_intraday_Data()* function fetches intraday price data for a specified stock on Euronext. It allows you to retrieve either today's intraday prices or the previous day's intraday prices, with "Today" being the default option. The function returns a data frame containing the intraday stock information.

*Inputs* :
- *ticker*: A character string representing the stock ticker or name.
- *day_type* : A character string specifying the type of intraday price to fetch. Options are "Today" or "Previous" day. Default is "Today." You can also use 'T' for 'Today' or 'P' for 'Previous'.
- *stock_type* : The type of the ticker, which can be 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for ETFs.
escape: A Boolean value (either T or F). If escape is set to True, it indicates that the DNA (ISIN-Market identifier) is provided directly. Using True for escape can help avoid time-consuming operations. If escape is set to False, the function expects the Ticker symbol, name, or ISIN, along with the type of market to which it belongs.
- *nbitems*: An integer specifying the number of items to fetch. Default is 30 (also the maximum).

### *Example 10.a* : Get recent intraday prices  for an Equity

```r
# Get recent intraday prices of ABCA share for 10 items
intra_ = EN_intraday_Data("ABCA", day_type = 'T', nbitems = 10)
print(intra_)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Tradeid </th>
   <th style="text-align:left;"> Time </th>
   <th style="text-align:left;"> Price </th>
   <th style="text-align:left;"> Volume </th>
   <th style="text-align:left;"> Type </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1OK98HZJZ </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98HZJY </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 12 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98HZJX </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 53 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98HZJW </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 41 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98HZJV </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 111 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98HZJU </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 39 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98HZJT </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 317 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98HZJS </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 127 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98HZJR </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 110 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98HZJQ </td>
   <td style="text-align:left;"> 17:35:09 </td>
   <td style="text-align:left;"> 4.39 </td>
   <td style="text-align:left;"> 13 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
</tbody>
</table>

### *Example 10.b* : Get recent intraday prices of ACOMEA EMERGING Q2 Fund

```r
intra_1 = EN_intraday_Data("IT0005091126", 'F', escape = FALSE, day_type = 'T')
print(intra_1)
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Tradeid </th>
   <th style="text-align:left;"> Time </th>
   <th style="text-align:left;"> Price </th>
   <th style="text-align:left;"> Volume </th>
   <th style="text-align:left;"> Type </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 5FC6J23R </td>
   <td style="text-align:left;"> 15:00:48 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 45 </td>
   <td style="text-align:left;"> OffBook On Exchange </td>
  </tr>
</tbody>
</table>

### *Example 10.c* : Get Previous intraday prices of ETF AAPL by providing directly the ISIN-Market identifier

```r
intra_2 = EN_intraday_Data("XS2337099563-XAMS", escape = T, day_type = 'Previous')
print(intra_2)

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Tradeid </th>
   <th style="text-align:left;"> Time </th>
   <th style="text-align:left;"> Price </th>
   <th style="text-align:left;"> Volume </th>
   <th style="text-align:left;"> Type </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 321Y30WCE </td>
   <td style="text-align:left;"> 16:33:59 </td>
   <td style="text-align:left;"> 6.9238 </td>
   <td style="text-align:left;"> 100 </td>
   <td style="text-align:left;"> Exchange Continuous </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 321Y30TUR </td>
   <td style="text-align:left;"> 11:22:27 </td>
   <td style="text-align:left;"> 6.9755 </td>
   <td style="text-align:left;"> 222 </td>
   <td style="text-align:left;"> Exchange Continuous </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 321Y30TN0 </td>
   <td style="text-align:left;"> 10:50:37 </td>
   <td style="text-align:left;"> 6.9763 </td>
   <td style="text-align:left;"> 333 </td>
   <td style="text-align:left;"> Exchange Continuous </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 321Y30TJ6 </td>
   <td style="text-align:left;"> 10:33:49 </td>
   <td style="text-align:left;"> 6.9771 </td>
   <td style="text-align:left;"> 444 </td>
   <td style="text-align:left;"> Exchange Continuous </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 321Y30TGJ </td>
   <td style="text-align:left;"> 10:21:46 </td>
   <td style="text-align:left;"> 6.9789 </td>
   <td style="text-align:left;"> 333 </td>
   <td style="text-align:left;"> Exchange Continuous </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 09:04:27 </td>
   <td style="text-align:left;"> 6.9608 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Valuation Trade </td>
  </tr>
</tbody>
</table>

### *Example 10.d* : Get Previous intraday prices of AEX All-Share Index

```r
intra_3 = EN_intraday_Data("AEX All-Share Index GR", day_type = 'P')
print(intra_3)

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Tradeid </th>
   <th style="text-align:left;"> Time </th>
   <th style="text-align:left;"> Price </th>
   <th style="text-align:left;"> Volume </th>
   <th style="text-align:left;"> Type </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 18:05:02 </td>
   <td style="text-align:left;"> 4,497.27 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Closing Reference index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 18:00:01 </td>
   <td style="text-align:left;"> 4,497.27 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Closing Reference index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:57:15 </td>
   <td style="text-align:left;"> 4,497.23 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:54:45 </td>
   <td style="text-align:left;"> 4,497.24 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:54:30 </td>
   <td style="text-align:left;"> 4,497.25 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:54:15 </td>
   <td style="text-align:left;"> 4,497.24 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:51:16 </td>
   <td style="text-align:left;"> 4,497.25 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:51:00 </td>
   <td style="text-align:left;"> 4,497.26 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:46:00 </td>
   <td style="text-align:left;"> 4,497.25 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:42:30 </td>
   <td style="text-align:left;"> 4,497.26 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
</tbody>
</table>


**Authors** : <br> 
* [Koffi Frederic Sessie](https://github.com/Koffi-Fredysessie) (<koffisessie@gmail.com>)

**Creator** : Koffi Frederic Sessie <br>  **cph (Copyright Holder)** : Koffi Frederic Sessie <br>


**License** : MIT 2024, Koffi Frederic SESSIE. All rights reserved.
