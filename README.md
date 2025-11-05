---
title: "Library Euronext"
author: "Koffi Frederic SESSIE"
date: "22 février,2024"
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
![](https://cranlogs.r-pkg.org/badges/grand-total/Euronext)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html##experimental)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com)
<!-- badges: end -->




<!-- <img src="man/figures/EN_good_Logo.png" width="147" height="170" align="right"/> -->
<!-- <img src="man/figures/EN_good1_Logo.png" width="250" height="250" align="right"/> -->


<!-- <img src="man/figures/EN_good2_Logo.png" width="200" height="250" align="right"/> -->
<!-- <img src="https://ibb.co/4M1R392" width="200" height="250" align="right"/> -->

<img src="https://i.ibb.co/wCchj37/EN-good2-Logo.png" alt="EN-good2-Logo" width="200" height="250" align="right">


<!-- ![EN-good2-Logo](https://i.ibb.co/wCchj37/EN-good2-Logo.png) -->



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


Please refer to the respective functions **EN_GetISIN()**, **EN_GetISIN_Etf()**, **EN_GetISIN_F()**, and **EN_GetISIN_B()** if you wish to obtain the DNA of a giving Equity or Index, ETF, Fund, and Bond listed on Euronext (retrieving DNA is useful in case you decide to use 'escape = TRUE' option).



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
- *escape* Boolean, either TRUE or FALSE. If escape is True, it means you're providing the DNA
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
   <td style="text-align:left;"> 36.82 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of last update </td>
   <td style="text-align:left;"> 21/02/2024 - 17:35 CET </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Since Open </td>
   <td style="text-align:left;"> -0.14 (-0.38%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Since Previous Close </td>
   <td style="text-align:left;"> -0.03 (-0.08%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Valuation Close </td>
   <td style="text-align:left;"> 36.82 </td>
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
   <td style="text-align:left;"> 4,482.11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of last update </td>
   <td style="text-align:left;"> 21/02/2024 - 18:05 CET </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Since Open </td>
   <td style="text-align:left;"> -5.35 (-0.12%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Since Previous Close </td>
   <td style="text-align:left;"> -5.32 (-0.12%) </td>
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
   <td style="text-align:left;"> €36.82 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> ABN </td>
   <td style="text-align:left;"> NL0011540547 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €14.505 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACCSYS </td>
   <td style="text-align:left;"> AXS </td>
   <td style="text-align:left;"> GB00BQQFX454 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €0.63 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACOMO </td>
   <td style="text-align:left;"> ACOMO </td>
   <td style="text-align:left;"> NL0000313286 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €17.88 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ADUX </td>
   <td style="text-align:left;"> ADUX </td>
   <td style="text-align:left;"> FR0012821890 </td>
   <td style="text-align:left;"> XPAR, XAMS </td>
   <td style="text-align:left;"> €1.32 </td>
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
   <td style="text-align:left;"> €25.38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 138 </td>
   <td style="text-align:left;"> WERELDHAVE BELGIUM </td>
   <td style="text-align:left;"> WEHB </td>
   <td style="text-align:left;"> BE0003724383 </td>
   <td style="text-align:left;"> XBRU </td>
   <td style="text-align:left;"> €47.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 139 </td>
   <td style="text-align:left;"> WHAT </td>
   <td style="text-align:left;"> WHATS </td>
   <td style="text-align:left;"> BE0003573814 </td>
   <td style="text-align:left;"> XBRU </td>
   <td style="text-align:left;"> €59.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 140 </td>
   <td style="text-align:left;"> WHITESTONE GROUP </td>
   <td style="text-align:left;"> ROCK </td>
   <td style="text-align:left;"> BE0974401334 </td>
   <td style="text-align:left;"> ALXB </td>
   <td style="text-align:left;"> €11.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 141 </td>
   <td style="text-align:left;"> XIOR </td>
   <td style="text-align:left;"> XIOR </td>
   <td style="text-align:left;"> BE0974288202 </td>
   <td style="text-align:left;"> XBRU </td>
   <td style="text-align:left;"> €25.95 </td>
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
   <td style="text-align:left;"> €25.60 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2CRSI </td>
   <td style="text-align:left;"> AL2SI </td>
   <td style="text-align:left;"> FR0013341781 </td>
   <td style="text-align:left;"> ALXP </td>
   <td style="text-align:left;"> €4.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> A.S.T. GROUPE </td>
   <td style="text-align:left;"> ALAST </td>
   <td style="text-align:left;"> FR0000076887 </td>
   <td style="text-align:left;"> ALXP </td>
   <td style="text-align:left;"> €0.864 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AB SCIENCE </td>
   <td style="text-align:left;"> AB </td>
   <td style="text-align:left;"> FR0010557264 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> €3.30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABC ARBITRAGE </td>
   <td style="text-align:left;"> ABCA </td>
   <td style="text-align:left;"> FR0004040608 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> €3.72 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABEO </td>
   <td style="text-align:left;"> ABEO </td>
   <td style="text-align:left;"> FR0013185857 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> €13.70 </td>
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
   <td style="text-align:left;"> €4.51 </td>
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
   <td style="text-align:left;"> €0.275 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BENFICA </td>
   <td style="text-align:left;"> SLBEN </td>
   <td style="text-align:left;"> PTSLB0AM0010 </td>
   <td style="text-align:left;"> XLIS </td>
   <td style="text-align:left;"> €2.82 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> COFINA,SGPS </td>
   <td style="text-align:left;"> CFN </td>
   <td style="text-align:left;"> PTCFN0AE0003 </td>
   <td style="text-align:left;"> XLIS </td>
   <td style="text-align:left;"> €0.422 </td>
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
   <td style="text-align:left;"> 1905 </td>
   <td style="text-align:left;"> ZOETIS </td>
   <td style="text-align:left;"> 4ZTS </td>
   <td style="text-align:left;"> US98978V1035 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> €175.85 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1906 </td>
   <td style="text-align:left;"> ZOETIS </td>
   <td style="text-align:left;"> 2ZTS </td>
   <td style="text-align:left;"> US98978V1035 </td>
   <td style="text-align:left;"> MTAH </td>
   <td style="text-align:left;"> €174.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1907 </td>
   <td style="text-align:left;"> ZOOM VIDEO COMM </td>
   <td style="text-align:left;"> 4ZM </td>
   <td style="text-align:left;"> US98980L1017 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> €59.43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1908 </td>
   <td style="text-align:left;"> ZOOM VIDEO COMM </td>
   <td style="text-align:left;"> 1ZM </td>
   <td style="text-align:left;"> US98980L1017 </td>
   <td style="text-align:left;"> BGEM </td>
   <td style="text-align:left;"> €58.78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1909 </td>
   <td style="text-align:left;"> ZOOM VIDEO COMM </td>
   <td style="text-align:left;"> 2ZM </td>
   <td style="text-align:left;"> US98980L1017 </td>
   <td style="text-align:left;"> MTAH </td>
   <td style="text-align:left;"> €64.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1910 </td>
   <td style="text-align:left;"> ZUCCHI </td>
   <td style="text-align:left;"> ZUC </td>
   <td style="text-align:left;"> IT0005395071 </td>
   <td style="text-align:left;"> MTAA </td>
   <td style="text-align:left;"> €2.04 </td>
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
   <td style="text-align:left;"> €3.30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 29 </td>
   <td style="text-align:left;"> OVOCA BIO PLC </td>
   <td style="text-align:left;"> OVXA </td>
   <td style="text-align:left;"> IE00B4XVDC01 </td>
   <td style="text-align:left;"> XESM </td>
   <td style="text-align:left;"> €0.0145 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 30 </td>
   <td style="text-align:left;"> PERM. TSB GP. HOLD </td>
   <td style="text-align:left;"> PTSB </td>
   <td style="text-align:left;"> IE00BWB8X525 </td>
   <td style="text-align:left;"> XMSM </td>
   <td style="text-align:left;"> €1.59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 31 </td>
   <td style="text-align:left;"> RYANAIR HOLD. PLC </td>
   <td style="text-align:left;"> RYA </td>
   <td style="text-align:left;"> IE00BYTBXV33 </td>
   <td style="text-align:left;"> XMSM </td>
   <td style="text-align:left;"> €20.23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 32 </td>
   <td style="text-align:left;"> SMURFIT KAPPA GP </td>
   <td style="text-align:left;"> SK3 </td>
   <td style="text-align:left;"> IE00B1RR8406 </td>
   <td style="text-align:left;"> XMSM </td>
   <td style="text-align:left;"> €37.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 33 </td>
   <td style="text-align:left;"> UNIPHAR PLC </td>
   <td style="text-align:left;"> UPR </td>
   <td style="text-align:left;"> IE00BJ5FQX74 </td>
   <td style="text-align:left;"> XESM </td>
   <td style="text-align:left;"> €2.90 </td>
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
   <td style="text-align:left;"> €36.82 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABN AMRO BANK N.V. </td>
   <td style="text-align:left;"> ABN </td>
   <td style="text-align:left;"> NL0011540547 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €14.505 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACCSYS </td>
   <td style="text-align:left;"> AXS </td>
   <td style="text-align:left;"> GB00BQQFX454 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €0.63 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ACOMO </td>
   <td style="text-align:left;"> ACOMO </td>
   <td style="text-align:left;"> NL0000313286 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> €17.88 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ADUX </td>
   <td style="text-align:left;"> ADUX </td>
   <td style="text-align:left;"> FR0012821890 </td>
   <td style="text-align:left;"> XPAR, XAMS </td>
   <td style="text-align:left;"> €1.32 </td>
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



### *Example 2.c* : Show in detail Paris Euronext Stocks


```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-a4561ac384803f6013ef" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-a4561ac384803f6013ef">{"x":{"filter":"none","vertical":false,"extensions":["ColReorder","RowReorder","Buttons","Responsive"],"data":[["1000MERCIS","2CRSI","A.S.T. GROUPE","AB SCIENCE","ABC ARBITRAGE","ABEO","ABIONYX PHARMA","ABIVAX","ABL Diagnostics","ABO GROUP","ACANTHE DEV.","ACCOR","ACHETER-LOUER.FR","ACTEOS","ACTIA GROUP","ACTICOR BIOTECH","ACTIVIUM GROUP","ADC SIIC","ADEUNIS","ADOCIA","ADOMOS","ADP","ADUX","ADVICENNE","ADVINI","AELIS FARMA","AERKOMM INC","AFFLUENT MED BSAR","AFFLUENT MEDICAL","AFYREN","AG3I","AGENCE AUTO","AGP MALAGA SOCIMI","AGRIPOWER","AGROGENERATION","AIR FRANCE -KLM","AIR LIQUIDE","AIRBUS","AIRWELL","AKWEL","ALAN ALLMAN","ALCHIMIE","ALD","ALGREEN","ALPES (COMPAGNIE)","ALPHA MOS","ALSTOM","ALTAMIR","ALTAREA","ALTAREIT","ALTEN","ALTHEORA","ALTUR INVEST.","ALVEEN","AMA CORPORATION","AMATHEON AGRI","AMOEBA","AMPLITUDE SURGICAL","AMUNDI","ANDINO GLOBAL","ANTIN INFRA PARTN","APERAM","APODACA INVERSIONE","AQUILA","ARAMIS GROUP","ARCELORMITTAL SA","ARCHOS","ARCURE","ARDOIN ST AMAND A","ARDOIN ST AMAND B","AREF THALASSA","ARGAN","ARIMELIA ITG","ARKEMA","AROCA DEL PINAR","ARTEA","ARTMARKET COM","ARTOIS NOM.","ARVERNE GROUP","ARVERNE WARRANT","ASHLER ET MANSON","ASSYSTEM","ASTICKSO XXI","ATARI","ATEME","ATLAND","ATOS","AUBAY","AUDACIA","AUGROS COSMETICS","AUPLATA MINING GR","AUREA","AURES TECHNOLOGIES","AVENIR TELECOM","AXA","AXA NV24","AXWAY SOFTWARE","AZ LEASING","AZOREAN TECH","BAIKOWSKI","BAINS MER MONACO","BALYO","BARBARA BUI","BARINGS CORE SPAIN","BASSAC","BASTIDE LE CONFORT","BD MULTI MEDIA","BEACONSMIND","BEBO HEALTH","BELIEVE","BENETEAU","BERNARD LOISEAU","BIC","BIGBEN INTERACTIVE","BILENDI","BIO-UV GROUP","BIOMERIEUX","BIOPHYTIS","BIOPHYTIS BSA","BIOPHYTIS BSA","BIOSENIC","BIOSYNEX","BLEECKER","BLUE SHARK POWER","BLUELINEA","BNP PARIBAS ACT.A","BOA CONCEPT","BODY ONE","BOIRON","BOLLORE","BONDUELLE","BONYF","BOOSTHEAT","BOURRELIER GROUP","BOURSE DIRECT","BOUYGUES","BOUYGUES NV24","BROADPEAK","BUREAU VERITAS","BURELLE","CA TOULOUSE 31 CCI","CABASSE","CAFOM","CAMBODGE NOM.","CAPELLI","CAPGEMINI","CARBIOS","CARMAT","CARMILA","CARPINIENNE PART.","CARREFOUR","CASINO GUICHARD","CATANA GROUP","CATERING INTL SCES","CATERPILLAR INC","CBI","CBI BSA","CBO TERRITORIA","CEGEDIM","CELLECTIS","CELYAD ONCOLOGY","CERINNOV GROUP","CFI","CFM INDOSUEZWEALTH","CGG","CH.FER DEPARTEMENT","CH.FER VAR GARD N.","CHARGEURS","CHARWOOD ENERGY","CHAUSSERIA","CHEOPS TECHNOLOGY","CHRISTIAN DIOR","CIBOX INTER A CTIV","CIE DU MONT BLANC","CLARANOVA","CLARIANE","CLASQUIN","CMG CLEANTECH","CNOVA","COFACE","COFIDUR","COGELEC","COGRA","COHERIS","COIL","COLIPAYS","COMPAGNIE ODET","CONDOR TECHNOLOG","CONSORT NT","CONSTRUCTEURS BOIS","CORE SPAIN HOLDCO","COREP LIGHTING","CORETECH 5","COTY","COURBET","COURTOIS","COVIVIO","COVIVIO HOTELS","CRCAM ALP.PROV.CCI","CRCAM ATL.VEND.CCI","CRCAM BRIE PIC2CCI","CRCAM ILLE-VIL.CCI","CRCAM LANGUED CCI","CRCAM LOIRE HTE L.","CRCAM MORBIHAN CCI","CRCAM NORD CCI","CRCAM NORM.SEINE","CRCAM PARIS ET IDF","CRCAM SUD R.A.CCI","CRCAM TOURAINE CCI","CREDIT AGRICOLE","CROSSJECT","CROSSWOOD","CYBERGUN","CYBERGUN BSA K1","CYBERGUN BSA K2A","CYBERGUN BSA K2B","D.L.S.I.","DAMARIS","DAMARTEX","DANONE","DASSAULT AVIATION","DASSAULT SYSTEMES","DBT","DBT DS","DBV TECHNOLOGIES","DEEZER","DEEZER WARRANTS","DEKUPLE","DELFINGEN","DELTA PLUS GROUP","DERICHEBOURG","DEVERNOIS","DIAGNOSTIC MED BSA","DIAGNOSTIC MEDICAL","DMS IMAGING","DNXCORP","DOCK.PETR.AMBES AM","DOLFINES","DONTNOD","DRONE VOLT","DRONE VOLT BS26","DYNAFOND","DYNEX ENERGY SA","E PANGO","EASSON HOLDINGS","EAUX DE ROYAN","EAVS","ECOLUTIONS","ECOMIAM","ECOSLOPS","EDENRED","EDILIZIACROBATICA","EDITIONS DU SIGNE","EDUFORM ACTION","EDUNIVERSAL","EGIDE","EIFFAGE","EKINOPS","ELEC.STRASBOURG","ELECT. MADAGASCAR","ELIOR GROUP","ELIS","ELIX","EMBENTION","EMOVA GROUP","ENCRES DUBUIT","ENENSYS","ENERGISME","ENERTIME","ENGIE","ENIBLOCK","ENOGIA","ENTECH","ENTREPARTICULIERS","ENTREPRENDRE","EO2","EQUASENS","ERAMET","EROLD","ESKER","ESSILORLUXOTTICA","ESSO","EURASIA FONC INV","EURASIA GROUPE","EURAZEO","EURO RESSOURCES","EUROAPI","EUROBIO-SCIENTIFIC","EUROFINS CEREP","EUROFINS SCIE.NV24","EUROFINS SCIENT.","EUROLAND CORPORATE","EUROLOG CANOLA","EURONEXT","EUROPACORP","EUROPLASMA","EUTELSAT COMMUNIC.","EVERGREEN","EXACOMPTA CLAIREF.","EXAIL TECHNOLOGIES","EXCLUSIVE NETWORKS","EXEL INDUSTRIES","EXPLOSIFS PROD.CHI","FACEPHI","FAIFEY INVEST","FASHION B AIR","FAYENC.SARREGUEMI.","FD","FDJ","FERM.CAS.MUN.CANNE","FERMENTALG","FIDUCIAL OFF.SOL.","FIDUCIAL REAL EST.","FIGEAC AERO","FILL UP MEDIA","FIN.ETANG BERRE","FIN.OUEST AFRICAIN","FINANCIERE MARJOS","FINATIS","FINAXO","FIPP","FIRSTCAUTION","FLEURY MICHON","FLORENTAISE","FNAC DARTY","FNPTECHNOLOGIESSA","FOCUSENTERTAINMENT","FONCIERE 7 INVEST","FONCIERE EURIS","FONCIERE INEA","FONCIERE LYONNAISE","FONCIERE VINDI","FONCIERE VOLTA","FORESTIERE EQUAT.","FORSEE POWER","FORVIA","FOUNTAINE PAJOT","FRANCAISE ENERGIE","FRANCE SOIR GROUPE","FRANCE TOURISME","FREELANCE.COM","FREY","G.A.I.","GALEO","GALIMMO","GASCOGNE","GAUMONT","GAUSSIN","GEA GRENOBL.ELECT.","GECI INTL","GECINA","GENERAL ELECTRIC","GENEURO","GENFIT","GENOWAY","GENSIGHT BIOLOGICS","GENTLEMENS EQUITY","GETLINK SE","GEVELOT","GL EVENTS","GLASS TO POWER A","GLASS TO POWER B","GLASS TO POWER WAR","GLOBAL BIOENERGIES","GLOBAL PIELAGO","GOLD BY GOLD","GPE GROUP PIZZORNO","GPE PAROT (AUTO)","GRAINES VOLTZ","GROLLEAU","GROUPE BERKEM","GROUPE CARNIVOR","GROUPE CRIT","GROUPE GUILLIN","GROUPE JAJ","GROUPE LDLC","GROUPE OKWIND","GROUPE PARTOUCHE","GROUPE PLUS-VALUES","GROUPE SFPI","GROUPE TERA","GROUPIMO","GT BIOPHARMA INC","GTT","GUANDAO PUER INVES","GUERBET","GUILLEMOT","HAFFNER ENERGY","HAMILTON GLOBAL OP","HAULOTTE GROUP","HDF","HEALTHCARE ACTIVOS","HERIGE","HERMES INTL","HEXAOM","HF COMPANY","HIGH CO","HIPAY GROUP","HITECHPROS","HK","HOCHE BAINS L.BAIN","HOFFMANN","HOME CONCEPT","HOPENING","HOPIUM","HOPSCOTCH GROUPE","HOT.MAJESTIC CANNE","HOTELES BESTPRICE","HOTELIM","HOTELS DE PARIS","HOTL.IMMOB.NICE","HUNYVERS","HYBRIGENICS","HYDRAULIQUE PB","HYDRO-EXPLOIT.","HYDROGEN REFUELING","I.CERAM","I2S","IANTE INVESTMENTS","ICADE","ICAPE HOLDING","ID LOGISTICS GROUP","IDI","IDS","IDSUD","IGIS NEPTUNE","IKONISYS","ILBE","IMALLIANCE","IMERYS","IMM.PARIS.PERLE","IMMERSION","IMMOB.DASSAULT","IMPLANET","IMPRIMERIE CHIRAT","IMPULSE FITNESS","INDLE FIN.ENTREPR.","INFOCLIP","INFOTEL","INMARK","INMOSUPA","INNATE PHARMA","INNELEC MULTIMEDIA","INNOVATIVE RFK SPA","INSTALLUX","INTEGRAGEN","INTEGRITAS VIAGER","INTERPARFUMS","INTEXA","INTRASENSE","INVENTIVA","INVIBES ADVERTSING","IPOSA PROPERTIES","IPSEN","IPSOS","ISPD","IT LINK","ITALY INNOVAZIONI","ITESOFT","JACQUES BOGART","JACQUET METALS","JCDECAUX","JSA TECHNOLOGY","JUNGLE21","KALRAY","KAUFMAN ET BROAD","KERING","KERLINK","KEYRUS","KKO INTERNATIONAL","KLARSEN","KLEPIERRE","KOMPUESTOS","KUMULUS VAPE","L","LA PERLA FASHION","LABO EUROMEDIS","LACROIX GROUP","LAGARDERE SA","LANSON-BCC","LARGO","LATECOERE","LAURENT-PERRIER","LDC","LEBON","LECTRA","LECTRA NV24","LEGRAND","LEPERMISLIBRE","LES HOTELS BAVEREZ","LEXIBOOK LINGUIST.","LHYFE","LINEDATA SERVICES","LISI","LLAMA GROUP","LLEIDA","LNA SANTE","LOCASYSTEM INTL","LOGIC INSTRUMENT","LOMBARD ET MEDOT","LUCIBEL","LUMIBIRD","LVMH","M.R.M","M2I","MAAT PHARMA","MADE","MAGILLEM","MAIS.ANTOINE BAUD","MAISON CLIO BLUE","MAISONS DU MONDE","MAKING SCIENCE","MALTERIES FCO-BEL.","MANITOU BF","MAQ ADMON. URBANAS","MARE NOSTRUM","MAROC TELECOM","MASTRAD","MASTRAD BS29","MAUNA KEA TECH","MAUREL ET PROM","MBWS","MCPHY ENERGY","MEDESIS PHARMA","MEDIA 6","MEDIA LAB","MEDIANTECHNOLOGIES","MEDINCELL","MEDIOCREDITO EUROP","MEMSCAP REGPT","MERCIALYS","MERIDIA RE IV","MERSEN","METABOLIC EXPLORER","METALLIANCE","METAVISIO","METHANOR","METRICS IN BALANCE","METROPOLE TV","MEXEDIA","MG INTERNATIONAL","MGI DIGITAL GRAPHI","MICHELIN","MICROPOLE","MIGUET ET ASSOCIES","MILIBOO","MINT","MND","MON COURTIER ENERG","MONCEY (FIN.) NOM.","MONTEA","MONTEPINO LOGISTIC","MOULINVEST","MR BRICOLAGE","MUNIC","MUTTER VENTURES","MYHOTELMATCH","NACON","NAMR","NANOBIOTIX","NEOEN","NEOLIFE","NEOVACS","NETGEM","NETMEDIA GROUP","NEURONES","NEXANS","NEXITY","NEXTEDIA","NFL BIOSCIENCES","NHOA","NICOX","NOKIA","NORTEM BIOGROUP","NOVACYT","NOVATECH IND.","NR21","NRJ GROUP","NSC GROUPE","NSE","OBIZ","OCTOPUS BIOSAFETY","OENEO","OK PROPERTIES","OL GROUPE","OMER-DECUGIS & CIE","ONCODESIGN PM","ONE EXPERIENCE","ONLINEFORMAPRO","ORANGE","ORAPI","ORBIS PROPERTIES","ORDISSIMO","OREGE","ORINOQUIA","ORPEA","OSE IMMUNO","OSMOSUN","OSMOZIS","OVH","PACTE NOVATION","PAREF","PARROT","PART.INDLES MINI.","PARX MATERIALS NV","PASSAT","PATRIMOINE ET COMM","PAULIC MEUNERIE","PERNOD RICARD","PERRIER (GERARD)","PERSEIDA RENTA","PET SERVICE","PEUGEOT INVEST","PHARNEXT","PHAXIAM Tx","PHONE WEB","PHOTONIKE CAPITAL","PIERRE VAC BSA ACT","PIERRE VAC BSA CRE","PIERRE VACANCES","PISCINES DESJOYAUX","PIXIUM VISION","PLACOPLATRE","PLANT ADVANCED","PLANT ADVANCED BS","PLAST.VAL LOIRE","PLASTIC OMNIUM","PLUXEE","POUJOULAT","POULAILLON","POXEL","PRECIA","PREDILIFE","PRISMAFLEX INTL","PROACTIS SA","PRODWARE","PRODWAYS","PROLOGUE","PROLOGUE BSA","PROP.IMMEUBLES","PUBLICIS GROUPE SA","QUADIENT","QUADPACK","QUANTUM GENOMICS","QWAMPLIFY","RACING FORCE","RALLYE","RAMSAY GEN SANTE","RAPID NUTRITION","REALITES","REMY COINTREAU","RENAULT","RES GESTAE SOCIMI","REWORLD MEDIA","REXEL","RIBER","ROBERTET","ROBERTET CDV 87","ROBERTET CI","ROCHE BOBOIS","ROCTOOL","ROCTOOL BSA 2020-2","ROUGIER S.A.","RUBIS","S.E.B.","SAFE","SAFRAN","SAGAX REAL ESTATE","SAINT GOBAIN","SAINT GOBAIN NV24","SAINT JEAN GROUPE","SAMSE","SANOFI","SANOFI NV24","SAPMER","SARTORIUS STED BIO","SAVENCIA","SAVONNERIE NYONS","SCBSM","SCEMI","SCHLUMBERGER","SCHNEIDER ELECTRIC","SCIENTIA SCHOOL","SCOR SE","SECHE ENVIRONNEM.","SEGRO PLC","SEIF SPA","SELCODIS","SELECTIRENTE","SEMPLICEMENTE SpA","SENSORION","SEQUA PETROLEUM NV","SERGEFERRARI GROUP","SES","SHOWROOMPRIVE","SIDETRADE","SIGNAUX GIROD","SII","SILC","SIMAT","SIRIUS MEDIA","SMAIO","SMALTO","SMALTO BSA","SMART GOOD THINGS","SMCP","SMTPC","SOC FRANC CASINOS","SOCIETE GENERALE","SODEXO","SODITECH","SOGECLAIR","SOITEC","SOLOCAL GROUP","SOLUTIONS 30 SE","SOLVAY","SOPRA STERIA GROUP","SPARTOO","SPEED RABBIT PIZZA","SPIE","SPINEGUARD","SPINEWAY","SQLI","ST DUPONT","STEF","STELLANTIS NV","STIF","STMICROELECTRONICS","STRADIM ESPAC.FIN","STREAMWIDE","STREAMWIDE BS25","STREAMWIDE BS25-2","STREIT MECANIQUE","SUMO RESOURCES PLC","SWORD GROUP","SYENSQO","SYNERGIE","TARKETT","TATATU","TAYNINH","TECHNIP ENERGIES","TELEPERFORMANCE","TELEVERBIER","TELEVISTA","TERACT","TERACT BS","TF1","TF1 NV24","TFF GROUP","THALES","THE AZUR SELECTION","THE BLOCKCHAIN GP","THERACLION","THERANEXUS","THERAVET","THERMADOR GROUPE","TIKEHAU CAPITAL","TIPIAK","TITAN CEMENT","TME PHARMA","TME PHARMA BSA Z","TONNER DRONES","TOOLUX SANDING","TOOSLA","TOTALENERGIES","TotalEnergiesGabon","TOUAX","TOUR EIFFEL","TRAMWAYS DE ROUEN","TRANSGENE","TRIGANO","TRILOGIQ","TROC ILE","TRONICS","TTI","TXCOM","U10 CORP","UBISOFT ENTERTAIN","UCAPITAL GLOBAL","UMALIS GROUP","UNIBAIL-RODAMCO-WE","UNIBEL","UNION TECH.INFOR.","UNITI","UPERGY","URCOLESA","UV GERMI","VALBIOTIS","VALEO","VALERIO TX","VALLOUREC","VALLOUREC BSA 21","VALNEVA","VANDOR REAL ESTATE","VANTIVA","VANTIVA BSA 2024","VAZIVA","VENTE UNIQUE.COM","VEOLIA ENVIRON.","VEOM GROUP","VERALLIA","VERGNET","VERIMATRIX","VERNEY CARRON","VERSITY","VETOQUINOL","VIALIFE","VICAT","VIEL ET COMPAGNIE","VINCI","VINPAI","VIRBAC","VIRTUALWARE","VISIATIV","VISIATIV BS","VISIOMED GROUP","VITURA","VIVENDI SE","VOGO","VOLTALIA","VOYAGEURS DU MONDE","VRANKEN-POMMERY","VREF SEVILLE","VusionGroup","WAGA ENERGY","WALLIX","WAVESTONE","WE.CONNECT","WEACCESS GROUP","WEDIA","WELL","WENDEL","WEYA","WHITENI R CAJAL","WINFARM","WITBE","WIZIBOAT","WORLDLINE","X-FAB","XILAM ANIMATION","ZCCM","ZCI LIMITED"],["ALMIL","AL2SI","ALAST","AB","ABCA","ABEO","ABNX","ABVX","ABLD","ABO","ACAN","AC","ALALO","EOS","ALATI","ALACT","MLACT","ALDV","ALARF","ADOC","ALADO","ADP","ADUX","ALDVI","ALAVI","AELIS","AKOM","AFMBS","AFME","ALAFY","MLAGI","MLAA","MLAGP","ALAGP","ALAGR","AF","AI","AIR","ALAIR","AKW","AAA","ALCHI","ALD","ALGRE","CDA","ALNEO","ALO","LTA","ALTA","AREIT","ATE","ALORA","ALTUR","MLALV","ALAMA","MLAAH","ALMIB","AMPLI","AMUN","MLAIG","ANTIN","APAM","MLASO","ALAQU","ARAMI","MT","ALJXR","ALCUR","MLARD","ARDO","MLARE","ARG","MLARI","AKE","MLARO","ARTE","PRC","ARTO","ARVEN","ARVBS","MLAEM","ASY","MLAST","ALATA","ATEME","ATLD","ATO","AUB","ALAUD","AUGR","ALAMG","AURE","ALAUR","AVT","CS","CSNV","AXW","MLAZL","MLAAT","ALBKK","BAIN","BALYO","BUI","MLBAR","BASS","BLC","ALBDM","MLBMD","MLBBO","BLV","BEN","ALDBL","BB","BIG","ALBLD","ALTUV","BIM","ALBPS","BPSBS","BPBS","BIOS","ALBIO","BLEE","MLBSP","ALBLU","BNP","ALBOA","MLONE","BOI","BOL","BON","MLBON","ALBOO","ALBOU","BSD","EN","ENNV","ALBPK","BVI","BUR","CAT31","ALCAB","CAFO","CBDG","ALCAP","CAP","ALCRB","ALCAR","CARM","CARP","CA","CO","CATG","ALCIS","CATR","ALCBI","CBIBS","CBOT","CGM","ALCLS","CYAD","ALPCV","CFI","MLCFM","CGG","MLCFD","MLCVG","CRI","ALCWE","CHSR","MLCHE","CDI","ALCBX","MLCMB","CLA","CLARI","ALCLA","MLCMG","CNV","COFA","ALCOF","ALLEC","ALCOG","COH","ALCOI","MLCLP","ODET","MLMFI","MLCNT","MLLCB","MLCOE","MLCOR","MLCOT","COTY","MLCOU","COUR","COV","COVH","CRAP","CRAV","CRBP2","CIV","CRLA","CRLO","CMO","CNDF","CCN","CAF","CRSU","CRTO","ACA","ALCJ","CROS","ALCYB","CYBK1","CYBKA","CYBKB","ALDLS","MLDAM","ALDAR","BN","AM","DSY","ALDBT","DBTDS","DBV","DEEZR","DEEZW","DKUPL","ALDEL","ALDLT","DBG","ALDEV","DMSBS","ALDMS","ALIMG","ALDNX","DPAM","ALDOL","ALDNE","ALDRV","BNBS","MLDYN","MLDYX","ALAGO","MLEAS","MLEDR","MLEAV","MLECO","ALECO","ALESA","EDEN","ALEAC","MLEDS","MLEFA","MLEDU","ALGID","FGR","EKI","ELEC","EEM","ELIOR","ELIS","MLERH","MLUAV","ALEMV","ALDUB","ALNN6","ALNRG","ALENE","ENGI","ALENI","ALENO","ALESE","ALENT","ALENR","ALEO2","EQS","ERA","ALPLA","ALESK","EL","ES","EFI","ALEUA","RF","EUR","EAPI","ALERS","ALECR","ERFNV","ERF","MLERO","MLCAN","ENX","ALECP","ALEUP","ETL","EGR","ALEXA","EXA","EXN","EXE","EXPL","ALPHI","MLECE","ALFBA","FAYE","MLFDV","FDJ","FCMC","FALG","SACI","ORIA","FGA","ALFUM","BERR","FOAF","FINM","FNTS","MLFXO","FIPP","MLFIR","ALFLE","ALFLO","FNAC","MLFNP","ALFOC","LEBL","EURS","INEA","FLY","MLVIN","SPEL","FORE","FORSE","FRVIA","ALFPC","FDE","MLFSG","MLFTI","ALFRE","FREY","MLGAI","MLGAL","GALIM","ALBI","GAM","ALGAU","GEA","ALGEC","GFC","GNE","GNRO","GNFT","ALGEN","SIGHT","MLGEQ","GET","ALGEV","GLO","MLGLA","MLGLB","MLGLW","ALGBE","MLNDG","ALGLD","GPE","ALPAR","GRVO","ALGRO","ALKEM","MLGRC","CEN","ALGIL","GJAJ","ALLDL","ALOKW","PARP","MLPVG","SFPI","ALGTR","ALIMO","GTBP","GTT","MLGDI","GBT","GUI","ALHAF","ALHGO","PIG","HDF","MLHAY","ALHRG","RMS","ALHEX","ALHF","HCO","ALHYP","ALHIT","MLHK","MLHBB","ALHGR","MLHCF","MLHPE","ALHPI","ALHOP","MLHMC","MLHBP","MLHOT","HDP","MLHIN","ALHUN","ALHYG","MLHYD","MLHYE","ALHRS","ALICR","ALI2S","MLINT","ICAD","ALICA","IDL","IDIP","MLIDS","ALIDS","MLABC","ALIKO","ALIE","MLIML","NK","MLIPP","ALIMR","IMDA","ALIMP","MLIMP","MLIFS","INFE","MLIFC","INF","MLINM","MLISP","IPH","ALINN","MLIRF","ALLUX","ALINT","MLVIE","ITP","ITXT","ALINS","IVA","ALINV","MLIPO","IPN","IPS","ALISP","ALITL","MLITN","ITE","JBOG","JCQ","DEC","MLJSA","MLJ21","ALKAL","KOF","KER","ALKLK","ALKEY","ALKKO","ALKLA","LI","ALKOM","ALVAP","OR","ALPER","ALEMG","LACR","MMB","ALLAN","ALLGO","LAT","LPE","LOUP","ALBON","LSS","LSSNV","LR","ALLPL","ALLHB","ALLEX","LHYFE","LIN","FII","ALLAM","ALLLN","LNA","MLLOI","ALLOG","MLCAC","ALUCI","LBIRD","MC","MRM","ALMII","MAAT","MLMAD","MLMGL","MLMAB","MLCLI","MDM","ALMKS","MALT","MTU","MLMAQ","ALMAR","IAM","ALMAS","MASBS","ALMKT","MAU","MBWS","MCPHY","ALMDP","EDI","MLLAB","ALMDT","MEDCL","MLMCE","MEMS","MERY","MLMIV","MRN","METEX","MLETA","ALTHO","ALMET","MLMIB","MMT","ALMEX","ALMGI","ALMDG","ML","ALMIC","MLNMA","ALMLB","ALMIN","ALMND","ALMCE","FMONC","MONT","MLMTP","ALMOU","ALMRB","ALMUN","MLMUT","MHM","NACON","ALNMR","NANO","NEOEN","ALNLF","ALNEV","ALNTG","ALNMG","NRO","NEX","NXI","ALNXT","ALNFL","NHOA","ALCOX","NOKIA","MLBIO","ALNOV","MLNOV","NR21","NRG","ALNSC","ALNSE","ALBIZ","MLOCT","SBT","MLOKP","OLG","ALODC","ALOPM","ALEXP","MLONL","ORA","ORAP","MLORB","ALORD","OREGE","MLORQ","ORP","OSE","ALWTR","ALOSM","OVH","MLPAC","PAR","PARRO","MLHOP","MLPRX","PSAT","PAT","ALPAU","RI","PERR","MLPER","MLPET","PEUG","ALPHA","PHXM","MLPHW","MLPHO","VACBS","VACBT","VAC","ALPDX","ALPIX","MLPLC","ALPAT","PATBS","PVL","POM","PLX","ALPJT","ALPOU","POXEL","ALPM","ALPRE","ALPRI","PROAC","ALPRO","PWG","ALPRG","PROBT","MLPRI","PUB","QDT","ALQP","ALQGC","ALQWA","ALRFG","RAL","GDS","ALRPD","ALREA","RCO","RNO","MLJDL","ALREW","RXL","ALRIB","RBT","CBR","CBE","RBO","ALROC","ROCBT","ALRGR","RUI","SK","ALSAF","SAF","MLSAG","SGO","SGONV","SABE","SAMS","SAN","SANNV","ALMER","DIM","SAVE","MLSDN","CBSM","MLCMI","SLB","SU","MLSCI","SCR","SCHP","SGRO","ALSEI","SLCO","SELER","MLSMP","ALSEN","MLSEQ","SEFER","SESG","SRP","ALBFR","ALGIR","SII","MLSIL","MLMAT","ALSRS","ALSMA","MLSML","SMLBS","MLSGT","SMCP","ALTPC","SFCA","GLE","SW","SEC","ALSOG","SOI","LOCAL","S30","SOLB","SOP","ALSPT","MLSRP","SPIE","ALSGD","ALSPW","SQI","DPT","STF","STLAP","ALSTI","STMPA","ALSAS","ALSTW","STWBS","STRBS","MLSTR","MLSUM","SWP","SYENS","SDG","TKTT","ALTTU","TAYN","TE","TEP","TVRB","MLVST","TRACT","TERBS","TFI","TFINV","TFF","HO","MLAZR","ALTBG","ALTHE","ALTHX","ALVET","THEP","TKO","TIPI","TITC","ALTME","TMBSZ","ALTD","ALTLX","ALTOO","TTE","EC","TOUP","EIFF","MLTRA","TNG","TRI","ALTRI","MLTRO","ALTRO","ALTTI","ALTXC","ALU10","UBI","MLALE","MLUMG","URW","UNBL","FPG","ALUNT","ALUPG","MLURC","ALUVI","ALVAL","FR","ALVIO","VK","VKBS","VLA","MLVRE","VANTI","VANBS","MLVAZ","ALVU","VIE","ALVG","VRLA","ALVER","VMX","MLVER","MLVSY","VETO","ALVIA","VCT","VIL","DG","ALVIN","VIRP","MLVIR","ALVIV","VIVBS","ALVMG","VTR","VIV","ALVGO","VLTSA","ALVDM","VRAP","MLVRF","VU","WAGA","ALLIX","WAVE","ALWEC","MLWEA","ALWED","MLWEL","MF","MLWEY","MLWRC","ALWF","ALWIT","MLWIZ","WLN","XFAB","XIL","MLZAM","CV"],["FR0010285965","FR0013341781","FR0000076887","FR0010557264","FR0004040608","FR0013185857","FR0012616852","FR0012333284","FR001400AHX6","BE0974278104","FR0000064602","FR0000120404","FR001400JAP8","FR0000076861","FR0000076655","FR0014005OJ5","FR0010979377","BE0974269012","FR0013284627","FR0011184241","FR001400JAL7","FR0010340141","FR0012821890","FR0013296746","FR0000053043","FR0014007ZB4","US00774B2088","FR001400FL38","FR0013333077","FR0014005AC9","FR0011908045","FR0014005WE9","ES0105478004","FR0013452281","FR0010641449","FR001400J770","FR0000120073","NL0000235190","FR0014003V77","FR0000053027","FR0000062465","FR0014000JX7","FR0013258662","FR001400IV58","FR0000053324","FR0013421286","FR0010220475","FR0000053837","FR0000033219","FR0000039216","FR0000071946","FR0000061244","FR0010395681","FR0013253812","GB00BNKGZC51","NL0010273694","FR0011051598","FR0012789667","FR0004125920","ES0105744009","FR0014005AL0","LU0569974404","ES0105658001","FR0010340711","FR0014003U94","LU1598757687","FR001400KO61","FR0013398997","FR0005057635","FR0004070795","ES0105661005","FR0010481960","ES0105601001","FR0010313833","ES0105486007","FR0012185536","FR0000074783","FR0000076952","FR001400JWR8","FR0014003AC4","FR0012968485","FR0000074148","ES0105708004","FR0010478248","FR0011992700","FR0013455482","FR0000051732","FR0000063737","FR00140059B5","FR0000061780","FR0013410370","FR0000039232","FR0013183589","FR001400CFI7","FR0000120628","FR001400M7B2","FR0011040500","IT0004812258","PTAZR0AM0006","FR0013384369","MC0000031187","FR0013258399","FR0000062788","ES0105362000","FR0004023208","FR0000035370","FR0000035305","CH0451123589","CH1148983609","FR0014003FE9","FR0000035164","FR0000066961","FR0000120966","FR0000074072","FR0004174233","FR0013345493","FR0013280286","FR0012816825","FR0013507290","FR001400LN79","BE0974280126","FR0011005933","FR0000062150","FR0013340973","FR0011041011","FR0000131104","FR0011365907","FR0010106039","FR0000061129","FR0000039299","FR0000063935","BE6333353298","FR001400IAM7","FR0000054421","FR0000074254","FR0000120503","FR001400M3D7","FR001400AJZ7","FR0006174348","FR0000061137","FR0000045544","FR001400DIY6","FR0010151589","FR0000079659","FR0012969095","FR0000125338","FR0011648716","FR0010907956","FR0010828137","FR0000064156","FR0000120172","FR0000125585","FR0010193052","FR0000064446","US1491231015","FR0014007LW0","FR001400D0X2","FR0010193979","FR0000053506","FR0010425595","BE0974260896","FR0013178712","FR0000037475","MC0010000826","FR0013181864","FR0000037871","FR0000051567","FR0000130692","FR001400AJ60","FR0000060907","FR0010447086","FR0000130403","FR0000054322","FR0000060428","FR0013426004","FR0010386334","FR0004152882","FR0013406881","NL0010949392","FR0010667147","FR0013257409","FR0013335742","FR0011071570","FR0004031763","BE0160342011","FR0010959684","FR0000062234","BE6252013725","FR0000077828","FR00140007I9","ES0105660007","FR0010035816","FR0013371507","US2220702037","FR0004998318","FR0000065393","FR0000064578","FR0000060303","FR0000044323","FR0000185506","FR0010483768","FR0000045213","FR0010461053","FR0000045239","FR0000045551","FR0000185514","FR0000044364","FR0000045528","FR0000045346","FR0000045304","FR0000045072","FR0011716265","FR0000050395","FR0014004QR6","FR0013507977","FR0013507985","FR0013508009","FR0010404368","FR0000077885","FR0000185423","FR0000120644","FR0014004L86","FR0014003TT8","FR001400LO86","FR001400O218","FR0010417345","FR001400AYG6","FR0014004JF6","FR0000062978","FR0000054132","FR0013283108","FR0000053381","FR0000060840","FR001400IAQ8","FR0012202497","BE0974289218","FR0010436584","FR0000065260","FR0014004QZ9","FR0013331212","FR0013088606","FR0014007951","FR0000052920","LU0881232630","FR0014004339","HK0000038783","FR0007200100","FR0010536185","DE000A0XYM45","FR0013534617","FR0011490648","FR0010908533","IT0005351504","FR0000052755","FR0010882886","FR0010439265","FR0000072373","FR0000130452","FR0011466069","FR0000031023","FR0000035719","FR0011950732","FR0012435121","ES0105726006","ES0105639001","FR0013356755","FR0004030708","FR0013330792","FR0013399359","FR0011915339","FR0010208488","FR001400C2Z4","FR0014004974","FR0014004362","FR0010424697","FR0000045122","FR0010465534","FR0012882389","FR0000131757","FR0010211037","FR0000035818","FR0000121667","FR0000120669","FR0000061475","FR0010844001","FR0000121121","FR0000054678","FR0014008VX5","FR0013240934","FR0013256518","FR001400M7C0","FR0014000MR3","FR0010157115","ES0105586004","NL0006294274","FR0010490920","FR001400CF13","FR0010221234","FR0000035784","FR0000064164","FR0000062671","FR0014005DA7","FR0004527638","FR0014003AQ4","ES0105029005","ES0105553004","FR0004034593","FR0000031973","FR0012300424","FR0013451333","FR0000062101","FR0011271600","FR0000061418","FR0000060535","FR0011665280","FR001400AEM6","FR0000062341","SN0000033192","FR0000060824","FR0000035123","FR0010487272","FR0000038184","CH0120879058","FR0000074759","FR001400GO75","FR0011476928","FR0013230067","FR0012419307","FR0000065930","FR0000038499","FR0010341032","FR0000033409","FR0011605617","FR0000053944","CI0000053161","FR0014005SB3","FR0000121147","FR0010485268","FR0013030152","FR0013222346","FR0010823724","FR0004187367","FR0010588079","FR0000053415","FR0011100759","FR0000030611","FR0000124414","FR0000034894","FR0013495298","FR0000053035","FR001400M1R1","FR0010040865","US3696043013","CH0308403085","FR0004163111","FR0004053510","FR0013183985","PTGVE1AE0009","FR0010533075","FR0000033888","FR0000066672","IT0005454167","IT0005454175","IT0005454134","FR0011052257","ES0105537007","FR0011208693","FR0010214064","FR0013204070","FR0000065971","FR0014005ZM5","FR00140069V2","FR0000076960","FR0000036675","FR0012819381","FR0004010338","FR0000075442","FR0013439627","FR0012612646","FR0010529719","FR0004155000","FR0013429404","FR0014000RP6","US36254L2097","FR0011726835","LU1840650458","FR0000032526","FR0000066722","FR0014007ND6","GB00BMDXQ672","FR0000066755","FR0014003VY4","ES0105498002","FR0000066540","FR0000052292","FR0004159473","FR0000038531","FR0000054231","FR0012821916","FR0010396309","DE000A11Q133","FR0000051302","FR0013451044","FR0012336691","FR0010312181","FR0014000U63","FR0000065278","FR0006226791","ES0105664009","FR0000053738","FR0004165801","FR0006563904","FR0014007LQ2","FR0004153930","FR0000064735","FR0005843125","FR0014001PM5","FR0014005IU4","FR0005854700","ES0105479002","FR0000035081","FR001400A3Q3","FR0010929125","FR0000051393","FR0000079691","FR0000062184","ES0105551008","FR00140048X2","IT0005380602","FR0010086371","FR0000120859","FR0006859039","FR0013060100","FR0000033243","FR0013470168","FR0000065773","ES0105590006","FR0000066219","FR0011158823","FR0000071797","ES0105511002","ES0105473005","FR0010331421","FR0000064297","IT0005391161","FR0000060451","FR0010908723","FR0014003FN0","FR0004024222","FR0000064958","FR0011179886","FR0013233012","BE0974299316","ES0105417002","FR0010259150","FR0000073298","ES0109429037","FR0000072597","IT0005336521","FR0004026151","FR0012872141","FR0000033904","FR0000077919","FR0010680033","ES0105636007","FR0010722819","FR0004007813","FR0000121485","FR0013156007","FR0004029411","FR0013374667","FR0011038348","FR0000121964","ES0105425005","FR0013419876","FR0000120321","NL0012191662","FR0000075343","FR0000066607","FR0000130213","FR0004027068","FR0013308582","FR001400JY13","FR0006864484","FR0013204336","FR0000121295","FR0000065484","FR001400MMI2","FR0010307819","FR001400F2Z1","FR0007080254","FR0000033599","FR0014009YQ1","FR0004156297","FR0000050353","BE0974334667","ES0105089009","FR0004170017","FR0004155208","FR0000044943","FR0006205019","FR0011884378","FR0000038242","FR0000121014","FR00140085W6","FR0013270626","FR0012634822","FR0010328302","FR0010827741","FR0000061657","FR0011092089","FR0013153541","ES0105463006","FR0000030074","FR0000038606","ES0105447009","FR0013400835","MA0000011488","FR0004155687","FR0013472446","FR0010609263","FR0000051070","FR0000060873","FR0011742329","FR0010844464","FR0000064404","IT0005324105","FR0011049824","FR0004065605","IT0004844848","FR0010298620","FR0010241638","ES0105559001","FR0000039620","FR0004177046","FR0010492181","FR00140066X4","FR0011217710","BE0974328602","FR0000053225","IT0005450819","FR0010204453","FR0010353888","FR001400AJ45","FR0000077570","FR0010500363","FR0013053535","FR0004172450","FR00140050Q2","FR001400H3A0","FR0000076986","BE0003853703","ES0105549002","FR0011033083","FR0004034320","FR0013462231","ES0105697009","FR001400IE67","FR0013482791","FR0014003J32","FR0011341205","FR0011675362","FR0011636083","FR001400MV37","FR0004154060","FR0000072993","FR0004050250","FR0000044448","FR0010112524","FR0004171346","FR0014003XT0","FR0012650166","FR0013018124","FI0009000681","ES0105719001","FR0010397232","FR0000185464","FR0014001PV6","FR0000121691","FR0000064529","FR0004065639","FR0014003711","FR0013310281","FR0000052680","ES0105698007","FR0010428771","FR0014003T71","FR001400CM63","FR0013266772","FR0004174712","FR0000133308","FR0000075392","ES0105490009","FR0013318052","FR0010609206","ES0105534004","FR0000184798","FR0012127173","FR001400IUV6","FR0013231180","FR0014005HJ9","FR0000077992","FR0010263202","FR0004038263","FR0006823092","NL0012650535","FR0000038465","FR0011027135","FR0013479730","FR0000120693","FR0000061459","ES0105612008","NL0015001HZ9","FR0000064784","FR001400N1P4","FR001400K4B1","FR0000185480","BE0948608451","FR001400B4H9","FR001400B4G1","FR0000073041","FR0000061608","FR001400JX97","FR0000030769","FR0010785790","FR0011844067","FR0013252186","FR0000124570","NL0015001W49","FR0000066441","FR0013015583","FR0012432516","FR0014004EC4","FR0010169920","FR0004044600","FR0004052561","FR0010313486","FR0012613610","FR0010380626","FR0013398617","FR0000061376","FR0000130577","FR0000120560","ES0105118006","FR0011648971","FR0010889386","IT0005466963","FR0000060618","FR0000044471","GB00BM9PTW47","FR0011858190","FR0000130395","FR0000131906","ES0105550000","FR0010820274","FR0010451203","FR0000075954","FR0000039091","FR0000045619","FR0000045601","FR0013344173","FR0010523167","FR0013477593","FR0000037640","FR0013269123","FR0000121709","FR001400F1V2","FR0000073272","ES0105651006","FR0000125007","FR001400M7D8","FR0000060121","FR0000060071","FR0000120578","FR001400M6Z3","FR0010776617","FR0013154002","FR0000120107","FR0013155975","FR0006239109","FR0010972091","AN8068571086","FR0000121972","ES0105592002","FR0010411983","FR0000039109","GB00B5ZN1N88","IT0005353484","FR0000065492","FR0004175842","IT0005072811","FR0012596468","NL0010623518","FR0011950682","LU0088087324","FR0013006558","FR0010202606","FR0000060790","FR0000074122","FR0010679365","CI0000000832","FR0010812230","FR0014005I80","FR0011131788","FR0010649228","FR001400LBS6","FR0013214145","FR0004016699","FR0010209809","FR0000130809","FR0000121220","FR0000078321","FR0000065864","FR0013227113","FR00140006O9","FR0013379484","BE0003470755","FR0000050809","FR00140043Y1","FR0000054371","FR0012757854","FR0011464452","FR001400BVK2","FR0011289040","FR0000054199","FR0000064271","NL00150001Q9","FR001400MDW2","NL0000226223","FR0000074775","FR0010528059","FR001400DG11","FR001400DGA0","FR0000063976","GB00B8GJBS16","FR0004180578","BE0974464977","FR0000032658","FR0004188670","IT0005507857","FR0000063307","NL0014559478","FR0000051807","CH0008175645","FR0011076595","FR001400BMH7","FR0014000TB2","FR0000054900","FR001400M3E5","FR0013295789","FR0000121329","GRS528003007","FR0011053636","FR0010120402","FR0013286259","BE0974387194","FR0013333432","FR0013230612","FR0000066482","BE0974338700","NL0015000YE1","NL0015001SR3","FR001400H2X4","LU0394945660","FR00140062B9","FR0000120271","GA0000121459","FR0000033003","FR0000036816","FR0000031866","FR0005175080","FR0005691656","FR0010397901","FR0000031106","FR0004175099","FR0010383877","FR0010654087","FR0000079147","FR0000054470","GB00BJ9M4V82","FR0011776889","FR0013326246","FR0000054215","FR0000074197","FR0012709160","FR0010337865","ES0105748000","FR0011898584","FR0013254851","FR0013176526","FR0010095596","FR0013506730","FR00140030K7","FR0004056851","ES0105623005","FR0013505062","FR0013526225","FR0014007T10","FR0010766667","FR0000124141","FR0013530102","FR0013447729","FR001400JXA2","FR0010291245","FR0006174496","FR0014003I41","FR0004186856","FR0010326090","FR0000031775","FR0000050049","FR0000125486","FR001400AXT1","FR0000031577","ES0105704003","FR0004029478","FR0014003O76","FR0013481835","FR0010309096","FR0000127771","FR0011532225","FR0011995588","FR0004045847","FR0000062796","ES0105492005","FR0010282822","FR0012532810","FR0010131409","FR0013357621","FR0013079092","FR0010688465","FR0010688440","FR0004152700","FR0000121204","FR0010768770","ES0105399002","FR0014000P11","FR0013143872","FR00140047H7","FR0011981968","BE0974310428","FR0004034072","ZM0000000037","BMG9887P1068"],["ALXP","ALXP","ALXP","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XBRU, XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","XMLI","XPAR","ALXP","XPAR","ALXP","XPAR","XPAR, XAMS","ALXP","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XMLI","XMLI","XMLI","ALXP","ALXP","XPAR, XAMS","XPAR","XPAR","ALXP","XPAR","XPAR","ALXP","XPAR","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","ALXP","XMLI","ALXP","XPAR","XPAR","XMLI","XPAR","XAMS, XBRU, XPAR","XMLI","ALXP","XPAR","XAMS, XPAR","ALXP","ALXP","XMLI","XMLI","XMLI","XPAR","XMLI","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","XPAR","XMLI","XPAR","XMLI","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","XMLI","XMLI","ALXP","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","ALXP","XMLI","XMLI","XPAR","XPAR","ALXP","XPAR","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","ALXP","XBRU, XPAR","ALXP","XPAR","XMLI","ALXP","XPAR","ALXP","XMLI","XPAR","XPAR","XPAR","XMLI","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","XPAR","XPAR","ALXP","XBRU, XPAR","ALXP","XPAR","XMLI","XPAR","XMLI","XMLI","XPAR","ALXP","XPAR","XMLI","XPAR","ALXP","XMLI","XPAR","XPAR","ALXP","XMLI","XPAR","XPAR","ALXP","ALXP","ALXP","XPAR","ALXP","XMLI","XPAR","XMLI","XMLI","XMLI","XMLI","XMLI","XMLI","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","ALXP","ALXP","ALXP","XMLI","ALXP","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","ALXP","ALXB, ALXP","ALXP","XPAR","ALXP","ALXP","ALXP","ALXP","XMLI","XMLI","ALXP","XMLI","XMLI","XMLI","XMLI","ALXP","ALXP","XPAR","ALXP","XMLI","XMLI","XMLI","ALXP","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XMLI","XMLI","ALXP","ALXP","ALXP","ALXP","ALXP","XPAR, XBRU","ALXP","ALXP","ALXP","ALXP","ALXP","ALXP","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XMLI","XMLI","XPAR, XAMS, XBRU","ALXP","ALXP","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XMLI","ALXP","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","XMLI","XPAR","XMLI","ALXP","ALXP","XPAR","XMLI","ALXP","XPAR","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","XMLI","ALXP","XPAR","XMLI","XMLI","XPAR","ALXP","XPAR","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","XPAR","ALXP","XPAR","XMLI","XMLI","XMLI","ALXP","XMLI","ALXP","XPAR","ALXP","XPAR","ALXP","ALXP","XMLI","XPAR","ALXP","XPAR","ALXP","ALXP","XPAR","XMLI","XPAR","ALXP","ALXP","XPAR","XPAR","XMLI","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XMLI","ALXP","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","XMLI","XMLI","ALXP","XMLI","XMLI","ALXP","ALXP","XMLI","XMLI","XMLI","XPAR","XMLI","ALXP","ALXP","XMLI","XMLI","ALXP","ALXP","ALXP","XMLI","XPAR","ALXP","XPAR","XPAR","XMLI","ALXP","XMLI","ALXP","ALXP","XMLI","XPAR","XMLI","ALXP","XPAR","ALXP","XMLI","XMLI","XPAR","XMLI","XPAR","XMLI","XMLI","XPAR","ALXP","XMLI","ALXP","ALXP","XMLI","XPAR","XPAR","ALXP","XPAR","ALXP","XMLI","XPAR","XPAR","ALXP","ALXP","XMLI","XPAR","XPAR","XPAR","XPAR","XMLI","XMLI","ALXP","XPAR","XPAR","ALXP","ALXP","ALXP","ALXP","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","ALXP","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP, ALXB","ALXP","XPAR","XMLI","ALXP","XMLI","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","XMLI","XMLI","XMLI","XPAR","ALXP","XPAR","XPAR","XMLI","ALXP","XPAR","ALXP","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","ALXP","XPAR","XMLI","XPAR","XPAR","XMLI","XPAR","XPAR","XMLI","ALXP","ALXP","XMLI","XPAR","ALXP","ALXP","ALXP","XPAR","ALXP","XMLI","ALXP","ALXP","ALXP","ALXP","XPAR","XBRU, XPAR","XMLI","ALXP","ALXP","ALXP","XMLI","XPAR","XPAR","ALXP","XPAR","XPAR","ALXP","ALXP","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","ALXP","XPAR","XMLI","ALXP","XMLI","XPAR","XPAR","ALXP","ALXP","ALXP","XMLI","XPAR","XMLI","XPAR","ALXP","ALXP","ALXP","XMLI","XPAR","XPAR","XMLI","ALXP","XPAR","XMLI","XPAR","XPAR","ALXP","ALXP","XPAR","XMLI","XPAR","XPAR","XMLI","XMLI","XPAR","XPAR","ALXP","XPAR","XPAR","XMLI","XMLI","XPAR","ALXP","XPAR","XMLI","XMLI","XPAR","XPAR","XPAR","ALXP","ALXP","XMLI","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","ALXP","XPAR","ALXP","XPAR","ALXP","ALXP","XMLI","XPAR","XPAR","ALXP","ALXP","ALXP","ALXP","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XMLI","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","ALXP","ALXP","XPAR","XPAR","ALXP","XPAR","XMLI","XPAR, XAMS, XBRU","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XMLI","XPAR","XMLI","XPAR","XPAR","XMLI","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XMLI","ALXP","XMLI","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","XMLI","XMLI","ALXP","ALXP","XMLI","XMLI","XMLI","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","XBRU, XPAR","XPAR","ALXP","XMLI","XPAR","ALXP","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","ALXP","ALXP","XMLI","XMLI","XPAR","XBRU, XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XMLI","ALXP","ALXP","ALXP","ALXP, ALXB","XPAR","XPAR","XPAR","XBRU, XPAR","ALXP","ALXP","ALXP","ALXP","ALXP","XPAR, XBRU","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","ALXP","XMLI","ALXP","ALXP","ALXP","ALXP","XPAR","XMLI","XMLI","XPAR","XPAR","XPAR","ALXP","ALXP","XMLI","ALXP","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","XMLI","ALXP","XPAR","ALXP","XPAR","ALXP","XPAR","XMLI","XMLI","XPAR","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","ALXP","ALXP","ALXP","XPAR","XPAR","ALXP","XPAR","ALXP","XPAR, XBRU","XMLI","XPAR","XPAR","ALXP","XPAR","ALXP","XMLI","ALXP","XMLI","XPAR","XMLI","XMLI","ALXP","ALXP","XMLI","XPAR","XPAR","XPAR","XMLI","XPAR"],["€25.60","€4.28","€0.864","€3.30","€3.72","€13.70","€1.104","€11.40","€9.70","€6.00","€0.382","€37.96","€0.0007","€1.34","€3.80","€4.90","€1.50","€0.0635","€0.394","€9.75","€0.0074","€129.80","€1.32","€1.44","€15.90","€13.35","€2.80","€0.02","€1.395","€1.795","€0.35","€1.94","€3.00","€1.355","€0.047","€11.108","€185.40","€145.86","€5.40","€14.20","€10.30","€0.604","€5.475","€0.0006","€14.16","€0.727","€11.945","€24.40","€75.00","€458.00","€137.50","€0.544","€11.00","€0.08","€0.1955","€0.08","€0.444","€3.30","€60.50","€3.20","€15.99","€28.70","€70.00","€3.66","€3.88","€24.35","€0.0764","€4.46","€180.00","€72.00","€8.75","€79.90","€2.97","€96.70","€14.60","€14.00","€5.10","€4","€8.263","€0.06","€3.06","€54.60","€9.85","€0.139","€4.62","€41.60","€2.171","€40.05","€4.20","€6.50","€0.0015","€5.00","€4.85","€0.155","€31.175","€29.80","€29.70","€0.625","€0.052","€15.30","€104.50","€0.772","€7.20","€1.50","€47.10","€19.00","€1.568","€8.00","€3.98","€14.76","€12.24","€3.48","€69.25","€2.70","€14.66","€2.47","€104.40","€0.0042","€0.004","€0.0003","€0.032","€6.10","€155.00","€8.00","€1.185","€55.90","€25.70","€0.324","€35.56","€6.25","€9.94","€12.00","€0.0006","€45.00","€4.58","€34.81","€34.12","€1.50","€25.14","€390.00","€63.61","€2.18","€8.86","€6","€7.50","€217.70","€24.50","€4.21","€15.14","€6.30","€16.48","€0.4264","€5.48","€9.20","€289.00","€0.3845","€0.002","€3.62","€16.38","€2.498","€0.361","€2.76","€0.54","€1","€0.3805","€735.00","€6","€11.92","€3.84","€6.00","€58.50","€780.00","€0.0145","€127.00","€2.63","€1.741","€124.50","€2.16","€1.50","€12.83","€330.00","€8.20","€9.35","€4.56","€4.60","€1.98","€1","€12.50","€70.00","€3.86","€16.60","€9.00","€0.08","€11.12","€3.48","€126.00","€42.02","€16.30","€70.90","€80.70","€17.66","€59.00","€52.26","€55.00","€61.71","€13.40","€72.04","€65.00","€117.00","€74.10","€12.516","€3.79","€8.65","€0.0328","€0.0005","€0.001","€0.0005","€13.15","€9.00","€3.07","€61.70","€182.10","€42.745","€2.86","€1.17","€1.362","€2.155","€0.0005","€30.70","€37.80","€71.80","€4.294","€10.30","€0.0038","€1.14","€0.0215","€22.20","€486.00","€0.0009","€4.17","€0.009","€0.0015","€0.70","€1.50","€0.78","€1.56","€86.00","€13.00","€1.25","€3.76","€0.93","€49.90","€12.55","€0.18","€0.68","€0.20","€0.62","€97.30","€4.14","€117.50","€3.30","€2.50","€21.20","NANA","€7.70","€1.015","€3.00","€0.682","€0.009","€0.59","€14.53","€0.406","€1.745","€8.14","€0.80","€2.92","€5.08","€47.15","€60.00","€0.16","€154.70","€189.44","€77.25","€0.262","€3.44","€77.05","€3.50","€6.576","€17.00","€25","NANA","€57.40","€2.30","€1","€83.45","€0.365","€0.001","€3.83","€2.24","€155.00","€21.40","€17.00","€57.40","€112.00","€1.995","€19.80","€0.04","€14.00","€0.476","€38.74","€1","€0.70","€28.00","€180.00","€5.48","€6.96","€11.20","€58.00","€0.092","€2.92","€0.55","€0.112","€33.40","€19.30","€1.80","€24.00","€0.25","€13.34","€0.615","€0.159","€35.00","€69.00","€4.10","€7.50","€650.00","€2.275","€13.86","€115.00","€42.40","€0.005","€0.04","€3.32","€26.80","€94.50","€0.73","€15.10","€3.47","€95.50","€0.3204","€93.00","€2.48","€93.70","€137.00","€1.16","€3.305","€3.98","€0.406","€0.0245","€15.52","€228.00","€22.80","NANA","€4.80","NANA","€1.928","€4.92","€1.13","€57.40","€8.30","€27.05","€5.00","€2.38","€26.00","€74.20","€31.05","€1.21","€18.54","€18.40","€20.90","€0.01","€1.848","€5.56","€0.45","€0.55","€126.30","€0.454","€29.45","€4.78","€0.475","€47.40","€2.58","€7.78","€1.43","€29.20","€2","€19.85","€5.64","€2.86","€7.54","€16.00","€115.00","€63.00","€9.10","€16.40","€8.25","€0.20","€17.35","€4","€3.24","€25.00","€2.92","€204.00","€13.30","€0.0142","€700.00","€103.00","€14.00","€3.36","€6.80","€4.62","€28.90","€9.92","€318.50","€66.40","€0.312","€183.00","€11.43","€1.40","€1.12","€0.36","€32.32","€45.00","€1.85","€46.60","€0.0686","€6.10","€13.20","€60.50","€2.00","€46.70","€17.90","€1.62","€2.255","€6.12","€1.58","€298.00","€0.888","€115.00","€49.90","€2.90","€0.319","€3.05","€7.36","€18.74","€103.80","€60.20","€3.00","€29.60","€8.80","€3.94","€6.10","€18.66","€19.03","€0.64","€3.40","€19.12","€29.45","€429.70","€0.868","€6.70","€0.087","€2.45","€23.90","€0.79","€6.66","€444.55","€7.20","€4.60","€27.70","€20.55","€41.10","€2.30","€0.015","€124.50","€133.00","€93.00","€31.70","NANA","€89.48","€0.94","€58.50","€3.415","€4.70","€66.40","€23.10","€0.435","€1.06","€22.10","€15.10","€0.984","€14.80","€0.4285","€13.44","€821.60","€19.40","€3.44","€7.34","€7.00","€4.20","€198.00","€1.98","€4.53","€10.90","€620.00","€21.80","€8.30","€0.51","€8.75","€0.009","NANA","€0.4175","€5.01","€2.95","€2.232","€0.78","€9.80","€1.04","€3.82","€8.86","€4.30","€8.32","€10.27","€18.55","€36.20","€0.327","€8.50","€1.36","€2.82","€0.108","€12.55","€14.90","€5.70","€14.48","€33.69","€1.215","€0.158","€1.60","€3.28","€0.80","€8.00","€7","€77.40","€9.95","€21.75","€7.78","€0.71","€3.55","€0.72","€1.504","€1.16","€6.11","€23.62","€0.0697","€1.44","€0.958","€0.0385","€44.20","€94.35","€14.20","€0.65","€2.045","€0.70","€0.444","€3.2435","€5.40","€0.555","€7.20","€59.00","€7.72","€47.40","€26.40","€6.88","€0.20","€11.25","€12.00","€2.20","€4.43","€1.32","€0.52","€3.18","€10.846","€6.60","€13.60","€0.58","€0.416","€1.32","€0.0129","€3.345","€7.29","€11.50","€9.09","€8.00","€45.40","€2.61","€10.00","€0.29","€5.30","€18.35","€2.30","€158.25","€98.40","€0.71","€4.50","€105.00","€0.559","€2.94","€0.825","€0.135","€0.101","€0.20","€1.27","€16.00","€0.3764","€496.00","€4.58","€0.01","€3.05","€10.41","€26.185","€13.85","€5.25","€0.4815","€34.10","€4.38","€5.60","€0.0675","€8.75","€0.99","€0.1855","€0.0005","€25.00","€97.56","€19.22","€18.90","€0.1032","€4.04","€4.34","€0.1004","€18.20","€0.0968","€14.95","€98.80","€36.98","€7.00","€3.24","€24.24","€2.73","€795.00","€188.00","€745.00","€48.30","€1.69","€0.01","€13.80","€24.52","€112.40","€0.0019","€189.20","€1.1385","€68.42","NANA","€19.00","€202.00","€87.37","€82.90","€5.70","€248.60","€51.20","€29.00","€8.90","€4.00","€45.42","€202.50","€5.65","€27.79","€118.60","€11.30","€0.25","€0.29","€87.00","€0.81","€0.829","€0.0115","€5.93","€5.955","€1.00","€160.50","€18.70","€70.10","€0.416","€2.20","€0.70","€3.28","€0.0145","€0.04","€16.998","€2.74","€27.50","€1.74","€22.25","€74.86","€1.41","€18.90","€139.35","€0.0803","€2.212","€24.04","€211.60","€0.41","€8.50","€31.28","€0.252","€0.0014","€42.00","€0.0662","€120.00","€23.545","€9.603","€40.995","€6.50","€23.90","NANA","NANA","€8.00","€0.01","€36.05","€84.93","€33.10","€9.92","€6.18","€1.21","€19.755","€133.35","€62.00","€3.00","€0.988","€0.001","€8.52","NANA","€45.00","€134.85","€1.93","€0.10","€0.422","€0.76","€1.14","€80.40","€21.05","€86.00","€26.20","€0.353","€0.0301","€0.531","€2.30","€0.65","€58.92","€158.60","€4.94","€12.20","€5","€1.10","€146.80","€5.10","€3.70","€3.80","€4.00","€11.20","€1.04","€22.60","€0.22","€3.20","€69.08","€955.00","€0.60","€1.70","€2.50","NANA","€3.90","€3.91","€10.855","€0.12","€13.08","NANA","€3.277","€6.00","€0.1408","€0.0018","€27.80","€14.70","€30.02","€0.237","€34.02","€0.832","€0.513","€8.70","€0.99","€100.80","€14.20","€34.10","€7.86","€115.14","€4.95","€347.00","€7.25","€35.50","€0.96","€0.2428","€11.40","€10.195","€5.34","€7.85","€131.00","€15.95","€3.75","€152.00","€20.30","€9.15","€53.50","€17.00","€2.42","€25.00","€0.392","€87.25","€0.44","€3.00","€5.00","€4.08","€3.50","€11.55","€7.43","€4.12","€1.38","€0.20"],[null,-8.15,1.65,-3.23,-6.06,2.62,-10.1,3.07,null,1.69,null,0.29,null,null,-3.8,10.11,18.11,0.79,-3.19,-2.11,-3.9,2.04,null,-8.28,-0.63,0.38,26.13,100,3.33,8.13,12.18,null,4.17,0.74,3.3,1.63,-0.25,0.62,-0.92,null,1.98,-3.51,0.18,null,0.28,null,4.41,0.83,-0.13,null,-4.58,-3.89,null,null,null,-5.88,0.68,0.61,0.25,-0.31,-7.36,-0.73,null,-3.17,-0.26,-0.29,-1.04,1.13,-3.74,-18.18,null,-0.75,null,0.27,null,0.72,17.24,-0.81,0.01,20,-4.38,0.37,null,0.43,4.52,null,0.51,null,-1.18,-1.52,7.14,null,-2.02,3.33,0.03,0.68,0.68,null,null,null,0.48,-0.39,null,null,0.43,-3.55,-0.38,-3.03,-0.5,null,1.16,0.58,1.91,null,1.66,2.07,0.68,-2.33,null,null,5.96,-4.54,null,null,-0.42,0.72,-1.15,20.9,-0.11,-0.48,1.02,null,20,-8.54,0.88,0.69,null,-7.41,-0.4,1.83,0.03,-0.46,null,-1.52,0.81,-0.5,null,-2.21,1.2,null,4.93,6.81,0.74,-0.65,-4.3,-0.52,null,0.56,null,0.64,-0.82,null,null,4.12,1.3,null,-2.31,null,null,-14.29,10.38,0.06,-3.33,-0.78,1.54,18.44,-0.4,72.8,-3.85,1.34,0.61,1.23,-1.06,-4.6,null,22.22,-0.14,-3.85,null,-4.93,null,null,null,-3.29,-0.57,-3.08,1.4,null,-0.35,null,-0.23,null,0.04,-0.9,-0.45,-0.22,-1.32,-1.07,0.33,0.14,0.61,-2.82,3.59,-6.29,null,null,null,-0.75,-5.26,-0.32,0.03,-0.27,-0.82,-14.5,5.79,1.41,0.47,-87.5,1.32,-5.5,-0.97,4.73,-1.9,null,null,-2.27,2.78,null,null,-5.66,-2.17,50,null,null,-0.26,null,null,null,-66.22,0.27,-11.43,-11.46,0.4,-10,1.49,null,4.38,0.91,-1.43,0.86,null,0.64,1.63,null,10,0.5,-0.66,-2.29,-1.1,null,0.58,null,-0.85,-1.21,-1.23,-28.08,null,-2.08,0.5,-5.6,1.05,0.49,4.89,null,null,-0.64,null,2.62,-2.3,11.61,null,-0.31,-0.86,null,1.09,-5.19,-9.09,-2.49,2.28,-3.13,-0.47,-1.96,null,0.9,null,null,-28.57,-23.91,null,0.05,0.59,-5.02,0.72,-1.64,2.24,-0.29,null,-2.52,null,-27.36,null,null,null,-1.03,null,1.27,8.7,-0.45,-11.51,null,-0.28,0.29,5.67,null,-7.8,0.44,9.31,0.44,0.12,null,33.33,0.61,null,-10,null,null,0.58,-1.55,0.13,null,-3.88,0.21,null,5.94,-3.5,-0.5,-0.49,53.13,0.62,null,0.88,null,-9.43,null,0.52,null,1.8,-1.71,0.61,0.19,1.21,2.15,null,0.27,null,null,1.64,5.14,null,null,0.11,null,null,129.17,-1.48,null,-4.07,-2.15,-6.86,-0.42,-0.39,-3.23,null,null,0.41,null,-0.7,2.14,3.01,null,2.68,-3.08,1.11,0.61,-5.71,217.97,-0.29,2.22,15.71,17.92,-2.67,-7.27,-0.37,-5.33,1.45,1.98,null,1.82,3.82,null,0.56,0.61,-0.16,0.3,0.65,null,null,-0.71,null,null,2.28,-3.43,-5.13,-0.43,1.63,-2.4,null,null,null,-0.85,null,null,-1.53,1.66,-0.63,2.05,-3.48,-8.73,0.1,null,null,-0.97,15,null,-1.7,-0.74,null,-0.67,null,-1.01,1.67,2.41,0.21,null,null,null,0.68,0.35,-1.36,-2.33,2.84,0.82,0.84,null,-1.77,0.21,null,-3.36,-1.07,-0.24,2.49,-4.17,null,1.63,2.7,0.43,-3.21,null,0.45,-2.08,null,-3.53,0.86,0.3,0.87,-8.61,-5.36,2.31,null,5.35,9.63,-0.23,6.5,0.17,1.04,-0.58,-3.42,-1.41,null,null,null,-0.44,null,null,0.46,null,-0.97,null,-2.17,null,-1.07,1.95,-2.32,1.18,-1.27,0.51,-0.95,-1.55,0.68,null,-1.19,0.69,null,0.56,-4.66,null,null,-1.05,-40,null,-2.61,null,0.28,1.08,4.74,-1.25,null,1.23,-1.23,null,-1.35,0.39,null,null,-0.26,-5.33,null,-5.28,-1.57,-2.93,null,-2.15,0.87,-6.49,-0.21,-0.77,null,4.2,0.71,6.21,null,-2.51,-0.22,0.02,null,-0.72,-13.25,-0.84,0.78,-0.84,-1.49,-0.86,-16.67,-0.44,null,-1.35,0.68,-2.22,4,2.58,-0.53,-0.6,null,-4.92,3.74,5.6,0.78,-3.04,1.1,null,-2.88,null,null,-0.76,null,20.83,null,0.82,null,1.54,-0.61,9.23,-6.25,0.57,-31.83,-10.23,14.58,null,0.5,null,1.6,-1.23,-10.17,null,1.78,-50,null,2.87,-1.56,-1.07,1.94,-3.7,-0.87,-2.67,-3.78,12.5,null,1.12,-4.38,null,null,-0.57,0.42,null,-6.35,null,null,-4.2,null,-2.91,-1.64,0.37,1.37,null,-3.71,0.71,-0.73,0.38,-11.74,0.68,0.63,-5.06,-9.09,2.99,0.66,0.09,5.56,-0.66,null,0.18,null,null,0.5,0.28,1.34,18.75,-0.28,-0.39,-3.33,2.89,5.26,0.96,0.67,2.73,-0.36,0.51,4,-7.41,7.41,0.58,-33.06,-1.31,null,-0.17,-0.75,-3.85,-0.62,null,null,30,15.79,-0.57,-1.2,null,null,-15.85,-1.79,-0.72,-2.79,0.45,-1.06,null,0.53,-0.68,null,-0.36,-0.21,-1.21,-13.68,null,2.02,null,16.67,0.48,-0.6,-0.17,0.64,-3.78,0.12,null,null,null,null,-3.61,null,-0.41,0.77,-1.19,2.48,null,null,0.69,-0.41,4.2,null,-1.2,-90,-1.16,null,1.12,-0.22,-13.84,-1.19,-12.08,2.43,null,-1.71,0.96,null,1.55,-5.87,0.33,-1.67,19.79,-2.99,0.55,0.89,0.82,-9.29,-3.7,-3.17,1.31,2,20.92,null,null,-0.88,-9.57,-1.65,-18.52,23.08,-0.8,null,0.84,-3.41,-2.34,null,-1.27,-2.25,3.68,-4,0.81,null,-0.12,null,-2.22,null,null,3.89,0.91,-10.9,0.12,7.91,-4.65,null,10.61,0.6,7.58,0.74,-0.25,0.61,-0.99,-0.29,0.69,null,1.05,1.17,4.59,-0.29,null,-0.51,-0.38,0.31,null,-1.04,-3.56,-4.59,-1.11,2.41,null,null,null,-0.74,null,11.11,-4.58,-0.97,-28.57,0.43,1.57,3,-1.43,null],["https://live.euronext.com/en/product/equities/FR0010285965-ALXP","https://live.euronext.com/en/product/equities/FR0013341781-ALXP","https://live.euronext.com/en/product/equities/FR0000076887-ALXP","https://live.euronext.com/en/product/equities/FR0010557264-XPAR","https://live.euronext.com/en/product/equities/FR0004040608-XPAR","https://live.euronext.com/en/product/equities/FR0013185857-XPAR","https://live.euronext.com/en/product/equities/FR0012616852-XPAR","https://live.euronext.com/en/product/equities/FR0012333284-XPAR","https://live.euronext.com/en/product/equities/FR001400AHX6-XPAR","https://live.euronext.com/en/product/equities/BE0974278104-XBRU","https://live.euronext.com/en/product/equities/FR0000064602-XPAR","https://live.euronext.com/en/product/equities/FR0000120404-XPAR","https://live.euronext.com/en/product/equities/FR001400JAP8-ALXP","https://live.euronext.com/en/product/equities/FR0000076861-XPAR","https://live.euronext.com/en/product/equities/FR0000076655-ALXP","https://live.euronext.com/en/product/equities/FR0014005OJ5-ALXP","https://live.euronext.com/en/product/equities/FR0010979377-XMLI","https://live.euronext.com/en/product/equities/BE0974269012-XPAR","https://live.euronext.com/en/product/equities/FR0013284627-ALXP","https://live.euronext.com/en/product/equities/FR0011184241-XPAR","https://live.euronext.com/en/product/equities/FR001400JAL7-ALXP","https://live.euronext.com/en/product/equities/FR0010340141-XPAR","https://live.euronext.com/en/product/equities/FR0012821890-XPAR","https://live.euronext.com/en/product/equities/FR0013296746-ALXP","https://live.euronext.com/en/product/equities/FR0000053043-ALXP","https://live.euronext.com/en/product/equities/FR0014007ZB4-XPAR","https://live.euronext.com/en/product/equities/US00774B2088-XPAR","https://live.euronext.com/en/product/equities/FR001400FL38-XPAR","https://live.euronext.com/en/product/equities/FR0013333077-XPAR","https://live.euronext.com/en/product/equities/FR0014005AC9-ALXP","https://live.euronext.com/en/product/equities/FR0011908045-XMLI","https://live.euronext.com/en/product/equities/FR0014005WE9-XMLI","https://live.euronext.com/en/product/equities/ES0105478004-XMLI","https://live.euronext.com/en/product/equities/FR0013452281-ALXP","https://live.euronext.com/en/product/equities/FR0010641449-ALXP","https://live.euronext.com/en/product/equities/FR001400J770-XPAR","https://live.euronext.com/en/product/equities/FR0000120073-XPAR","https://live.euronext.com/en/product/equities/NL0000235190-XPAR","https://live.euronext.com/en/product/equities/FR0014003V77-ALXP","https://live.euronext.com/en/product/equities/FR0000053027-XPAR","https://live.euronext.com/en/product/equities/FR0000062465-XPAR","https://live.euronext.com/en/product/equities/FR0014000JX7-ALXP","https://live.euronext.com/en/product/equities/FR0013258662-XPAR","https://live.euronext.com/en/product/equities/FR001400IV58-ALXP","https://live.euronext.com/en/product/equities/FR0000053324-XPAR","https://live.euronext.com/en/product/equities/FR0013421286-ALXP","https://live.euronext.com/en/product/equities/FR0010220475-XPAR","https://live.euronext.com/en/product/equities/FR0000053837-XPAR","https://live.euronext.com/en/product/equities/FR0000033219-XPAR","https://live.euronext.com/en/product/equities/FR0000039216-XPAR","https://live.euronext.com/en/product/equities/FR0000071946-XPAR","https://live.euronext.com/en/product/equities/FR0000061244-ALXP","https://live.euronext.com/en/product/equities/FR0010395681-XPAR","https://live.euronext.com/en/product/equities/FR0013253812-XMLI","https://live.euronext.com/en/product/equities/GB00BNKGZC51-ALXP","https://live.euronext.com/en/product/equities/NL0010273694-XMLI","https://live.euronext.com/en/product/equities/FR0011051598-ALXP","https://live.euronext.com/en/product/equities/FR0012789667-XPAR","https://live.euronext.com/en/product/equities/FR0004125920-XPAR","https://live.euronext.com/en/product/equities/ES0105744009-XMLI","https://live.euronext.com/en/product/equities/FR0014005AL0-XPAR","https://live.euronext.com/en/product/equities/LU0569974404-XAMS","https://live.euronext.com/en/product/equities/ES0105658001-XMLI","https://live.euronext.com/en/product/equities/FR0010340711-ALXP","https://live.euronext.com/en/product/equities/FR0014003U94-XPAR","https://live.euronext.com/en/product/equities/LU1598757687-XAMS","https://live.euronext.com/en/product/equities/FR001400KO61-ALXP","https://live.euronext.com/en/product/equities/FR0013398997-ALXP","https://live.euronext.com/en/product/equities/FR0005057635-XMLI","https://live.euronext.com/en/product/equities/FR0004070795-XMLI","https://live.euronext.com/en/product/equities/ES0105661005-XMLI","https://live.euronext.com/en/product/equities/FR0010481960-XPAR","https://live.euronext.com/en/product/equities/ES0105601001-XMLI","https://live.euronext.com/en/product/equities/FR0010313833-XPAR","https://live.euronext.com/en/product/equities/ES0105486007-XMLI","https://live.euronext.com/en/product/equities/FR0012185536-XPAR","https://live.euronext.com/en/product/equities/FR0000074783-XPAR","https://live.euronext.com/en/product/equities/FR0000076952-XPAR","https://live.euronext.com/en/product/equities/FR001400JWR8-XPAR","https://live.euronext.com/en/product/equities/FR0014003AC4-XPAR","https://live.euronext.com/en/product/equities/FR0012968485-XMLI","https://live.euronext.com/en/product/equities/FR0000074148-XPAR","https://live.euronext.com/en/product/equities/ES0105708004-XMLI","https://live.euronext.com/en/product/equities/FR0010478248-ALXP","https://live.euronext.com/en/product/equities/FR0011992700-XPAR","https://live.euronext.com/en/product/equities/FR0013455482-XPAR","https://live.euronext.com/en/product/equities/FR0000051732-XPAR","https://live.euronext.com/en/product/equities/FR0000063737-XPAR","https://live.euronext.com/en/product/equities/FR00140059B5-ALXP","https://live.euronext.com/en/product/equities/FR0000061780-XPAR","https://live.euronext.com/en/product/equities/FR0013410370-ALXP","https://live.euronext.com/en/product/equities/FR0000039232-XPAR","https://live.euronext.com/en/product/equities/FR0013183589-ALXP","https://live.euronext.com/en/product/equities/FR001400CFI7-XPAR","https://live.euronext.com/en/product/equities/FR0000120628-XPAR","https://live.euronext.com/en/product/equities/FR001400M7B2-XPAR","https://live.euronext.com/en/product/equities/FR0011040500-XPAR","https://live.euronext.com/en/product/equities/IT0004812258-XMLI","https://live.euronext.com/en/product/equities/PTAZR0AM0006-XMLI","https://live.euronext.com/en/product/equities/FR0013384369-ALXP","https://live.euronext.com/en/product/equities/MC0000031187-XPAR","https://live.euronext.com/en/product/equities/FR0013258399-XPAR","https://live.euronext.com/en/product/equities/FR0000062788-XPAR","https://live.euronext.com/en/product/equities/ES0105362000-XMLI","https://live.euronext.com/en/product/equities/FR0004023208-XPAR","https://live.euronext.com/en/product/equities/FR0000035370-XPAR","https://live.euronext.com/en/product/equities/FR0000035305-ALXP","https://live.euronext.com/en/product/equities/CH0451123589-XMLI","https://live.euronext.com/en/product/equities/CH1148983609-XMLI","https://live.euronext.com/en/product/equities/FR0014003FE9-XPAR","https://live.euronext.com/en/product/equities/FR0000035164-XPAR","https://live.euronext.com/en/product/equities/FR0000066961-ALXP","https://live.euronext.com/en/product/equities/FR0000120966-XPAR","https://live.euronext.com/en/product/equities/FR0000074072-XPAR","https://live.euronext.com/en/product/equities/FR0004174233-ALXP","https://live.euronext.com/en/product/equities/FR0013345493-ALXP","https://live.euronext.com/en/product/equities/FR0013280286-XPAR","https://live.euronext.com/en/product/equities/FR0012816825-ALXP","https://live.euronext.com/en/product/equities/FR0013507290-ALXP","https://live.euronext.com/en/product/equities/FR001400LN79-ALXP","https://live.euronext.com/en/product/equities/BE0974280126-XBRU","https://live.euronext.com/en/product/equities/FR0011005933-ALXP","https://live.euronext.com/en/product/equities/FR0000062150-XPAR","https://live.euronext.com/en/product/equities/FR0013340973-XMLI","https://live.euronext.com/en/product/equities/FR0011041011-ALXP","https://live.euronext.com/en/product/equities/FR0000131104-XPAR","https://live.euronext.com/en/product/equities/FR0011365907-ALXP","https://live.euronext.com/en/product/equities/FR0010106039-XMLI","https://live.euronext.com/en/product/equities/FR0000061129-XPAR","https://live.euronext.com/en/product/equities/FR0000039299-XPAR","https://live.euronext.com/en/product/equities/FR0000063935-XPAR","https://live.euronext.com/en/product/equities/BE6333353298-XMLI","https://live.euronext.com/en/product/equities/FR001400IAM7-ALXP","https://live.euronext.com/en/product/equities/FR0000054421-ALXP","https://live.euronext.com/en/product/equities/FR0000074254-XPAR","https://live.euronext.com/en/product/equities/FR0000120503-XPAR","https://live.euronext.com/en/product/equities/FR001400M3D7-XPAR","https://live.euronext.com/en/product/equities/FR001400AJZ7-ALXP","https://live.euronext.com/en/product/equities/FR0006174348-XPAR","https://live.euronext.com/en/product/equities/FR0000061137-XPAR","https://live.euronext.com/en/product/equities/FR0000045544-XPAR","https://live.euronext.com/en/product/equities/FR001400DIY6-ALXP","https://live.euronext.com/en/product/equities/FR0010151589-XPAR","https://live.euronext.com/en/product/equities/FR0000079659-XPAR","https://live.euronext.com/en/product/equities/FR0012969095-ALXP","https://live.euronext.com/en/product/equities/FR0000125338-XPAR","https://live.euronext.com/en/product/equities/FR0011648716-ALXP","https://live.euronext.com/en/product/equities/FR0010907956-ALXP","https://live.euronext.com/en/product/equities/FR0010828137-XPAR","https://live.euronext.com/en/product/equities/FR0000064156-XPAR","https://live.euronext.com/en/product/equities/FR0000120172-XPAR","https://live.euronext.com/en/product/equities/FR0000125585-XPAR","https://live.euronext.com/en/product/equities/FR0010193052-XPAR","https://live.euronext.com/en/product/equities/FR0000064446-ALXP","https://live.euronext.com/en/product/equities/US1491231015-XPAR","https://live.euronext.com/en/product/equities/FR0014007LW0-ALXP","https://live.euronext.com/en/product/equities/FR001400D0X2-ALXP","https://live.euronext.com/en/product/equities/FR0010193979-XPAR","https://live.euronext.com/en/product/equities/FR0000053506-XPAR","https://live.euronext.com/en/product/equities/FR0010425595-ALXP","https://live.euronext.com/en/product/equities/BE0974260896-XBRU","https://live.euronext.com/en/product/equities/FR0013178712-ALXP","https://live.euronext.com/en/product/equities/FR0000037475-XPAR","https://live.euronext.com/en/product/equities/MC0010000826-XMLI","https://live.euronext.com/en/product/equities/FR0013181864-XPAR","https://live.euronext.com/en/product/equities/FR0000037871-XMLI","https://live.euronext.com/en/product/equities/FR0000051567-XMLI","https://live.euronext.com/en/product/equities/FR0000130692-XPAR","https://live.euronext.com/en/product/equities/FR001400AJ60-ALXP","https://live.euronext.com/en/product/equities/FR0000060907-XPAR","https://live.euronext.com/en/product/equities/FR0010447086-XMLI","https://live.euronext.com/en/product/equities/FR0000130403-XPAR","https://live.euronext.com/en/product/equities/FR0000054322-ALXP","https://live.euronext.com/en/product/equities/FR0000060428-XMLI","https://live.euronext.com/en/product/equities/FR0013426004-XPAR","https://live.euronext.com/en/product/equities/FR0010386334-XPAR","https://live.euronext.com/en/product/equities/FR0004152882-ALXP","https://live.euronext.com/en/product/equities/FR0013406881-XMLI","https://live.euronext.com/en/product/equities/NL0010949392-XPAR","https://live.euronext.com/en/product/equities/FR0010667147-XPAR","https://live.euronext.com/en/product/equities/FR0013257409-ALXP","https://live.euronext.com/en/product/equities/FR0013335742-ALXP","https://live.euronext.com/en/product/equities/FR0011071570-ALXP","https://live.euronext.com/en/product/equities/FR0004031763-XPAR","https://live.euronext.com/en/product/equities/BE0160342011-ALXP","https://live.euronext.com/en/product/equities/FR0010959684-XMLI","https://live.euronext.com/en/product/equities/FR0000062234-XPAR","https://live.euronext.com/en/product/equities/BE6252013725-XMLI","https://live.euronext.com/en/product/equities/FR0000077828-XMLI","https://live.euronext.com/en/product/equities/FR00140007I9-XMLI","https://live.euronext.com/en/product/equities/ES0105660007-XMLI","https://live.euronext.com/en/product/equities/FR0010035816-XMLI","https://live.euronext.com/en/product/equities/FR0013371507-XMLI","https://live.euronext.com/en/product/equities/US2220702037-XPAR","https://live.euronext.com/en/product/equities/FR0004998318-XMLI","https://live.euronext.com/en/product/equities/FR0000065393-XPAR","https://live.euronext.com/en/product/equities/FR0000064578-XPAR","https://live.euronext.com/en/product/equities/FR0000060303-XPAR","https://live.euronext.com/en/product/equities/FR0000044323-XPAR","https://live.euronext.com/en/product/equities/FR0000185506-XPAR","https://live.euronext.com/en/product/equities/FR0010483768-XPAR","https://live.euronext.com/en/product/equities/FR0000045213-XPAR","https://live.euronext.com/en/product/equities/FR0010461053-XPAR","https://live.euronext.com/en/product/equities/FR0000045239-XPAR","https://live.euronext.com/en/product/equities/FR0000045551-XPAR","https://live.euronext.com/en/product/equities/FR0000185514-XPAR","https://live.euronext.com/en/product/equities/FR0000044364-XPAR","https://live.euronext.com/en/product/equities/FR0000045528-XPAR","https://live.euronext.com/en/product/equities/FR0000045346-XPAR","https://live.euronext.com/en/product/equities/FR0000045304-XPAR","https://live.euronext.com/en/product/equities/FR0000045072-XPAR","https://live.euronext.com/en/product/equities/FR0011716265-ALXP","https://live.euronext.com/en/product/equities/FR0000050395-XPAR","https://live.euronext.com/en/product/equities/FR0014004QR6-ALXP","https://live.euronext.com/en/product/equities/FR0013507977-ALXP","https://live.euronext.com/en/product/equities/FR0013507985-ALXP","https://live.euronext.com/en/product/equities/FR0013508009-ALXP","https://live.euronext.com/en/product/equities/FR0010404368-ALXP","https://live.euronext.com/en/product/equities/FR0000077885-XMLI","https://live.euronext.com/en/product/equities/FR0000185423-ALXP","https://live.euronext.com/en/product/equities/FR0000120644-XPAR","https://live.euronext.com/en/product/equities/FR0014004L86-XPAR","https://live.euronext.com/en/product/equities/FR0014003TT8-XPAR","https://live.euronext.com/en/product/equities/FR001400LO86-ALXP","https://live.euronext.com/en/product/equities/FR001400O218-ALXP","https://live.euronext.com/en/product/equities/FR0010417345-XPAR","https://live.euronext.com/en/product/equities/FR001400AYG6-XPAR","https://live.euronext.com/en/product/equities/FR0014004JF6-XPAR","https://live.euronext.com/en/product/equities/FR0000062978-XPAR","https://live.euronext.com/en/product/equities/FR0000054132-ALXP","https://live.euronext.com/en/product/equities/FR0013283108-ALXP","https://live.euronext.com/en/product/equities/FR0000053381-XPAR","https://live.euronext.com/en/product/equities/FR0000060840-ALXP","https://live.euronext.com/en/product/equities/FR001400IAQ8-ALXP","https://live.euronext.com/en/product/equities/FR0012202497-ALXP","https://live.euronext.com/en/product/equities/BE0974289218-ALXB","https://live.euronext.com/en/product/equities/FR0010436584-ALXP","https://live.euronext.com/en/product/equities/FR0000065260-XPAR","https://live.euronext.com/en/product/equities/FR0014004QZ9-ALXP","https://live.euronext.com/en/product/equities/FR0013331212-ALXP","https://live.euronext.com/en/product/equities/FR0013088606-ALXP","https://live.euronext.com/en/product/equities/FR0014007951-ALXP","https://live.euronext.com/en/product/equities/FR0000052920-XMLI","https://live.euronext.com/en/product/equities/LU0881232630-XMLI","https://live.euronext.com/en/product/equities/FR0014004339-ALXP","https://live.euronext.com/en/product/equities/HK0000038783-XMLI","https://live.euronext.com/en/product/equities/FR0007200100-XMLI","https://live.euronext.com/en/product/equities/FR0010536185-XMLI","https://live.euronext.com/en/product/equities/DE000A0XYM45-XMLI","https://live.euronext.com/en/product/equities/FR0013534617-ALXP","https://live.euronext.com/en/product/equities/FR0011490648-ALXP","https://live.euronext.com/en/product/equities/FR0010908533-XPAR","https://live.euronext.com/en/product/equities/IT0005351504-ALXP","https://live.euronext.com/en/product/equities/FR0000052755-XMLI","https://live.euronext.com/en/product/equities/FR0010882886-XMLI","https://live.euronext.com/en/product/equities/FR0010439265-XMLI","https://live.euronext.com/en/product/equities/FR0000072373-ALXP","https://live.euronext.com/en/product/equities/FR0000130452-XPAR","https://live.euronext.com/en/product/equities/FR0011466069-XPAR","https://live.euronext.com/en/product/equities/FR0000031023-XPAR","https://live.euronext.com/en/product/equities/FR0000035719-XPAR","https://live.euronext.com/en/product/equities/FR0011950732-XPAR","https://live.euronext.com/en/product/equities/FR0012435121-XPAR","https://live.euronext.com/en/product/equities/ES0105726006-XMLI","https://live.euronext.com/en/product/equities/ES0105639001-XMLI","https://live.euronext.com/en/product/equities/FR0013356755-ALXP","https://live.euronext.com/en/product/equities/FR0004030708-ALXP","https://live.euronext.com/en/product/equities/FR0013330792-ALXP","https://live.euronext.com/en/product/equities/FR0013399359-ALXP","https://live.euronext.com/en/product/equities/FR0011915339-ALXP","https://live.euronext.com/en/product/equities/FR0010208488-XPAR","https://live.euronext.com/en/product/equities/FR001400C2Z4-ALXP","https://live.euronext.com/en/product/equities/FR0014004974-ALXP","https://live.euronext.com/en/product/equities/FR0014004362-ALXP","https://live.euronext.com/en/product/equities/FR0010424697-ALXP","https://live.euronext.com/en/product/equities/FR0000045122-ALXP","https://live.euronext.com/en/product/equities/FR0010465534-ALXP","https://live.euronext.com/en/product/equities/FR0012882389-XPAR","https://live.euronext.com/en/product/equities/FR0000131757-XPAR","https://live.euronext.com/en/product/equities/FR0010211037-ALXP","https://live.euronext.com/en/product/equities/FR0000035818-ALXP","https://live.euronext.com/en/product/equities/FR0000121667-XPAR","https://live.euronext.com/en/product/equities/FR0000120669-XPAR","https://live.euronext.com/en/product/equities/FR0000061475-XPAR","https://live.euronext.com/en/product/equities/FR0010844001-ALXP","https://live.euronext.com/en/product/equities/FR0000121121-XPAR","https://live.euronext.com/en/product/equities/FR0000054678-XPAR","https://live.euronext.com/en/product/equities/FR0014008VX5-XPAR","https://live.euronext.com/en/product/equities/FR0013240934-ALXP","https://live.euronext.com/en/product/equities/FR0013256518-ALXP","https://live.euronext.com/en/product/equities/FR001400M7C0-XPAR","https://live.euronext.com/en/product/equities/FR0014000MR3-XPAR","https://live.euronext.com/en/product/equities/FR0010157115-XMLI","https://live.euronext.com/en/product/equities/ES0105586004-XMLI","https://live.euronext.com/en/product/equities/NL0006294274-XPAR","https://live.euronext.com/en/product/equities/FR0010490920-ALXP","https://live.euronext.com/en/product/equities/FR001400CF13-ALXP","https://live.euronext.com/en/product/equities/FR0010221234-XPAR","https://live.euronext.com/en/product/equities/FR0000035784-XPAR","https://live.euronext.com/en/product/equities/FR0000064164-ALXP","https://live.euronext.com/en/product/equities/FR0000062671-XPAR","https://live.euronext.com/en/product/equities/FR0014005DA7-XPAR","https://live.euronext.com/en/product/equities/FR0004527638-XPAR","https://live.euronext.com/en/product/equities/FR0014003AQ4-XPAR","https://live.euronext.com/en/product/equities/ES0105029005-ALXP","https://live.euronext.com/en/product/equities/ES0105553004-XMLI","https://live.euronext.com/en/product/equities/FR0004034593-ALXP","https://live.euronext.com/en/product/equities/FR0000031973-XPAR","https://live.euronext.com/en/product/equities/FR0012300424-XMLI","https://live.euronext.com/en/product/equities/FR0013451333-XPAR","https://live.euronext.com/en/product/equities/FR0000062101-XPAR","https://live.euronext.com/en/product/equities/FR0011271600-XPAR","https://live.euronext.com/en/product/equities/FR0000061418-XPAR","https://live.euronext.com/en/product/equities/FR0000060535-XPAR","https://live.euronext.com/en/product/equities/FR0011665280-XPAR","https://live.euronext.com/en/product/equities/FR001400AEM6-ALXP","https://live.euronext.com/en/product/equities/FR0000062341-XPAR","https://live.euronext.com/en/product/equities/SN0000033192-XPAR","https://live.euronext.com/en/product/equities/FR0000060824-XPAR","https://live.euronext.com/en/product/equities/FR0000035123-XPAR","https://live.euronext.com/en/product/equities/FR0010487272-XMLI","https://live.euronext.com/en/product/equities/FR0000038184-XPAR","https://live.euronext.com/en/product/equities/CH0120879058-XMLI","https://live.euronext.com/en/product/equities/FR0000074759-ALXP","https://live.euronext.com/en/product/equities/FR001400GO75-ALXP","https://live.euronext.com/en/product/equities/FR0011476928-XPAR","https://live.euronext.com/en/product/equities/FR0013230067-XMLI","https://live.euronext.com/en/product/equities/FR0012419307-ALXP","https://live.euronext.com/en/product/equities/FR0000065930-XPAR","https://live.euronext.com/en/product/equities/FR0000038499-XPAR","https://live.euronext.com/en/product/equities/FR0010341032-XPAR","https://live.euronext.com/en/product/equities/FR0000033409-XPAR","https://live.euronext.com/en/product/equities/FR0011605617-XMLI","https://live.euronext.com/en/product/equities/FR0000053944-XPAR","https://live.euronext.com/en/product/equities/CI0000053161-XPAR","https://live.euronext.com/en/product/equities/FR0014005SB3-XPAR","https://live.euronext.com/en/product/equities/FR0000121147-XPAR","https://live.euronext.com/en/product/equities/FR0010485268-ALXP","https://live.euronext.com/en/product/equities/FR0013030152-XPAR","https://live.euronext.com/en/product/equities/FR0013222346-XMLI","https://live.euronext.com/en/product/equities/FR0010823724-XMLI","https://live.euronext.com/en/product/equities/FR0004187367-ALXP","https://live.euronext.com/en/product/equities/FR0010588079-XPAR","https://live.euronext.com/en/product/equities/FR0000053415-XMLI","https://live.euronext.com/en/product/equities/FR0011100759-XMLI","https://live.euronext.com/en/product/equities/FR0000030611-XPAR","https://live.euronext.com/en/product/equities/FR0000124414-ALXP","https://live.euronext.com/en/product/equities/FR0000034894-XPAR","https://live.euronext.com/en/product/equities/FR0013495298-ALXP","https://live.euronext.com/en/product/equities/FR0000053035-XPAR","https://live.euronext.com/en/product/equities/FR001400M1R1-ALXP","https://live.euronext.com/en/product/equities/FR0010040865-XPAR","https://live.euronext.com/en/product/equities/US3696043013-XPAR","https://live.euronext.com/en/product/equities/CH0308403085-XPAR","https://live.euronext.com/en/product/equities/FR0004163111-XPAR","https://live.euronext.com/en/product/equities/FR0004053510-ALXP","https://live.euronext.com/en/product/equities/FR0013183985-XPAR","https://live.euronext.com/en/product/equities/PTGVE1AE0009-XMLI","https://live.euronext.com/en/product/equities/FR0010533075-XPAR","https://live.euronext.com/en/product/equities/FR0000033888-ALXP","https://live.euronext.com/en/product/equities/FR0000066672-XPAR","https://live.euronext.com/en/product/equities/IT0005454167-XMLI","https://live.euronext.com/en/product/equities/IT0005454175-XMLI","https://live.euronext.com/en/product/equities/IT0005454134-XMLI","https://live.euronext.com/en/product/equities/FR0011052257-ALXP","https://live.euronext.com/en/product/equities/ES0105537007-XMLI","https://live.euronext.com/en/product/equities/FR0011208693-ALXP","https://live.euronext.com/en/product/equities/FR0010214064-XPAR","https://live.euronext.com/en/product/equities/FR0013204070-ALXP","https://live.euronext.com/en/product/equities/FR0000065971-XPAR","https://live.euronext.com/en/product/equities/FR0014005ZM5-ALXP","https://live.euronext.com/en/product/equities/FR00140069V2-ALXP","https://live.euronext.com/en/product/equities/FR0000076960-XMLI","https://live.euronext.com/en/product/equities/FR0000036675-XPAR","https://live.euronext.com/en/product/equities/FR0012819381-ALXP","https://live.euronext.com/en/product/equities/FR0004010338-XPAR","https://live.euronext.com/en/product/equities/FR0000075442-ALXP","https://live.euronext.com/en/product/equities/FR0013439627-ALXP","https://live.euronext.com/en/product/equities/FR0012612646-XPAR","https://live.euronext.com/en/product/equities/FR0010529719-XMLI","https://live.euronext.com/en/product/equities/FR0004155000-XPAR","https://live.euronext.com/en/product/equities/FR0013429404-ALXP","https://live.euronext.com/en/product/equities/FR0014000RP6-ALXP","https://live.euronext.com/en/product/equities/US36254L2097-XPAR","https://live.euronext.com/en/product/equities/FR0011726835-XPAR","https://live.euronext.com/en/product/equities/LU1840650458-XMLI","https://live.euronext.com/en/product/equities/FR0000032526-XPAR","https://live.euronext.com/en/product/equities/FR0000066722-XPAR","https://live.euronext.com/en/product/equities/FR0014007ND6-ALXP","https://live.euronext.com/en/product/equities/GB00BMDXQ672-ALXP","https://live.euronext.com/en/product/equities/FR0000066755-XPAR","https://live.euronext.com/en/product/equities/FR0014003VY4-XPAR","https://live.euronext.com/en/product/equities/ES0105498002-XMLI","https://live.euronext.com/en/product/equities/FR0000066540-ALXP","https://live.euronext.com/en/product/equities/FR0000052292-XPAR","https://live.euronext.com/en/product/equities/FR0004159473-ALXP","https://live.euronext.com/en/product/equities/FR0000038531-ALXP","https://live.euronext.com/en/product/equities/FR0000054231-XPAR","https://live.euronext.com/en/product/equities/FR0012821916-ALXP","https://live.euronext.com/en/product/equities/FR0010396309-ALXP","https://live.euronext.com/en/product/equities/DE000A11Q133-XMLI","https://live.euronext.com/en/product/equities/FR0000051302-XMLI","https://live.euronext.com/en/product/equities/FR0013451044-ALXP","https://live.euronext.com/en/product/equities/FR0012336691-XMLI","https://live.euronext.com/en/product/equities/FR0010312181-XMLI","https://live.euronext.com/en/product/equities/FR0014000U63-ALXP","https://live.euronext.com/en/product/equities/FR0000065278-ALXP","https://live.euronext.com/en/product/equities/FR0006226791-XMLI","https://live.euronext.com/en/product/equities/ES0105664009-XMLI","https://live.euronext.com/en/product/equities/FR0000053738-XMLI","https://live.euronext.com/en/product/equities/FR0004165801-XPAR","https://live.euronext.com/en/product/equities/FR0006563904-XMLI","https://live.euronext.com/en/product/equities/FR0014007LQ2-ALXP","https://live.euronext.com/en/product/equities/FR0004153930-ALXP","https://live.euronext.com/en/product/equities/FR0000064735-XMLI","https://live.euronext.com/en/product/equities/FR0005843125-XMLI","https://live.euronext.com/en/product/equities/FR0014001PM5-ALXP","https://live.euronext.com/en/product/equities/FR0014005IU4-ALXP","https://live.euronext.com/en/product/equities/FR0005854700-ALXP","https://live.euronext.com/en/product/equities/ES0105479002-XMLI","https://live.euronext.com/en/product/equities/FR0000035081-XPAR","https://live.euronext.com/en/product/equities/FR001400A3Q3-ALXP","https://live.euronext.com/en/product/equities/FR0010929125-XPAR","https://live.euronext.com/en/product/equities/FR0000051393-XPAR","https://live.euronext.com/en/product/equities/FR0000079691-XMLI","https://live.euronext.com/en/product/equities/FR0000062184-ALXP","https://live.euronext.com/en/product/equities/ES0105551008-XMLI","https://live.euronext.com/en/product/equities/FR00140048X2-ALXP","https://live.euronext.com/en/product/equities/IT0005380602-ALXP","https://live.euronext.com/en/product/equities/FR0010086371-XMLI","https://live.euronext.com/en/product/equities/FR0000120859-XPAR","https://live.euronext.com/en/product/equities/FR0006859039-XMLI","https://live.euronext.com/en/product/equities/FR0013060100-ALXP","https://live.euronext.com/en/product/equities/FR0000033243-XPAR","https://live.euronext.com/en/product/equities/FR0013470168-ALXP","https://live.euronext.com/en/product/equities/FR0000065773-XMLI","https://live.euronext.com/en/product/equities/ES0105590006-XMLI","https://live.euronext.com/en/product/equities/FR0000066219-XPAR","https://live.euronext.com/en/product/equities/FR0011158823-XMLI","https://live.euronext.com/en/product/equities/FR0000071797-XPAR","https://live.euronext.com/en/product/equities/ES0105511002-XMLI","https://live.euronext.com/en/product/equities/ES0105473005-XMLI","https://live.euronext.com/en/product/equities/FR0010331421-XPAR","https://live.euronext.com/en/product/equities/FR0000064297-ALXP","https://live.euronext.com/en/product/equities/IT0005391161-XMLI","https://live.euronext.com/en/product/equities/FR0000060451-ALXP","https://live.euronext.com/en/product/equities/FR0010908723-ALXP","https://live.euronext.com/en/product/equities/FR0014003FN0-XMLI","https://live.euronext.com/en/product/equities/FR0004024222-XPAR","https://live.euronext.com/en/product/equities/FR0000064958-XPAR","https://live.euronext.com/en/product/equities/FR0011179886-ALXP","https://live.euronext.com/en/product/equities/FR0013233012-XPAR","https://live.euronext.com/en/product/equities/BE0974299316-ALXP","https://live.euronext.com/en/product/equities/ES0105417002-XMLI","https://live.euronext.com/en/product/equities/FR0010259150-XPAR","https://live.euronext.com/en/product/equities/FR0000073298-XPAR","https://live.euronext.com/en/product/equities/ES0109429037-ALXP","https://live.euronext.com/en/product/equities/FR0000072597-ALXP","https://live.euronext.com/en/product/equities/IT0005336521-XMLI","https://live.euronext.com/en/product/equities/FR0004026151-XPAR","https://live.euronext.com/en/product/equities/FR0012872141-XPAR","https://live.euronext.com/en/product/equities/FR0000033904-XPAR","https://live.euronext.com/en/product/equities/FR0000077919-XPAR","https://live.euronext.com/en/product/equities/FR0010680033-XMLI","https://live.euronext.com/en/product/equities/ES0105636007-XMLI","https://live.euronext.com/en/product/equities/FR0010722819-ALXP","https://live.euronext.com/en/product/equities/FR0004007813-XPAR","https://live.euronext.com/en/product/equities/FR0000121485-XPAR","https://live.euronext.com/en/product/equities/FR0013156007-ALXP","https://live.euronext.com/en/product/equities/FR0004029411-ALXP","https://live.euronext.com/en/product/equities/FR0013374667-ALXP","https://live.euronext.com/en/product/equities/FR0011038348-ALXP","https://live.euronext.com/en/product/equities/FR0000121964-XPAR","https://live.euronext.com/en/product/equities/ES0105425005-ALXP","https://live.euronext.com/en/product/equities/FR0013419876-ALXP","https://live.euronext.com/en/product/equities/FR0000120321-XPAR","https://live.euronext.com/en/product/equities/NL0012191662-ALXP","https://live.euronext.com/en/product/equities/FR0000075343-ALXP","https://live.euronext.com/en/product/equities/FR0000066607-XPAR","https://live.euronext.com/en/product/equities/FR0000130213-XPAR","https://live.euronext.com/en/product/equities/FR0004027068-ALXP","https://live.euronext.com/en/product/equities/FR0013308582-ALXP","https://live.euronext.com/en/product/equities/FR001400JY13-XPAR","https://live.euronext.com/en/product/equities/FR0006864484-XPAR","https://live.euronext.com/en/product/equities/FR0013204336-XPAR","https://live.euronext.com/en/product/equities/FR0000121295-ALXP","https://live.euronext.com/en/product/equities/FR0000065484-XPAR","https://live.euronext.com/en/product/equities/FR001400MMI2-XPAR","https://live.euronext.com/en/product/equities/FR0010307819-XPAR","https://live.euronext.com/en/product/equities/FR001400F2Z1-ALXP","https://live.euronext.com/en/product/equities/FR0007080254-ALXP","https://live.euronext.com/en/product/equities/FR0000033599-ALXP","https://live.euronext.com/en/product/equities/FR0014009YQ1-XPAR","https://live.euronext.com/en/product/equities/FR0004156297-XPAR","https://live.euronext.com/en/product/equities/FR0000050353-XPAR","https://live.euronext.com/en/product/equities/BE0974334667-ALXP","https://live.euronext.com/en/product/equities/ES0105089009-ALXP","https://live.euronext.com/en/product/equities/FR0004170017-XPAR","https://live.euronext.com/en/product/equities/FR0004155208-XMLI","https://live.euronext.com/en/product/equities/FR0000044943-ALXP","https://live.euronext.com/en/product/equities/FR0006205019-XMLI","https://live.euronext.com/en/product/equities/FR0011884378-ALXP","https://live.euronext.com/en/product/equities/FR0000038242-XPAR","https://live.euronext.com/en/product/equities/FR0000121014-XPAR","https://live.euronext.com/en/product/equities/FR00140085W6-XPAR","https://live.euronext.com/en/product/equities/FR0013270626-ALXP","https://live.euronext.com/en/product/equities/FR0012634822-XPAR","https://live.euronext.com/en/product/equities/FR0010328302-XMLI","https://live.euronext.com/en/product/equities/FR0010827741-XMLI","https://live.euronext.com/en/product/equities/FR0000061657-XMLI","https://live.euronext.com/en/product/equities/FR0011092089-XMLI","https://live.euronext.com/en/product/equities/FR0013153541-XPAR","https://live.euronext.com/en/product/equities/ES0105463006-ALXP","https://live.euronext.com/en/product/equities/FR0000030074-XPAR","https://live.euronext.com/en/product/equities/FR0000038606-XPAR","https://live.euronext.com/en/product/equities/ES0105447009-XMLI","https://live.euronext.com/en/product/equities/FR0013400835-ALXP","https://live.euronext.com/en/product/equities/MA0000011488-XPAR","https://live.euronext.com/en/product/equities/FR0004155687-ALXP","https://live.euronext.com/en/product/equities/FR0013472446-ALXP","https://live.euronext.com/en/product/equities/FR0010609263-ALXP","https://live.euronext.com/en/product/equities/FR0000051070-XPAR","https://live.euronext.com/en/product/equities/FR0000060873-XPAR","https://live.euronext.com/en/product/equities/FR0011742329-XPAR","https://live.euronext.com/en/product/equities/FR0010844464-ALXP","https://live.euronext.com/en/product/equities/FR0000064404-XPAR","https://live.euronext.com/en/product/equities/IT0005324105-XMLI","https://live.euronext.com/en/product/equities/FR0011049824-ALXP","https://live.euronext.com/en/product/equities/FR0004065605-XPAR","https://live.euronext.com/en/product/equities/IT0004844848-XMLI","https://live.euronext.com/en/product/equities/FR0010298620-XPAR","https://live.euronext.com/en/product/equities/FR0010241638-XPAR","https://live.euronext.com/en/product/equities/ES0105559001-XMLI","https://live.euronext.com/en/product/equities/FR0000039620-XPAR","https://live.euronext.com/en/product/equities/FR0004177046-XPAR","https://live.euronext.com/en/product/equities/FR0010492181-XMLI","https://live.euronext.com/en/product/equities/FR00140066X4-ALXP","https://live.euronext.com/en/product/equities/FR0011217710-ALXP","https://live.euronext.com/en/product/equities/BE0974328602-XMLI","https://live.euronext.com/en/product/equities/FR0000053225-XPAR","https://live.euronext.com/en/product/equities/IT0005450819-ALXP","https://live.euronext.com/en/product/equities/FR0010204453-ALXP","https://live.euronext.com/en/product/equities/FR0010353888-ALXP","https://live.euronext.com/en/product/equities/FR001400AJ45-XPAR","https://live.euronext.com/en/product/equities/FR0000077570-ALXP","https://live.euronext.com/en/product/equities/FR0010500363-XMLI","https://live.euronext.com/en/product/equities/FR0013053535-ALXP","https://live.euronext.com/en/product/equities/FR0004172450-ALXP","https://live.euronext.com/en/product/equities/FR00140050Q2-ALXP","https://live.euronext.com/en/product/equities/FR001400H3A0-ALXP","https://live.euronext.com/en/product/equities/FR0000076986-XPAR","https://live.euronext.com/en/product/equities/BE0003853703-XBRU","https://live.euronext.com/en/product/equities/ES0105549002-XMLI","https://live.euronext.com/en/product/equities/FR0011033083-ALXP","https://live.euronext.com/en/product/equities/FR0004034320-ALXP","https://live.euronext.com/en/product/equities/FR0013462231-ALXP","https://live.euronext.com/en/product/equities/ES0105697009-XMLI","https://live.euronext.com/en/product/equities/FR001400IE67-XPAR","https://live.euronext.com/en/product/equities/FR0013482791-XPAR","https://live.euronext.com/en/product/equities/FR0014003J32-ALXP","https://live.euronext.com/en/product/equities/FR0011341205-XPAR","https://live.euronext.com/en/product/equities/FR0011675362-XPAR","https://live.euronext.com/en/product/equities/FR0011636083-ALXP","https://live.euronext.com/en/product/equities/FR001400MV37-ALXP","https://live.euronext.com/en/product/equities/FR0004154060-ALXP","https://live.euronext.com/en/product/equities/FR0000072993-ALXP","https://live.euronext.com/en/product/equities/FR0004050250-XPAR","https://live.euronext.com/en/product/equities/FR0000044448-XPAR","https://live.euronext.com/en/product/equities/FR0010112524-XPAR","https://live.euronext.com/en/product/equities/FR0004171346-ALXP","https://live.euronext.com/en/product/equities/FR0014003XT0-ALXP","https://live.euronext.com/en/product/equities/FR0012650166-XPAR","https://live.euronext.com/en/product/equities/FR0013018124-ALXP","https://live.euronext.com/en/product/equities/FI0009000681-XPAR","https://live.euronext.com/en/product/equities/ES0105719001-XMLI","https://live.euronext.com/en/product/equities/FR0010397232-ALXP","https://live.euronext.com/en/product/equities/FR0000185464-XMLI","https://live.euronext.com/en/product/equities/FR0014001PV6-XPAR","https://live.euronext.com/en/product/equities/FR0000121691-XPAR","https://live.euronext.com/en/product/equities/FR0000064529-ALXP","https://live.euronext.com/en/product/equities/FR0004065639-ALXP","https://live.euronext.com/en/product/equities/FR0014003711-ALXP","https://live.euronext.com/en/product/equities/FR0013310281-XMLI","https://live.euronext.com/en/product/equities/FR0000052680-XPAR","https://live.euronext.com/en/product/equities/ES0105698007-XMLI","https://live.euronext.com/en/product/equities/FR0010428771-XPAR","https://live.euronext.com/en/product/equities/FR0014003T71-ALXP","https://live.euronext.com/en/product/equities/FR001400CM63-ALXP","https://live.euronext.com/en/product/equities/FR0013266772-ALXP","https://live.euronext.com/en/product/equities/FR0004174712-XMLI","https://live.euronext.com/en/product/equities/FR0000133308-XPAR","https://live.euronext.com/en/product/equities/FR0000075392-XPAR","https://live.euronext.com/en/product/equities/ES0105490009-XMLI","https://live.euronext.com/en/product/equities/FR0013318052-ALXP","https://live.euronext.com/en/product/equities/FR0010609206-XPAR","https://live.euronext.com/en/product/equities/ES0105534004-XMLI","https://live.euronext.com/en/product/equities/FR0000184798-XPAR","https://live.euronext.com/en/product/equities/FR0012127173-XPAR","https://live.euronext.com/en/product/equities/FR001400IUV6-ALXP","https://live.euronext.com/en/product/equities/FR0013231180-ALXP","https://live.euronext.com/en/product/equities/FR0014005HJ9-XPAR","https://live.euronext.com/en/product/equities/FR0000077992-XMLI","https://live.euronext.com/en/product/equities/FR0010263202-XPAR","https://live.euronext.com/en/product/equities/FR0004038263-XPAR","https://live.euronext.com/en/product/equities/FR0006823092-XMLI","https://live.euronext.com/en/product/equities/NL0012650535-XMLI","https://live.euronext.com/en/product/equities/FR0000038465-XPAR","https://live.euronext.com/en/product/equities/FR0011027135-XPAR","https://live.euronext.com/en/product/equities/FR0013479730-ALXP","https://live.euronext.com/en/product/equities/FR0000120693-XPAR","https://live.euronext.com/en/product/equities/FR0000061459-XPAR","https://live.euronext.com/en/product/equities/ES0105612008-XMLI","https://live.euronext.com/en/product/equities/NL0015001HZ9-XMLI","https://live.euronext.com/en/product/equities/FR0000064784-XPAR","https://live.euronext.com/en/product/equities/FR001400N1P4-ALXP","https://live.euronext.com/en/product/equities/FR001400K4B1-XPAR","https://live.euronext.com/en/product/equities/FR0000185480-XMLI","https://live.euronext.com/en/product/equities/BE0948608451-XMLI","https://live.euronext.com/en/product/equities/FR001400B4H9-XPAR","https://live.euronext.com/en/product/equities/FR001400B4G1-XPAR","https://live.euronext.com/en/product/equities/FR0000073041-XPAR","https://live.euronext.com/en/product/equities/FR0000061608-ALXP","https://live.euronext.com/en/product/equities/FR001400JX97-ALXP","https://live.euronext.com/en/product/equities/FR0000030769-XMLI","https://live.euronext.com/en/product/equities/FR0010785790-ALXP","https://live.euronext.com/en/product/equities/FR0011844067-ALXP","https://live.euronext.com/en/product/equities/FR0013252186-XPAR","https://live.euronext.com/en/product/equities/FR0000124570-XPAR","https://live.euronext.com/en/product/equities/NL0015001W49-XPAR","https://live.euronext.com/en/product/equities/FR0000066441-ALXP","https://live.euronext.com/en/product/equities/FR0013015583-ALXP","https://live.euronext.com/en/product/equities/FR0012432516-XPAR","https://live.euronext.com/en/product/equities/FR0014004EC4-ALXP","https://live.euronext.com/en/product/equities/FR0010169920-ALXP","https://live.euronext.com/en/product/equities/FR0004044600-ALXP","https://live.euronext.com/en/product/equities/FR0004052561-XPAR","https://live.euronext.com/en/product/equities/FR0010313486-ALXP","https://live.euronext.com/en/product/equities/FR0012613610-XPAR","https://live.euronext.com/en/product/equities/FR0010380626-ALXP","https://live.euronext.com/en/product/equities/FR0013398617-ALXP","https://live.euronext.com/en/product/equities/FR0000061376-XMLI","https://live.euronext.com/en/product/equities/FR0000130577-XPAR","https://live.euronext.com/en/product/equities/FR0000120560-XPAR","https://live.euronext.com/en/product/equities/ES0105118006-ALXP","https://live.euronext.com/en/product/equities/FR0011648971-ALXP","https://live.euronext.com/en/product/equities/FR0010889386-ALXP","https://live.euronext.com/en/product/equities/IT0005466963-ALXP","https://live.euronext.com/en/product/equities/FR0000060618-XPAR","https://live.euronext.com/en/product/equities/FR0000044471-XPAR","https://live.euronext.com/en/product/equities/GB00BM9PTW47-ALXP","https://live.euronext.com/en/product/equities/FR0011858190-ALXP","https://live.euronext.com/en/product/equities/FR0000130395-XPAR","https://live.euronext.com/en/product/equities/FR0000131906-XPAR","https://live.euronext.com/en/product/equities/ES0105550000-XMLI","https://live.euronext.com/en/product/equities/FR0010820274-ALXP","https://live.euronext.com/en/product/equities/FR0010451203-XPAR","https://live.euronext.com/en/product/equities/FR0000075954-ALXP","https://live.euronext.com/en/product/equities/FR0000039091-XPAR","https://live.euronext.com/en/product/equities/FR0000045619-XPAR","https://live.euronext.com/en/product/equities/FR0000045601-XPAR","https://live.euronext.com/en/product/equities/FR0013344173-XPAR","https://live.euronext.com/en/product/equities/FR0010523167-ALXP","https://live.euronext.com/en/product/equities/FR0013477593-ALXP","https://live.euronext.com/en/product/equities/FR0000037640-ALXP","https://live.euronext.com/en/product/equities/FR0013269123-XPAR","https://live.euronext.com/en/product/equities/FR0000121709-XPAR","https://live.euronext.com/en/product/equities/FR001400F1V2-ALXP","https://live.euronext.com/en/product/equities/FR0000073272-XPAR","https://live.euronext.com/en/product/equities/ES0105651006-XMLI","https://live.euronext.com/en/product/equities/FR0000125007-XPAR","https://live.euronext.com/en/product/equities/FR001400M7D8-XPAR","https://live.euronext.com/en/product/equities/FR0000060121-XPAR","https://live.euronext.com/en/product/equities/FR0000060071-XPAR","https://live.euronext.com/en/product/equities/FR0000120578-XPAR","https://live.euronext.com/en/product/equities/FR001400M6Z3-XPAR","https://live.euronext.com/en/product/equities/FR0010776617-ALXP","https://live.euronext.com/en/product/equities/FR0013154002-XPAR","https://live.euronext.com/en/product/equities/FR0000120107-XPAR","https://live.euronext.com/en/product/equities/FR0013155975-XMLI","https://live.euronext.com/en/product/equities/FR0006239109-XPAR","https://live.euronext.com/en/product/equities/FR0010972091-XMLI","https://live.euronext.com/en/product/equities/AN8068571086-XPAR","https://live.euronext.com/en/product/equities/FR0000121972-XPAR","https://live.euronext.com/en/product/equities/ES0105592002-XMLI","https://live.euronext.com/en/product/equities/FR0010411983-XPAR","https://live.euronext.com/en/product/equities/FR0000039109-XPAR","https://live.euronext.com/en/product/equities/GB00B5ZN1N88-XPAR","https://live.euronext.com/en/product/equities/IT0005353484-ALXP","https://live.euronext.com/en/product/equities/FR0000065492-XPAR","https://live.euronext.com/en/product/equities/FR0004175842-XPAR","https://live.euronext.com/en/product/equities/IT0005072811-XMLI","https://live.euronext.com/en/product/equities/FR0012596468-ALXP","https://live.euronext.com/en/product/equities/NL0010623518-XMLI","https://live.euronext.com/en/product/equities/FR0011950682-XPAR","https://live.euronext.com/en/product/equities/LU0088087324-XPAR","https://live.euronext.com/en/product/equities/FR0013006558-XPAR","https://live.euronext.com/en/product/equities/FR0010202606-ALXP","https://live.euronext.com/en/product/equities/FR0000060790-ALXP","https://live.euronext.com/en/product/equities/FR0000074122-XPAR","https://live.euronext.com/en/product/equities/FR0010679365-XMLI","https://live.euronext.com/en/product/equities/CI0000000832-XMLI","https://live.euronext.com/en/product/equities/FR0010812230-ALXP","https://live.euronext.com/en/product/equities/FR0014005I80-ALXP","https://live.euronext.com/en/product/equities/FR0011131788-XMLI","https://live.euronext.com/en/product/equities/FR0010649228-XMLI","https://live.euronext.com/en/product/equities/FR001400LBS6-XMLI","https://live.euronext.com/en/product/equities/FR0013214145-XPAR","https://live.euronext.com/en/product/equities/FR0004016699-ALXP","https://live.euronext.com/en/product/equities/FR0010209809-XPAR","https://live.euronext.com/en/product/equities/FR0000130809-XPAR","https://live.euronext.com/en/product/equities/FR0000121220-XPAR","https://live.euronext.com/en/product/equities/FR0000078321-XPAR","https://live.euronext.com/en/product/equities/FR0000065864-ALXP","https://live.euronext.com/en/product/equities/FR0013227113-XPAR","https://live.euronext.com/en/product/equities/FR00140006O9-XPAR","https://live.euronext.com/en/product/equities/FR0013379484-XPAR","https://live.euronext.com/en/product/equities/BE0003470755-XBRU","https://live.euronext.com/en/product/equities/FR0000050809-XPAR","https://live.euronext.com/en/product/equities/FR00140043Y1-ALXP","https://live.euronext.com/en/product/equities/FR0000054371-XMLI","https://live.euronext.com/en/product/equities/FR0012757854-XPAR","https://live.euronext.com/en/product/equities/FR0011464452-ALXP","https://live.euronext.com/en/product/equities/FR001400BVK2-ALXP","https://live.euronext.com/en/product/equities/FR0011289040-XPAR","https://live.euronext.com/en/product/equities/FR0000054199-XPAR","https://live.euronext.com/en/product/equities/FR0000064271-XPAR","https://live.euronext.com/en/product/equities/NL00150001Q9-XPAR","https://live.euronext.com/en/product/equities/FR001400MDW2-ALXP","https://live.euronext.com/en/product/equities/NL0000226223-XPAR","https://live.euronext.com/en/product/equities/FR0000074775-ALXP","https://live.euronext.com/en/product/equities/FR0010528059-ALXP","https://live.euronext.com/en/product/equities/FR001400DG11-ALXP","https://live.euronext.com/en/product/equities/FR001400DGA0-ALXP","https://live.euronext.com/en/product/equities/FR0000063976-XMLI","https://live.euronext.com/en/product/equities/GB00B8GJBS16-XMLI","https://live.euronext.com/en/product/equities/FR0004180578-XPAR","https://live.euronext.com/en/product/equities/BE0974464977-XBRU","https://live.euronext.com/en/product/equities/FR0000032658-XPAR","https://live.euronext.com/en/product/equities/FR0004188670-XPAR","https://live.euronext.com/en/product/equities/IT0005507857-ALXP","https://live.euronext.com/en/product/equities/FR0000063307-XPAR","https://live.euronext.com/en/product/equities/NL0014559478-XPAR","https://live.euronext.com/en/product/equities/FR0000051807-XPAR","https://live.euronext.com/en/product/equities/CH0008175645-XPAR","https://live.euronext.com/en/product/equities/FR0011076595-XMLI","https://live.euronext.com/en/product/equities/FR001400BMH7-XPAR","https://live.euronext.com/en/product/equities/FR0014000TB2-XPAR","https://live.euronext.com/en/product/equities/FR0000054900-XPAR","https://live.euronext.com/en/product/equities/FR001400M3E5-XPAR","https://live.euronext.com/en/product/equities/FR0013295789-XPAR","https://live.euronext.com/en/product/equities/FR0000121329-XPAR","https://live.euronext.com/en/product/equities/GRS528003007-XMLI","https://live.euronext.com/en/product/equities/FR0011053636-ALXP","https://live.euronext.com/en/product/equities/FR0010120402-ALXP","https://live.euronext.com/en/product/equities/FR0013286259-ALXP","https://live.euronext.com/en/product/equities/BE0974387194-ALXP","https://live.euronext.com/en/product/equities/FR0013333432-XPAR","https://live.euronext.com/en/product/equities/FR0013230612-XPAR","https://live.euronext.com/en/product/equities/FR0000066482-XPAR","https://live.euronext.com/en/product/equities/BE0974338700-XBRU","https://live.euronext.com/en/product/equities/NL0015000YE1-ALXP","https://live.euronext.com/en/product/equities/NL0015001SR3-ALXP","https://live.euronext.com/en/product/equities/FR001400H2X4-ALXP","https://live.euronext.com/en/product/equities/LU0394945660-ALXP","https://live.euronext.com/en/product/equities/FR00140062B9-ALXP","https://live.euronext.com/en/product/equities/FR0000120271-XPAR","https://live.euronext.com/en/product/equities/GA0000121459-XPAR","https://live.euronext.com/en/product/equities/FR0000033003-XPAR","https://live.euronext.com/en/product/equities/FR0000036816-XPAR","https://live.euronext.com/en/product/equities/FR0000031866-XMLI","https://live.euronext.com/en/product/equities/FR0005175080-XPAR","https://live.euronext.com/en/product/equities/FR0005691656-XPAR","https://live.euronext.com/en/product/equities/FR0010397901-ALXP","https://live.euronext.com/en/product/equities/FR0000031106-XMLI","https://live.euronext.com/en/product/equities/FR0004175099-ALXP","https://live.euronext.com/en/product/equities/FR0010383877-ALXP","https://live.euronext.com/en/product/equities/FR0010654087-ALXP","https://live.euronext.com/en/product/equities/FR0000079147-ALXP","https://live.euronext.com/en/product/equities/FR0000054470-XPAR","https://live.euronext.com/en/product/equities/GB00BJ9M4V82-XMLI","https://live.euronext.com/en/product/equities/FR0011776889-XMLI","https://live.euronext.com/en/product/equities/FR0013326246-XPAR","https://live.euronext.com/en/product/equities/FR0000054215-XPAR","https://live.euronext.com/en/product/equities/FR0000074197-XPAR","https://live.euronext.com/en/product/equities/FR0012709160-ALXP","https://live.euronext.com/en/product/equities/FR0010337865-ALXP","https://live.euronext.com/en/product/equities/ES0105748000-XMLI","https://live.euronext.com/en/product/equities/FR0011898584-ALXP","https://live.euronext.com/en/product/equities/FR0013254851-ALXP","https://live.euronext.com/en/product/equities/FR0013176526-XPAR","https://live.euronext.com/en/product/equities/FR0010095596-ALXP","https://live.euronext.com/en/product/equities/FR0013506730-XPAR","https://live.euronext.com/en/product/equities/FR00140030K7-XPAR","https://live.euronext.com/en/product/equities/FR0004056851-XPAR","https://live.euronext.com/en/product/equities/ES0105623005-XMLI","https://live.euronext.com/en/product/equities/FR0013505062-XPAR","https://live.euronext.com/en/product/equities/FR0013526225-XPAR","https://live.euronext.com/en/product/equities/FR0014007T10-XMLI","https://live.euronext.com/en/product/equities/FR0010766667-ALXP","https://live.euronext.com/en/product/equities/FR0000124141-XPAR","https://live.euronext.com/en/product/equities/FR0013530102-ALXP","https://live.euronext.com/en/product/equities/FR0013447729-XPAR","https://live.euronext.com/en/product/equities/FR001400JXA2-ALXP","https://live.euronext.com/en/product/equities/FR0010291245-XPAR","https://live.euronext.com/en/product/equities/FR0006174496-XMLI","https://live.euronext.com/en/product/equities/FR0014003I41-XMLI","https://live.euronext.com/en/product/equities/FR0004186856-XPAR","https://live.euronext.com/en/product/equities/FR0010326090-ALXP","https://live.euronext.com/en/product/equities/FR0000031775-XPAR","https://live.euronext.com/en/product/equities/FR0000050049-XPAR","https://live.euronext.com/en/product/equities/FR0000125486-XPAR","https://live.euronext.com/en/product/equities/FR001400AXT1-ALXP","https://live.euronext.com/en/product/equities/FR0000031577-XPAR","https://live.euronext.com/en/product/equities/ES0105704003-XMLI","https://live.euronext.com/en/product/equities/FR0004029478-ALXP","https://live.euronext.com/en/product/equities/FR0014003O76-ALXP","https://live.euronext.com/en/product/equities/FR0013481835-ALXP","https://live.euronext.com/en/product/equities/FR0010309096-XPAR","https://live.euronext.com/en/product/equities/FR0000127771-XPAR","https://live.euronext.com/en/product/equities/FR0011532225-ALXP","https://live.euronext.com/en/product/equities/FR0011995588-XPAR","https://live.euronext.com/en/product/equities/FR0004045847-ALXP","https://live.euronext.com/en/product/equities/FR0000062796-XPAR","https://live.euronext.com/en/product/equities/ES0105492005-XMLI","https://live.euronext.com/en/product/equities/FR0010282822-XPAR","https://live.euronext.com/en/product/equities/FR0012532810-XPAR","https://live.euronext.com/en/product/equities/FR0010131409-ALXP","https://live.euronext.com/en/product/equities/FR0013357621-XPAR","https://live.euronext.com/en/product/equities/FR0013079092-ALXP","https://live.euronext.com/en/product/equities/FR0010688465-XMLI","https://live.euronext.com/en/product/equities/FR0010688440-ALXP","https://live.euronext.com/en/product/equities/FR0004152700-XMLI","https://live.euronext.com/en/product/equities/FR0000121204-XPAR","https://live.euronext.com/en/product/equities/FR0010768770-XMLI","https://live.euronext.com/en/product/equities/ES0105399002-XMLI","https://live.euronext.com/en/product/equities/FR0014000P11-ALXP","https://live.euronext.com/en/product/equities/FR0013143872-ALXP","https://live.euronext.com/en/product/equities/FR00140047H7-XMLI","https://live.euronext.com/en/product/equities/FR0011981968-XPAR","https://live.euronext.com/en/product/equities/BE0974310428-XPAR","https://live.euronext.com/en/product/equities/FR0004034072-XPAR","https://live.euronext.com/en/product/equities/ZM0000000037-XMLI","https://live.euronext.com/en/product/equities/BMG9887P1068-XPAR"],["FR0010285965-ALXP","FR0013341781-ALXP","FR0000076887-ALXP","FR0010557264-XPAR","FR0004040608-XPAR","FR0013185857-XPAR","FR0012616852-XPAR","FR0012333284-XPAR","FR001400AHX6-XPAR","BE0974278104-XBRU","FR0000064602-XPAR","FR0000120404-XPAR","FR001400JAP8-ALXP","FR0000076861-XPAR","FR0000076655-ALXP","FR0014005OJ5-ALXP","FR0010979377-XMLI","BE0974269012-XPAR","FR0013284627-ALXP","FR0011184241-XPAR","FR001400JAL7-ALXP","FR0010340141-XPAR","FR0012821890-XPAR","FR0013296746-ALXP","FR0000053043-ALXP","FR0014007ZB4-XPAR","US00774B2088-XPAR","FR001400FL38-XPAR","FR0013333077-XPAR","FR0014005AC9-ALXP","FR0011908045-XMLI","FR0014005WE9-XMLI","ES0105478004-XMLI","FR0013452281-ALXP","FR0010641449-ALXP","FR001400J770-XPAR","FR0000120073-XPAR","NL0000235190-XPAR","FR0014003V77-ALXP","FR0000053027-XPAR","FR0000062465-XPAR","FR0014000JX7-ALXP","FR0013258662-XPAR","FR001400IV58-ALXP","FR0000053324-XPAR","FR0013421286-ALXP","FR0010220475-XPAR","FR0000053837-XPAR","FR0000033219-XPAR","FR0000039216-XPAR","FR0000071946-XPAR","FR0000061244-ALXP","FR0010395681-XPAR","FR0013253812-XMLI","GB00BNKGZC51-ALXP","NL0010273694-XMLI","FR0011051598-ALXP","FR0012789667-XPAR","FR0004125920-XPAR","ES0105744009-XMLI","FR0014005AL0-XPAR","LU0569974404-XAMS","ES0105658001-XMLI","FR0010340711-ALXP","FR0014003U94-XPAR","LU1598757687-XAMS","FR001400KO61-ALXP","FR0013398997-ALXP","FR0005057635-XMLI","FR0004070795-XMLI","ES0105661005-XMLI","FR0010481960-XPAR","ES0105601001-XMLI","FR0010313833-XPAR","ES0105486007-XMLI","FR0012185536-XPAR","FR0000074783-XPAR","FR0000076952-XPAR","FR001400JWR8-XPAR","FR0014003AC4-XPAR","FR0012968485-XMLI","FR0000074148-XPAR","ES0105708004-XMLI","FR0010478248-ALXP","FR0011992700-XPAR","FR0013455482-XPAR","FR0000051732-XPAR","FR0000063737-XPAR","FR00140059B5-ALXP","FR0000061780-XPAR","FR0013410370-ALXP","FR0000039232-XPAR","FR0013183589-ALXP","FR001400CFI7-XPAR","FR0000120628-XPAR","FR001400M7B2-XPAR","FR0011040500-XPAR","IT0004812258-XMLI","PTAZR0AM0006-XMLI","FR0013384369-ALXP","MC0000031187-XPAR","FR0013258399-XPAR","FR0000062788-XPAR","ES0105362000-XMLI","FR0004023208-XPAR","FR0000035370-XPAR","FR0000035305-ALXP","CH0451123589-XMLI","CH1148983609-XMLI","FR0014003FE9-XPAR","FR0000035164-XPAR","FR0000066961-ALXP","FR0000120966-XPAR","FR0000074072-XPAR","FR0004174233-ALXP","FR0013345493-ALXP","FR0013280286-XPAR","FR0012816825-ALXP","FR0013507290-ALXP","FR001400LN79-ALXP","BE0974280126-XBRU","FR0011005933-ALXP","FR0000062150-XPAR","FR0013340973-XMLI","FR0011041011-ALXP","FR0000131104-XPAR","FR0011365907-ALXP","FR0010106039-XMLI","FR0000061129-XPAR","FR0000039299-XPAR","FR0000063935-XPAR","BE6333353298-XMLI","FR001400IAM7-ALXP","FR0000054421-ALXP","FR0000074254-XPAR","FR0000120503-XPAR","FR001400M3D7-XPAR","FR001400AJZ7-ALXP","FR0006174348-XPAR","FR0000061137-XPAR","FR0000045544-XPAR","FR001400DIY6-ALXP","FR0010151589-XPAR","FR0000079659-XPAR","FR0012969095-ALXP","FR0000125338-XPAR","FR0011648716-ALXP","FR0010907956-ALXP","FR0010828137-XPAR","FR0000064156-XPAR","FR0000120172-XPAR","FR0000125585-XPAR","FR0010193052-XPAR","FR0000064446-ALXP","US1491231015-XPAR","FR0014007LW0-ALXP","FR001400D0X2-ALXP","FR0010193979-XPAR","FR0000053506-XPAR","FR0010425595-ALXP","BE0974260896-XBRU","FR0013178712-ALXP","FR0000037475-XPAR","MC0010000826-XMLI","FR0013181864-XPAR","FR0000037871-XMLI","FR0000051567-XMLI","FR0000130692-XPAR","FR001400AJ60-ALXP","FR0000060907-XPAR","FR0010447086-XMLI","FR0000130403-XPAR","FR0000054322-ALXP","FR0000060428-XMLI","FR0013426004-XPAR","FR0010386334-XPAR","FR0004152882-ALXP","FR0013406881-XMLI","NL0010949392-XPAR","FR0010667147-XPAR","FR0013257409-ALXP","FR0013335742-ALXP","FR0011071570-ALXP","FR0004031763-XPAR","BE0160342011-ALXP","FR0010959684-XMLI","FR0000062234-XPAR","BE6252013725-XMLI","FR0000077828-XMLI","FR00140007I9-XMLI","ES0105660007-XMLI","FR0010035816-XMLI","FR0013371507-XMLI","US2220702037-XPAR","FR0004998318-XMLI","FR0000065393-XPAR","FR0000064578-XPAR","FR0000060303-XPAR","FR0000044323-XPAR","FR0000185506-XPAR","FR0010483768-XPAR","FR0000045213-XPAR","FR0010461053-XPAR","FR0000045239-XPAR","FR0000045551-XPAR","FR0000185514-XPAR","FR0000044364-XPAR","FR0000045528-XPAR","FR0000045346-XPAR","FR0000045304-XPAR","FR0000045072-XPAR","FR0011716265-ALXP","FR0000050395-XPAR","FR0014004QR6-ALXP","FR0013507977-ALXP","FR0013507985-ALXP","FR0013508009-ALXP","FR0010404368-ALXP","FR0000077885-XMLI","FR0000185423-ALXP","FR0000120644-XPAR","FR0014004L86-XPAR","FR0014003TT8-XPAR","FR001400LO86-ALXP","FR001400O218-ALXP","FR0010417345-XPAR","FR001400AYG6-XPAR","FR0014004JF6-XPAR","FR0000062978-XPAR","FR0000054132-ALXP","FR0013283108-ALXP","FR0000053381-XPAR","FR0000060840-ALXP","FR001400IAQ8-ALXP","FR0012202497-ALXP","BE0974289218-ALXB","FR0010436584-ALXP","FR0000065260-XPAR","FR0014004QZ9-ALXP","FR0013331212-ALXP","FR0013088606-ALXP","FR0014007951-ALXP","FR0000052920-XMLI","LU0881232630-XMLI","FR0014004339-ALXP","HK0000038783-XMLI","FR0007200100-XMLI","FR0010536185-XMLI","DE000A0XYM45-XMLI","FR0013534617-ALXP","FR0011490648-ALXP","FR0010908533-XPAR","IT0005351504-ALXP","FR0000052755-XMLI","FR0010882886-XMLI","FR0010439265-XMLI","FR0000072373-ALXP","FR0000130452-XPAR","FR0011466069-XPAR","FR0000031023-XPAR","FR0000035719-XPAR","FR0011950732-XPAR","FR0012435121-XPAR","ES0105726006-XMLI","ES0105639001-XMLI","FR0013356755-ALXP","FR0004030708-ALXP","FR0013330792-ALXP","FR0013399359-ALXP","FR0011915339-ALXP","FR0010208488-XPAR","FR001400C2Z4-ALXP","FR0014004974-ALXP","FR0014004362-ALXP","FR0010424697-ALXP","FR0000045122-ALXP","FR0010465534-ALXP","FR0012882389-XPAR","FR0000131757-XPAR","FR0010211037-ALXP","FR0000035818-ALXP","FR0000121667-XPAR","FR0000120669-XPAR","FR0000061475-XPAR","FR0010844001-ALXP","FR0000121121-XPAR","FR0000054678-XPAR","FR0014008VX5-XPAR","FR0013240934-ALXP","FR0013256518-ALXP","FR001400M7C0-XPAR","FR0014000MR3-XPAR","FR0010157115-XMLI","ES0105586004-XMLI","NL0006294274-XPAR","FR0010490920-ALXP","FR001400CF13-ALXP","FR0010221234-XPAR","FR0000035784-XPAR","FR0000064164-ALXP","FR0000062671-XPAR","FR0014005DA7-XPAR","FR0004527638-XPAR","FR0014003AQ4-XPAR","ES0105029005-ALXP","ES0105553004-XMLI","FR0004034593-ALXP","FR0000031973-XPAR","FR0012300424-XMLI","FR0013451333-XPAR","FR0000062101-XPAR","FR0011271600-XPAR","FR0000061418-XPAR","FR0000060535-XPAR","FR0011665280-XPAR","FR001400AEM6-ALXP","FR0000062341-XPAR","SN0000033192-XPAR","FR0000060824-XPAR","FR0000035123-XPAR","FR0010487272-XMLI","FR0000038184-XPAR","CH0120879058-XMLI","FR0000074759-ALXP","FR001400GO75-ALXP","FR0011476928-XPAR","FR0013230067-XMLI","FR0012419307-ALXP","FR0000065930-XPAR","FR0000038499-XPAR","FR0010341032-XPAR","FR0000033409-XPAR","FR0011605617-XMLI","FR0000053944-XPAR","CI0000053161-XPAR","FR0014005SB3-XPAR","FR0000121147-XPAR","FR0010485268-ALXP","FR0013030152-XPAR","FR0013222346-XMLI","FR0010823724-XMLI","FR0004187367-ALXP","FR0010588079-XPAR","FR0000053415-XMLI","FR0011100759-XMLI","FR0000030611-XPAR","FR0000124414-ALXP","FR0000034894-XPAR","FR0013495298-ALXP","FR0000053035-XPAR","FR001400M1R1-ALXP","FR0010040865-XPAR","US3696043013-XPAR","CH0308403085-XPAR","FR0004163111-XPAR","FR0004053510-ALXP","FR0013183985-XPAR","PTGVE1AE0009-XMLI","FR0010533075-XPAR","FR0000033888-ALXP","FR0000066672-XPAR","IT0005454167-XMLI","IT0005454175-XMLI","IT0005454134-XMLI","FR0011052257-ALXP","ES0105537007-XMLI","FR0011208693-ALXP","FR0010214064-XPAR","FR0013204070-ALXP","FR0000065971-XPAR","FR0014005ZM5-ALXP","FR00140069V2-ALXP","FR0000076960-XMLI","FR0000036675-XPAR","FR0012819381-ALXP","FR0004010338-XPAR","FR0000075442-ALXP","FR0013439627-ALXP","FR0012612646-XPAR","FR0010529719-XMLI","FR0004155000-XPAR","FR0013429404-ALXP","FR0014000RP6-ALXP","US36254L2097-XPAR","FR0011726835-XPAR","LU1840650458-XMLI","FR0000032526-XPAR","FR0000066722-XPAR","FR0014007ND6-ALXP","GB00BMDXQ672-ALXP","FR0000066755-XPAR","FR0014003VY4-XPAR","ES0105498002-XMLI","FR0000066540-ALXP","FR0000052292-XPAR","FR0004159473-ALXP","FR0000038531-ALXP","FR0000054231-XPAR","FR0012821916-ALXP","FR0010396309-ALXP","DE000A11Q133-XMLI","FR0000051302-XMLI","FR0013451044-ALXP","FR0012336691-XMLI","FR0010312181-XMLI","FR0014000U63-ALXP","FR0000065278-ALXP","FR0006226791-XMLI","ES0105664009-XMLI","FR0000053738-XMLI","FR0004165801-XPAR","FR0006563904-XMLI","FR0014007LQ2-ALXP","FR0004153930-ALXP","FR0000064735-XMLI","FR0005843125-XMLI","FR0014001PM5-ALXP","FR0014005IU4-ALXP","FR0005854700-ALXP","ES0105479002-XMLI","FR0000035081-XPAR","FR001400A3Q3-ALXP","FR0010929125-XPAR","FR0000051393-XPAR","FR0000079691-XMLI","FR0000062184-ALXP","ES0105551008-XMLI","FR00140048X2-ALXP","IT0005380602-ALXP","FR0010086371-XMLI","FR0000120859-XPAR","FR0006859039-XMLI","FR0013060100-ALXP","FR0000033243-XPAR","FR0013470168-ALXP","FR0000065773-XMLI","ES0105590006-XMLI","FR0000066219-XPAR","FR0011158823-XMLI","FR0000071797-XPAR","ES0105511002-XMLI","ES0105473005-XMLI","FR0010331421-XPAR","FR0000064297-ALXP","IT0005391161-XMLI","FR0000060451-ALXP","FR0010908723-ALXP","FR0014003FN0-XMLI","FR0004024222-XPAR","FR0000064958-XPAR","FR0011179886-ALXP","FR0013233012-XPAR","BE0974299316-ALXP","ES0105417002-XMLI","FR0010259150-XPAR","FR0000073298-XPAR","ES0109429037-ALXP","FR0000072597-ALXP","IT0005336521-XMLI","FR0004026151-XPAR","FR0012872141-XPAR","FR0000033904-XPAR","FR0000077919-XPAR","FR0010680033-XMLI","ES0105636007-XMLI","FR0010722819-ALXP","FR0004007813-XPAR","FR0000121485-XPAR","FR0013156007-ALXP","FR0004029411-ALXP","FR0013374667-ALXP","FR0011038348-ALXP","FR0000121964-XPAR","ES0105425005-ALXP","FR0013419876-ALXP","FR0000120321-XPAR","NL0012191662-ALXP","FR0000075343-ALXP","FR0000066607-XPAR","FR0000130213-XPAR","FR0004027068-ALXP","FR0013308582-ALXP","FR001400JY13-XPAR","FR0006864484-XPAR","FR0013204336-XPAR","FR0000121295-ALXP","FR0000065484-XPAR","FR001400MMI2-XPAR","FR0010307819-XPAR","FR001400F2Z1-ALXP","FR0007080254-ALXP","FR0000033599-ALXP","FR0014009YQ1-XPAR","FR0004156297-XPAR","FR0000050353-XPAR","BE0974334667-ALXP","ES0105089009-ALXP","FR0004170017-XPAR","FR0004155208-XMLI","FR0000044943-ALXP","FR0006205019-XMLI","FR0011884378-ALXP","FR0000038242-XPAR","FR0000121014-XPAR","FR00140085W6-XPAR","FR0013270626-ALXP","FR0012634822-XPAR","FR0010328302-XMLI","FR0010827741-XMLI","FR0000061657-XMLI","FR0011092089-XMLI","FR0013153541-XPAR","ES0105463006-ALXP","FR0000030074-XPAR","FR0000038606-XPAR","ES0105447009-XMLI","FR0013400835-ALXP","MA0000011488-XPAR","FR0004155687-ALXP","FR0013472446-ALXP","FR0010609263-ALXP","FR0000051070-XPAR","FR0000060873-XPAR","FR0011742329-XPAR","FR0010844464-ALXP","FR0000064404-XPAR","IT0005324105-XMLI","FR0011049824-ALXP","FR0004065605-XPAR","IT0004844848-XMLI","FR0010298620-XPAR","FR0010241638-XPAR","ES0105559001-XMLI","FR0000039620-XPAR","FR0004177046-XPAR","FR0010492181-XMLI","FR00140066X4-ALXP","FR0011217710-ALXP","BE0974328602-XMLI","FR0000053225-XPAR","IT0005450819-ALXP","FR0010204453-ALXP","FR0010353888-ALXP","FR001400AJ45-XPAR","FR0000077570-ALXP","FR0010500363-XMLI","FR0013053535-ALXP","FR0004172450-ALXP","FR00140050Q2-ALXP","FR001400H3A0-ALXP","FR0000076986-XPAR","BE0003853703-XBRU","ES0105549002-XMLI","FR0011033083-ALXP","FR0004034320-ALXP","FR0013462231-ALXP","ES0105697009-XMLI","FR001400IE67-XPAR","FR0013482791-XPAR","FR0014003J32-ALXP","FR0011341205-XPAR","FR0011675362-XPAR","FR0011636083-ALXP","FR001400MV37-ALXP","FR0004154060-ALXP","FR0000072993-ALXP","FR0004050250-XPAR","FR0000044448-XPAR","FR0010112524-XPAR","FR0004171346-ALXP","FR0014003XT0-ALXP","FR0012650166-XPAR","FR0013018124-ALXP","FI0009000681-XPAR","ES0105719001-XMLI","FR0010397232-ALXP","FR0000185464-XMLI","FR0014001PV6-XPAR","FR0000121691-XPAR","FR0000064529-ALXP","FR0004065639-ALXP","FR0014003711-ALXP","FR0013310281-XMLI","FR0000052680-XPAR","ES0105698007-XMLI","FR0010428771-XPAR","FR0014003T71-ALXP","FR001400CM63-ALXP","FR0013266772-ALXP","FR0004174712-XMLI","FR0000133308-XPAR","FR0000075392-XPAR","ES0105490009-XMLI","FR0013318052-ALXP","FR0010609206-XPAR","ES0105534004-XMLI","FR0000184798-XPAR","FR0012127173-XPAR","FR001400IUV6-ALXP","FR0013231180-ALXP","FR0014005HJ9-XPAR","FR0000077992-XMLI","FR0010263202-XPAR","FR0004038263-XPAR","FR0006823092-XMLI","NL0012650535-XMLI","FR0000038465-XPAR","FR0011027135-XPAR","FR0013479730-ALXP","FR0000120693-XPAR","FR0000061459-XPAR","ES0105612008-XMLI","NL0015001HZ9-XMLI","FR0000064784-XPAR","FR001400N1P4-ALXP","FR001400K4B1-XPAR","FR0000185480-XMLI","BE0948608451-XMLI","FR001400B4H9-XPAR","FR001400B4G1-XPAR","FR0000073041-XPAR","FR0000061608-ALXP","FR001400JX97-ALXP","FR0000030769-XMLI","FR0010785790-ALXP","FR0011844067-ALXP","FR0013252186-XPAR","FR0000124570-XPAR","NL0015001W49-XPAR","FR0000066441-ALXP","FR0013015583-ALXP","FR0012432516-XPAR","FR0014004EC4-ALXP","FR0010169920-ALXP","FR0004044600-ALXP","FR0004052561-XPAR","FR0010313486-ALXP","FR0012613610-XPAR","FR0010380626-ALXP","FR0013398617-ALXP","FR0000061376-XMLI","FR0000130577-XPAR","FR0000120560-XPAR","ES0105118006-ALXP","FR0011648971-ALXP","FR0010889386-ALXP","IT0005466963-ALXP","FR0000060618-XPAR","FR0000044471-XPAR","GB00BM9PTW47-ALXP","FR0011858190-ALXP","FR0000130395-XPAR","FR0000131906-XPAR","ES0105550000-XMLI","FR0010820274-ALXP","FR0010451203-XPAR","FR0000075954-ALXP","FR0000039091-XPAR","FR0000045619-XPAR","FR0000045601-XPAR","FR0013344173-XPAR","FR0010523167-ALXP","FR0013477593-ALXP","FR0000037640-ALXP","FR0013269123-XPAR","FR0000121709-XPAR","FR001400F1V2-ALXP","FR0000073272-XPAR","ES0105651006-XMLI","FR0000125007-XPAR","FR001400M7D8-XPAR","FR0000060121-XPAR","FR0000060071-XPAR","FR0000120578-XPAR","FR001400M6Z3-XPAR","FR0010776617-ALXP","FR0013154002-XPAR","FR0000120107-XPAR","FR0013155975-XMLI","FR0006239109-XPAR","FR0010972091-XMLI","AN8068571086-XPAR","FR0000121972-XPAR","ES0105592002-XMLI","FR0010411983-XPAR","FR0000039109-XPAR","GB00B5ZN1N88-XPAR","IT0005353484-ALXP","FR0000065492-XPAR","FR0004175842-XPAR","IT0005072811-XMLI","FR0012596468-ALXP","NL0010623518-XMLI","FR0011950682-XPAR","LU0088087324-XPAR","FR0013006558-XPAR","FR0010202606-ALXP","FR0000060790-ALXP","FR0000074122-XPAR","FR0010679365-XMLI","CI0000000832-XMLI","FR0010812230-ALXP","FR0014005I80-ALXP","FR0011131788-XMLI","FR0010649228-XMLI","FR001400LBS6-XMLI","FR0013214145-XPAR","FR0004016699-ALXP","FR0010209809-XPAR","FR0000130809-XPAR","FR0000121220-XPAR","FR0000078321-XPAR","FR0000065864-ALXP","FR0013227113-XPAR","FR00140006O9-XPAR","FR0013379484-XPAR","BE0003470755-XBRU","FR0000050809-XPAR","FR00140043Y1-ALXP","FR0000054371-XMLI","FR0012757854-XPAR","FR0011464452-ALXP","FR001400BVK2-ALXP","FR0011289040-XPAR","FR0000054199-XPAR","FR0000064271-XPAR","NL00150001Q9-XPAR","FR001400MDW2-ALXP","NL0000226223-XPAR","FR0000074775-ALXP","FR0010528059-ALXP","FR001400DG11-ALXP","FR001400DGA0-ALXP","FR0000063976-XMLI","GB00B8GJBS16-XMLI","FR0004180578-XPAR","BE0974464977-XBRU","FR0000032658-XPAR","FR0004188670-XPAR","IT0005507857-ALXP","FR0000063307-XPAR","NL0014559478-XPAR","FR0000051807-XPAR","CH0008175645-XPAR","FR0011076595-XMLI","FR001400BMH7-XPAR","FR0014000TB2-XPAR","FR0000054900-XPAR","FR001400M3E5-XPAR","FR0013295789-XPAR","FR0000121329-XPAR","GRS528003007-XMLI","FR0011053636-ALXP","FR0010120402-ALXP","FR0013286259-ALXP","BE0974387194-ALXP","FR0013333432-XPAR","FR0013230612-XPAR","FR0000066482-XPAR","BE0974338700-XBRU","NL0015000YE1-ALXP","NL0015001SR3-ALXP","FR001400H2X4-ALXP","LU0394945660-ALXP","FR00140062B9-ALXP","FR0000120271-XPAR","GA0000121459-XPAR","FR0000033003-XPAR","FR0000036816-XPAR","FR0000031866-XMLI","FR0005175080-XPAR","FR0005691656-XPAR","FR0010397901-ALXP","FR0000031106-XMLI","FR0004175099-ALXP","FR0010383877-ALXP","FR0010654087-ALXP","FR0000079147-ALXP","FR0000054470-XPAR","GB00BJ9M4V82-XMLI","FR0011776889-XMLI","FR0013326246-XPAR","FR0000054215-XPAR","FR0000074197-XPAR","FR0012709160-ALXP","FR0010337865-ALXP","ES0105748000-XMLI","FR0011898584-ALXP","FR0013254851-ALXP","FR0013176526-XPAR","FR0010095596-ALXP","FR0013506730-XPAR","FR00140030K7-XPAR","FR0004056851-XPAR","ES0105623005-XMLI","FR0013505062-XPAR","FR0013526225-XPAR","FR0014007T10-XMLI","FR0010766667-ALXP","FR0000124141-XPAR","FR0013530102-ALXP","FR0013447729-XPAR","FR001400JXA2-ALXP","FR0010291245-XPAR","FR0006174496-XMLI","FR0014003I41-XMLI","FR0004186856-XPAR","FR0010326090-ALXP","FR0000031775-XPAR","FR0000050049-XPAR","FR0000125486-XPAR","FR001400AXT1-ALXP","FR0000031577-XPAR","ES0105704003-XMLI","FR0004029478-ALXP","FR0014003O76-ALXP","FR0013481835-ALXP","FR0010309096-XPAR","FR0000127771-XPAR","FR0011532225-ALXP","FR0011995588-XPAR","FR0004045847-ALXP","FR0000062796-XPAR","ES0105492005-XMLI","FR0010282822-XPAR","FR0012532810-XPAR","FR0010131409-ALXP","FR0013357621-XPAR","FR0013079092-ALXP","FR0010688465-XMLI","FR0010688440-ALXP","FR0004152700-XMLI","FR0000121204-XPAR","FR0010768770-XMLI","ES0105399002-XMLI","FR0014000P11-ALXP","FR0013143872-ALXP","FR00140047H7-XMLI","FR0011981968-XPAR","BE0974310428-XPAR","FR0004034072-XPAR","ZM0000000037-XMLI","BMG9887P1068-XPAR"],["21 Feb 2024 17:22 CET","21 Feb 2024 17:35 CET","21 Feb 2024 15:59 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:29 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","13 Oct 2023 11:30 CEST","21 Feb 2024 13:41 CET","21 Feb 2024 15:47 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:03 CET","21 Feb 2024 16:18 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","20 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:09 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 13:42 CET","21 Feb 2024 09:45 CET","02 Feb 2024 12:14 CET","21 Feb 2024 09:00 CET","21 Feb 2024 17:28 CET","21 Feb 2024 17:35 CET","16 Jun 2023 16:30 CEST","05 Feb 2024 16:42 CET","21 Nov 2023 11:30 CET","21 Feb 2024 16:35 CET","21 Feb 2024 17:10 CET","21 Feb 2024 17:39 CET","21 Feb 2024 17:37 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:57 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:26 CET","21 Feb 2024 17:15 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:06 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:21 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:00 CET","21 Feb 2024 17:36 CET","21 Feb 2024 16:24 CET","08 Feb 2024 16:06 CET","20 Nov 2023 11:30 CET","21 Feb 2024 09:00 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:29 CET","21 Feb 2024 11:49 CET","21 Feb 2024 17:35 CET","12 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","07 Nov 2022 01:00 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:37 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:38 CET","22 Jan 2024 16:39 CET","03 Aug 2020 16:30 CEST","17 Nov 2022 01:00 CET","21 Feb 2024 17:35 CET","17 Sep 2021 02:00 CEST","21 Feb 2024 17:35 CET","16 Aug 2020 02:00 CEST","21 Feb 2024 14:16 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:58 CET","21 Feb 2024 17:35 CET","17 Jan 2024 10:38 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","20 Jul 2023 02:00 CEST","21 Feb 2024 17:24 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:00 CET","21 Feb 2024 17:39 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","21 Feb 2024 15:47 CET","21 Feb 2024 16:36 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","20 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","13 Oct 2023 16:30 CEST","20 Feb 2024 11:30 CET","21 Feb 2024 09:00 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","20 Feb 2024 16:30 CET","18 Sep 2018 02:00 CEST","21 Feb 2024 16:40 CET","21 Feb 2024 17:35 CET","21 Feb 2024 13:29 CET","29 Jun 2023 16:30 CEST","29 Dec 2023 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:36 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:29 CET","21 Feb 2024 09:00 CET","20 Feb 2024 12:43 CET","21 Feb 2024 16:44 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 11:46 CET","21 Feb 2024 09:00 CET","21 Feb 2024 17:39 CET","21 Feb 2024 12:05 CET","12 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","08 Apr 2022 16:30 CEST","21 Feb 2024 17:14 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:20 CET","21 Feb 2024 17:35 CET","12 Feb 2024 01:00 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:24 CET","21 Feb 2024 10:42 CET","21 Feb 2024 15:55 CET","21 Feb 2024 15:06 CET","21 Feb 2024 17:25 CET","21 Feb 2024 16:55 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Aug 2023 11:30 CEST","21 Feb 2024 17:38 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:20 CET","20 Feb 2024 16:02 CET","21 Feb 2024 16:22 CET","09 Feb 2024 09:31 CET","21 Feb 2024 17:15 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:07 CET","14 Feb 2024 11:30 CET","15 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","16 Feb 2024 11:30 CET","30 Nov 2023 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:00 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:18 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","06 Dec 2023 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","20 Feb 2024 12:09 CET","21 Feb 2024 17:35 CET","21 Feb 2024 12:00 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","15 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","20 Feb 2024 16:30 CET","27 Feb 2023 16:30 CET","21 Feb 2024 11:30 CET","17 Nov 2022 01:00 CET","25 Sep 2023 11:30 CEST","20 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","20 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 14:25 CET","21 Feb 2024 16:46 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:00 CET","21 Feb 2024 16:46 CET","21 Feb 2024 17:35 CET","21 Feb 2024 14:50 CET","21 Feb 2024 17:27 CET","21 Feb 2024 17:12 CET","21 Feb 2024 17:22 CET","21 Feb 2024 17:16 CET","21 Feb 2024 16:59 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","15 Sep 2023 09:00 CEST","07 Feb 2024 10:43 CET","09 Nov 2023 09:00 CET","21 Feb 2024 14:59 CET","05 Feb 2024 11:30 CET","21 Feb 2024 16:18 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","19 Feb 2024 09:00 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:13 CET","12 Dec 2023 10:23 CET","21 Feb 2024 13:10 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:18 CET","21 Feb 2024 17:35 CET","20 Feb 2024 16:30 CET","20 Feb 2024 17:07 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:24 CET","21 Feb 2024 13:36 CET","19 Feb 2024 11:30 CET","21 Feb 2024 13:48 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 15:31 CET","30 Aug 2023 16:30 CEST","16 Sep 2022 16:30 CEST","21 Feb 2024 17:07 CET","21 Dec 2023 11:30 CET","20 Feb 2024 16:30 CET","28 Sep 2022 11:30 CEST","21 Dec 2016 15:00 CET","21 Feb 2024 17:00 CET","21 Feb 2024 17:05 CET","21 Feb 2024 17:36 CET","21 Feb 2024 11:59 CET","16 Feb 2024 16:30 CET","20 Feb 2024 16:30 CET","15 Feb 2024 11:30 CET","21 Feb 2024 17:29 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET"," ","13 Sep 2023 16:30 CEST","21 Feb 2024 09:00 CET","21 Feb 2024 15:44 CET","21 Feb 2024 16:18 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:28 CET","21 Feb 2024 17:35 CET","19 Jan 2024 09:00 CET","21 Feb 2024 15:04 CET","21 Feb 2024 17:17 CET","21 Feb 2024 16:58 CET","21 Feb 2024 11:30 CET","21 Feb 2024 16:49 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","28 Sep 2023 17:07 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","13 Feb 2024 16:30 CET","14 Dec 2022 09:00 CET","21 Feb 2024 17:35 CET","07 Feb 2024 16:20 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","02 Nov 2023 16:30 CET"," ","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","11 Aug 2021 02:00 CEST","21 Feb 2024 17:36 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:36 CET","21 Feb 2024 17:35 CET","21 Feb 2024 14:25 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:26 CET","21 Feb 2024 12:31 CET","21 Feb 2024 09:00 CET","29 Jul 2021 02:00 CEST","21 Feb 2024 11:51 CET","17 Jan 2024 16:35 CET","14 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","16 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 13:09 CET","18 Sep 2023 16:30 CEST","08 Mar 2023 11:49 CET","21 Feb 2024 16:30 CET","01 Aug 2023 13:59 CEST","21 Feb 2024 16:30 CET","16 Feb 2024 16:49 CET","28 Jun 2023 16:41 CEST","21 Feb 2024 17:29 CET","21 Feb 2024 15:43 CET","21 Feb 2024 17:35 CET","26 Jan 2024 11:30 CET","21 Feb 2024 17:35 CET","17 Oct 2023 11:30 CEST","20 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","12 Dec 2023 16:30 CET","21 Feb 2024 11:30 CET","09 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:36 CET","21 Feb 2024 17:13 CET","21 Feb 2024 17:35 CET","24 May 2022 11:30 CEST","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","16 Jan 2024 11:30 CET","31 Jan 2024 16:30 CET","21 Feb 2024 11:30 CET","21 Feb 2024 14:32 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:04 CET","21 Feb 2024 09:00 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:28 CET","21 Feb 2024 17:29 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:35 CET","21 Feb 2024 17:35 CET","19 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:55 CET","21 Feb 2024 17:37 CET"," ","11 Sep 2023 16:30 CEST"," ","21 Feb 2024 17:35 CET","16 Apr 2021 02:00 CEST","21 Feb 2024 16:30 CET","21 Feb 2024 14:29 CET","21 Feb 2024 13:32 CET","21 Feb 2024 09:38 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:36 CET","17 Jan 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","14 Feb 2024 11:32 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 12:38 CET","18 Mar 2013 15:00 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:00 CET","16 Feb 2024 14:14 CET","24 Dec 2020 11:30 CET","21 Feb 2024 17:35 CET","23 May 2022 11:30 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:31 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:22 CET","30 Sep 2020 02:00 CEST","21 Feb 2024 17:28 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:28 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:36 CET","21 Feb 2024 11:30 CET","21 Feb 2024 16:30 CET","13 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","23 Jan 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 14:45 CET","17 Oct 2023 16:30 CEST","31 Jan 2024 11:30 CET","15 Feb 2024 16:30 CET","21 Feb 2024 16:30 CET","19 Feb 2024 11:30 CET","21 Feb 2024 17:24 CET","21 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","19 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 12:34 CET","21 Feb 2024 16:30 CET","20 May 2022 16:30 CEST","21 Feb 2024 17:39 CET","21 Feb 2024 15:45 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","09 Feb 2024 16:30 CET","21 Feb 2024 17:19 CET","31 Aug 2021 02:00 CEST","21 Feb 2024 10:55 CET","06 Oct 2023 09:00 CEST","01 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","08 Jun 2021 11:30 CEST","20 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:26 CET","21 Feb 2024 16:30 CET","04 Jan 2024 11:30 CET","21 Feb 2024 16:30 CET","20 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","08 Apr 2021 02:00 CEST","06 Apr 2020 02:00 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 16:51 CET","08 Nov 2023 11:30 CET","19 Feb 2024 17:17 CET","21 Feb 2024 15:28 CET","14 Aug 2023 11:30 CEST","21 Feb 2024 17:35 CET","12 Feb 2024 13:36 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","05 Aug 2019 02:00 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:00 CET","21 Feb 2024 09:05 CET","25 Oct 2023 16:30 CEST","20 Feb 2024 15:30 CET","21 Feb 2024 16:15 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:17 CET","21 Feb 2024 09:25 CET","21 Feb 2024 17:27 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:00 CET","21 Feb 2024 17:18 CET","21 Feb 2024 17:35 CET","03 Jul 2023 09:00 CEST","21 Feb 2024 16:35 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:19 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 12:50 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:51 CET","21 Feb 2024 17:35 CET"," ","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 12:03 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:36 CET","21 Feb 2024 14:42 CET","21 Feb 2024 17:35 CET","09 Feb 2024 16:30 CET","21 Feb 2024 17:06 CET","08 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:18 CET","21 Feb 2024 17:20 CET","21 Feb 2024 16:30 CET","21 Feb 2024 16:30 CET","20 Feb 2024 11:30 CET","08 Dec 2023 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","27 Jan 2020 11:30 CET","21 Feb 2024 14:18 CET","21 Feb 2024 09:00 CET","21 Feb 2024 16:31 CET"," ","21 Feb 2024 17:35 CET","21 Feb 2024 17:37 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:40 CET","20 Feb 2024 09:32 CET","18 Jan 2024 11:30 CET","21 Feb 2024 17:29 CET","21 Feb 2024 17:35 CET","28 Nov 2012 10:24 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","02 Jul 2021 02:00 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","15 Jan 2024 11:38 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:45 CET","30 Jan 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 10:38 CET","20 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:28 CET","16 Feb 2024 11:30 CET","21 Feb 2024 09:00 CET","21 Feb 2024 17:35 CET","21 Feb 2024 12:02 CET","21 Feb 2024 09:43 CET","21 Feb 2024 15:39 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:50 CET","21 Feb 2024 17:35 CET","21 Feb 2024 13:42 CET","21 Feb 2024 16:39 CET","02 Jan 2024 13:59 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:23 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 13:00 CET","21 Feb 2024 16:24 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:21 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:27 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:56 CET","21 Feb 2024 17:35 CET","21 Feb 2024 12:45 CET","21 Feb 2024 17:35 CET","20 Feb 2024 16:30 CET","19 Feb 2024 14:21 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 16:00 CET","21 Feb 2024 17:19 CET","21 Feb 2024 16:52 CET","21 Feb 2024 17:35 CET","29 Mar 2023 02:00 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 16:46 CET","21 Feb 2024 17:35 CET","21 Feb 2024 14:40 CET","19 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 15:49 CET","30 Jul 2020 02:00 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","03 Nov 2023 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:23 CET","21 Feb 2024 17:35 CET","12 Feb 2024 11:30 CET","21 Feb 2024 09:00 CET","21 Feb 2024 16:46 CET","20 Feb 2024 11:30 CET","21 Feb 2024 16:30 CET","21 Feb 2024 16:37 CET","21 Feb 2024 16:46 CET","21 Feb 2024 15:49 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","09 Jun 2022 16:30 CEST","19 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","17 Jan 2024 16:30 CET","21 Feb 2024 11:30 CET","21 Feb 2024 16:59 CET","14 Feb 2024 11:13 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:18 CET","30 Jan 2024 17:35 CET","15 Feb 2024 16:37 CET","21 Feb 2024 14:26 CET","14 Nov 2023 15:29 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:36 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:18 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:21 CET","21 Feb 2024 16:49 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:16 CET","21 Feb 2024 09:14 CET","21 Feb 2024 12:30 CET","21 Feb 2024 17:29 CET","20 Feb 2024 09:58 CET","07 Nov 2023 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:00 CET","21 Feb 2024 17:25 CET","21 Feb 2024 17:35 CET","21 Feb 2024 09:02 CET","21 Feb 2024 17:11 CET","21 Feb 2024 14:55 CET","21 Feb 2024 17:24 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","29 Jun 2021 02:00 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","02 Nov 2022 11:30 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:19 CET","21 Feb 2024 17:35 CET","18 Apr 2023 16:45 CEST","21 Feb 2024 10:45 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:37 CET","21 Feb 2024 16:06 CET","21 Feb 2024 17:36 CET","14 Jun 2022 02:00 CEST","21 Feb 2024 17:35 CET"," ","21 Feb 2024 14:41 CET","21 Feb 2024 17:17 CET","21 Feb 2024 17:35 CET","14 Feb 2024 11:30 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 13:20 CET","29 Jan 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:38 CET","24 Mar 2023 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","07 Apr 2021 13:45 CEST","21 Dec 2023 09:29 CET","25 Mar 2009 01:00 CET","21 Feb 2024 16:30 CET","05 Aug 2016 15:00 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:11 CET","21 Feb 2024 17:35 CET","22 Mar 2021 16:30 CET","13 Nov 2019 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 14:22 CET","21 Feb 2024 16:30 CET","27 Dec 2016 15:30 CET","02 Jan 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:27 CET","19 Feb 2024 11:41 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:01 CET","21 Feb 2024 10:14 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:05 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:38 CET","19 Feb 2024 11:48 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:43 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:37 CET","19 Feb 2024 11:30 CET","21 Feb 2024 15:41 CET"," "," ","21 Feb 2024 16:30 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","21 Feb 2024 09:00 CET","05 Jan 2024 12:47 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 12:30 CET","29 Dec 2023 13:45 CET","21 Feb 2024 17:25 CET","14 Dec 2023 13:15 CET","21 Feb 2024 17:35 CET"," ","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","16 Nov 2023 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:18 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:38 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:36 CET","15 Feb 2024 10:30 CET","21 Feb 2024 17:35 CET","29 Aug 2022 16:30 CEST","21 Feb 2024 17:35 CET","21 Feb 2024 17:38 CET","21 Feb 2024 17:35 CET","21 Feb 2024 15:31 CET","21 Feb 2024 17:35 CET","20 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:30 CET","13 Feb 2024 11:30 CET","07 Feb 2024 16:30 CET","15 Feb 2024 13:57 CET","21 Feb 2024 16:37 CET","21 Feb 2024 17:26 CET","21 Feb 2024 17:35 CET","12 Feb 2024 16:30 CET","21 Feb 2024 16:30 CET","21 Feb 2024 17:35 CET","19 Feb 2024 14:58 CET","21 Feb 2024 17:27 CET","21 Feb 2024 15:26 CET","19 Feb 2024 09:00 CET"," ","21 Feb 2024 17:04 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:37 CET","21 Feb 2024 16:37 CET","21 Feb 2024 17:37 CET"," ","21 Feb 2024 17:35 CET","16 Dec 2021 01:00 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:20 CET","21 Feb 2024 11:30 CET","21 Feb 2024 17:25 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:28 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:38 CET","21 Feb 2024 17:35 CET","21 Feb 2024 11:30 CET","12 Sep 2023 16:30 CEST","21 Feb 2024 17:35 CET","31 Jan 2024 16:30 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:37 CET","21 Feb 2024 13:14 CET","21 Feb 2024 17:35 CET","14 Feb 2024 11:30 CET","21 Feb 2024 17:16 CET","20 Feb 2024 14:25 CET","21 Feb 2024 17:35 CET","21 Feb 2024 12:58 CET","21 Feb 2024 17:38 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:05 CET","30 Jul 2020 02:00 CEST","21 Feb 2024 17:36 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 15:31 CET","11 Dec 2023 11:30 CET","21 Feb 2024 15:19 CET","16 Feb 2024 11:30 CET","21 Feb 2024 17:35 CET","19 Feb 2024 11:30 CET","25 Oct 2019 11:30 CEST","21 Feb 2024 16:47 CET","21 Feb 2024 17:35 CET","26 Jan 2024 16:30 CET","21 Feb 2024 17:39 CET","21 Feb 2024 17:35 CET","21 Feb 2024 17:35 CET","21 Feb 2024 16:31 CET","04 Aug 2015 16:20 CEST"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>Name<\/th>\n      <th>Ticker<\/th>\n      <th>Code_ISIN<\/th>\n      <th>Market<\/th>\n      <th>Last_price<\/th>\n      <th>Percentage change (in %)<\/th>\n      <th>URL<\/th>\n      <th>Ticker_adn<\/th>\n      <th>Date<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"BRrltpi","scrollX":true,"scrollY":"350px","lengthMenu":[[10,50,100,-1],["10","50","100","All"]],"ColReorder":true,"rowReorder":false,"buttons":["copy","print",{"extend":"collection","buttons":["csv","excel","pdf"],"columnDefs":[{"targets":[0,2,3,4,5,6,7,8],"className":"dt-center"}],"text":"Download"},["colvis"]],"columnDefs":[{"className":"dt-right","targets":5}],"order":[],"autoWidth":false,"orderClasses":false,"responsive":true},"selection":{"mode":"multiple","selected":null,"target":"row","selectable":null}},"evals":[],"jsHooks":[]}</script>
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
#> [1] 1311    8
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
   <td style="text-align:left;"> €1265.31 </td>
   <td style="text-align:left;"> +0.36% </td>
   <td style="text-align:left;"> 21 Feb 2024 </td>
   <td style="text-align:left;"> +0.29% </td>
   <td style="text-align:left;"> FR0013371432-ESF5G </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 50 ESG EW NR </td>
   <td style="text-align:left;"> FR0013371424 </td>
   <td style="text-align:left;"> ESF5N </td>
   <td style="text-align:left;"> €1205.78 </td>
   <td style="text-align:left;"> +0.35% </td>
   <td style="text-align:left;"> 21 Feb 2024 </td>
   <td style="text-align:left;"> +0.24% </td>
   <td style="text-align:left;"> FR0013371424-ESF5N </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 80 EW </td>
   <td style="text-align:left;"> FR0013017936 </td>
   <td style="text-align:left;"> SBF80 </td>
   <td style="text-align:left;"> €1257.48 </td>
   <td style="text-align:left;"> +0.23% </td>
   <td style="text-align:left;"> 21 Feb 2024 </td>
   <td style="text-align:left;"> +0.43% </td>
   <td style="text-align:left;"> FR0013017936-SBF80 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 80 EW Decrement 50 Points </td>
   <td style="text-align:left;"> FR0013017969 </td>
   <td style="text-align:left;"> SBF8D </td>
   <td style="text-align:left;"> €1009.23 </td>
   <td style="text-align:left;"> +0.22% </td>
   <td style="text-align:left;"> 21 Feb 2024 </td>
   <td style="text-align:left;"> -0.19% </td>
   <td style="text-align:left;"> FR0013017969-SBF8D </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 80 EW GR </td>
   <td style="text-align:left;"> FR0013017951 </td>
   <td style="text-align:left;"> SBF8G </td>
   <td style="text-align:left;"> €1601.48 </td>
   <td style="text-align:left;"> +0.23% </td>
   <td style="text-align:left;"> 21 Feb 2024 </td>
   <td style="text-align:left;"> +0.55% </td>
   <td style="text-align:left;"> FR0013017951-SBF8G </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF Top 80 EW NR </td>
   <td style="text-align:left;"> FR0013017944 </td>
   <td style="text-align:left;"> SBF8N </td>
   <td style="text-align:left;"> €1498.57 </td>
   <td style="text-align:left;"> +0.23% </td>
   <td style="text-align:left;"> 21 Feb 2024 </td>
   <td style="text-align:left;"> +0.52% </td>
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
   <td style="text-align:left;"> AMUNDI TPX GBP HD </td>
   <td style="text-align:left;"> TPHG </td>
   <td style="text-align:left;"> LU1681038086 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> NA107.4884 </td>
   <td style="text-align:left;"> 0.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 496 </td>
   <td style="text-align:left;"> AMUNDI TPX USD HD </td>
   <td style="text-align:left;"> TPHU </td>
   <td style="text-align:left;"> LU1681037948 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> $119.1413 </td>
   <td style="text-align:left;"> 0.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 497 </td>
   <td style="text-align:left;"> AMUNDI UK Gov Infl </td>
   <td style="text-align:left;"> GILI </td>
   <td style="text-align:left;"> LU1407893301 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €160.61 </td>
   <td style="text-align:left;"> -0.56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 498 </td>
   <td style="text-align:left;"> AMUNDI US CORP SRI </td>
   <td style="text-align:left;"> UCRP </td>
   <td style="text-align:left;"> LU1806495575 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> 55.88 </td>
   <td style="text-align:left;"> 55.993 </td>
   <td style="text-align:left;"> $56.091 </td>
   <td style="text-align:left;"> -0.06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 499 </td>
   <td style="text-align:left;"> AMUNDI US MIN VO </td>
   <td style="text-align:left;"> MIVU </td>
   <td style="text-align:left;"> LU1589349734 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> 81.50 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> €82.984 </td>
   <td style="text-align:left;"> -0.22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 500 </td>
   <td style="text-align:left;"> AMUNDI US MIN VO </td>
   <td style="text-align:left;"> MIVU </td>
   <td style="text-align:left;"> LU1589349734 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> $89.71 </td>
   <td style="text-align:left;"> -0.31 </td>
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
   <td style="text-align:left;"> 4.775 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> $4.8231 </td>
   <td style="text-align:left;"> 0.08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -1X SHORT DIS </td>
   <td style="text-align:left;"> SDIS </td>
   <td style="text-align:left;"> XS2337085422 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €6.0208 </td>
   <td style="text-align:left;"> 1.30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -1X SHORT PLTR </td>
   <td style="text-align:left;"> SPLR </td>
   <td style="text-align:left;"> XS2337086669 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €1.3595 </td>
   <td style="text-align:left;"> 0.82 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -1X SHORT PLUG </td>
   <td style="text-align:left;"> SPLU </td>
   <td style="text-align:left;"> XS2336362079 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €4.6115 </td>
   <td style="text-align:left;"> 2.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -3X ARK INNOVATION </td>
   <td style="text-align:left;"> SARKK </td>
   <td style="text-align:left;"> XS2399368906 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> 0.515 </td>
   <td style="text-align:left;"> 0.679 </td>
   <td style="text-align:left;"> €0.5799 </td>
   <td style="text-align:left;"> 7.19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> -3x China Tech </td>
   <td style="text-align:left;"> SKWE </td>
   <td style="text-align:left;"> XS2399370126 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> €0.2581 </td>
   <td style="text-align:left;"> -1.90 </td>
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
   <td style="text-align:left;"> ALLIAN3.25%13JUN28 </td>
   <td style="text-align:left;"> ALLIANDER N.V. </td>
   <td style="text-align:left;"> NO0012698341 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> 2028-06-13 </td>
   <td style="text-align:left;"> 3.25% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 496 </td>
   <td style="text-align:left;"> ALLIANDER1.625%PL </td>
   <td style="text-align:left;"> ALLIANDER N.V. </td>
   <td style="text-align:left;"> NO0012698341 </td>
   <td style="text-align:left;"> XAMS </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 1.625% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 497 </td>
   <td style="text-align:left;"> ALLY FINANCIAL 8% </td>
   <td style="text-align:left;"> ALLY FINANCIAL INC </td>
   <td style="text-align:left;"> NO0012698341 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> 2031-11-01 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> 110.49 </td>
   <td style="text-align:left;"> 0.91% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 498 </td>
   <td style="text-align:left;"> ALPERIA GREEN TF 5 </td>
   <td style="text-align:left;"> Alperia S.p.A </td>
   <td style="text-align:left;"> NO0012698341 </td>
   <td style="text-align:left;"> ETLX </td>
   <td style="text-align:left;"> 2028-07-05 </td>
   <td style="text-align:left;"> 0.0% </td>
   <td style="text-align:left;"> 99.85 </td>
   <td style="text-align:left;"> 0.14% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 499 </td>
   <td style="text-align:left;"> ALPHATHAI8%28JAN25 </td>
   <td style="text-align:left;"> ALPHA THAI BENELUX SA </td>
   <td style="text-align:left;"> NO0012698341 </td>
   <td style="text-align:left;"> VPXB </td>
   <td style="text-align:left;"> 2025-01-28 </td>
   <td style="text-align:left;"> 8.0% </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 500 </td>
   <td style="text-align:left;"> ALSTO0.125%27JUL27 </td>
   <td style="text-align:left;"> ALSTOM </td>
   <td style="text-align:left;"> NO0012698341 </td>
   <td style="text-align:left;"> XPAR </td>
   <td style="text-align:left;"> 2027-07-27 </td>
   <td style="text-align:left;"> 0.125% </td>
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


## **EN_Ticker_Performance()** function

This function retrieves the historical performance data of a company listed on the Euronext exchange based on its ticker symbol. It returns a table with details such as the highest and lowest stock prices, date of the highest and lowest prices, and other relevant information.
It receives three (3) parameters such us :
* 'ticker' : A character string representing the company's ticker symbol,
* 'stock_type' : The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers, 'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
* 'escape' : Boolean, either TRUE or FALSE. If escape is True, it means you're providing the DNA (ISIN-Market identifier) directly. Giving T to escape is helpful to avoid time-consuming operations; otherwise, F means you need to provide the Ticker symbol, name, or ISIN and the type of market to which it belongs. By default, escape = 'FALSE'


### *Example 7* : *Retrieve historical performance*


```r
# Get Performance of Ticker ABCA
dt = EN_Ticker_Performance("ABCA")
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
   <td style="text-align:left;"> 3.985 </td>
   <td style="text-align:left;"> 4.05 </td>
   <td style="text-align:left;"> 4.62 </td>
   <td style="text-align:left;"> 5.12 </td>
   <td style="text-align:left;"> 6.12 </td>
   <td style="text-align:left;"> 4.87 </td>
   <td style="text-align:left;"> 6.58 </td>
   <td style="text-align:left;"> 7.78 </td>
   <td style="text-align:left;"> 8.15 </td>
   <td style="text-align:left;"> 8.15 </td>
   <td style="text-align:left;"> 14.85 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the highest </td>
   <td style="text-align:left;"> 20/02/2024 - 14:20 </td>
   <td style="text-align:left;"> 16/02/2024 </td>
   <td style="text-align:left;"> 23/01/2024 </td>
   <td style="text-align:left;"> 29/11/2023 </td>
   <td style="text-align:left;"> 01/09/2023 </td>
   <td style="text-align:left;"> 09/01/2024 </td>
   <td style="text-align:left;"> 22/02/2023 </td>
   <td style="text-align:left;"> 19/04/2022 </td>
   <td style="text-align:left;"> 22/03/2021 </td>
   <td style="text-align:left;"> 22/03/2021 </td>
   <td style="text-align:left;"> 25/02/2000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lowest </td>
   <td style="text-align:left;"> 3.90 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 1.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the lowest </td>
   <td style="text-align:left;"> 20/02/2024 - 09:07 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 11/10/2002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> % </td>
   <td style="text-align:left;"> 0.25 </td>
   <td style="text-align:left;"> -5.34 </td>
   <td style="text-align:left;"> -18.33 </td>
   <td style="text-align:left;"> -24.92 </td>
   <td style="text-align:left;"> -38.21 </td>
   <td style="text-align:left;"> -22.58 </td>
   <td style="text-align:left;"> -43.47 </td>
   <td style="text-align:left;"> -47.61 </td>
   <td style="text-align:left;"> -49.93 </td>
   <td style="text-align:left;"> -39.31 </td>
   <td style="text-align:left;"> -61.65 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> -0.21 </td>
   <td style="text-align:left;"> -0.835 </td>
   <td style="text-align:left;"> -1.235 </td>
   <td style="text-align:left;"> -2.30 </td>
   <td style="text-align:left;"> -1.085 </td>
   <td style="text-align:left;"> -2.86 </td>
   <td style="text-align:left;"> -3.38 </td>
   <td style="text-align:left;"> -3.71 </td>
   <td style="text-align:left;"> -2.41 </td>
   <td style="text-align:left;"> -5.98 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 219177.25 </td>
   <td style="text-align:left;"> 2079382.72 </td>
   <td style="text-align:left;"> 7733642.74 </td>
   <td style="text-align:left;"> 14.199M </td>
   <td style="text-align:left;"> 23.911M </td>
   <td style="text-align:left;"> 10.272M </td>
   <td style="text-align:left;"> 48.792M </td>
   <td style="text-align:left;"> 105.273M </td>
   <td style="text-align:left;"> 182.531M </td>
   <td style="text-align:left;"> 313.910M </td>
   <td style="text-align:left;"> 1.372B </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 55681 </td>
   <td style="text-align:left;"> 712773 </td>
   <td style="text-align:left;"> 2046139 </td>
   <td style="text-align:left;"> 3378793 </td>
   <td style="text-align:left;"> 5193659 </td>
   <td style="text-align:left;"> 2584397 </td>
   <td style="text-align:left;"> 9290122 </td>
   <td style="text-align:left;"> 17.422M </td>
   <td style="text-align:left;"> 28.113M </td>
   <td style="text-align:left;"> 47.916M </td>
   <td style="text-align:left;"> 82.248B </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Vol </td>
   <td style="text-align:left;"> 55681 </td>
   <td style="text-align:left;"> 118796 </td>
   <td style="text-align:left;"> 85256 </td>
   <td style="text-align:left;"> 51981 </td>
   <td style="text-align:left;"> 39646 </td>
   <td style="text-align:left;"> 68010 </td>
   <td style="text-align:left;"> 36148 </td>
   <td style="text-align:left;"> 33829 </td>
   <td style="text-align:left;"> 36322 </td>
   <td style="text-align:left;"> 37318 </td>
   <td style="text-align:left;"> 12.677M </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Price </td>
   <td style="text-align:left;"> 3.94 </td>
   <td style="text-align:left;"> 2.92 </td>
   <td style="text-align:left;"> 3.78 </td>
   <td style="text-align:left;"> 4.20 </td>
   <td style="text-align:left;"> 4.60 </td>
   <td style="text-align:left;"> 3.97 </td>
   <td style="text-align:left;"> 5.25 </td>
   <td style="text-align:left;"> 6.04 </td>
   <td style="text-align:left;"> 6.49 </td>
   <td style="text-align:left;"> 6.55 </td>
   <td style="text-align:left;"> 0.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nb days </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 24 </td>
   <td style="text-align:left;"> 65 </td>
   <td style="text-align:left;"> 131 </td>
   <td style="text-align:left;"> 38 </td>
   <td style="text-align:left;"> 257 </td>
   <td style="text-align:left;"> 515 </td>
   <td style="text-align:left;"> 774 </td>
   <td style="text-align:left;"> 1284 </td>
   <td style="text-align:left;"> 6488 </td>
  </tr>
</tbody>
</table>



```r
# Get Performance of ETF AAPL
dt_ = EN_Ticker_Performance("AAPL", stock_type = "E")
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
   <td style="text-align:left;"> 6.680 </td>
   <td style="text-align:left;"> 6.790 </td>
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
   <td style="text-align:left;"> 20/02/2024 - 09:04 </td>
   <td style="text-align:left;"> 16/02/2024 </td>
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
   <td style="text-align:left;"> 6.622 </td>
   <td style="text-align:left;"> 6.527 </td>
   <td style="text-align:left;"> 6.527 </td>
   <td style="text-align:left;"> 6.527 </td>
   <td style="text-align:left;"> 6.281 </td>
   <td style="text-align:left;"> 6.527 </td>
   <td style="text-align:left;"> 5.35 </td>
   <td style="text-align:left;"> 4.700 </td>
   <td style="text-align:left;"> 4.030 </td>
   <td style="text-align:left;"> 4.030 </td>
   <td style="text-align:left;"> 4.030 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the lowest </td>
   <td style="text-align:left;"> 20/02/2024 - 16:04 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 27/10/2023 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 02/03/2023 </td>
   <td style="text-align:left;"> 06/01/2023 </td>
   <td style="text-align:left;"> 07/06/2021 </td>
   <td style="text-align:left;"> 07/06/2021 </td>
   <td style="text-align:left;"> 07/06/2021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> % </td>
   <td style="text-align:left;"> -0.76 </td>
   <td style="text-align:left;"> -1.48 </td>
   <td style="text-align:left;"> -3.34 </td>
   <td style="text-align:left;"> -3.01 </td>
   <td style="text-align:left;"> 5.50 </td>
   <td style="text-align:left;"> -3.49 </td>
   <td style="text-align:left;"> 19.14 </td>
   <td style="text-align:left;"> 17.07 </td>
   <td style="text-align:left;"> 63.53 </td>
   <td style="text-align:left;"> 63.53 </td>
   <td style="text-align:left;"> 63.53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> -0.051 </td>
   <td style="text-align:left;"> -0.101 </td>
   <td style="text-align:left;"> -0.231 </td>
   <td style="text-align:left;"> -0.207 </td>
   <td style="text-align:left;"> 0.348 </td>
   <td style="text-align:left;"> -0.242 </td>
   <td style="text-align:left;"> 1.074 </td>
   <td style="text-align:left;"> 0.975 </td>
   <td style="text-align:left;"> 2.596 </td>
   <td style="text-align:left;"> 2.596 </td>
   <td style="text-align:left;"> 2.596 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 662.19 </td>
   <td style="text-align:left;"> 2347.68 </td>
   <td style="text-align:left;"> 27036.00 </td>
   <td style="text-align:left;"> 29614.39 </td>
   <td style="text-align:left;"> 59111.43 </td>
   <td style="text-align:left;"> 29427.29 </td>
   <td style="text-align:left;"> 135854.86 </td>
   <td style="text-align:left;"> 371444.61 </td>
   <td style="text-align:left;"> 448700.84 </td>
   <td style="text-align:left;"> 448700.84 </td>
   <td style="text-align:left;"> 448700.84 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 100 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 3903 </td>
   <td style="text-align:left;"> 4285 </td>
   <td style="text-align:left;"> 8712 </td>
   <td style="text-align:left;"> 4259 </td>
   <td style="text-align:left;"> 21989 </td>
   <td style="text-align:left;"> 66158 </td>
   <td style="text-align:left;"> 80850 </td>
   <td style="text-align:left;"> 80850 </td>
   <td style="text-align:left;"> 80850 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Vol </td>
   <td style="text-align:left;"> 100 </td>
   <td style="text-align:left;"> 58 </td>
   <td style="text-align:left;"> 163 </td>
   <td style="text-align:left;"> 67 </td>
   <td style="text-align:left;"> 67 </td>
   <td style="text-align:left;"> 112 </td>
   <td style="text-align:left;"> 86 </td>
   <td style="text-align:left;"> 129 </td>
   <td style="text-align:left;"> 105 </td>
   <td style="text-align:left;"> 63 </td>
   <td style="text-align:left;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Price </td>
   <td style="text-align:left;"> 6.62 </td>
   <td style="text-align:left;"> 6.71 </td>
   <td style="text-align:left;"> 6.93 </td>
   <td style="text-align:left;"> 6.91 </td>
   <td style="text-align:left;"> 6.79 </td>
   <td style="text-align:left;"> 6.91 </td>
   <td style="text-align:left;"> 6.18 </td>
   <td style="text-align:left;"> 5.61 </td>
   <td style="text-align:left;"> 5.55 </td>
   <td style="text-align:left;"> 5.55 </td>
   <td style="text-align:left;"> 5.55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nb days </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 24 </td>
   <td style="text-align:left;"> 64 </td>
   <td style="text-align:left;"> 130 </td>
   <td style="text-align:left;"> 38 </td>
   <td style="text-align:left;"> 256 </td>
   <td style="text-align:left;"> 514 </td>
   <td style="text-align:left;"> 773 </td>
   <td style="text-align:left;"> 1283 </td>
   <td style="text-align:left;"> 6487 </td>
  </tr>
</tbody>
</table>



```r
# Get Performance of Bond issued by A2A S.p.A.
dt1 = EN_Ticker_Performance("XS1195347478-ETLX", escape = TRUE)
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
   <td style="text-align:left;"> 0.05 </td>
   <td style="text-align:left;"> 0.16 </td>
   <td style="text-align:left;"> 0.97 </td>
   <td style="text-align:left;"> 1.73 </td>
   <td style="text-align:left;"> 0.18 </td>
   <td style="text-align:left;"> 2.48 </td>
   <td style="text-align:left;"> -4.33 </td>
   <td style="text-align:left;"> -7.67 </td>
   <td style="text-align:left;"> -4.25 </td>
   <td style="text-align:left;"> -2.87 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> -0.06 </td>
   <td style="text-align:left;"> 0.05 </td>
   <td style="text-align:left;"> 0.16 </td>
   <td style="text-align:left;"> 0.95 </td>
   <td style="text-align:left;"> 1.67 </td>
   <td style="text-align:left;"> 0.18 </td>
   <td style="text-align:left;"> 2.38 </td>
   <td style="text-align:left;"> -4.45 </td>
   <td style="text-align:left;"> -8.18 </td>
   <td style="text-align:left;"> -4.37 </td>
   <td style="text-align:left;"> -2.91 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 98200.00 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 590560.00 </td>
   <td style="text-align:left;"> 883180.00 </td>
   <td style="text-align:left;"> 394800.00 </td>
   <td style="text-align:left;"> 2934650.00 </td>
   <td style="text-align:left;"> 6824010.00 </td>
   <td style="text-align:left;"> 7029220.00 </td>
   <td style="text-align:left;"> 8402410.00 </td>
   <td style="text-align:left;"> 18.669M </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 100000 </td>
   <td style="text-align:left;"> 300000 </td>
   <td style="text-align:left;"> 300000 </td>
   <td style="text-align:left;"> 900000 </td>
   <td style="text-align:left;"> 1200000 </td>
   <td style="text-align:left;"> 700000 </td>
   <td style="text-align:left;"> 3300000 </td>
   <td style="text-align:left;"> 7300000 </td>
   <td style="text-align:left;"> 7500000 </td>
   <td style="text-align:left;"> 8800000 </td>
   <td style="text-align:left;"> 19.000M </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Vol </td>
   <td style="text-align:left;"> 100000 </td>
   <td style="text-align:left;"> 50000 </td>
   <td style="text-align:left;"> 12500 </td>
   <td style="text-align:left;"> 13636 </td>
   <td style="text-align:left;"> 9091 </td>
   <td style="text-align:left;"> 18421 </td>
   <td style="text-align:left;"> 12644 </td>
   <td style="text-align:left;"> 13985 </td>
   <td style="text-align:left;"> 9579 </td>
   <td style="text-align:left;"> 6748 </td>
   <td style="text-align:left;"> 2898 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Price </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
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
   <td style="text-align:left;"> 38 </td>
   <td style="text-align:left;"> 261 </td>
   <td style="text-align:left;"> 522 </td>
   <td style="text-align:left;"> 783 </td>
   <td style="text-align:left;"> 1304 </td>
   <td style="text-align:left;"> 6557 </td>
  </tr>
</tbody>
</table>



```r
# Get Performance of ACOMEA EMERGING Q2 Fund
dt2 = EN_Ticker_Performance("IT0005091126", 'F', escape = FALSE)
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
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 10.005 </td>
   <td style="text-align:left;"> 10.005 </td>
   <td style="text-align:left;"> 10.005 </td>
   <td style="text-align:left;"> 10.005 </td>
   <td style="text-align:left;"> 10.005 </td>
   <td style="text-align:left;"> 10.679 </td>
   <td style="text-align:left;"> 10.847 </td>
   <td style="text-align:left;"> 12.185 </td>
   <td style="text-align:left;"> 12.185 </td>
   <td style="text-align:left;"> 12.185 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the highest </td>
   <td style="text-align:left;"> 07/12/2023 - 15:00 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 06/07/2023 </td>
   <td style="text-align:left;"> 01/06/2022 </td>
   <td style="text-align:left;"> 12/11/2021 </td>
   <td style="text-align:left;"> 12/11/2021 </td>
   <td style="text-align:left;"> 12/11/2021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lowest </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 10.005 </td>
   <td style="text-align:left;"> 10.005 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 9.955 </td>
   <td style="text-align:left;"> 10.005 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 1.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the lowest </td>
   <td style="text-align:left;"> 07/12/2023 - 15:00 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 07/12/2023 </td>
   <td style="text-align:left;"> 19/02/2024 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
   <td style="text-align:left;"> 24/03/2023 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> % </td>
   <td style="text-align:left;"> -0.64 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> -4.63 </td>
   <td style="text-align:left;"> -15.66 </td>
   <td style="text-align:left;"> -7.74 </td>
   <td style="text-align:left;"> 25.39 </td>
   <td style="text-align:left;"> 28.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> -0.064 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> 0.00 </td>
   <td style="text-align:left;"> -0.486 </td>
   <td style="text-align:left;"> -1.861 </td>
   <td style="text-align:left;"> -0.841 </td>
   <td style="text-align:left;"> 2.029 </td>
   <td style="text-align:left;"> 2.196 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 447.98 </td>
   <td style="text-align:left;"> 40.02 </td>
   <td style="text-align:left;"> 40.02 </td>
   <td style="text-align:left;"> 488.00 </td>
   <td style="text-align:left;"> 488.00 </td>
   <td style="text-align:left;"> 40.02 </td>
   <td style="text-align:left;"> 7468.06 </td>
   <td style="text-align:left;"> 291474.83 </td>
   <td style="text-align:left;"> 327164.50 </td>
   <td style="text-align:left;"> 781608.81 </td>
   <td style="text-align:left;"> 1027828.18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 45 </td>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:left;"> 53 </td>
   <td style="text-align:left;"> 53 </td>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:left;"> 713 </td>
   <td style="text-align:left;"> 26904 </td>
   <td style="text-align:left;"> 30012 </td>
   <td style="text-align:left;"> 86031 </td>
   <td style="text-align:left;"> 118239 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Vol </td>
   <td style="text-align:left;"> 45 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 0 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 0 </td>
   <td style="text-align:left;"> 0 </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 53 </td>
   <td style="text-align:left;"> 39 </td>
   <td style="text-align:left;"> 67 </td>
   <td style="text-align:left;"> 18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Avg Price </td>
   <td style="text-align:left;"> 9.96 </td>
   <td style="text-align:left;"> 5.00 </td>
   <td style="text-align:left;"> 5.00 </td>
   <td style="text-align:left;"> 9.21 </td>
   <td style="text-align:left;"> 9.21 </td>
   <td style="text-align:left;"> 5.00 </td>
   <td style="text-align:left;"> 10.47 </td>
   <td style="text-align:left;"> 10.83 </td>
   <td style="text-align:left;"> 10.90 </td>
   <td style="text-align:left;"> 9.09 </td>
   <td style="text-align:left;"> 8.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nb days </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 24 </td>
   <td style="text-align:left;"> 64 </td>
   <td style="text-align:left;"> 130 </td>
   <td style="text-align:left;"> 38 </td>
   <td style="text-align:left;"> 255 </td>
   <td style="text-align:left;"> 512 </td>
   <td style="text-align:left;"> 769 </td>
   <td style="text-align:left;"> 1275 </td>
   <td style="text-align:left;"> 6500 </td>
  </tr>
</tbody>
</table>



```r
# Get Performance of AEX All-Share Index
dt3 = EN_Ticker_Performance("AEX All-Share Index GR", escape = FALSE)
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
   <td style="text-align:left;"> 4,534.94 </td>
   <td style="text-align:left;"> 4,552.25 </td>
   <td style="text-align:left;"> 4,553.63 </td>
   <td style="text-align:left;"> 4,553.63 </td>
   <td style="text-align:left;"> 4,553.63 </td>
   <td style="text-align:left;"> 4,553.63 </td>
   <td style="text-align:left;"> 4,553.63 </td>
   <td style="text-align:left;"> 4,553.63 </td>
   <td style="text-align:left;"> 4,553.63 </td>
   <td style="text-align:left;"> 4,553.63 </td>
   <td style="text-align:left;"> 4,553.63 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date of the highest </td>
   <td style="text-align:left;"> 20/02/2024 - 09:00 </td>
   <td style="text-align:left;"> 16/02/2024 </td>
   <td style="text-align:left;"> 12/02/2024 </td>
   <td style="text-align:left;"> 12/02/2024 </td>
   <td style="text-align:left;"> 12/02/2024 </td>
   <td style="text-align:left;"> 12/02/2024 </td>
   <td style="text-align:left;"> 12/02/2024 </td>
   <td style="text-align:left;"> 12/02/2024 </td>
   <td style="text-align:left;"> 12/02/2024 </td>
   <td style="text-align:left;"> 12/02/2024 </td>
   <td style="text-align:left;"> 12/02/2024 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lowest </td>
   <td style="text-align:left;"> 4,479.12 </td>
   <td style="text-align:left;"> 4,464.25 </td>
   <td style="text-align:left;"> 4,128.31 </td>
   <td style="text-align:left;"> 3,993.51 </td>
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
   <td style="text-align:left;"> 20/02/2024 - 15:45 </td>
   <td style="text-align:left;"> 21/02/2024 </td>
   <td style="text-align:left;"> 22/01/2024 </td>
   <td style="text-align:left;"> 22/11/2023 </td>
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
   <td style="text-align:left;"> -1.04 </td>
   <td style="text-align:left;"> 0.08 </td>
   <td style="text-align:left;"> 8.60 </td>
   <td style="text-align:left;"> 12.19 </td>
   <td style="text-align:left;"> 16.05 </td>
   <td style="text-align:left;"> 7.21 </td>
   <td style="text-align:left;"> 13.40 </td>
   <td style="text-align:left;"> 21.26 </td>
   <td style="text-align:left;"> 24.48 </td>
   <td style="text-align:left;"> 61.58 </td>
   <td style="text-align:left;"> 244.77 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:left;"> -47.28 </td>
   <td style="text-align:left;"> 3.43 </td>
   <td style="text-align:left;"> 354.98 </td>
   <td style="text-align:left;"> 486.85 </td>
   <td style="text-align:left;"> 619.90 </td>
   <td style="text-align:left;"> 301.39 </td>
   <td style="text-align:left;"> 529.58 </td>
   <td style="text-align:left;"> 785.72 </td>
   <td style="text-align:left;"> 881.44 </td>
   <td style="text-align:left;"> 1,708.16 </td>
   <td style="text-align:left;"> 3,182.08 </td>
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
   <td style="text-align:left;"> 38 </td>
   <td style="text-align:left;"> 256 </td>
   <td style="text-align:left;"> 514 </td>
   <td style="text-align:left;"> 773 </td>
   <td style="text-align:left;"> 1283 </td>
   <td style="text-align:left;"> 6487 </td>
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
* escape': Boolean, either TRUE or FALSE. If escape is True, this means you're supplying the ISIN-Market identifier (ADN) directly. Giving T to escape is useful to avoid tedious operations; otherwise, F means you must provide the Ticker symbol, the name or ISIN and the type of market to which it belongs. By default, escape = 'FALSE'.
* up.col : is the color of the rise
* down.col : is the color of the fall


```r
# The default colors for the up and down are 'darkgreen' and 'red', respectively.
chart <- EN_Overview_plot("4ddd")  

chart
```

```{=html}
<div class="highchart html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-ca143ead509c0510ee2d" style="width:100%;height:576px;"></div>
<script type="application/json" data-for="htmlwidget-ca143ead509c0510ee2d">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"4DDD chart : from 2017-10-30 to 2024-02-16","style":{"fontWeight":"bold","fontSize":"17px"},"align":"center"},"yAxis":[{"title":{"style":{"color":"#333333","fontSize":"20px","fontFamily":"Erica One"},"text":"Price"},"top":"-10%","height":"90%","opposite":false},{"title":{"style":{"color":"gray","fontSize":"20px","fontFamily":"Erica One"},"text":"Volume"},"top":"80%","height":"20%"}],"credits":{"enabled":false},"exporting":{"enabled":true,"filename":"4DDD chart : from 2017-10-30 to 2024-02-16"},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"series":[{"data":[[1509321600000,10.21],[1509408000000,10.21],[1509494400000,10.21],[1509580800000,8.1],[1509667200000,8.1],[1509926400000,8.1],[1510012800000,8.1],[1510099200000,8.1],[1510185600000,8.1],[1510272000000,8.1],[1510531200000,8.1],[1510617600000,7.2],[1510704000000,7.2],[1510790400000,7.2],[1510876800000,7.2],[1511136000000,7.2],[1511222400000,7.2],[1511308800000,7.2],[1511395200000,7.2],[1511481600000,7.2],[1511740800000,7.2],[1511827200000,7.2],[1511913600000,7.2],[1512000000000,7.2],[1512086400000,7.2],[1512345600000,7.2],[1512432000000,7.2],[1512518400000,7.2],[1512604800000,7.2],[1512691200000,7.2],[1512950400000,8.17],[1513036800000,8.17],[1513123200000,8.17],[1513209600000,8.17],[1513296000000,8.17],[1513555200000,8.17],[1513641600000,8.17],[1513728000000,8.17],[1513814400000,8.17],[1513900800000,8.17],[1514332800000,8.17],[1514419200000,7.53],[1514505600000,7.53],[1514851200000,7.53],[1514937600000,7.53],[1515024000000,7.74],[1515110400000,7.74],[1515369600000,7.74],[1515456000000,7.74],[1515542400000,7.86],[1515628800000,7.86],[1515715200000,7.86],[1515974400000,7.86],[1516060800000,9.26],[1516147200000,9.26],[1516233600000,9.26],[1516320000000,9.26],[1516579200000,9.26],[1516665600000,9.26],[1516752000000,9.26],[1516838400000,9.26],[1516924800000,9.26],[1517184000000,9.26],[1517270400000,9.26],[1517356800000,9.26],[1517443200000,9.26],[1517529600000,9.26],[1517788800000,9.26],[1517875200000,7.64],[1517961600000,7.64],[1518048000000,8.4],[1518134400000,8.4],[1518393600000,8.4],[1518480000000,8.4],[1518566400000,8.4],[1518652800000,8.4],[1518739200000,8.4],[1518998400000,8.4],[1519084800000,8.4],[1519171200000,8.4],[1519257600000,8.4],[1519344000000,8.4],[1519603200000,8.4],[1519689600000,8.4],[1519776000000,8.02],[1519862400000,8.02],[1519948800000,8.84],[1520208000000,9.2],[1520294400000,9.2],[1520380800000,9.2],[1520467200000,9.2],[1520553600000,9.2],[1520812800000,9.2],[1520899200000,9.2],[1520985600000,9.2],[1521072000000,9.2],[1521158400000,9.2],[1521417600000,9.2],[1521504000000,9.94],[1521590400000,9.94],[1521676800000,9.94],[1521763200000,9.94],[1522022400000,9.94],[1522108800000,9.94],[1522195200000,9.1],[1522281600000,9.1],[1522713600000,9.1],[1522800000000,9.1],[1522886400000,9.1],[1522972800000,9.1],[1523232000000,9.1],[1523318400000,9.1],[1523404800000,9.1],[1523491200000,9.1],[1523577600000,9.1],[1523836800000,9.1],[1523923200000,9.1],[1524009600000,9.1],[1524096000000,9.1],[1524182400000,9.1],[1524441600000,9.1],[1524528000000,9.5],[1524614400000,9.5],[1524700800000,8.8],[1524787200000,8.8],[1525046400000,8.8],[1525219200000,8.56],[1525305600000,8.26],[1525392000000,8.26],[1525651200000,8.26],[1525737600000,8.26],[1525824000000,9.44],[1525910400000,9.44],[1525996800000,9.44],[1526256000000,9.44],[1526342400000,9.44],[1526428800000,9.44],[1526515200000,11],[1526601600000,11],[1526860800000,11],[1526947200000,11],[1527033600000,11],[1527120000000,11],[1527206400000,11],[1527465600000,11],[1527552000000,11],[1527638400000,11],[1527724800000,11],[1527811200000,11],[1528070400000,11],[1528156800000,11],[1528243200000,11],[1528329600000,11],[1528416000000,11],[1528675200000,11],[1528761600000,11],[1528848000000,11],[1528934400000,11],[1529020800000,11],[1529280000000,12.25],[1529366400000,12.25],[1529452800000,12.25],[1529539200000,12.25],[1529625600000,12.25],[1529884800000,12.25],[1529971200000,12.25],[1530057600000,12.25],[1530144000000,12.25],[1530230400000,12.25],[1530489600000,12.25],[1530576000000,12.25],[1530662400000,12.25],[1530748800000,12.25],[1530835200000,12.25],[1531094400000,12.25],[1531180800000,12.25],[1531267200000,12.25],[1531353600000,12.25],[1531440000000,12.25],[1531699200000,12.25],[1531785600000,12.25],[1531872000000,12.25],[1531958400000,12.25],[1532044800000,12.25],[1532304000000,12.85],[1532390400000,12.85],[1532476800000,12.85],[1532563200000,12.85],[1532649600000,12.85],[1532908800000,12.85],[1532995200000,12.85],[1533081600000,10.85],[1533168000000,10.95],[1533254400000,10.95],[1533513600000,10.95],[1533600000000,10.95],[1533686400000,10.95],[1533772800000,15.7],[1533859200000,15.7],[1534118400000,15.7],[1534204800000,15.7],[1534377600000,15.7],[1534464000000,15.7],[1534723200000,15.7],[1534809600000,15.7],[1534896000000,15.7],[1534982400000,15.7],[1535068800000,15.7],[1535328000000,15.7],[1535414400000,15.7],[1535500800000,17.95],[1535587200000,17.95],[1535673600000,17.95],[1535932800000,17.95],[1536019200000,17.95],[1536105600000,17.95],[1536192000000,17.95],[1536278400000,15.9],[1536537600000,15.9],[1536624000000,15.9],[1536710400000,15.9],[1536796800000,15.9],[1536883200000,15.9],[1537142400000,15.9],[1537228800000,15.9],[1537315200000,15.9],[1537401600000,15.9],[1537488000000,15.9],[1537747200000,15.9],[1537833600000,15.9],[1537920000000,15.9],[1538006400000,15.9],[1538092800000,15.9],[1538352000000,15.9],[1538438400000,15.1],[1538524800000,15.1],[1538611200000,15.1],[1538697600000,15.1],[1538956800000,15.1],[1539043200000,15.1],[1539129600000,15.1],[1539216000000,13.8],[1539302400000,13.8],[1539561600000,13.8],[1539648000000,13.8],[1539734400000,13.8],[1539820800000,13.8],[1539907200000,13.8],[1540166400000,13.8],[1540252800000,13.8],[1540339200000,15.75],[1540425600000,15.75],[1540512000000,15.75],[1540771200000,15.75],[1540857600000,15.75],[1540944000000,15.75],[1541030400000,15.75],[1541116800000,15.75],[1541376000000,15.75],[1541462400000,15.75],[1541548800000,15.75],[1541635200000,15.75],[1541721600000,15.75],[1541980800000,15.75],[1542067200000,15.75],[1542153600000,15.75],[1542240000000,15.75],[1542326400000,15.75],[1542585600000,15.75],[1542672000000,15.75],[1542758400000,15.75],[1542844800000,15.75],[1542931200000,15.75],[1543190400000,15.75],[1543276800000,15.75],[1543363200000,15.75],[1543449600000,15.75],[1543536000000,15.75],[1543795200000,15.75],[1543881600000,15.75],[1543968000000,15.75],[1544054400000,15.75],[1544140800000,15.75],[1544400000000,15.75],[1544486400000,15.75],[1544572800000,15.75],[1544659200000,10.1],[1544745600000,10.1],[1545004800000,10.1],[1545091200000,10.1],[1545177600000,10.1],[1545264000000,10.1],[1545350400000,10.1],[1545868800000,8.54],[1545955200000,8.54],[1546387200000,8.54],[1546473600000,8.8],[1546560000000,8.8],[1546819200000,8.8],[1546905600000,8.8],[1546992000000,8.8],[1547078400000,8.8],[1547164800000,8.8],[1547424000000,8.8],[1547510400000,8.8],[1547596800000,8.8],[1547683200000,8.8],[1547769600000,8.8],[1548028800000,8.8],[1548115200000,8.8],[1548201600000,8.8],[1548288000000,8.8],[1548374400000,8.8],[1548633600000,8.8],[1548720000000,8.8],[1548806400000,8.8],[1548892800000,8.8],[1548979200000,11.25],[1549238400000,11.25],[1549324800000,11.25],[1549411200000,11.25],[1549497600000,11.25],[1549584000000,11.25],[1549843200000,11.45],[1549929600000,11.45],[1550016000000,12],[1550102400000,12],[1550188800000,12],[1550448000000,12],[1550534400000,12],[1550620800000,12],[1550707200000,12],[1550793600000,12],[1551052800000,12],[1551139200000,12],[1551225600000,12],[1551312000000,12.7],[1551398400000,12.7],[1551657600000,10.85],[1551744000000,10.85],[1551830400000,10.25],[1551916800000,10.25],[1552003200000,10.25],[1552262400000,10.25],[1552348800000,10.25],[1552435200000,10.25],[1552521600000,10.05],[1552608000000,10.05],[1552867200000,10.05],[1552953600000,10.05],[1553040000000,10.05],[1553126400000,10.05],[1553212800000,10.1],[1553472000000,10.1],[1553558400000,10.1],[1553644800000,10.1],[1553731200000,10.1],[1553817600000,10.1],[1554076800000,10.1],[1554163200000,10.1],[1554249600000,10.1],[1554336000000,10.1],[1554422400000,10.1],[1554681600000,10.1],[1554768000000,10.1],[1554854400000,10.1],[1554940800000,10.1],[1555027200000,10.1],[1555286400000,10.1],[1555372800000,10.1],[1555459200000,9.8],[1555545600000,9.8],[1555977600000,9.8],[1556064000000,9.8],[1556150400000,9.8],[1556236800000,9.8],[1556496000000,9.8],[1556582400000,9.8],[1556755200000,9.8],[1556841600000,9.8],[1557100800000,9.8],[1557187200000,9.8],[1557273600000,7.25],[1557360000000,7.25],[1557446400000,7.75],[1557705600000,7.6],[1557792000000,7.6],[1557878400000,7.6],[1557964800000,7.6],[1558051200000,7.6],[1558310400000,7.6],[1558396800000,7.6],[1558483200000,7.6],[1558569600000,7.6],[1558656000000,7.6],[1558915200000,7.6],[1559001600000,7.6],[1559088000000,7.6],[1559174400000,7.6],[1559260800000,7.6],[1559520000000,7.6],[1559606400000,7.6],[1559692800000,7.6],[1559779200000,7.6],[1559865600000,7.6],[1560124800000,7.6],[1560211200000,7.6],[1560297600000,7.6],[1560384000000,7.6],[1560470400000,7.6],[1560729600000,7.6],[1560816000000,7.6],[1560902400000,7.6],[1560988800000,7.6],[1561075200000,7.6],[1561334400000,7.6],[1561420800000,7.6],[1561507200000,7.6],[1561593600000,7.6],[1561680000000,7.6],[1561939200000,7.6],[1562025600000,7.6],[1562112000000,7.6],[1562198400000,7.6],[1562284800000,7.6],[1562544000000,7.6],[1562630400000,7.6],[1562716800000,7.6],[1562803200000,7.6],[1562889600000,7.6],[1563148800000,7.6],[1563235200000,7.6],[1563321600000,7.6],[1563408000000,7.6],[1563494400000,7.6],[1563753600000,7.6],[1563840000000,7.6],[1563926400000,7.6],[1564012800000,7.6],[1564099200000,7.6],[1564358400000,7.6],[1564444800000,7.6],[1564531200000,7.6],[1564617600000,7.6],[1564704000000,7.6],[1564963200000,7.6],[1565049600000,7.6],[1565136000000,7.6],[1565222400000,7.6],[1565308800000,7.6],[1565568000000,7.6],[1565654400000,7.6],[1565740800000,7.6],[1565913600000,7.6],[1566172800000,7.6],[1566259200000,6.3],[1566345600000,6.3],[1566432000000,6.3],[1566518400000,6.23],[1566777600000,6.23],[1566864000000,6.23],[1566950400000,6.23],[1567036800000,6.23],[1567123200000,6.23],[1567382400000,6.23],[1567468800000,6.23],[1567555200000,6.23],[1567641600000,6.23],[1567728000000,6.23],[1567987200000,6.23],[1568073600000,6.23],[1568160000000,6.23],[1568246400000,6.23],[1568332800000,6.23],[1568592000000,6.23],[1568678400000,6.23],[1568764800000,7.86],[1568851200000,7.86],[1568937600000,7.86],[1569196800000,7.86],[1569283200000,7.86],[1569369600000,7.86],[1569456000000,7.86],[1569542400000,7.86],[1569801600000,7.86],[1569888000000,7.86],[1569974400000,7.86],[1570060800000,7.86],[1570147200000,7.86],[1570406400000,7.86],[1570492800000,7.86],[1570579200000,7.86],[1570665600000,7.86],[1570752000000,7.86],[1571011200000,7.86],[1571097600000,7.86],[1571184000000,7.86],[1571270400000,7.86],[1571356800000,7.86],[1571616000000,7.86],[1571702400000,7.86],[1571788800000,7.86],[1571875200000,7.86],[1571961600000,7.86],[1572220800000,7.86],[1572307200000,7.86],[1572393600000,7.86],[1572480000000,7.86],[1572566400000,7.86],[1572825600000,7.86],[1572912000000,7.86],[1572998400000,7.86],[1573084800000,7.86],[1573171200000,7.86],[1573430400000,7.86],[1573516800000,7.86],[1573603200000,7.86],[1573689600000,7.86],[1573776000000,7.86],[1574035200000,7.86],[1574121600000,7.86],[1574208000000,7.86],[1574294400000,7.86],[1574380800000,7.86],[1574640000000,7.86],[1574726400000,7.86],[1574812800000,7.86],[1574899200000,7.86],[1574985600000,7.86],[1575244800000,7.86],[1575331200000,7.86],[1575417600000,7.86],[1575504000000,7.86],[1575590400000,7.86],[1575849600000,7.86],[1575936000000,7.86],[1576022400000,7.86],[1576108800000,7.86],[1576195200000,7.86],[1576454400000,7.86],[1576540800000,7.86],[1576627200000,7.86],[1576713600000,7.86],[1576800000000,7.86],[1577059200000,7.86],[1577404800000,7.86],[1577664000000,8.031],[1577923200000,7.981],[1578009600000,7.981],[1578268800000,7.981],[1578355200000,7.7],[1578441600000,7.7],[1578528000000,7.7],[1578614400000,7.7],[1578873600000,7.7],[1578960000000,9.9],[1579046400000,9.9],[1579132800000,9.9],[1579219200000,9.9],[1579478400000,9.9],[1579564800000,9.9],[1579651200000,9.9],[1579737600000,9.9],[1579824000000,9.9],[1580083200000,9.9],[1580169600000,9.9],[1580256000000,9.9],[1580342400000,9.9],[1580428800000,9.9],[1580688000000,9.9],[1580774400000,9.9],[1580860800000,9.9],[1580947200000,11.408],[1581033600000,11.408],[1581292800000,11.408],[1581379200000,11.408],[1581465600000,11.408],[1581552000000,11.408],[1581638400000,11.408],[1581897600000,11.408],[1581984000000,10.872],[1582070400000,10.872],[1582156800000,10.872],[1582243200000,10.872],[1582502400000,10.872],[1582588800000,10.872],[1582675200000,10.872],[1582761600000,10.872],[1582848000000,8.49],[1583107200000,8.49],[1583193600000,8.49],[1583280000000,8.49],[1583366400000,8.49],[1583452800000,8.49],[1583712000000,8.49],[1583798400000,8.49],[1583884800000,8.49],[1583971200000,8.49],[1584057600000,8.49],[1584316800000,8.49],[1584403200000,4.934],[1584489600000,4.934],[1584576000000,4.934],[1584662400000,4.934],[1584921600000,5.5],[1585008000000,5.754],[1585094400000,5.754],[1585180800000,5.754],[1585267200000,5.754],[1585526400000,5.754],[1585612800000,5.754],[1585699200000,5.754],[1585785600000,5.754],[1585872000000,5.754],[1586131200000,5.754],[1586217600000,5.754],[1586304000000,5.754],[1586390400000,5.754],[1586822400000,5.754],[1586908800000,5.754],[1586995200000,5.754],[1587081600000,5.754],[1587340800000,5.754],[1587427200000,5.754],[1587513600000,5.754],[1587600000000,5.754],[1587686400000,5.754],[1587945600000,7.5],[1588032000000,7.5],[1588118400000,7.5],[1588204800000,7.5],[1588550400000,7.5],[1588636800000,7.5],[1588723200000,7.5],[1588809600000,7.215],[1588896000000,7.215],[1589155200000,7.215],[1589241600000,7.215],[1589328000000,7.215],[1589414400000,7.215],[1589500800000,7.215],[1589760000000,7.215],[1589846400000,7.215],[1589932800000,7.215],[1590019200000,7.215],[1590105600000,7.215],[1590364800000,7.215],[1590451200000,7.215],[1590537600000,7.215],[1590624000000,7.215],[1590710400000,6.712],[1590969600000,6.712],[1591056000000,6.712],[1591142400000,6.712],[1591228800000,6.712],[1591315200000,6.712],[1591574400000,6.712],[1591660800000,6.712],[1591747200000,6.712],[1591833600000,6.712],[1591920000000,6.712],[1592179200000,6.712],[1592265600000,6.712],[1592352000000,6.712],[1592438400000,6.712],[1592524800000,6.712],[1592784000000,6.712],[1592870400000,6.712],[1592956800000,6.712],[1593043200000,6.712],[1593129600000,6.712],[1593388800000,6.712],[1593475200000,6.712],[1593561600000,6.712],[1593648000000,6.712],[1593734400000,6.712],[1593993600000,6.712],[1594080000000,6.712],[1594166400000,6.712],[1594252800000,6.712],[1594339200000,6.712],[1594598400000,6.712],[1594684800000,6.712],[1594771200000,6.712],[1594857600000,6.712],[1594944000000,6.712],[1595203200000,6.712],[1595289600000,6.712],[1595376000000,6.712],[1595462400000,6.712],[1595548800000,6.712],[1595808000000,6.712],[1595894400000,6.712],[1595980800000,6.712],[1596067200000,6.712],[1596153600000,6.712],[1596412800000,6.712],[1596499200000,6.712],[1596585600000,6.712],[1596672000000,6.712],[1596758400000,6.712],[1597017600000,6.712],[1597104000000,6.712],[1597190400000,6.712],[1597276800000,6.712],[1597363200000,6.712],[1597622400000,6.712],[1597708800000,6.712],[1597795200000,6.712],[1597881600000,6.712],[1597968000000,6.712],[1598227200000,6.712],[1598313600000,6.712],[1598400000000,6.712],[1598486400000,6.712],[1598572800000,6.712],[1598832000000,6.712],[1598918400000,6.712],[1599004800000,6.712],[1599091200000,6.712],[1599177600000,6.712],[1599436800000,6.712],[1599523200000,6.712],[1599609600000,4.45],[1599696000000,4.45],[1599782400000,4.45],[1600041600000,4.45],[1600128000000,4.45],[1600214400000,4.45],[1600300800000,4.45],[1600387200000,4.4],[1600646400000,4.4],[1600732800000,4.22],[1600819200000,4.22],[1600905600000,4.22],[1600992000000,4.22],[1601251200000,4.22],[1601337600000,4.22],[1601424000000,4.22],[1601510400000,4.22],[1601596800000,4.22],[1601856000000,4.22],[1601942400000,4.22],[1602028800000,4.22],[1602115200000,4.22],[1602201600000,4.22],[1602460800000,4.22],[1602547200000,4.22],[1602633600000,4.22],[1602720000000,4.22],[1602806400000,5.826],[1603065600000,5.826],[1603152000000,5.826],[1603238400000,5.826],[1603324800000,6.276],[1603411200000,6.276],[1603670400000,6.276],[1603756800000,6.276],[1603843200000,6.276],[1603929600000,6.276],[1604016000000,6.276],[1604275200000,6.276],[1604361600000,6.276],[1604448000000,6.276],[1604534400000,6.276],[1604620800000,6.276],[1604880000000,6.276],[1604966400000,6.276],[1605052800000,6.276],[1605139200000,6.276],[1605225600000,6.276],[1605484800000,6.276],[1605571200000,6.276],[1605657600000,6.276],[1605744000000,6.276],[1605830400000,6.276],[1606089600000,6.276],[1606176000000,6.276],[1606262400000,6.276],[1606348800000,6.276],[1606435200000,6.276],[1606694400000,6.276],[1606780800000,6.276],[1606867200000,6.276],[1606953600000,6.276],[1607040000000,6.276],[1607299200000,6.276],[1607385600000,8.487],[1607472000000,8.487],[1607558400000,8.487],[1607644800000,8.448],[1607904000000,8.448],[1607990400000,8.71],[1608076800000,8.71],[1608163200000,8.71],[1608249600000,9.296],[1608508800000,9.296],[1608595200000,9.296],[1608681600000,9.296],[1609113600000,9.296],[1609200000000,9.282],[1609286400000,9.282],[1609718400000,9.282],[1609804800000,9.282],[1609891200000,9.282],[1609977600000,9.282],[1610064000000,17.356],[1610323200000,17.356],[1610409600000,23.2],[1610496000000,20.065],[1610582400000,20.065],[1610668800000,24.775],[1610928000000,24.5],[1611014400000,25.7],[1611100800000,25.455],[1611187200000,26.295],[1611273600000,26.295],[1611532800000,30.2],[1611619200000,28.905],[1611705600000,29.15],[1611792000000,31.22],[1611878400000,31.27],[1612137600000,30.72],[1612224000000,30.72],[1612310400000,30.72],[1612396800000,37.03],[1612483200000,37.03],[1612742400000,37.03],[1612828800000,44],[1612915200000,42],[1613001600000,43.105],[1613088000000,39.925],[1613347200000,41.5],[1613433600000,41.5],[1613520000000,41.5],[1613606400000,37.085],[1613692800000,37],[1613952000000,34.795],[1614038400000,34.795],[1614124800000,28.765],[1614211200000,28.765],[1614297600000,28.765],[1614556800000,28.765],[1614643200000,28.765],[1614729600000,24.525],[1614816000000,22.565],[1614902400000,22.565],[1615161600000,22.565],[1615248000000,20],[1615334400000,21.87],[1615420800000,21.87],[1615507200000,21.87],[1615766400000,27.715],[1615852800000,27.91],[1615939200000,25.23],[1616025600000,26.28],[1616112000000,24.8],[1616371200000,24.8],[1616457600000,24.8],[1616544000000,24.8],[1616630400000,21.34],[1616716800000,22.555],[1616976000000,21.715],[1617062400000,21.395],[1617148800000,21.395],[1617235200000,21.395],[1617667200000,21.395],[1617753600000,21.395],[1617840000000,21.395],[1617926400000,20.52],[1618185600000,20.52],[1618272000000,20.52],[1618358400000,20.52],[1618444800000,19.1],[1618531200000,17.63],[1618790400000,15.87],[1618876800000,15.73],[1618963200000,15.73],[1619049600000,15.73],[1619136000000,15.73],[1619395200000,15.73],[1619481600000,15.73],[1619568000000,15.73],[1619654400000,15.73],[1619740800000,15.73],[1620000000000,15.73],[1620086400000,15.73],[1620172800000,15.73],[1620259200000,15.73],[1620345600000,15.73],[1620604800000,15.73],[1620691200000,15.73],[1620777600000,18.27],[1620864000000,18.38],[1620950400000,18.38],[1621209600000,18.38],[1621296000000,18.38],[1621382400000,19.63],[1621468800000,20.12],[1621555200000,20.12],[1621814400000,22.32],[1621900800000,22.32],[1621987200000,24.1],[1622073600000,23.66],[1622160000000,23.66],[1622419200000,23.66],[1622505600000,23.64],[1622592000000,23.64],[1622678400000,23.64],[1622764800000,23.64],[1623024000000,23.64],[1623110400000,25.66],[1623196800000,25.66],[1623283200000,25.66],[1623369600000,25.46],[1623628800000,25.46],[1623715200000,25.46],[1623801600000,25.46],[1623888000000,25.46],[1623974400000,25.46],[1624233600000,25.46],[1624320000000,30.94],[1624406400000,30.92],[1624492800000,30.92],[1624579200000,33.9],[1624838400000,33.9],[1624924800000,34.3],[1625011200000,32.1],[1625097600000,32.1],[1625184000000,32.1],[1625443200000,32.1],[1625529600000,32.1],[1625616000000,32.1],[1625702400000,32.1],[1625788800000,29.08],[1626048000000,29.08],[1626134400000,26.6],[1626220800000,26.6],[1626307200000,26.6],[1626393600000,26.6],[1626652800000,20.76],[1626739200000,20.76],[1626825600000,20.76],[1626912000000,20.76],[1626998400000,20.76],[1627257600000,20.76],[1627344000000,20.76],[1627430400000,20.76],[1627516800000,20.76],[1627603200000,20.76],[1627862400000,23.32],[1627948800000,23.32],[1628035200000,23.32],[1628121600000,23.32],[1628208000000,23.32],[1628467200000,23.7],[1628553600000,23.7],[1628640000000,23.7],[1628726400000,28.5],[1628812800000,28.5],[1629072000000,28.5],[1629158400000,23.9],[1629244800000,23.9],[1629331200000,23.9],[1629417600000,23.9],[1629676800000,23.9],[1629763200000,23.9],[1629849600000,23.9],[1629936000000,24.88],[1630022400000,24.88],[1630281600000,24.88],[1630368000000,24.88],[1630454400000,24.88],[1630540800000,24.88],[1630627200000,24.88],[1630886400000,24.88],[1630972800000,24.88],[1631059200000,24.88],[1631145600000,24.88],[1631232000000,24.88],[1631491200000,26.54],[1631577600000,25.82],[1631664000000,25.82],[1631750400000,25.82],[1631836800000,25.82],[1632096000000,25.82],[1632182400000,24.28],[1632268800000,24.28],[1632355200000,25.16],[1632441600000,25.16],[1632700800000,25.16],[1632787200000,24.7],[1632873600000,24.7],[1632960000000,24.7],[1633046400000,24.7],[1633305600000,24.7],[1633392000000,24.7],[1633478400000,24.7],[1633564800000,24.7],[1633651200000,24.7],[1633910400000,24.7],[1633996800000,24.7],[1634083200000,24.7],[1634169600000,24.7],[1634256000000,24.7],[1634515200000,24.7],[1634601600000,24.7],[1634688000000,24.7],[1634774400000,24.7],[1634860800000,24.7],[1635120000000,24.7],[1635206400000,24.7],[1635292800000,24.7],[1635379200000,24.7],[1635465600000,24.7],[1635724800000,24.7],[1635811200000,24.7],[1635897600000,24.7],[1635984000000,24.7],[1636070400000,27.72],[1636329600000,27.72],[1636416000000,27.72],[1636502400000,25.22],[1636588800000,25.22],[1636675200000,22.44],[1636934400000,22.44],[1637020800000,22.44],[1637107200000,22.44],[1637193600000,22.44],[1637280000000,21.72],[1637539200000,21.72],[1637625600000,21.72],[1637712000000,21.72],[1637798400000,21.72],[1637884800000,21.72],[1638144000000,20.36],[1638230400000,20.36],[1638316800000,20.36],[1638403200000,20.36],[1638489600000,20.36],[1638748800000,20.36],[1638835200000,20.36],[1638921600000,20.36],[1639008000000,20.36],[1639094400000,20.36],[1639353600000,20.36],[1639440000000,20.36],[1639526400000,20.36],[1639612800000,20.36],[1639699200000,20.36],[1639958400000,20.36],[1640044800000,20.36],[1640131200000,20.36],[1640217600000,20.36],[1640563200000,20.36],[1640649600000,20.36],[1640736000000,20.36],[1640822400000,20.36],[1641168000000,20.36],[1641254400000,20.36],[1641340800000,19.38],[1641427200000,19.38],[1641513600000,19.38],[1641772800000,19.38],[1641859200000,17.71],[1641945600000,17.71],[1642032000000,17.71],[1642118400000,17.71],[1642377600000,17.71],[1642464000000,17.71],[1642550400000,17.71],[1642636800000,17.71],[1642723200000,17.71],[1642982400000,14],[1643068800000,14.6],[1643155200000,14.95],[1643241600000,14.95],[1643328000000,14.95],[1643587200000,14.95],[1643673600000,14.95],[1643760000000,15.9],[1643846400000,15.9],[1643932800000,15.9],[1644192000000,15.9],[1644278400000,15.9],[1644364800000,15.9],[1644451200000,15.9],[1644537600000,15.9],[1644796800000,15.9],[1644883200000,15.9],[1644969600000,15.9],[1645056000000,15.9],[1645142400000,15.9],[1645401600000,15.9],[1645488000000,15.9],[1645574400000,15.9],[1645660800000,15.9],[1645747200000,15.9],[1646006400000,15.9],[1646092800000,15.9],[1646179200000,15.9],[1646265600000,15.9],[1646352000000,15.9],[1646611200000,15.9],[1646697600000,13.28],[1646784000000,13.28],[1646870400000,13.28],[1646956800000,13.61],[1647216000000,13.61],[1647302400000,13.61],[1647388800000,13.61],[1647475200000,13.61],[1647561600000,13.61],[1647820800000,14.58],[1647907200000,14.58],[1647993600000,14.58],[1648080000000,14.58],[1648166400000,14.58],[1648425600000,14.58],[1648512000000,14.58],[1648598400000,14.58],[1648684800000,14.58],[1648771200000,14.58],[1649030400000,14.58],[1649116800000,14.58],[1649203200000,14.58],[1649289600000,14.58],[1649376000000,14.58],[1649635200000,14.58],[1649721600000,14.58],[1649808000000,14.58],[1649894400000,14.58],[1650326400000,14.58],[1650412800000,13.03],[1650499200000,13.03],[1650585600000,13.03],[1650844800000,13.03],[1650931200000,13.03],[1651017600000,13.03],[1651104000000,13.03],[1651190400000,13.03],[1651449600000,13.03],[1651536000000,13.03],[1651622400000,13.03],[1651708800000,13.03],[1651795200000,13.03],[1652054400000,13.03],[1652140800000,13.03],[1652227200000,13.03],[1652313600000,13.03],[1652400000000,13.03],[1652659200000,13.03],[1652745600000,13.03],[1652832000000,13.03],[1652918400000,9.481],[1653004800000,9.481],[1653264000000,9.816],[1653350400000,9.816],[1653436800000,9.816],[1653523200000,9.816],[1653609600000,9.816],[1653868800000,9.816],[1653955200000,9.816],[1654041600000,9.816],[1654128000000,9.816],[1654214400000,9.816],[1654473600000,10.172],[1654560000000,10.172],[1654646400000,10.172],[1654732800000,10.172],[1654819200000,10.172],[1655078400000,10.172],[1655164800000,10.172],[1655251200000,10.172],[1655337600000,10.172],[1655424000000,10.172],[1655683200000,10.172],[1655769600000,10.172],[1655856000000,10.172],[1655942400000,10.172],[1656028800000,10.172],[1656288000000,10.172],[1656374400000,10.172],[1656460800000,10.172],[1656547200000,10.172],[1656633600000,10.172],[1656892800000,10.172],[1656979200000,10.172],[1657065600000,10.172],[1657152000000,10.172],[1657238400000,10.172],[1657497600000,10.172],[1657584000000,10.172],[1657670400000,10.172],[1657756800000,10.172],[1657843200000,10.172],[1658102400000,10.172],[1658188800000,10.172],[1658275200000,10.172],[1658361600000,10.172],[1658448000000,10.172],[1658707200000,10.172],[1658793600000,10.172],[1658880000000,10.172],[1658966400000,10.172],[1659052800000,10.172],[1659312000000,10.172],[1659398400000,11.048],[1659484800000,11.048],[1659571200000,11.048],[1659657600000,11.048],[1659916800000,11.048],[1660003200000,11.048],[1660089600000,11.11],[1660176000000,11.11],[1660262400000,11.85],[1660608000000,11.85],[1660694400000,11.85],[1660780800000,11.85],[1660867200000,11.85],[1661126400000,11.85],[1661212800000,11.85],[1661299200000,11.85],[1661385600000,11.85],[1661472000000,11.85],[1661731200000,11.85],[1661817600000,11.85],[1661904000000,11.85],[1661990400000,11.85],[1662076800000,11.85],[1662336000000,11.85],[1662422400000,11.85],[1662508800000,11.85],[1662595200000,9.638],[1662681600000,9.638],[1662940800000,9.638],[1663027200000,9.638],[1663113600000,9.638],[1663200000000,9.638],[1663286400000,9.638],[1663545600000,9.638],[1663632000000,9.638],[1663718400000,9.638],[1663804800000,9.638],[1663891200000,9.638],[1664150400000,9.638],[1664236800000,9.638],[1664323200000,9.638],[1664409600000,9.638],[1664496000000,9.638],[1664755200000,9.638],[1664841600000,9.638],[1664928000000,9.638],[1665014400000,9.638],[1665100800000,9.638],[1665360000000,9.638],[1665446400000,9.638],[1665532800000,9.638],[1665619200000,9.638],[1665705600000,9.638],[1665964800000,9.638],[1666051200000,9.638],[1666137600000,9.638],[1666224000000,9.638],[1666310400000,9.638],[1666569600000,9.638],[1666656000000,9.638],[1666742400000,9.638],[1666828800000,9.638],[1666915200000,9.638],[1667174400000,9.638],[1667260800000,9.638],[1667347200000,9.638],[1667433600000,9.638],[1667520000000,9.638],[1667779200000,9.638],[1667865600000,9.638],[1667952000000,9.638],[1668038400000,9.638],[1668124800000,9.638],[1668384000000,9.638],[1668470400000,9.638],[1668556800000,10.442],[1668643200000,10.442],[1668729600000,10.442],[1668988800000,10.442],[1669075200000,10.442],[1669161600000,10.442],[1669248000000,10.442],[1669334400000,10.442],[1669593600000,10.442],[1669680000000,10.442],[1669766400000,10.442],[1669852800000,10.442],[1669939200000,10.442],[1670198400000,10.442],[1670284800000,10.442],[1670371200000,10.442],[1670457600000,10.442],[1670544000000,10.442],[1670803200000,10.442],[1670889600000,10.442],[1670976000000,10.442],[1671062400000,10.442],[1671148800000,10.442],[1671408000000,7.881],[1671494400000,7.881],[1671580800000,7.881],[1671667200000,7.881],[1671753600000,7.881],[1672099200000,7.881],[1672185600000,7.881],[1672272000000,7.881],[1672358400000,7.881],[1672617600000,7.881],[1672704000000,7.881],[1672790400000,7.881],[1672876800000,7.881],[1672963200000,7.881],[1673222400000,7.881],[1673308800000,7.881],[1673395200000,7.881],[1673481600000,7.881],[1673568000000,7.881],[1673827200000,7.881],[1673913600000,7.881],[1674000000000,7.881],[1674086400000,7.881],[1674172800000,7.881],[1674432000000,7.881],[1674518400000,7.881],[1674604800000,7.881],[1674691200000,7.881],[1674777600000,7.881],[1675036800000,9.662],[1675123200000,9.662],[1675209600000,9.662],[1675296000000,9.662],[1675382400000,9.662],[1675641600000,9.662],[1675728000000,10.5],[1675814400000,10.5],[1675900800000,10.5],[1675987200000,10.5],[1676246400000,10.5],[1676332800000,10.5],[1676419200000,10.5],[1676505600000,10.5],[1676592000000,10.5],[1676851200000,10.5],[1676937600000,10.5],[1677024000000,10.5],[1677110400000,10.5],[1677196800000,10.5],[1677456000000,10.5],[1677542400000,10.5],[1677628800000,10.5],[1677715200000,10.5],[1677801600000,10.5],[1678060800000,10.5],[1678147200000,10.5],[1678233600000,10.5],[1678320000000,10.5],[1678406400000,10.5],[1678665600000,10.5],[1678752000000,10.5],[1678838400000,10.5],[1678924800000,10.5],[1679011200000,9.602],[1679270400000,9.602],[1679356800000,9.602],[1679443200000,9.602],[1679529600000,9.602],[1679616000000,9.602],[1679875200000,9.602],[1679961600000,9.602],[1680048000000,9.602],[1680134400000,9.602],[1680220800000,9.602],[1680480000000,9.602],[1680566400000,9.602],[1680652800000,9.602],[1680739200000,9.602],[1681171200000,9.602],[1681257600000,9.602],[1681344000000,9.602],[1681430400000,9.602],[1681689600000,9.602],[1681776000000,9.602],[1681862400000,8.31],[1681948800000,8.31],[1682035200000,8.31],[1682294400000,8.31],[1682380800000,8.31],[1682467200000,8.31],[1682553600000,8.31],[1682640000000,8.31],[1682985600000,8.31],[1683072000000,8.31],[1683158400000,8.31],[1683244800000,8.31],[1683504000000,8.31],[1683590400000,8.31],[1683676800000,8.31],[1683763200000,8.31],[1683849600000,8.31],[1684108800000,8.31],[1684195200000,8.31],[1684281600000,8.31],[1684368000000,8.31],[1684454400000,8.31],[1684713600000,8.31],[1684800000000,8.31],[1684886400000,8.31],[1684972800000,8.31],[1685059200000,8.31],[1685318400000,8.31],[1685404800000,8.31],[1685491200000,8.31],[1685577600000,8.31],[1685664000000,8.31],[1685923200000,8.31],[1686009600000,8.31],[1686096000000,8.31],[1686182400000,8.31],[1686268800000,8.31],[1686528000000,8.31],[1686614400000,8.31],[1686700800000,8.31],[1686787200000,8.31],[1686873600000,8.31],[1687132800000,8.31],[1687219200000,8.5],[1687305600000,8.5],[1687392000000,8.5],[1687478400000,8.5],[1687737600000,8.5],[1687824000000,8.5],[1687910400000,8.5],[1687996800000,8.5],[1688083200000,8.5],[1688342400000,8.5],[1688428800000,8.5],[1688515200000,8.5],[1688601600000,8.5],[1688688000000,8.5],[1688947200000,8.5],[1689033600000,8.5],[1689120000000,8.5],[1689206400000,8.5],[1689292800000,8.5],[1689552000000,8.5],[1689638400000,8.5],[1689724800000,8.5],[1689811200000,8.5],[1689897600000,8.5],[1690156800000,8.5],[1690243200000,8.5],[1690329600000,8.5],[1690416000000,8.5],[1690502400000,8],[1690761600000,8],[1690848000000,8],[1690934400000,8],[1691020800000,8],[1691107200000,8],[1691366400000,8],[1691452800000,8],[1691539200000,8],[1691625600000,6.535],[1691712000000,6.51],[1691971200000,6.51],[1692144000000,6.51],[1692230400000,6.51],[1692316800000,6.51],[1692576000000,6.51],[1692662400000,6.51],[1692748800000,6.51],[1692835200000,6.51],[1692921600000,6.51],[1693180800000,6.51],[1693267200000,6.51],[1693353600000,6.51],[1693440000000,6.51],[1693526400000,6.51],[1693785600000,6.51],[1693872000000,5.9],[1693958400000,5.9],[1694044800000,5.9],[1694736000000,5.12],[1696464000000,4.088],[1698192000000,3.67],[1698364800000,3.608],[1703030400000,5.745],[1705449600000,4.2],[1706227200000,4.728],[1708041600000,5.325]],"name":"Prices","yAxis":0,"showInLegend":false,"type":"area","color":"darkgreen"},{"group":"down","data":[{"Date":"2017-11-03","Volume":0,"direction":"down","x":1509667200000,"y":0},{"Date":"2017-11-15","Volume":0,"direction":"down","x":1510704000000,"y":0},{"Date":"2017-12-12","Volume":0,"direction":"down","x":1513036800000,"y":0},{"Date":"2017-12-29","Volume":0,"direction":"down","x":1514505600000,"y":0},{"Date":"2018-01-05","Volume":0,"direction":"down","x":1515110400000,"y":0},{"Date":"2018-01-11","Volume":0,"direction":"down","x":1515628800000,"y":0},{"Date":"2018-01-17","Volume":0,"direction":"down","x":1516147200000,"y":0},{"Date":"2018-02-07","Volume":0,"direction":"down","x":1517961600000,"y":0},{"Date":"2018-02-09","Volume":0,"direction":"down","x":1518134400000,"y":0},{"Date":"2018-03-01","Volume":0,"direction":"down","x":1519862400000,"y":0},{"Date":"2018-03-05","Volume":250,"direction":"down","x":1520208000000,"y":250},{"Date":"2018-03-06","Volume":0,"direction":"down","x":1520294400000,"y":0},{"Date":"2018-03-21","Volume":0,"direction":"down","x":1521590400000,"y":0},{"Date":"2018-03-29","Volume":0,"direction":"down","x":1522281600000,"y":0},{"Date":"2018-04-25","Volume":0,"direction":"down","x":1524614400000,"y":0},{"Date":"2018-04-27","Volume":0,"direction":"down","x":1524787200000,"y":0},{"Date":"2018-05-03","Volume":200,"direction":"down","x":1525305600000,"y":200},{"Date":"2018-05-04","Volume":0,"direction":"down","x":1525392000000,"y":0},{"Date":"2018-05-10","Volume":0,"direction":"down","x":1525910400000,"y":0},{"Date":"2018-05-18","Volume":0,"direction":"down","x":1526601600000,"y":0},{"Date":"2018-06-19","Volume":0,"direction":"down","x":1529366400000,"y":0},{"Date":"2018-07-24","Volume":0,"direction":"down","x":1532390400000,"y":0},{"Date":"2018-08-02","Volume":5,"direction":"down","x":1533168000000,"y":5},{"Date":"2018-08-03","Volume":0,"direction":"down","x":1533254400000,"y":0},{"Date":"2018-08-10","Volume":0,"direction":"down","x":1533859200000,"y":0},{"Date":"2018-08-30","Volume":0,"direction":"down","x":1535587200000,"y":0},{"Date":"2018-09-10","Volume":0,"direction":"down","x":1536537600000,"y":0},{"Date":"2018-10-03","Volume":0,"direction":"down","x":1538524800000,"y":0},{"Date":"2018-10-12","Volume":0,"direction":"down","x":1539302400000,"y":0},{"Date":"2018-10-25","Volume":0,"direction":"down","x":1540425600000,"y":0},{"Date":"2018-12-14","Volume":0,"direction":"down","x":1544745600000,"y":0},{"Date":"2018-12-28","Volume":0,"direction":"down","x":1545955200000,"y":0},{"Date":"2019-01-04","Volume":0,"direction":"down","x":1546560000000,"y":0},{"Date":"2019-02-04","Volume":0,"direction":"down","x":1549238400000,"y":0},{"Date":"2019-02-12","Volume":0,"direction":"down","x":1549929600000,"y":0},{"Date":"2019-02-14","Volume":0,"direction":"down","x":1550102400000,"y":0},{"Date":"2019-03-01","Volume":0,"direction":"down","x":1551398400000,"y":0},{"Date":"2019-03-05","Volume":0,"direction":"down","x":1551744000000,"y":0},{"Date":"2019-03-07","Volume":0,"direction":"down","x":1551916800000,"y":0},{"Date":"2019-03-15","Volume":0,"direction":"down","x":1552608000000,"y":0},{"Date":"2019-03-25","Volume":0,"direction":"down","x":1553472000000,"y":0},{"Date":"2019-04-18","Volume":0,"direction":"down","x":1555545600000,"y":0},{"Date":"2019-05-09","Volume":2620,"direction":"down","x":1557360000000,"y":2620},{"Date":"2019-05-10","Volume":700,"direction":"down","x":1557446400000,"y":700},{"Date":"2019-05-13","Volume":200,"direction":"down","x":1557705600000,"y":200},{"Date":"2019-05-14","Volume":0,"direction":"down","x":1557792000000,"y":0},{"Date":"2019-08-21","Volume":0,"direction":"down","x":1566345600000,"y":0},{"Date":"2019-08-26","Volume":0,"direction":"down","x":1566777600000,"y":0},{"Date":"2019-09-19","Volume":0,"direction":"down","x":1568851200000,"y":0},{"Date":"2020-01-02","Volume":120,"direction":"down","x":1577923200000,"y":120},{"Date":"2020-01-03","Volume":0,"direction":"down","x":1578009600000,"y":0},{"Date":"2020-01-08","Volume":0,"direction":"down","x":1578441600000,"y":0},{"Date":"2020-01-15","Volume":0,"direction":"down","x":1579046400000,"y":0},{"Date":"2020-02-07","Volume":0,"direction":"down","x":1581033600000,"y":0},{"Date":"2020-02-19","Volume":0,"direction":"down","x":1582070400000,"y":0},{"Date":"2020-03-02","Volume":0,"direction":"down","x":1583107200000,"y":0},{"Date":"2020-03-18","Volume":0,"direction":"down","x":1584489600000,"y":0},{"Date":"2020-03-25","Volume":0,"direction":"down","x":1585094400000,"y":0},{"Date":"2020-04-28","Volume":0,"direction":"down","x":1588032000000,"y":0},{"Date":"2020-05-08","Volume":0,"direction":"down","x":1588896000000,"y":0},{"Date":"2020-06-01","Volume":0,"direction":"down","x":1590969600000,"y":0},{"Date":"2020-09-10","Volume":0,"direction":"down","x":1599696000000,"y":0},{"Date":"2020-09-21","Volume":0,"direction":"down","x":1600646400000,"y":0},{"Date":"2020-09-23","Volume":0,"direction":"down","x":1600819200000,"y":0},{"Date":"2020-10-19","Volume":0,"direction":"down","x":1603065600000,"y":0},{"Date":"2020-10-23","Volume":0,"direction":"down","x":1603411200000,"y":0},{"Date":"2020-12-09","Volume":0,"direction":"down","x":1607472000000,"y":0},{"Date":"2020-12-14","Volume":0,"direction":"down","x":1607904000000,"y":0},{"Date":"2020-12-16","Volume":0,"direction":"down","x":1608076800000,"y":0},{"Date":"2020-12-21","Volume":0,"direction":"down","x":1608508800000,"y":0},{"Date":"2020-12-30","Volume":0,"direction":"down","x":1609286400000,"y":0},{"Date":"2021-01-11","Volume":0,"direction":"down","x":1610323200000,"y":0},{"Date":"2021-01-13","Volume":75,"direction":"down","x":1610496000000,"y":75},{"Date":"2021-01-14","Volume":0,"direction":"down","x":1610582400000,"y":0},{"Date":"2021-01-18","Volume":30,"direction":"down","x":1610928000000,"y":30},{"Date":"2021-01-21","Volume":80,"direction":"down","x":1611187200000,"y":80},{"Date":"2021-01-22","Volume":0,"direction":"down","x":1611273600000,"y":0},{"Date":"2021-01-29","Volume":45,"direction":"down","x":1611878400000,"y":45},{"Date":"2021-02-01","Volume":19,"direction":"down","x":1612137600000,"y":19},{"Date":"2021-02-02","Volume":0,"direction":"down","x":1612224000000,"y":0},{"Date":"2021-02-05","Volume":0,"direction":"down","x":1612483200000,"y":0},{"Date":"2021-02-12","Volume":800,"direction":"down","x":1613088000000,"y":800},{"Date":"2021-02-15","Volume":8,"direction":"down","x":1613347200000,"y":8},{"Date":"2021-02-16","Volume":0,"direction":"down","x":1613433600000,"y":0},{"Date":"2021-02-23","Volume":0,"direction":"down","x":1614038400000,"y":0},{"Date":"2021-02-25","Volume":0,"direction":"down","x":1614211200000,"y":0},{"Date":"2021-03-04","Volume":118,"direction":"down","x":1614816000000,"y":118},{"Date":"2021-03-05","Volume":0,"direction":"down","x":1614902400000,"y":0},{"Date":"2021-03-11","Volume":0,"direction":"down","x":1615420800000,"y":0},{"Date":"2021-03-16","Volume":156,"direction":"down","x":1615852800000,"y":156},{"Date":"2021-03-17","Volume":10,"direction":"down","x":1615939200000,"y":10},{"Date":"2021-03-19","Volume":8,"direction":"down","x":1616112000000,"y":8},{"Date":"2021-03-22","Volume":0,"direction":"down","x":1616371200000,"y":0},{"Date":"2021-03-29","Volume":5,"direction":"down","x":1616976000000,"y":5},{"Date":"2021-03-31","Volume":0,"direction":"down","x":1617148800000,"y":0},{"Date":"2021-04-12","Volume":0,"direction":"down","x":1618185600000,"y":0},{"Date":"2021-04-16","Volume":20,"direction":"down","x":1618531200000,"y":20},{"Date":"2021-04-20","Volume":70,"direction":"down","x":1618876800000,"y":70},{"Date":"2021-04-21","Volume":0,"direction":"down","x":1618963200000,"y":0},{"Date":"2021-05-13","Volume":220,"direction":"down","x":1620864000000,"y":220},{"Date":"2021-05-14","Volume":0,"direction":"down","x":1620950400000,"y":0},{"Date":"2021-05-20","Volume":25,"direction":"down","x":1621468800000,"y":25},{"Date":"2021-05-21","Volume":0,"direction":"down","x":1621555200000,"y":0},{"Date":"2021-05-25","Volume":0,"direction":"down","x":1621900800000,"y":0},{"Date":"2021-05-28","Volume":0,"direction":"down","x":1622160000000,"y":0},{"Date":"2021-06-02","Volume":0,"direction":"down","x":1622592000000,"y":0},{"Date":"2021-06-09","Volume":0,"direction":"down","x":1623196800000,"y":0},{"Date":"2021-06-14","Volume":0,"direction":"down","x":1623628800000,"y":0},{"Date":"2021-06-23","Volume":41,"direction":"down","x":1624406400000,"y":41},{"Date":"2021-06-24","Volume":0,"direction":"down","x":1624492800000,"y":0},{"Date":"2021-06-28","Volume":0,"direction":"down","x":1624838400000,"y":0},{"Date":"2021-07-01","Volume":0,"direction":"down","x":1625097600000,"y":0},{"Date":"2021-07-12","Volume":0,"direction":"down","x":1626048000000,"y":0},{"Date":"2021-07-14","Volume":0,"direction":"down","x":1626220800000,"y":0},{"Date":"2021-07-20","Volume":0,"direction":"down","x":1626739200000,"y":0},{"Date":"2021-08-03","Volume":0,"direction":"down","x":1627948800000,"y":0},{"Date":"2021-08-10","Volume":0,"direction":"down","x":1628553600000,"y":0},{"Date":"2021-08-13","Volume":0,"direction":"down","x":1628812800000,"y":0},{"Date":"2021-08-18","Volume":0,"direction":"down","x":1629244800000,"y":0},{"Date":"2021-08-27","Volume":0,"direction":"down","x":1630022400000,"y":0},{"Date":"2021-09-14","Volume":39,"direction":"down","x":1631577600000,"y":39},{"Date":"2021-09-15","Volume":0,"direction":"down","x":1631664000000,"y":0},{"Date":"2021-09-22","Volume":0,"direction":"down","x":1632268800000,"y":0},{"Date":"2021-09-24","Volume":0,"direction":"down","x":1632441600000,"y":0},{"Date":"2021-09-29","Volume":0,"direction":"down","x":1632873600000,"y":0},{"Date":"2021-11-08","Volume":0,"direction":"down","x":1636329600000,"y":0},{"Date":"2021-11-11","Volume":0,"direction":"down","x":1636588800000,"y":0},{"Date":"2021-11-15","Volume":0,"direction":"down","x":1636934400000,"y":0},{"Date":"2021-11-22","Volume":0,"direction":"down","x":1637539200000,"y":0},{"Date":"2021-11-30","Volume":0,"direction":"down","x":1638230400000,"y":0},{"Date":"2022-01-06","Volume":0,"direction":"down","x":1641427200000,"y":0},{"Date":"2022-01-12","Volume":0,"direction":"down","x":1641945600000,"y":0},{"Date":"2022-01-27","Volume":0,"direction":"down","x":1643241600000,"y":0},{"Date":"2022-02-03","Volume":0,"direction":"down","x":1643846400000,"y":0},{"Date":"2022-03-09","Volume":0,"direction":"down","x":1646784000000,"y":0},{"Date":"2022-03-14","Volume":0,"direction":"down","x":1647216000000,"y":0},{"Date":"2022-03-22","Volume":0,"direction":"down","x":1647907200000,"y":0},{"Date":"2022-04-21","Volume":0,"direction":"down","x":1650499200000,"y":0},{"Date":"2022-05-20","Volume":0,"direction":"down","x":1653004800000,"y":0},{"Date":"2022-05-24","Volume":0,"direction":"down","x":1653350400000,"y":0},{"Date":"2022-06-07","Volume":0,"direction":"down","x":1654560000000,"y":0},{"Date":"2022-08-03","Volume":0,"direction":"down","x":1659484800000,"y":0},{"Date":"2022-08-11","Volume":0,"direction":"down","x":1660176000000,"y":0},{"Date":"2022-08-16","Volume":0,"direction":"down","x":1660608000000,"y":0},{"Date":"2022-09-09","Volume":0,"direction":"down","x":1662681600000,"y":0},{"Date":"2022-11-17","Volume":0,"direction":"down","x":1668643200000,"y":0},{"Date":"2022-12-20","Volume":0,"direction":"down","x":1671494400000,"y":0},{"Date":"2023-01-31","Volume":0,"direction":"down","x":1675123200000,"y":0},{"Date":"2023-02-08","Volume":0,"direction":"down","x":1675814400000,"y":0},{"Date":"2023-03-20","Volume":0,"direction":"down","x":1679270400000,"y":0},{"Date":"2023-04-20","Volume":0,"direction":"down","x":1681948800000,"y":0},{"Date":"2023-06-21","Volume":0,"direction":"down","x":1687305600000,"y":0},{"Date":"2023-07-31","Volume":0,"direction":"down","x":1690761600000,"y":0},{"Date":"2023-08-14","Volume":0,"direction":"down","x":1691971200000,"y":0},{"Date":"2023-09-06","Volume":0,"direction":"down","x":1693958400000,"y":0},{"Date":"2023-10-05","Volume":75,"direction":"down","x":1696464000000,"y":75},{"Date":"2023-10-27","Volume":1400,"direction":"down","x":1698364800000,"y":1400},{"Date":"2023-12-20","Volume":75,"direction":"down","x":1703030400000,"y":75}],"type":"column","name":"Volume","yAxis":1,"showInLegend":false},{"group":"up","data":[{"Date":"2017-10-31","Volume":0,"direction":"up","x":1509408000000,"y":0},{"Date":"2017-11-01","Volume":0,"direction":"up","x":1509494400000,"y":0},{"Date":"2017-11-02","Volume":200,"direction":"up","x":1509580800000,"y":200},{"Date":"2017-11-06","Volume":0,"direction":"up","x":1509926400000,"y":0},{"Date":"2017-11-07","Volume":0,"direction":"up","x":1510012800000,"y":0},{"Date":"2017-11-08","Volume":0,"direction":"up","x":1510099200000,"y":0},{"Date":"2017-11-09","Volume":0,"direction":"up","x":1510185600000,"y":0},{"Date":"2017-11-10","Volume":0,"direction":"up","x":1510272000000,"y":0},{"Date":"2017-11-13","Volume":0,"direction":"up","x":1510531200000,"y":0},{"Date":"2017-11-14","Volume":200,"direction":"up","x":1510617600000,"y":200},{"Date":"2017-11-16","Volume":0,"direction":"up","x":1510790400000,"y":0},{"Date":"2017-11-17","Volume":0,"direction":"up","x":1510876800000,"y":0},{"Date":"2017-11-20","Volume":0,"direction":"up","x":1511136000000,"y":0},{"Date":"2017-11-21","Volume":0,"direction":"up","x":1511222400000,"y":0},{"Date":"2017-11-22","Volume":0,"direction":"up","x":1511308800000,"y":0},{"Date":"2017-11-23","Volume":0,"direction":"up","x":1511395200000,"y":0},{"Date":"2017-11-24","Volume":0,"direction":"up","x":1511481600000,"y":0},{"Date":"2017-11-27","Volume":0,"direction":"up","x":1511740800000,"y":0},{"Date":"2017-11-28","Volume":0,"direction":"up","x":1511827200000,"y":0},{"Date":"2017-11-29","Volume":0,"direction":"up","x":1511913600000,"y":0},{"Date":"2017-11-30","Volume":0,"direction":"up","x":1512000000000,"y":0},{"Date":"2017-12-01","Volume":0,"direction":"up","x":1512086400000,"y":0},{"Date":"2017-12-04","Volume":0,"direction":"up","x":1512345600000,"y":0},{"Date":"2017-12-05","Volume":0,"direction":"up","x":1512432000000,"y":0},{"Date":"2017-12-06","Volume":0,"direction":"up","x":1512518400000,"y":0},{"Date":"2017-12-07","Volume":0,"direction":"up","x":1512604800000,"y":0},{"Date":"2017-12-08","Volume":0,"direction":"up","x":1512691200000,"y":0},{"Date":"2017-12-11","Volume":400,"direction":"up","x":1512950400000,"y":400},{"Date":"2017-12-13","Volume":0,"direction":"up","x":1513123200000,"y":0},{"Date":"2017-12-14","Volume":0,"direction":"up","x":1513209600000,"y":0},{"Date":"2017-12-15","Volume":0,"direction":"up","x":1513296000000,"y":0},{"Date":"2017-12-18","Volume":0,"direction":"up","x":1513555200000,"y":0},{"Date":"2017-12-19","Volume":0,"direction":"up","x":1513641600000,"y":0},{"Date":"2017-12-20","Volume":0,"direction":"up","x":1513728000000,"y":0},{"Date":"2017-12-21","Volume":0,"direction":"up","x":1513814400000,"y":0},{"Date":"2017-12-22","Volume":0,"direction":"up","x":1513900800000,"y":0},{"Date":"2017-12-27","Volume":0,"direction":"up","x":1514332800000,"y":0},{"Date":"2017-12-28","Volume":200,"direction":"up","x":1514419200000,"y":200},{"Date":"2018-01-02","Volume":0,"direction":"up","x":1514851200000,"y":0},{"Date":"2018-01-03","Volume":0,"direction":"up","x":1514937600000,"y":0},{"Date":"2018-01-04","Volume":220,"direction":"up","x":1515024000000,"y":220},{"Date":"2018-01-08","Volume":0,"direction":"up","x":1515369600000,"y":0},{"Date":"2018-01-09","Volume":0,"direction":"up","x":1515456000000,"y":0},{"Date":"2018-01-10","Volume":220,"direction":"up","x":1515542400000,"y":220},{"Date":"2018-01-12","Volume":0,"direction":"up","x":1515715200000,"y":0},{"Date":"2018-01-15","Volume":0,"direction":"up","x":1515974400000,"y":0},{"Date":"2018-01-16","Volume":200,"direction":"up","x":1516060800000,"y":200},{"Date":"2018-01-18","Volume":0,"direction":"up","x":1516233600000,"y":0},{"Date":"2018-01-19","Volume":0,"direction":"up","x":1516320000000,"y":0},{"Date":"2018-01-22","Volume":0,"direction":"up","x":1516579200000,"y":0},{"Date":"2018-01-23","Volume":0,"direction":"up","x":1516665600000,"y":0},{"Date":"2018-01-24","Volume":0,"direction":"up","x":1516752000000,"y":0},{"Date":"2018-01-25","Volume":0,"direction":"up","x":1516838400000,"y":0},{"Date":"2018-01-26","Volume":0,"direction":"up","x":1516924800000,"y":0},{"Date":"2018-01-29","Volume":0,"direction":"up","x":1517184000000,"y":0},{"Date":"2018-01-30","Volume":0,"direction":"up","x":1517270400000,"y":0},{"Date":"2018-01-31","Volume":0,"direction":"up","x":1517356800000,"y":0},{"Date":"2018-02-01","Volume":0,"direction":"up","x":1517443200000,"y":0},{"Date":"2018-02-02","Volume":0,"direction":"up","x":1517529600000,"y":0},{"Date":"2018-02-05","Volume":0,"direction":"up","x":1517788800000,"y":0},{"Date":"2018-02-06","Volume":200,"direction":"up","x":1517875200000,"y":200},{"Date":"2018-02-08","Volume":200,"direction":"up","x":1518048000000,"y":200},{"Date":"2018-02-12","Volume":0,"direction":"up","x":1518393600000,"y":0},{"Date":"2018-02-13","Volume":0,"direction":"up","x":1518480000000,"y":0},{"Date":"2018-02-14","Volume":0,"direction":"up","x":1518566400000,"y":0},{"Date":"2018-02-15","Volume":0,"direction":"up","x":1518652800000,"y":0},{"Date":"2018-02-16","Volume":0,"direction":"up","x":1518739200000,"y":0},{"Date":"2018-02-19","Volume":0,"direction":"up","x":1518998400000,"y":0},{"Date":"2018-02-20","Volume":0,"direction":"up","x":1519084800000,"y":0},{"Date":"2018-02-21","Volume":0,"direction":"up","x":1519171200000,"y":0},{"Date":"2018-02-22","Volume":0,"direction":"up","x":1519257600000,"y":0},{"Date":"2018-02-23","Volume":0,"direction":"up","x":1519344000000,"y":0},{"Date":"2018-02-26","Volume":0,"direction":"up","x":1519603200000,"y":0},{"Date":"2018-02-27","Volume":0,"direction":"up","x":1519689600000,"y":0},{"Date":"2018-02-28","Volume":250,"direction":"up","x":1519776000000,"y":250},{"Date":"2018-03-02","Volume":400,"direction":"up","x":1519948800000,"y":400},{"Date":"2018-03-07","Volume":0,"direction":"up","x":1520380800000,"y":0},{"Date":"2018-03-08","Volume":0,"direction":"up","x":1520467200000,"y":0},{"Date":"2018-03-09","Volume":0,"direction":"up","x":1520553600000,"y":0},{"Date":"2018-03-12","Volume":0,"direction":"up","x":1520812800000,"y":0},{"Date":"2018-03-13","Volume":0,"direction":"up","x":1520899200000,"y":0},{"Date":"2018-03-14","Volume":0,"direction":"up","x":1520985600000,"y":0},{"Date":"2018-03-15","Volume":0,"direction":"up","x":1521072000000,"y":0},{"Date":"2018-03-16","Volume":0,"direction":"up","x":1521158400000,"y":0},{"Date":"2018-03-19","Volume":0,"direction":"up","x":1521417600000,"y":0},{"Date":"2018-03-20","Volume":250,"direction":"up","x":1521504000000,"y":250},{"Date":"2018-03-22","Volume":0,"direction":"up","x":1521676800000,"y":0},{"Date":"2018-03-23","Volume":0,"direction":"up","x":1521763200000,"y":0},{"Date":"2018-03-26","Volume":0,"direction":"up","x":1522022400000,"y":0},{"Date":"2018-03-27","Volume":0,"direction":"up","x":1522108800000,"y":0},{"Date":"2018-03-28","Volume":200,"direction":"up","x":1522195200000,"y":200},{"Date":"2018-04-03","Volume":0,"direction":"up","x":1522713600000,"y":0},{"Date":"2018-04-04","Volume":0,"direction":"up","x":1522800000000,"y":0},{"Date":"2018-04-05","Volume":0,"direction":"up","x":1522886400000,"y":0},{"Date":"2018-04-06","Volume":0,"direction":"up","x":1522972800000,"y":0},{"Date":"2018-04-09","Volume":0,"direction":"up","x":1523232000000,"y":0},{"Date":"2018-04-10","Volume":0,"direction":"up","x":1523318400000,"y":0},{"Date":"2018-04-11","Volume":0,"direction":"up","x":1523404800000,"y":0},{"Date":"2018-04-12","Volume":0,"direction":"up","x":1523491200000,"y":0},{"Date":"2018-04-13","Volume":0,"direction":"up","x":1523577600000,"y":0},{"Date":"2018-04-16","Volume":0,"direction":"up","x":1523836800000,"y":0},{"Date":"2018-04-17","Volume":0,"direction":"up","x":1523923200000,"y":0},{"Date":"2018-04-18","Volume":0,"direction":"up","x":1524009600000,"y":0},{"Date":"2018-04-19","Volume":0,"direction":"up","x":1524096000000,"y":0},{"Date":"2018-04-20","Volume":0,"direction":"up","x":1524182400000,"y":0},{"Date":"2018-04-23","Volume":0,"direction":"up","x":1524441600000,"y":0},{"Date":"2018-04-24","Volume":250,"direction":"up","x":1524528000000,"y":250},{"Date":"2018-04-26","Volume":200,"direction":"up","x":1524700800000,"y":200},{"Date":"2018-04-30","Volume":0,"direction":"up","x":1525046400000,"y":0},{"Date":"2018-05-02","Volume":3510,"direction":"up","x":1525219200000,"y":3510},{"Date":"2018-05-07","Volume":0,"direction":"up","x":1525651200000,"y":0},{"Date":"2018-05-08","Volume":0,"direction":"up","x":1525737600000,"y":0},{"Date":"2018-05-09","Volume":600,"direction":"up","x":1525824000000,"y":600},{"Date":"2018-05-11","Volume":0,"direction":"up","x":1525996800000,"y":0},{"Date":"2018-05-14","Volume":0,"direction":"up","x":1526256000000,"y":0},{"Date":"2018-05-15","Volume":0,"direction":"up","x":1526342400000,"y":0},{"Date":"2018-05-16","Volume":0,"direction":"up","x":1526428800000,"y":0},{"Date":"2018-05-17","Volume":150,"direction":"up","x":1526515200000,"y":150},{"Date":"2018-05-21","Volume":0,"direction":"up","x":1526860800000,"y":0},{"Date":"2018-05-22","Volume":0,"direction":"up","x":1526947200000,"y":0},{"Date":"2018-05-23","Volume":0,"direction":"up","x":1527033600000,"y":0},{"Date":"2018-05-24","Volume":0,"direction":"up","x":1527120000000,"y":0},{"Date":"2018-05-25","Volume":0,"direction":"up","x":1527206400000,"y":0},{"Date":"2018-05-28","Volume":0,"direction":"up","x":1527465600000,"y":0},{"Date":"2018-05-29","Volume":0,"direction":"up","x":1527552000000,"y":0},{"Date":"2018-05-30","Volume":0,"direction":"up","x":1527638400000,"y":0},{"Date":"2018-05-31","Volume":0,"direction":"up","x":1527724800000,"y":0},{"Date":"2018-06-01","Volume":0,"direction":"up","x":1527811200000,"y":0},{"Date":"2018-06-04","Volume":0,"direction":"up","x":1528070400000,"y":0},{"Date":"2018-06-05","Volume":0,"direction":"up","x":1528156800000,"y":0},{"Date":"2018-06-06","Volume":0,"direction":"up","x":1528243200000,"y":0},{"Date":"2018-06-07","Volume":0,"direction":"up","x":1528329600000,"y":0},{"Date":"2018-06-08","Volume":0,"direction":"up","x":1528416000000,"y":0},{"Date":"2018-06-11","Volume":0,"direction":"up","x":1528675200000,"y":0},{"Date":"2018-06-12","Volume":0,"direction":"up","x":1528761600000,"y":0},{"Date":"2018-06-13","Volume":0,"direction":"up","x":1528848000000,"y":0},{"Date":"2018-06-14","Volume":0,"direction":"up","x":1528934400000,"y":0},{"Date":"2018-06-15","Volume":0,"direction":"up","x":1529020800000,"y":0},{"Date":"2018-06-18","Volume":220,"direction":"up","x":1529280000000,"y":220},{"Date":"2018-06-20","Volume":0,"direction":"up","x":1529452800000,"y":0},{"Date":"2018-06-21","Volume":0,"direction":"up","x":1529539200000,"y":0},{"Date":"2018-06-22","Volume":0,"direction":"up","x":1529625600000,"y":0},{"Date":"2018-06-25","Volume":0,"direction":"up","x":1529884800000,"y":0},{"Date":"2018-06-26","Volume":0,"direction":"up","x":1529971200000,"y":0},{"Date":"2018-06-27","Volume":0,"direction":"up","x":1530057600000,"y":0},{"Date":"2018-06-28","Volume":0,"direction":"up","x":1530144000000,"y":0},{"Date":"2018-06-29","Volume":0,"direction":"up","x":1530230400000,"y":0},{"Date":"2018-07-02","Volume":0,"direction":"up","x":1530489600000,"y":0},{"Date":"2018-07-03","Volume":0,"direction":"up","x":1530576000000,"y":0},{"Date":"2018-07-04","Volume":0,"direction":"up","x":1530662400000,"y":0},{"Date":"2018-07-05","Volume":0,"direction":"up","x":1530748800000,"y":0},{"Date":"2018-07-06","Volume":0,"direction":"up","x":1530835200000,"y":0},{"Date":"2018-07-09","Volume":0,"direction":"up","x":1531094400000,"y":0},{"Date":"2018-07-10","Volume":0,"direction":"up","x":1531180800000,"y":0},{"Date":"2018-07-11","Volume":0,"direction":"up","x":1531267200000,"y":0},{"Date":"2018-07-12","Volume":0,"direction":"up","x":1531353600000,"y":0},{"Date":"2018-07-13","Volume":0,"direction":"up","x":1531440000000,"y":0},{"Date":"2018-07-16","Volume":0,"direction":"up","x":1531699200000,"y":0},{"Date":"2018-07-17","Volume":0,"direction":"up","x":1531785600000,"y":0},{"Date":"2018-07-18","Volume":0,"direction":"up","x":1531872000000,"y":0},{"Date":"2018-07-19","Volume":0,"direction":"up","x":1531958400000,"y":0},{"Date":"2018-07-20","Volume":0,"direction":"up","x":1532044800000,"y":0},{"Date":"2018-07-23","Volume":30,"direction":"up","x":1532304000000,"y":30},{"Date":"2018-07-25","Volume":0,"direction":"up","x":1532476800000,"y":0},{"Date":"2018-07-26","Volume":0,"direction":"up","x":1532563200000,"y":0},{"Date":"2018-07-27","Volume":0,"direction":"up","x":1532649600000,"y":0},{"Date":"2018-07-30","Volume":0,"direction":"up","x":1532908800000,"y":0},{"Date":"2018-07-31","Volume":0,"direction":"up","x":1532995200000,"y":0},{"Date":"2018-08-01","Volume":3944,"direction":"up","x":1533081600000,"y":3944},{"Date":"2018-08-06","Volume":0,"direction":"up","x":1533513600000,"y":0},{"Date":"2018-08-07","Volume":0,"direction":"up","x":1533600000000,"y":0},{"Date":"2018-08-08","Volume":0,"direction":"up","x":1533686400000,"y":0},{"Date":"2018-08-09","Volume":35,"direction":"up","x":1533772800000,"y":35},{"Date":"2018-08-13","Volume":0,"direction":"up","x":1534118400000,"y":0},{"Date":"2018-08-14","Volume":0,"direction":"up","x":1534204800000,"y":0},{"Date":"2018-08-16","Volume":0,"direction":"up","x":1534377600000,"y":0},{"Date":"2018-08-17","Volume":0,"direction":"up","x":1534464000000,"y":0},{"Date":"2018-08-20","Volume":0,"direction":"up","x":1534723200000,"y":0},{"Date":"2018-08-21","Volume":0,"direction":"up","x":1534809600000,"y":0},{"Date":"2018-08-22","Volume":0,"direction":"up","x":1534896000000,"y":0},{"Date":"2018-08-23","Volume":0,"direction":"up","x":1534982400000,"y":0},{"Date":"2018-08-24","Volume":0,"direction":"up","x":1535068800000,"y":0},{"Date":"2018-08-27","Volume":0,"direction":"up","x":1535328000000,"y":0},{"Date":"2018-08-28","Volume":0,"direction":"up","x":1535414400000,"y":0},{"Date":"2018-08-29","Volume":100,"direction":"up","x":1535500800000,"y":100},{"Date":"2018-08-31","Volume":0,"direction":"up","x":1535673600000,"y":0},{"Date":"2018-09-03","Volume":0,"direction":"up","x":1535932800000,"y":0},{"Date":"2018-09-04","Volume":0,"direction":"up","x":1536019200000,"y":0},{"Date":"2018-09-05","Volume":0,"direction":"up","x":1536105600000,"y":0},{"Date":"2018-09-06","Volume":0,"direction":"up","x":1536192000000,"y":0},{"Date":"2018-09-07","Volume":250,"direction":"up","x":1536278400000,"y":250},{"Date":"2018-09-11","Volume":0,"direction":"up","x":1536624000000,"y":0},{"Date":"2018-09-12","Volume":0,"direction":"up","x":1536710400000,"y":0},{"Date":"2018-09-13","Volume":0,"direction":"up","x":1536796800000,"y":0},{"Date":"2018-09-14","Volume":0,"direction":"up","x":1536883200000,"y":0},{"Date":"2018-09-17","Volume":0,"direction":"up","x":1537142400000,"y":0},{"Date":"2018-09-18","Volume":0,"direction":"up","x":1537228800000,"y":0},{"Date":"2018-09-19","Volume":0,"direction":"up","x":1537315200000,"y":0},{"Date":"2018-09-20","Volume":0,"direction":"up","x":1537401600000,"y":0},{"Date":"2018-09-21","Volume":0,"direction":"up","x":1537488000000,"y":0},{"Date":"2018-09-24","Volume":0,"direction":"up","x":1537747200000,"y":0},{"Date":"2018-09-25","Volume":0,"direction":"up","x":1537833600000,"y":0},{"Date":"2018-09-26","Volume":0,"direction":"up","x":1537920000000,"y":0},{"Date":"2018-09-27","Volume":0,"direction":"up","x":1538006400000,"y":0},{"Date":"2018-09-28","Volume":0,"direction":"up","x":1538092800000,"y":0},{"Date":"2018-10-01","Volume":0,"direction":"up","x":1538352000000,"y":0},{"Date":"2018-10-02","Volume":220,"direction":"up","x":1538438400000,"y":220},{"Date":"2018-10-04","Volume":0,"direction":"up","x":1538611200000,"y":0},{"Date":"2018-10-05","Volume":0,"direction":"up","x":1538697600000,"y":0},{"Date":"2018-10-08","Volume":0,"direction":"up","x":1538956800000,"y":0},{"Date":"2018-10-09","Volume":0,"direction":"up","x":1539043200000,"y":0},{"Date":"2018-10-10","Volume":0,"direction":"up","x":1539129600000,"y":0},{"Date":"2018-10-11","Volume":960,"direction":"up","x":1539216000000,"y":960},{"Date":"2018-10-15","Volume":0,"direction":"up","x":1539561600000,"y":0},{"Date":"2018-10-16","Volume":0,"direction":"up","x":1539648000000,"y":0},{"Date":"2018-10-17","Volume":0,"direction":"up","x":1539734400000,"y":0},{"Date":"2018-10-18","Volume":0,"direction":"up","x":1539820800000,"y":0},{"Date":"2018-10-19","Volume":0,"direction":"up","x":1539907200000,"y":0},{"Date":"2018-10-22","Volume":0,"direction":"up","x":1540166400000,"y":0},{"Date":"2018-10-23","Volume":0,"direction":"up","x":1540252800000,"y":0},{"Date":"2018-10-24","Volume":1378,"direction":"up","x":1540339200000,"y":1378},{"Date":"2018-10-26","Volume":0,"direction":"up","x":1540512000000,"y":0},{"Date":"2018-10-29","Volume":0,"direction":"up","x":1540771200000,"y":0},{"Date":"2018-10-30","Volume":0,"direction":"up","x":1540857600000,"y":0},{"Date":"2018-10-31","Volume":0,"direction":"up","x":1540944000000,"y":0},{"Date":"2018-11-01","Volume":0,"direction":"up","x":1541030400000,"y":0},{"Date":"2018-11-02","Volume":0,"direction":"up","x":1541116800000,"y":0},{"Date":"2018-11-05","Volume":0,"direction":"up","x":1541376000000,"y":0},{"Date":"2018-11-06","Volume":0,"direction":"up","x":1541462400000,"y":0},{"Date":"2018-11-07","Volume":0,"direction":"up","x":1541548800000,"y":0},{"Date":"2018-11-08","Volume":0,"direction":"up","x":1541635200000,"y":0},{"Date":"2018-11-09","Volume":0,"direction":"up","x":1541721600000,"y":0},{"Date":"2018-11-12","Volume":0,"direction":"up","x":1541980800000,"y":0},{"Date":"2018-11-13","Volume":0,"direction":"up","x":1542067200000,"y":0},{"Date":"2018-11-14","Volume":0,"direction":"up","x":1542153600000,"y":0},{"Date":"2018-11-15","Volume":0,"direction":"up","x":1542240000000,"y":0},{"Date":"2018-11-16","Volume":0,"direction":"up","x":1542326400000,"y":0},{"Date":"2018-11-19","Volume":0,"direction":"up","x":1542585600000,"y":0},{"Date":"2018-11-20","Volume":0,"direction":"up","x":1542672000000,"y":0},{"Date":"2018-11-21","Volume":0,"direction":"up","x":1542758400000,"y":0},{"Date":"2018-11-22","Volume":0,"direction":"up","x":1542844800000,"y":0},{"Date":"2018-11-23","Volume":0,"direction":"up","x":1542931200000,"y":0},{"Date":"2018-11-26","Volume":0,"direction":"up","x":1543190400000,"y":0},{"Date":"2018-11-27","Volume":0,"direction":"up","x":1543276800000,"y":0},{"Date":"2018-11-28","Volume":0,"direction":"up","x":1543363200000,"y":0},{"Date":"2018-11-29","Volume":0,"direction":"up","x":1543449600000,"y":0},{"Date":"2018-11-30","Volume":0,"direction":"up","x":1543536000000,"y":0},{"Date":"2018-12-03","Volume":0,"direction":"up","x":1543795200000,"y":0},{"Date":"2018-12-04","Volume":0,"direction":"up","x":1543881600000,"y":0},{"Date":"2018-12-05","Volume":0,"direction":"up","x":1543968000000,"y":0},{"Date":"2018-12-06","Volume":0,"direction":"up","x":1544054400000,"y":0},{"Date":"2018-12-07","Volume":0,"direction":"up","x":1544140800000,"y":0},{"Date":"2018-12-10","Volume":0,"direction":"up","x":1544400000000,"y":0},{"Date":"2018-12-11","Volume":0,"direction":"up","x":1544486400000,"y":0},{"Date":"2018-12-12","Volume":0,"direction":"up","x":1544572800000,"y":0},{"Date":"2018-12-13","Volume":1964,"direction":"up","x":1544659200000,"y":1964},{"Date":"2018-12-17","Volume":0,"direction":"up","x":1545004800000,"y":0},{"Date":"2018-12-18","Volume":0,"direction":"up","x":1545091200000,"y":0},{"Date":"2018-12-19","Volume":0,"direction":"up","x":1545177600000,"y":0},{"Date":"2018-12-20","Volume":0,"direction":"up","x":1545264000000,"y":0},{"Date":"2018-12-21","Volume":0,"direction":"up","x":1545350400000,"y":0},{"Date":"2018-12-27","Volume":13780,"direction":"up","x":1545868800000,"y":13780},{"Date":"2019-01-02","Volume":0,"direction":"up","x":1546387200000,"y":0},{"Date":"2019-01-03","Volume":700,"direction":"up","x":1546473600000,"y":700},{"Date":"2019-01-07","Volume":0,"direction":"up","x":1546819200000,"y":0},{"Date":"2019-01-08","Volume":0,"direction":"up","x":1546905600000,"y":0},{"Date":"2019-01-09","Volume":0,"direction":"up","x":1546992000000,"y":0},{"Date":"2019-01-10","Volume":0,"direction":"up","x":1547078400000,"y":0},{"Date":"2019-01-11","Volume":0,"direction":"up","x":1547164800000,"y":0},{"Date":"2019-01-14","Volume":0,"direction":"up","x":1547424000000,"y":0},{"Date":"2019-01-15","Volume":0,"direction":"up","x":1547510400000,"y":0},{"Date":"2019-01-16","Volume":0,"direction":"up","x":1547596800000,"y":0},{"Date":"2019-01-17","Volume":0,"direction":"up","x":1547683200000,"y":0},{"Date":"2019-01-18","Volume":0,"direction":"up","x":1547769600000,"y":0},{"Date":"2019-01-21","Volume":0,"direction":"up","x":1548028800000,"y":0},{"Date":"2019-01-22","Volume":0,"direction":"up","x":1548115200000,"y":0},{"Date":"2019-01-23","Volume":0,"direction":"up","x":1548201600000,"y":0},{"Date":"2019-01-24","Volume":0,"direction":"up","x":1548288000000,"y":0},{"Date":"2019-01-25","Volume":0,"direction":"up","x":1548374400000,"y":0},{"Date":"2019-01-28","Volume":0,"direction":"up","x":1548633600000,"y":0},{"Date":"2019-01-29","Volume":0,"direction":"up","x":1548720000000,"y":0},{"Date":"2019-01-30","Volume":0,"direction":"up","x":1548806400000,"y":0},{"Date":"2019-01-31","Volume":0,"direction":"up","x":1548892800000,"y":0},{"Date":"2019-02-01","Volume":1794,"direction":"up","x":1548979200000,"y":1794},{"Date":"2019-02-05","Volume":0,"direction":"up","x":1549324800000,"y":0},{"Date":"2019-02-06","Volume":0,"direction":"up","x":1549411200000,"y":0},{"Date":"2019-02-07","Volume":0,"direction":"up","x":1549497600000,"y":0},{"Date":"2019-02-08","Volume":0,"direction":"up","x":1549584000000,"y":0},{"Date":"2019-02-11","Volume":25,"direction":"up","x":1549843200000,"y":25},{"Date":"2019-02-13","Volume":120,"direction":"up","x":1550016000000,"y":120},{"Date":"2019-02-15","Volume":0,"direction":"up","x":1550188800000,"y":0},{"Date":"2019-02-18","Volume":0,"direction":"up","x":1550448000000,"y":0},{"Date":"2019-02-19","Volume":0,"direction":"up","x":1550534400000,"y":0},{"Date":"2019-02-20","Volume":0,"direction":"up","x":1550620800000,"y":0},{"Date":"2019-02-21","Volume":0,"direction":"up","x":1550707200000,"y":0},{"Date":"2019-02-22","Volume":0,"direction":"up","x":1550793600000,"y":0},{"Date":"2019-02-25","Volume":0,"direction":"up","x":1551052800000,"y":0},{"Date":"2019-02-26","Volume":0,"direction":"up","x":1551139200000,"y":0},{"Date":"2019-02-27","Volume":0,"direction":"up","x":1551225600000,"y":0},{"Date":"2019-02-28","Volume":570,"direction":"up","x":1551312000000,"y":570},{"Date":"2019-03-04","Volume":10,"direction":"up","x":1551657600000,"y":10},{"Date":"2019-03-06","Volume":20,"direction":"up","x":1551830400000,"y":20},{"Date":"2019-03-08","Volume":0,"direction":"up","x":1552003200000,"y":0},{"Date":"2019-03-11","Volume":0,"direction":"up","x":1552262400000,"y":0},{"Date":"2019-03-12","Volume":0,"direction":"up","x":1552348800000,"y":0},{"Date":"2019-03-13","Volume":0,"direction":"up","x":1552435200000,"y":0},{"Date":"2019-03-14","Volume":15,"direction":"up","x":1552521600000,"y":15},{"Date":"2019-03-18","Volume":0,"direction":"up","x":1552867200000,"y":0},{"Date":"2019-03-19","Volume":0,"direction":"up","x":1552953600000,"y":0},{"Date":"2019-03-20","Volume":0,"direction":"up","x":1553040000000,"y":0},{"Date":"2019-03-21","Volume":0,"direction":"up","x":1553126400000,"y":0},{"Date":"2019-03-22","Volume":100,"direction":"up","x":1553212800000,"y":100},{"Date":"2019-03-26","Volume":0,"direction":"up","x":1553558400000,"y":0},{"Date":"2019-03-27","Volume":0,"direction":"up","x":1553644800000,"y":0},{"Date":"2019-03-28","Volume":0,"direction":"up","x":1553731200000,"y":0},{"Date":"2019-03-29","Volume":0,"direction":"up","x":1553817600000,"y":0},{"Date":"2019-04-01","Volume":0,"direction":"up","x":1554076800000,"y":0},{"Date":"2019-04-02","Volume":0,"direction":"up","x":1554163200000,"y":0},{"Date":"2019-04-03","Volume":0,"direction":"up","x":1554249600000,"y":0},{"Date":"2019-04-04","Volume":0,"direction":"up","x":1554336000000,"y":0},{"Date":"2019-04-05","Volume":0,"direction":"up","x":1554422400000,"y":0},{"Date":"2019-04-08","Volume":0,"direction":"up","x":1554681600000,"y":0},{"Date":"2019-04-09","Volume":0,"direction":"up","x":1554768000000,"y":0},{"Date":"2019-04-10","Volume":0,"direction":"up","x":1554854400000,"y":0},{"Date":"2019-04-11","Volume":0,"direction":"up","x":1554940800000,"y":0},{"Date":"2019-04-12","Volume":0,"direction":"up","x":1555027200000,"y":0},{"Date":"2019-04-15","Volume":0,"direction":"up","x":1555286400000,"y":0},{"Date":"2019-04-16","Volume":0,"direction":"up","x":1555372800000,"y":0},{"Date":"2019-04-17","Volume":150,"direction":"up","x":1555459200000,"y":150},{"Date":"2019-04-23","Volume":0,"direction":"up","x":1555977600000,"y":0},{"Date":"2019-04-24","Volume":0,"direction":"up","x":1556064000000,"y":0},{"Date":"2019-04-25","Volume":0,"direction":"up","x":1556150400000,"y":0},{"Date":"2019-04-26","Volume":0,"direction":"up","x":1556236800000,"y":0},{"Date":"2019-04-29","Volume":0,"direction":"up","x":1556496000000,"y":0},{"Date":"2019-04-30","Volume":0,"direction":"up","x":1556582400000,"y":0},{"Date":"2019-05-02","Volume":0,"direction":"up","x":1556755200000,"y":0},{"Date":"2019-05-03","Volume":0,"direction":"up","x":1556841600000,"y":0},{"Date":"2019-05-06","Volume":0,"direction":"up","x":1557100800000,"y":0},{"Date":"2019-05-07","Volume":0,"direction":"up","x":1557187200000,"y":0},{"Date":"2019-05-08","Volume":2800,"direction":"up","x":1557273600000,"y":2800},{"Date":"2019-05-15","Volume":0,"direction":"up","x":1557878400000,"y":0},{"Date":"2019-05-16","Volume":0,"direction":"up","x":1557964800000,"y":0},{"Date":"2019-05-17","Volume":0,"direction":"up","x":1558051200000,"y":0},{"Date":"2019-05-20","Volume":0,"direction":"up","x":1558310400000,"y":0},{"Date":"2019-05-21","Volume":0,"direction":"up","x":1558396800000,"y":0},{"Date":"2019-05-22","Volume":0,"direction":"up","x":1558483200000,"y":0},{"Date":"2019-05-23","Volume":0,"direction":"up","x":1558569600000,"y":0},{"Date":"2019-05-24","Volume":0,"direction":"up","x":1558656000000,"y":0},{"Date":"2019-05-27","Volume":0,"direction":"up","x":1558915200000,"y":0},{"Date":"2019-05-28","Volume":0,"direction":"up","x":1559001600000,"y":0},{"Date":"2019-05-29","Volume":0,"direction":"up","x":1559088000000,"y":0},{"Date":"2019-05-30","Volume":0,"direction":"up","x":1559174400000,"y":0},{"Date":"2019-05-31","Volume":0,"direction":"up","x":1559260800000,"y":0},{"Date":"2019-06-03","Volume":0,"direction":"up","x":1559520000000,"y":0},{"Date":"2019-06-04","Volume":0,"direction":"up","x":1559606400000,"y":0},{"Date":"2019-06-05","Volume":0,"direction":"up","x":1559692800000,"y":0},{"Date":"2019-06-06","Volume":0,"direction":"up","x":1559779200000,"y":0},{"Date":"2019-06-07","Volume":0,"direction":"up","x":1559865600000,"y":0},{"Date":"2019-06-10","Volume":0,"direction":"up","x":1560124800000,"y":0},{"Date":"2019-06-11","Volume":0,"direction":"up","x":1560211200000,"y":0},{"Date":"2019-06-12","Volume":0,"direction":"up","x":1560297600000,"y":0},{"Date":"2019-06-13","Volume":0,"direction":"up","x":1560384000000,"y":0},{"Date":"2019-06-14","Volume":0,"direction":"up","x":1560470400000,"y":0},{"Date":"2019-06-17","Volume":0,"direction":"up","x":1560729600000,"y":0},{"Date":"2019-06-18","Volume":0,"direction":"up","x":1560816000000,"y":0},{"Date":"2019-06-19","Volume":0,"direction":"up","x":1560902400000,"y":0},{"Date":"2019-06-20","Volume":0,"direction":"up","x":1560988800000,"y":0},{"Date":"2019-06-21","Volume":0,"direction":"up","x":1561075200000,"y":0},{"Date":"2019-06-24","Volume":0,"direction":"up","x":1561334400000,"y":0},{"Date":"2019-06-25","Volume":0,"direction":"up","x":1561420800000,"y":0},{"Date":"2019-06-26","Volume":0,"direction":"up","x":1561507200000,"y":0},{"Date":"2019-06-27","Volume":0,"direction":"up","x":1561593600000,"y":0},{"Date":"2019-06-28","Volume":0,"direction":"up","x":1561680000000,"y":0},{"Date":"2019-07-01","Volume":0,"direction":"up","x":1561939200000,"y":0},{"Date":"2019-07-02","Volume":0,"direction":"up","x":1562025600000,"y":0},{"Date":"2019-07-03","Volume":0,"direction":"up","x":1562112000000,"y":0},{"Date":"2019-07-04","Volume":0,"direction":"up","x":1562198400000,"y":0},{"Date":"2019-07-05","Volume":0,"direction":"up","x":1562284800000,"y":0},{"Date":"2019-07-08","Volume":0,"direction":"up","x":1562544000000,"y":0},{"Date":"2019-07-09","Volume":0,"direction":"up","x":1562630400000,"y":0},{"Date":"2019-07-10","Volume":0,"direction":"up","x":1562716800000,"y":0},{"Date":"2019-07-11","Volume":0,"direction":"up","x":1562803200000,"y":0},{"Date":"2019-07-12","Volume":0,"direction":"up","x":1562889600000,"y":0},{"Date":"2019-07-15","Volume":0,"direction":"up","x":1563148800000,"y":0},{"Date":"2019-07-16","Volume":0,"direction":"up","x":1563235200000,"y":0},{"Date":"2019-07-17","Volume":0,"direction":"up","x":1563321600000,"y":0},{"Date":"2019-07-18","Volume":0,"direction":"up","x":1563408000000,"y":0},{"Date":"2019-07-19","Volume":0,"direction":"up","x":1563494400000,"y":0},{"Date":"2019-07-22","Volume":0,"direction":"up","x":1563753600000,"y":0},{"Date":"2019-07-23","Volume":0,"direction":"up","x":1563840000000,"y":0},{"Date":"2019-07-24","Volume":0,"direction":"up","x":1563926400000,"y":0},{"Date":"2019-07-25","Volume":0,"direction":"up","x":1564012800000,"y":0},{"Date":"2019-07-26","Volume":0,"direction":"up","x":1564099200000,"y":0},{"Date":"2019-07-29","Volume":0,"direction":"up","x":1564358400000,"y":0},{"Date":"2019-07-30","Volume":0,"direction":"up","x":1564444800000,"y":0},{"Date":"2019-07-31","Volume":0,"direction":"up","x":1564531200000,"y":0},{"Date":"2019-08-01","Volume":0,"direction":"up","x":1564617600000,"y":0},{"Date":"2019-08-02","Volume":0,"direction":"up","x":1564704000000,"y":0},{"Date":"2019-08-05","Volume":0,"direction":"up","x":1564963200000,"y":0},{"Date":"2019-08-06","Volume":0,"direction":"up","x":1565049600000,"y":0},{"Date":"2019-08-07","Volume":0,"direction":"up","x":1565136000000,"y":0},{"Date":"2019-08-08","Volume":0,"direction":"up","x":1565222400000,"y":0},{"Date":"2019-08-09","Volume":0,"direction":"up","x":1565308800000,"y":0},{"Date":"2019-08-12","Volume":0,"direction":"up","x":1565568000000,"y":0},{"Date":"2019-08-13","Volume":0,"direction":"up","x":1565654400000,"y":0},{"Date":"2019-08-14","Volume":0,"direction":"up","x":1565740800000,"y":0},{"Date":"2019-08-16","Volume":0,"direction":"up","x":1565913600000,"y":0},{"Date":"2019-08-19","Volume":0,"direction":"up","x":1566172800000,"y":0},{"Date":"2019-08-20","Volume":200,"direction":"up","x":1566259200000,"y":200},{"Date":"2019-08-22","Volume":0,"direction":"up","x":1566432000000,"y":0},{"Date":"2019-08-23","Volume":50,"direction":"up","x":1566518400000,"y":50},{"Date":"2019-08-27","Volume":0,"direction":"up","x":1566864000000,"y":0},{"Date":"2019-08-28","Volume":0,"direction":"up","x":1566950400000,"y":0},{"Date":"2019-08-29","Volume":0,"direction":"up","x":1567036800000,"y":0},{"Date":"2019-08-30","Volume":0,"direction":"up","x":1567123200000,"y":0},{"Date":"2019-09-02","Volume":0,"direction":"up","x":1567382400000,"y":0},{"Date":"2019-09-03","Volume":0,"direction":"up","x":1567468800000,"y":0},{"Date":"2019-09-04","Volume":0,"direction":"up","x":1567555200000,"y":0},{"Date":"2019-09-05","Volume":0,"direction":"up","x":1567641600000,"y":0},{"Date":"2019-09-06","Volume":0,"direction":"up","x":1567728000000,"y":0},{"Date":"2019-09-09","Volume":0,"direction":"up","x":1567987200000,"y":0},{"Date":"2019-09-10","Volume":0,"direction":"up","x":1568073600000,"y":0},{"Date":"2019-09-11","Volume":0,"direction":"up","x":1568160000000,"y":0},{"Date":"2019-09-12","Volume":0,"direction":"up","x":1568246400000,"y":0},{"Date":"2019-09-13","Volume":0,"direction":"up","x":1568332800000,"y":0},{"Date":"2019-09-16","Volume":0,"direction":"up","x":1568592000000,"y":0},{"Date":"2019-09-17","Volume":0,"direction":"up","x":1568678400000,"y":0},{"Date":"2019-09-18","Volume":400,"direction":"up","x":1568764800000,"y":400},{"Date":"2019-09-20","Volume":0,"direction":"up","x":1568937600000,"y":0},{"Date":"2019-09-23","Volume":0,"direction":"up","x":1569196800000,"y":0},{"Date":"2019-09-24","Volume":0,"direction":"up","x":1569283200000,"y":0},{"Date":"2019-09-25","Volume":0,"direction":"up","x":1569369600000,"y":0},{"Date":"2019-09-26","Volume":0,"direction":"up","x":1569456000000,"y":0},{"Date":"2019-09-27","Volume":0,"direction":"up","x":1569542400000,"y":0},{"Date":"2019-09-30","Volume":0,"direction":"up","x":1569801600000,"y":0},{"Date":"2019-10-01","Volume":0,"direction":"up","x":1569888000000,"y":0},{"Date":"2019-10-02","Volume":0,"direction":"up","x":1569974400000,"y":0},{"Date":"2019-10-03","Volume":0,"direction":"up","x":1570060800000,"y":0},{"Date":"2019-10-04","Volume":0,"direction":"up","x":1570147200000,"y":0},{"Date":"2019-10-07","Volume":0,"direction":"up","x":1570406400000,"y":0},{"Date":"2019-10-08","Volume":0,"direction":"up","x":1570492800000,"y":0},{"Date":"2019-10-09","Volume":0,"direction":"up","x":1570579200000,"y":0},{"Date":"2019-10-10","Volume":0,"direction":"up","x":1570665600000,"y":0},{"Date":"2019-10-11","Volume":0,"direction":"up","x":1570752000000,"y":0},{"Date":"2019-10-14","Volume":0,"direction":"up","x":1571011200000,"y":0},{"Date":"2019-10-15","Volume":0,"direction":"up","x":1571097600000,"y":0},{"Date":"2019-10-16","Volume":0,"direction":"up","x":1571184000000,"y":0},{"Date":"2019-10-17","Volume":0,"direction":"up","x":1571270400000,"y":0},{"Date":"2019-10-18","Volume":0,"direction":"up","x":1571356800000,"y":0},{"Date":"2019-10-21","Volume":0,"direction":"up","x":1571616000000,"y":0},{"Date":"2019-10-22","Volume":0,"direction":"up","x":1571702400000,"y":0},{"Date":"2019-10-23","Volume":0,"direction":"up","x":1571788800000,"y":0},{"Date":"2019-10-24","Volume":0,"direction":"up","x":1571875200000,"y":0},{"Date":"2019-10-25","Volume":0,"direction":"up","x":1571961600000,"y":0},{"Date":"2019-10-28","Volume":0,"direction":"up","x":1572220800000,"y":0},{"Date":"2019-10-29","Volume":0,"direction":"up","x":1572307200000,"y":0},{"Date":"2019-10-30","Volume":0,"direction":"up","x":1572393600000,"y":0},{"Date":"2019-10-31","Volume":0,"direction":"up","x":1572480000000,"y":0},{"Date":"2019-11-01","Volume":0,"direction":"up","x":1572566400000,"y":0},{"Date":"2019-11-04","Volume":0,"direction":"up","x":1572825600000,"y":0},{"Date":"2019-11-05","Volume":0,"direction":"up","x":1572912000000,"y":0},{"Date":"2019-11-06","Volume":0,"direction":"up","x":1572998400000,"y":0},{"Date":"2019-11-07","Volume":0,"direction":"up","x":1573084800000,"y":0},{"Date":"2019-11-08","Volume":0,"direction":"up","x":1573171200000,"y":0},{"Date":"2019-11-11","Volume":0,"direction":"up","x":1573430400000,"y":0},{"Date":"2019-11-12","Volume":0,"direction":"up","x":1573516800000,"y":0},{"Date":"2019-11-13","Volume":0,"direction":"up","x":1573603200000,"y":0},{"Date":"2019-11-14","Volume":0,"direction":"up","x":1573689600000,"y":0},{"Date":"2019-11-15","Volume":0,"direction":"up","x":1573776000000,"y":0},{"Date":"2019-11-18","Volume":0,"direction":"up","x":1574035200000,"y":0},{"Date":"2019-11-19","Volume":0,"direction":"up","x":1574121600000,"y":0},{"Date":"2019-11-20","Volume":0,"direction":"up","x":1574208000000,"y":0},{"Date":"2019-11-21","Volume":0,"direction":"up","x":1574294400000,"y":0},{"Date":"2019-11-22","Volume":0,"direction":"up","x":1574380800000,"y":0},{"Date":"2019-11-25","Volume":0,"direction":"up","x":1574640000000,"y":0},{"Date":"2019-11-26","Volume":0,"direction":"up","x":1574726400000,"y":0},{"Date":"2019-11-27","Volume":0,"direction":"up","x":1574812800000,"y":0},{"Date":"2019-11-28","Volume":0,"direction":"up","x":1574899200000,"y":0},{"Date":"2019-11-29","Volume":0,"direction":"up","x":1574985600000,"y":0},{"Date":"2019-12-02","Volume":0,"direction":"up","x":1575244800000,"y":0},{"Date":"2019-12-03","Volume":0,"direction":"up","x":1575331200000,"y":0},{"Date":"2019-12-04","Volume":0,"direction":"up","x":1575417600000,"y":0},{"Date":"2019-12-05","Volume":0,"direction":"up","x":1575504000000,"y":0},{"Date":"2019-12-06","Volume":0,"direction":"up","x":1575590400000,"y":0},{"Date":"2019-12-09","Volume":0,"direction":"up","x":1575849600000,"y":0},{"Date":"2019-12-10","Volume":0,"direction":"up","x":1575936000000,"y":0},{"Date":"2019-12-11","Volume":0,"direction":"up","x":1576022400000,"y":0},{"Date":"2019-12-12","Volume":0,"direction":"up","x":1576108800000,"y":0},{"Date":"2019-12-13","Volume":0,"direction":"up","x":1576195200000,"y":0},{"Date":"2019-12-16","Volume":0,"direction":"up","x":1576454400000,"y":0},{"Date":"2019-12-17","Volume":0,"direction":"up","x":1576540800000,"y":0},{"Date":"2019-12-18","Volume":0,"direction":"up","x":1576627200000,"y":0},{"Date":"2019-12-19","Volume":0,"direction":"up","x":1576713600000,"y":0},{"Date":"2019-12-20","Volume":0,"direction":"up","x":1576800000000,"y":0},{"Date":"2019-12-23","Volume":0,"direction":"up","x":1577059200000,"y":0},{"Date":"2019-12-27","Volume":0,"direction":"up","x":1577404800000,"y":0},{"Date":"2019-12-30","Volume":150,"direction":"up","x":1577664000000,"y":150},{"Date":"2020-01-06","Volume":0,"direction":"up","x":1578268800000,"y":0},{"Date":"2020-01-07","Volume":600,"direction":"up","x":1578355200000,"y":600},{"Date":"2020-01-09","Volume":0,"direction":"up","x":1578528000000,"y":0},{"Date":"2020-01-10","Volume":0,"direction":"up","x":1578614400000,"y":0},{"Date":"2020-01-13","Volume":0,"direction":"up","x":1578873600000,"y":0},{"Date":"2020-01-14","Volume":150,"direction":"up","x":1578960000000,"y":150},{"Date":"2020-01-16","Volume":0,"direction":"up","x":1579132800000,"y":0},{"Date":"2020-01-17","Volume":0,"direction":"up","x":1579219200000,"y":0},{"Date":"2020-01-20","Volume":0,"direction":"up","x":1579478400000,"y":0},{"Date":"2020-01-21","Volume":0,"direction":"up","x":1579564800000,"y":0},{"Date":"2020-01-22","Volume":0,"direction":"up","x":1579651200000,"y":0},{"Date":"2020-01-23","Volume":0,"direction":"up","x":1579737600000,"y":0},{"Date":"2020-01-24","Volume":0,"direction":"up","x":1579824000000,"y":0},{"Date":"2020-01-27","Volume":0,"direction":"up","x":1580083200000,"y":0},{"Date":"2020-01-28","Volume":0,"direction":"up","x":1580169600000,"y":0},{"Date":"2020-01-29","Volume":0,"direction":"up","x":1580256000000,"y":0},{"Date":"2020-01-30","Volume":0,"direction":"up","x":1580342400000,"y":0},{"Date":"2020-01-31","Volume":0,"direction":"up","x":1580428800000,"y":0},{"Date":"2020-02-03","Volume":0,"direction":"up","x":1580688000000,"y":0},{"Date":"2020-02-04","Volume":0,"direction":"up","x":1580774400000,"y":0},{"Date":"2020-02-05","Volume":0,"direction":"up","x":1580860800000,"y":0},{"Date":"2020-02-06","Volume":200,"direction":"up","x":1580947200000,"y":200},{"Date":"2020-02-10","Volume":0,"direction":"up","x":1581292800000,"y":0},{"Date":"2020-02-11","Volume":0,"direction":"up","x":1581379200000,"y":0},{"Date":"2020-02-12","Volume":0,"direction":"up","x":1581465600000,"y":0},{"Date":"2020-02-13","Volume":0,"direction":"up","x":1581552000000,"y":0},{"Date":"2020-02-14","Volume":0,"direction":"up","x":1581638400000,"y":0},{"Date":"2020-02-17","Volume":0,"direction":"up","x":1581897600000,"y":0},{"Date":"2020-02-18","Volume":350,"direction":"up","x":1581984000000,"y":350},{"Date":"2020-02-20","Volume":0,"direction":"up","x":1582156800000,"y":0},{"Date":"2020-02-21","Volume":0,"direction":"up","x":1582243200000,"y":0},{"Date":"2020-02-24","Volume":0,"direction":"up","x":1582502400000,"y":0},{"Date":"2020-02-25","Volume":0,"direction":"up","x":1582588800000,"y":0},{"Date":"2020-02-26","Volume":0,"direction":"up","x":1582675200000,"y":0},{"Date":"2020-02-27","Volume":0,"direction":"up","x":1582761600000,"y":0},{"Date":"2020-02-28","Volume":150,"direction":"up","x":1582848000000,"y":150},{"Date":"2020-03-03","Volume":0,"direction":"up","x":1583193600000,"y":0},{"Date":"2020-03-04","Volume":0,"direction":"up","x":1583280000000,"y":0},{"Date":"2020-03-05","Volume":0,"direction":"up","x":1583366400000,"y":0},{"Date":"2020-03-06","Volume":0,"direction":"up","x":1583452800000,"y":0},{"Date":"2020-03-09","Volume":0,"direction":"up","x":1583712000000,"y":0},{"Date":"2020-03-10","Volume":0,"direction":"up","x":1583798400000,"y":0},{"Date":"2020-03-11","Volume":0,"direction":"up","x":1583884800000,"y":0},{"Date":"2020-03-12","Volume":0,"direction":"up","x":1583971200000,"y":0},{"Date":"2020-03-13","Volume":0,"direction":"up","x":1584057600000,"y":0},{"Date":"2020-03-16","Volume":0,"direction":"up","x":1584316800000,"y":0},{"Date":"2020-03-17","Volume":1000,"direction":"up","x":1584403200000,"y":1000},{"Date":"2020-03-19","Volume":0,"direction":"up","x":1584576000000,"y":0},{"Date":"2020-03-20","Volume":0,"direction":"up","x":1584662400000,"y":0},{"Date":"2020-03-23","Volume":300,"direction":"up","x":1584921600000,"y":300},{"Date":"2020-03-24","Volume":700,"direction":"up","x":1585008000000,"y":700},{"Date":"2020-03-26","Volume":0,"direction":"up","x":1585180800000,"y":0},{"Date":"2020-03-27","Volume":0,"direction":"up","x":1585267200000,"y":0},{"Date":"2020-03-30","Volume":0,"direction":"up","x":1585526400000,"y":0},{"Date":"2020-03-31","Volume":0,"direction":"up","x":1585612800000,"y":0},{"Date":"2020-04-01","Volume":0,"direction":"up","x":1585699200000,"y":0},{"Date":"2020-04-02","Volume":0,"direction":"up","x":1585785600000,"y":0},{"Date":"2020-04-03","Volume":0,"direction":"up","x":1585872000000,"y":0},{"Date":"2020-04-06","Volume":0,"direction":"up","x":1586131200000,"y":0},{"Date":"2020-04-07","Volume":0,"direction":"up","x":1586217600000,"y":0},{"Date":"2020-04-08","Volume":0,"direction":"up","x":1586304000000,"y":0},{"Date":"2020-04-09","Volume":0,"direction":"up","x":1586390400000,"y":0},{"Date":"2020-04-14","Volume":0,"direction":"up","x":1586822400000,"y":0},{"Date":"2020-04-15","Volume":0,"direction":"up","x":1586908800000,"y":0},{"Date":"2020-04-16","Volume":0,"direction":"up","x":1586995200000,"y":0},{"Date":"2020-04-17","Volume":0,"direction":"up","x":1587081600000,"y":0},{"Date":"2020-04-20","Volume":0,"direction":"up","x":1587340800000,"y":0},{"Date":"2020-04-21","Volume":0,"direction":"up","x":1587427200000,"y":0},{"Date":"2020-04-22","Volume":0,"direction":"up","x":1587513600000,"y":0},{"Date":"2020-04-23","Volume":0,"direction":"up","x":1587600000000,"y":0},{"Date":"2020-04-24","Volume":0,"direction":"up","x":1587686400000,"y":0},{"Date":"2020-04-27","Volume":900,"direction":"up","x":1587945600000,"y":900},{"Date":"2020-04-29","Volume":0,"direction":"up","x":1588118400000,"y":0},{"Date":"2020-04-30","Volume":0,"direction":"up","x":1588204800000,"y":0},{"Date":"2020-05-04","Volume":0,"direction":"up","x":1588550400000,"y":0},{"Date":"2020-05-05","Volume":0,"direction":"up","x":1588636800000,"y":0},{"Date":"2020-05-06","Volume":0,"direction":"up","x":1588723200000,"y":0},{"Date":"2020-05-07","Volume":150,"direction":"up","x":1588809600000,"y":150},{"Date":"2020-05-11","Volume":0,"direction":"up","x":1589155200000,"y":0},{"Date":"2020-05-12","Volume":0,"direction":"up","x":1589241600000,"y":0},{"Date":"2020-05-13","Volume":0,"direction":"up","x":1589328000000,"y":0},{"Date":"2020-05-14","Volume":0,"direction":"up","x":1589414400000,"y":0},{"Date":"2020-05-15","Volume":0,"direction":"up","x":1589500800000,"y":0},{"Date":"2020-05-18","Volume":0,"direction":"up","x":1589760000000,"y":0},{"Date":"2020-05-19","Volume":0,"direction":"up","x":1589846400000,"y":0},{"Date":"2020-05-20","Volume":0,"direction":"up","x":1589932800000,"y":0},{"Date":"2020-05-21","Volume":0,"direction":"up","x":1590019200000,"y":0},{"Date":"2020-05-22","Volume":0,"direction":"up","x":1590105600000,"y":0},{"Date":"2020-05-25","Volume":0,"direction":"up","x":1590364800000,"y":0},{"Date":"2020-05-26","Volume":0,"direction":"up","x":1590451200000,"y":0},{"Date":"2020-05-27","Volume":0,"direction":"up","x":1590537600000,"y":0},{"Date":"2020-05-28","Volume":0,"direction":"up","x":1590624000000,"y":0},{"Date":"2020-05-29","Volume":120,"direction":"up","x":1590710400000,"y":120},{"Date":"2020-06-02","Volume":0,"direction":"up","x":1591056000000,"y":0},{"Date":"2020-06-03","Volume":0,"direction":"up","x":1591142400000,"y":0},{"Date":"2020-06-04","Volume":0,"direction":"up","x":1591228800000,"y":0},{"Date":"2020-06-05","Volume":0,"direction":"up","x":1591315200000,"y":0},{"Date":"2020-06-08","Volume":0,"direction":"up","x":1591574400000,"y":0},{"Date":"2020-06-09","Volume":0,"direction":"up","x":1591660800000,"y":0},{"Date":"2020-06-10","Volume":0,"direction":"up","x":1591747200000,"y":0},{"Date":"2020-06-11","Volume":0,"direction":"up","x":1591833600000,"y":0},{"Date":"2020-06-12","Volume":0,"direction":"up","x":1591920000000,"y":0},{"Date":"2020-06-15","Volume":0,"direction":"up","x":1592179200000,"y":0},{"Date":"2020-06-16","Volume":0,"direction":"up","x":1592265600000,"y":0},{"Date":"2020-06-17","Volume":0,"direction":"up","x":1592352000000,"y":0},{"Date":"2020-06-18","Volume":0,"direction":"up","x":1592438400000,"y":0},{"Date":"2020-06-19","Volume":0,"direction":"up","x":1592524800000,"y":0},{"Date":"2020-06-22","Volume":0,"direction":"up","x":1592784000000,"y":0},{"Date":"2020-06-23","Volume":0,"direction":"up","x":1592870400000,"y":0},{"Date":"2020-06-24","Volume":0,"direction":"up","x":1592956800000,"y":0},{"Date":"2020-06-25","Volume":0,"direction":"up","x":1593043200000,"y":0},{"Date":"2020-06-26","Volume":0,"direction":"up","x":1593129600000,"y":0},{"Date":"2020-06-29","Volume":0,"direction":"up","x":1593388800000,"y":0},{"Date":"2020-06-30","Volume":0,"direction":"up","x":1593475200000,"y":0},{"Date":"2020-07-01","Volume":0,"direction":"up","x":1593561600000,"y":0},{"Date":"2020-07-02","Volume":0,"direction":"up","x":1593648000000,"y":0},{"Date":"2020-07-03","Volume":0,"direction":"up","x":1593734400000,"y":0},{"Date":"2020-07-06","Volume":0,"direction":"up","x":1593993600000,"y":0},{"Date":"2020-07-07","Volume":0,"direction":"up","x":1594080000000,"y":0},{"Date":"2020-07-08","Volume":0,"direction":"up","x":1594166400000,"y":0},{"Date":"2020-07-09","Volume":0,"direction":"up","x":1594252800000,"y":0},{"Date":"2020-07-10","Volume":0,"direction":"up","x":1594339200000,"y":0},{"Date":"2020-07-13","Volume":0,"direction":"up","x":1594598400000,"y":0},{"Date":"2020-07-14","Volume":0,"direction":"up","x":1594684800000,"y":0},{"Date":"2020-07-15","Volume":0,"direction":"up","x":1594771200000,"y":0},{"Date":"2020-07-16","Volume":0,"direction":"up","x":1594857600000,"y":0},{"Date":"2020-07-17","Volume":0,"direction":"up","x":1594944000000,"y":0},{"Date":"2020-07-20","Volume":0,"direction":"up","x":1595203200000,"y":0},{"Date":"2020-07-21","Volume":0,"direction":"up","x":1595289600000,"y":0},{"Date":"2020-07-22","Volume":0,"direction":"up","x":1595376000000,"y":0},{"Date":"2020-07-23","Volume":0,"direction":"up","x":1595462400000,"y":0},{"Date":"2020-07-24","Volume":0,"direction":"up","x":1595548800000,"y":0},{"Date":"2020-07-27","Volume":0,"direction":"up","x":1595808000000,"y":0},{"Date":"2020-07-28","Volume":0,"direction":"up","x":1595894400000,"y":0},{"Date":"2020-07-29","Volume":0,"direction":"up","x":1595980800000,"y":0},{"Date":"2020-07-30","Volume":0,"direction":"up","x":1596067200000,"y":0},{"Date":"2020-07-31","Volume":0,"direction":"up","x":1596153600000,"y":0},{"Date":"2020-08-03","Volume":0,"direction":"up","x":1596412800000,"y":0},{"Date":"2020-08-04","Volume":0,"direction":"up","x":1596499200000,"y":0},{"Date":"2020-08-05","Volume":0,"direction":"up","x":1596585600000,"y":0},{"Date":"2020-08-06","Volume":0,"direction":"up","x":1596672000000,"y":0},{"Date":"2020-08-07","Volume":0,"direction":"up","x":1596758400000,"y":0},{"Date":"2020-08-10","Volume":0,"direction":"up","x":1597017600000,"y":0},{"Date":"2020-08-11","Volume":0,"direction":"up","x":1597104000000,"y":0},{"Date":"2020-08-12","Volume":0,"direction":"up","x":1597190400000,"y":0},{"Date":"2020-08-13","Volume":0,"direction":"up","x":1597276800000,"y":0},{"Date":"2020-08-14","Volume":0,"direction":"up","x":1597363200000,"y":0},{"Date":"2020-08-17","Volume":0,"direction":"up","x":1597622400000,"y":0},{"Date":"2020-08-18","Volume":0,"direction":"up","x":1597708800000,"y":0},{"Date":"2020-08-19","Volume":0,"direction":"up","x":1597795200000,"y":0},{"Date":"2020-08-20","Volume":0,"direction":"up","x":1597881600000,"y":0},{"Date":"2020-08-21","Volume":0,"direction":"up","x":1597968000000,"y":0},{"Date":"2020-08-24","Volume":0,"direction":"up","x":1598227200000,"y":0},{"Date":"2020-08-25","Volume":0,"direction":"up","x":1598313600000,"y":0},{"Date":"2020-08-26","Volume":0,"direction":"up","x":1598400000000,"y":0},{"Date":"2020-08-27","Volume":0,"direction":"up","x":1598486400000,"y":0},{"Date":"2020-08-28","Volume":0,"direction":"up","x":1598572800000,"y":0},{"Date":"2020-08-31","Volume":0,"direction":"up","x":1598832000000,"y":0},{"Date":"2020-09-01","Volume":0,"direction":"up","x":1598918400000,"y":0},{"Date":"2020-09-02","Volume":0,"direction":"up","x":1599004800000,"y":0},{"Date":"2020-09-03","Volume":0,"direction":"up","x":1599091200000,"y":0},{"Date":"2020-09-04","Volume":0,"direction":"up","x":1599177600000,"y":0},{"Date":"2020-09-07","Volume":0,"direction":"up","x":1599436800000,"y":0},{"Date":"2020-09-08","Volume":0,"direction":"up","x":1599523200000,"y":0},{"Date":"2020-09-09","Volume":1430,"direction":"up","x":1599609600000,"y":1430},{"Date":"2020-09-11","Volume":0,"direction":"up","x":1599782400000,"y":0},{"Date":"2020-09-14","Volume":0,"direction":"up","x":1600041600000,"y":0},{"Date":"2020-09-15","Volume":0,"direction":"up","x":1600128000000,"y":0},{"Date":"2020-09-16","Volume":0,"direction":"up","x":1600214400000,"y":0},{"Date":"2020-09-17","Volume":0,"direction":"up","x":1600300800000,"y":0},{"Date":"2020-09-18","Volume":1400,"direction":"up","x":1600387200000,"y":1400},{"Date":"2020-09-22","Volume":1400,"direction":"up","x":1600732800000,"y":1400},{"Date":"2020-09-24","Volume":0,"direction":"up","x":1600905600000,"y":0},{"Date":"2020-09-25","Volume":0,"direction":"up","x":1600992000000,"y":0},{"Date":"2020-09-28","Volume":0,"direction":"up","x":1601251200000,"y":0},{"Date":"2020-09-29","Volume":0,"direction":"up","x":1601337600000,"y":0},{"Date":"2020-09-30","Volume":0,"direction":"up","x":1601424000000,"y":0},{"Date":"2020-10-01","Volume":0,"direction":"up","x":1601510400000,"y":0},{"Date":"2020-10-02","Volume":0,"direction":"up","x":1601596800000,"y":0},{"Date":"2020-10-05","Volume":0,"direction":"up","x":1601856000000,"y":0},{"Date":"2020-10-06","Volume":0,"direction":"up","x":1601942400000,"y":0},{"Date":"2020-10-07","Volume":0,"direction":"up","x":1602028800000,"y":0},{"Date":"2020-10-08","Volume":0,"direction":"up","x":1602115200000,"y":0},{"Date":"2020-10-09","Volume":0,"direction":"up","x":1602201600000,"y":0},{"Date":"2020-10-12","Volume":0,"direction":"up","x":1602460800000,"y":0},{"Date":"2020-10-13","Volume":0,"direction":"up","x":1602547200000,"y":0},{"Date":"2020-10-14","Volume":0,"direction":"up","x":1602633600000,"y":0},{"Date":"2020-10-15","Volume":0,"direction":"up","x":1602720000000,"y":0},{"Date":"2020-10-16","Volume":900,"direction":"up","x":1602806400000,"y":900},{"Date":"2020-10-20","Volume":0,"direction":"up","x":1603152000000,"y":0},{"Date":"2020-10-21","Volume":0,"direction":"up","x":1603238400000,"y":0},{"Date":"2020-10-22","Volume":100,"direction":"up","x":1603324800000,"y":100},{"Date":"2020-10-26","Volume":0,"direction":"up","x":1603670400000,"y":0},{"Date":"2020-10-27","Volume":0,"direction":"up","x":1603756800000,"y":0},{"Date":"2020-10-28","Volume":0,"direction":"up","x":1603843200000,"y":0},{"Date":"2020-10-29","Volume":0,"direction":"up","x":1603929600000,"y":0},{"Date":"2020-10-30","Volume":0,"direction":"up","x":1604016000000,"y":0},{"Date":"2020-11-02","Volume":0,"direction":"up","x":1604275200000,"y":0},{"Date":"2020-11-03","Volume":0,"direction":"up","x":1604361600000,"y":0},{"Date":"2020-11-04","Volume":0,"direction":"up","x":1604448000000,"y":0},{"Date":"2020-11-05","Volume":0,"direction":"up","x":1604534400000,"y":0},{"Date":"2020-11-06","Volume":0,"direction":"up","x":1604620800000,"y":0},{"Date":"2020-11-09","Volume":0,"direction":"up","x":1604880000000,"y":0},{"Date":"2020-11-10","Volume":0,"direction":"up","x":1604966400000,"y":0},{"Date":"2020-11-11","Volume":0,"direction":"up","x":1605052800000,"y":0},{"Date":"2020-11-12","Volume":0,"direction":"up","x":1605139200000,"y":0},{"Date":"2020-11-13","Volume":0,"direction":"up","x":1605225600000,"y":0},{"Date":"2020-11-16","Volume":0,"direction":"up","x":1605484800000,"y":0},{"Date":"2020-11-17","Volume":0,"direction":"up","x":1605571200000,"y":0},{"Date":"2020-11-18","Volume":0,"direction":"up","x":1605657600000,"y":0},{"Date":"2020-11-19","Volume":0,"direction":"up","x":1605744000000,"y":0},{"Date":"2020-11-20","Volume":0,"direction":"up","x":1605830400000,"y":0},{"Date":"2020-11-23","Volume":0,"direction":"up","x":1606089600000,"y":0},{"Date":"2020-11-24","Volume":0,"direction":"up","x":1606176000000,"y":0},{"Date":"2020-11-25","Volume":0,"direction":"up","x":1606262400000,"y":0},{"Date":"2020-11-26","Volume":0,"direction":"up","x":1606348800000,"y":0},{"Date":"2020-11-27","Volume":0,"direction":"up","x":1606435200000,"y":0},{"Date":"2020-11-30","Volume":0,"direction":"up","x":1606694400000,"y":0},{"Date":"2020-12-01","Volume":0,"direction":"up","x":1606780800000,"y":0},{"Date":"2020-12-02","Volume":0,"direction":"up","x":1606867200000,"y":0},{"Date":"2020-12-03","Volume":0,"direction":"up","x":1606953600000,"y":0},{"Date":"2020-12-04","Volume":0,"direction":"up","x":1607040000000,"y":0},{"Date":"2020-12-07","Volume":0,"direction":"up","x":1607299200000,"y":0},{"Date":"2020-12-08","Volume":650,"direction":"up","x":1607385600000,"y":650},{"Date":"2020-12-10","Volume":0,"direction":"up","x":1607558400000,"y":0},{"Date":"2020-12-11","Volume":35,"direction":"up","x":1607644800000,"y":35},{"Date":"2020-12-15","Volume":2800,"direction":"up","x":1607990400000,"y":2800},{"Date":"2020-12-17","Volume":0,"direction":"up","x":1608163200000,"y":0},{"Date":"2020-12-18","Volume":35,"direction":"up","x":1608249600000,"y":35},{"Date":"2020-12-22","Volume":0,"direction":"up","x":1608595200000,"y":0},{"Date":"2020-12-23","Volume":0,"direction":"up","x":1608681600000,"y":0},{"Date":"2020-12-28","Volume":0,"direction":"up","x":1609113600000,"y":0},{"Date":"2020-12-29","Volume":32,"direction":"up","x":1609200000000,"y":32},{"Date":"2021-01-04","Volume":0,"direction":"up","x":1609718400000,"y":0},{"Date":"2021-01-05","Volume":0,"direction":"up","x":1609804800000,"y":0},{"Date":"2021-01-06","Volume":0,"direction":"up","x":1609891200000,"y":0},{"Date":"2021-01-07","Volume":0,"direction":"up","x":1609977600000,"y":0},{"Date":"2021-01-08","Volume":232,"direction":"up","x":1610064000000,"y":232},{"Date":"2021-01-12","Volume":100,"direction":"up","x":1610409600000,"y":100},{"Date":"2021-01-15","Volume":42,"direction":"up","x":1610668800000,"y":42},{"Date":"2021-01-19","Volume":1405,"direction":"up","x":1611014400000,"y":1405},{"Date":"2021-01-20","Volume":6328,"direction":"up","x":1611100800000,"y":6328},{"Date":"2021-01-25","Volume":20,"direction":"up","x":1611532800000,"y":20},{"Date":"2021-01-26","Volume":1400,"direction":"up","x":1611619200000,"y":1400},{"Date":"2021-01-27","Volume":1400,"direction":"up","x":1611705600000,"y":1400},{"Date":"2021-01-28","Volume":2874,"direction":"up","x":1611792000000,"y":2874},{"Date":"2021-02-03","Volume":0,"direction":"up","x":1612310400000,"y":0},{"Date":"2021-02-04","Volume":87,"direction":"up","x":1612396800000,"y":87},{"Date":"2021-02-08","Volume":0,"direction":"up","x":1612742400000,"y":0},{"Date":"2021-02-09","Volume":30,"direction":"up","x":1612828800000,"y":30},{"Date":"2021-02-10","Volume":3205,"direction":"up","x":1612915200000,"y":3205},{"Date":"2021-02-11","Volume":4085,"direction":"up","x":1613001600000,"y":4085},{"Date":"2021-02-17","Volume":0,"direction":"up","x":1613520000000,"y":0},{"Date":"2021-02-18","Volume":100,"direction":"up","x":1613606400000,"y":100},{"Date":"2021-02-19","Volume":165,"direction":"up","x":1613692800000,"y":165},{"Date":"2021-02-22","Volume":2000,"direction":"up","x":1613952000000,"y":2000},{"Date":"2021-02-24","Volume":8035,"direction":"up","x":1614124800000,"y":8035},{"Date":"2021-02-26","Volume":0,"direction":"up","x":1614297600000,"y":0},{"Date":"2021-03-01","Volume":0,"direction":"up","x":1614556800000,"y":0},{"Date":"2021-03-02","Volume":0,"direction":"up","x":1614643200000,"y":0},{"Date":"2021-03-03","Volume":2005,"direction":"up","x":1614729600000,"y":2005},{"Date":"2021-03-08","Volume":0,"direction":"up","x":1615161600000,"y":0},{"Date":"2021-03-09","Volume":18,"direction":"up","x":1615248000000,"y":18},{"Date":"2021-03-10","Volume":2000,"direction":"up","x":1615334400000,"y":2000},{"Date":"2021-03-12","Volume":0,"direction":"up","x":1615507200000,"y":0},{"Date":"2021-03-15","Volume":8010,"direction":"up","x":1615766400000,"y":8010},{"Date":"2021-03-18","Volume":20,"direction":"up","x":1616025600000,"y":20},{"Date":"2021-03-23","Volume":0,"direction":"up","x":1616457600000,"y":0},{"Date":"2021-03-24","Volume":0,"direction":"up","x":1616544000000,"y":0},{"Date":"2021-03-25","Volume":13,"direction":"up","x":1616630400000,"y":13},{"Date":"2021-03-26","Volume":22,"direction":"up","x":1616716800000,"y":22},{"Date":"2021-03-30","Volume":8,"direction":"up","x":1617062400000,"y":8},{"Date":"2021-04-01","Volume":0,"direction":"up","x":1617235200000,"y":0},{"Date":"2021-04-06","Volume":0,"direction":"up","x":1617667200000,"y":0},{"Date":"2021-04-07","Volume":0,"direction":"up","x":1617753600000,"y":0},{"Date":"2021-04-08","Volume":0,"direction":"up","x":1617840000000,"y":0},{"Date":"2021-04-09","Volume":50,"direction":"up","x":1617926400000,"y":50},{"Date":"2021-04-13","Volume":0,"direction":"up","x":1618272000000,"y":0},{"Date":"2021-04-14","Volume":0,"direction":"up","x":1618358400000,"y":0},{"Date":"2021-04-15","Volume":25,"direction":"up","x":1618444800000,"y":25},{"Date":"2021-04-19","Volume":152,"direction":"up","x":1618790400000,"y":152},{"Date":"2021-04-22","Volume":0,"direction":"up","x":1619049600000,"y":0},{"Date":"2021-04-23","Volume":0,"direction":"up","x":1619136000000,"y":0},{"Date":"2021-04-26","Volume":0,"direction":"up","x":1619395200000,"y":0},{"Date":"2021-04-27","Volume":0,"direction":"up","x":1619481600000,"y":0},{"Date":"2021-04-28","Volume":0,"direction":"up","x":1619568000000,"y":0},{"Date":"2021-04-29","Volume":0,"direction":"up","x":1619654400000,"y":0},{"Date":"2021-04-30","Volume":0,"direction":"up","x":1619740800000,"y":0},{"Date":"2021-05-03","Volume":0,"direction":"up","x":1620000000000,"y":0},{"Date":"2021-05-04","Volume":0,"direction":"up","x":1620086400000,"y":0},{"Date":"2021-05-05","Volume":0,"direction":"up","x":1620172800000,"y":0},{"Date":"2021-05-06","Volume":0,"direction":"up","x":1620259200000,"y":0},{"Date":"2021-05-07","Volume":0,"direction":"up","x":1620345600000,"y":0},{"Date":"2021-05-10","Volume":0,"direction":"up","x":1620604800000,"y":0},{"Date":"2021-05-11","Volume":0,"direction":"up","x":1620691200000,"y":0},{"Date":"2021-05-12","Volume":3320,"direction":"up","x":1620777600000,"y":3320},{"Date":"2021-05-17","Volume":0,"direction":"up","x":1621209600000,"y":0},{"Date":"2021-05-18","Volume":0,"direction":"up","x":1621296000000,"y":0},{"Date":"2021-05-19","Volume":214,"direction":"up","x":1621382400000,"y":214},{"Date":"2021-05-24","Volume":25,"direction":"up","x":1621814400000,"y":25},{"Date":"2021-05-26","Volume":10,"direction":"up","x":1621987200000,"y":10},{"Date":"2021-05-27","Volume":829,"direction":"up","x":1622073600000,"y":829},{"Date":"2021-05-31","Volume":0,"direction":"up","x":1622419200000,"y":0},{"Date":"2021-06-01","Volume":21,"direction":"up","x":1622505600000,"y":21},{"Date":"2021-06-03","Volume":0,"direction":"up","x":1622678400000,"y":0},{"Date":"2021-06-04","Volume":0,"direction":"up","x":1622764800000,"y":0},{"Date":"2021-06-07","Volume":0,"direction":"up","x":1623024000000,"y":0},{"Date":"2021-06-08","Volume":21,"direction":"up","x":1623110400000,"y":21},{"Date":"2021-06-10","Volume":0,"direction":"up","x":1623283200000,"y":0},{"Date":"2021-06-11","Volume":41,"direction":"up","x":1623369600000,"y":41},{"Date":"2021-06-15","Volume":0,"direction":"up","x":1623715200000,"y":0},{"Date":"2021-06-16","Volume":0,"direction":"up","x":1623801600000,"y":0},{"Date":"2021-06-17","Volume":0,"direction":"up","x":1623888000000,"y":0},{"Date":"2021-06-18","Volume":0,"direction":"up","x":1623974400000,"y":0},{"Date":"2021-06-21","Volume":0,"direction":"up","x":1624233600000,"y":0},{"Date":"2021-06-22","Volume":2000,"direction":"up","x":1624320000000,"y":2000},{"Date":"2021-06-25","Volume":4000,"direction":"up","x":1624579200000,"y":4000},{"Date":"2021-06-29","Volume":122,"direction":"up","x":1624924800000,"y":122},{"Date":"2021-06-30","Volume":2032,"direction":"up","x":1625011200000,"y":2032},{"Date":"2021-07-02","Volume":0,"direction":"up","x":1625184000000,"y":0},{"Date":"2021-07-05","Volume":0,"direction":"up","x":1625443200000,"y":0},{"Date":"2021-07-06","Volume":0,"direction":"up","x":1625529600000,"y":0},{"Date":"2021-07-07","Volume":0,"direction":"up","x":1625616000000,"y":0},{"Date":"2021-07-08","Volume":0,"direction":"up","x":1625702400000,"y":0},{"Date":"2021-07-09","Volume":2000,"direction":"up","x":1625788800000,"y":2000},{"Date":"2021-07-13","Volume":38,"direction":"up","x":1626134400000,"y":38},{"Date":"2021-07-15","Volume":0,"direction":"up","x":1626307200000,"y":0},{"Date":"2021-07-16","Volume":0,"direction":"up","x":1626393600000,"y":0},{"Date":"2021-07-19","Volume":90,"direction":"up","x":1626652800000,"y":90},{"Date":"2021-07-21","Volume":0,"direction":"up","x":1626825600000,"y":0},{"Date":"2021-07-22","Volume":0,"direction":"up","x":1626912000000,"y":0},{"Date":"2021-07-23","Volume":0,"direction":"up","x":1626998400000,"y":0},{"Date":"2021-07-26","Volume":0,"direction":"up","x":1627257600000,"y":0},{"Date":"2021-07-27","Volume":0,"direction":"up","x":1627344000000,"y":0},{"Date":"2021-07-28","Volume":0,"direction":"up","x":1627430400000,"y":0},{"Date":"2021-07-29","Volume":0,"direction":"up","x":1627516800000,"y":0},{"Date":"2021-07-30","Volume":0,"direction":"up","x":1627603200000,"y":0},{"Date":"2021-08-02","Volume":2000,"direction":"up","x":1627862400000,"y":2000},{"Date":"2021-08-04","Volume":0,"direction":"up","x":1628035200000,"y":0},{"Date":"2021-08-05","Volume":0,"direction":"up","x":1628121600000,"y":0},{"Date":"2021-08-06","Volume":0,"direction":"up","x":1628208000000,"y":0},{"Date":"2021-08-09","Volume":2000,"direction":"up","x":1628467200000,"y":2000},{"Date":"2021-08-11","Volume":0,"direction":"up","x":1628640000000,"y":0},{"Date":"2021-08-12","Volume":160,"direction":"up","x":1628726400000,"y":160},{"Date":"2021-08-16","Volume":0,"direction":"up","x":1629072000000,"y":0},{"Date":"2021-08-17","Volume":40,"direction":"up","x":1629158400000,"y":40},{"Date":"2021-08-19","Volume":0,"direction":"up","x":1629331200000,"y":0},{"Date":"2021-08-20","Volume":0,"direction":"up","x":1629417600000,"y":0},{"Date":"2021-08-23","Volume":0,"direction":"up","x":1629676800000,"y":0},{"Date":"2021-08-24","Volume":0,"direction":"up","x":1629763200000,"y":0},{"Date":"2021-08-25","Volume":0,"direction":"up","x":1629849600000,"y":0},{"Date":"2021-08-26","Volume":40,"direction":"up","x":1629936000000,"y":40},{"Date":"2021-08-30","Volume":0,"direction":"up","x":1630281600000,"y":0},{"Date":"2021-08-31","Volume":0,"direction":"up","x":1630368000000,"y":0},{"Date":"2021-09-01","Volume":0,"direction":"up","x":1630454400000,"y":0},{"Date":"2021-09-02","Volume":0,"direction":"up","x":1630540800000,"y":0},{"Date":"2021-09-03","Volume":0,"direction":"up","x":1630627200000,"y":0},{"Date":"2021-09-06","Volume":0,"direction":"up","x":1630886400000,"y":0},{"Date":"2021-09-07","Volume":0,"direction":"up","x":1630972800000,"y":0},{"Date":"2021-09-08","Volume":0,"direction":"up","x":1631059200000,"y":0},{"Date":"2021-09-09","Volume":0,"direction":"up","x":1631145600000,"y":0},{"Date":"2021-09-10","Volume":0,"direction":"up","x":1631232000000,"y":0},{"Date":"2021-09-13","Volume":2000,"direction":"up","x":1631491200000,"y":2000},{"Date":"2021-09-16","Volume":0,"direction":"up","x":1631750400000,"y":0},{"Date":"2021-09-17","Volume":0,"direction":"up","x":1631836800000,"y":0},{"Date":"2021-09-20","Volume":0,"direction":"up","x":1632096000000,"y":0},{"Date":"2021-09-21","Volume":2000,"direction":"up","x":1632182400000,"y":2000},{"Date":"2021-09-23","Volume":2000,"direction":"up","x":1632355200000,"y":2000},{"Date":"2021-09-27","Volume":0,"direction":"up","x":1632700800000,"y":0},{"Date":"2021-09-28","Volume":2000,"direction":"up","x":1632787200000,"y":2000},{"Date":"2021-09-30","Volume":0,"direction":"up","x":1632960000000,"y":0},{"Date":"2021-10-01","Volume":0,"direction":"up","x":1633046400000,"y":0},{"Date":"2021-10-04","Volume":0,"direction":"up","x":1633305600000,"y":0},{"Date":"2021-10-05","Volume":0,"direction":"up","x":1633392000000,"y":0},{"Date":"2021-10-06","Volume":0,"direction":"up","x":1633478400000,"y":0},{"Date":"2021-10-07","Volume":0,"direction":"up","x":1633564800000,"y":0},{"Date":"2021-10-08","Volume":0,"direction":"up","x":1633651200000,"y":0},{"Date":"2021-10-11","Volume":0,"direction":"up","x":1633910400000,"y":0},{"Date":"2021-10-12","Volume":0,"direction":"up","x":1633996800000,"y":0},{"Date":"2021-10-13","Volume":0,"direction":"up","x":1634083200000,"y":0},{"Date":"2021-10-14","Volume":0,"direction":"up","x":1634169600000,"y":0},{"Date":"2021-10-15","Volume":0,"direction":"up","x":1634256000000,"y":0},{"Date":"2021-10-18","Volume":0,"direction":"up","x":1634515200000,"y":0},{"Date":"2021-10-19","Volume":0,"direction":"up","x":1634601600000,"y":0},{"Date":"2021-10-20","Volume":0,"direction":"up","x":1634688000000,"y":0},{"Date":"2021-10-21","Volume":0,"direction":"up","x":1634774400000,"y":0},{"Date":"2021-10-22","Volume":0,"direction":"up","x":1634860800000,"y":0},{"Date":"2021-10-25","Volume":0,"direction":"up","x":1635120000000,"y":0},{"Date":"2021-10-26","Volume":0,"direction":"up","x":1635206400000,"y":0},{"Date":"2021-10-27","Volume":0,"direction":"up","x":1635292800000,"y":0},{"Date":"2021-10-28","Volume":0,"direction":"up","x":1635379200000,"y":0},{"Date":"2021-10-29","Volume":0,"direction":"up","x":1635465600000,"y":0},{"Date":"2021-11-01","Volume":0,"direction":"up","x":1635724800000,"y":0},{"Date":"2021-11-02","Volume":0,"direction":"up","x":1635811200000,"y":0},{"Date":"2021-11-03","Volume":0,"direction":"up","x":1635897600000,"y":0},{"Date":"2021-11-04","Volume":0,"direction":"up","x":1635984000000,"y":0},{"Date":"2021-11-05","Volume":39,"direction":"up","x":1636070400000,"y":39},{"Date":"2021-11-09","Volume":0,"direction":"up","x":1636416000000,"y":0},{"Date":"2021-11-10","Volume":20,"direction":"up","x":1636502400000,"y":20},{"Date":"2021-11-12","Volume":23,"direction":"up","x":1636675200000,"y":23},{"Date":"2021-11-16","Volume":0,"direction":"up","x":1637020800000,"y":0},{"Date":"2021-11-17","Volume":0,"direction":"up","x":1637107200000,"y":0},{"Date":"2021-11-18","Volume":0,"direction":"up","x":1637193600000,"y":0},{"Date":"2021-11-19","Volume":300,"direction":"up","x":1637280000000,"y":300},{"Date":"2021-11-23","Volume":0,"direction":"up","x":1637625600000,"y":0},{"Date":"2021-11-24","Volume":0,"direction":"up","x":1637712000000,"y":0},{"Date":"2021-11-25","Volume":0,"direction":"up","x":1637798400000,"y":0},{"Date":"2021-11-26","Volume":0,"direction":"up","x":1637884800000,"y":0},{"Date":"2021-11-29","Volume":51,"direction":"up","x":1638144000000,"y":51},{"Date":"2021-12-01","Volume":0,"direction":"up","x":1638316800000,"y":0},{"Date":"2021-12-02","Volume":0,"direction":"up","x":1638403200000,"y":0},{"Date":"2021-12-03","Volume":0,"direction":"up","x":1638489600000,"y":0},{"Date":"2021-12-06","Volume":0,"direction":"up","x":1638748800000,"y":0},{"Date":"2021-12-07","Volume":0,"direction":"up","x":1638835200000,"y":0},{"Date":"2021-12-08","Volume":0,"direction":"up","x":1638921600000,"y":0},{"Date":"2021-12-09","Volume":0,"direction":"up","x":1639008000000,"y":0},{"Date":"2021-12-10","Volume":0,"direction":"up","x":1639094400000,"y":0},{"Date":"2021-12-13","Volume":0,"direction":"up","x":1639353600000,"y":0},{"Date":"2021-12-14","Volume":0,"direction":"up","x":1639440000000,"y":0},{"Date":"2021-12-15","Volume":0,"direction":"up","x":1639526400000,"y":0},{"Date":"2021-12-16","Volume":0,"direction":"up","x":1639612800000,"y":0},{"Date":"2021-12-17","Volume":0,"direction":"up","x":1639699200000,"y":0},{"Date":"2021-12-20","Volume":0,"direction":"up","x":1639958400000,"y":0},{"Date":"2021-12-21","Volume":0,"direction":"up","x":1640044800000,"y":0},{"Date":"2021-12-22","Volume":0,"direction":"up","x":1640131200000,"y":0},{"Date":"2021-12-23","Volume":0,"direction":"up","x":1640217600000,"y":0},{"Date":"2021-12-27","Volume":0,"direction":"up","x":1640563200000,"y":0},{"Date":"2021-12-28","Volume":0,"direction":"up","x":1640649600000,"y":0},{"Date":"2021-12-29","Volume":0,"direction":"up","x":1640736000000,"y":0},{"Date":"2021-12-30","Volume":0,"direction":"up","x":1640822400000,"y":0},{"Date":"2022-01-03","Volume":0,"direction":"up","x":1641168000000,"y":0},{"Date":"2022-01-04","Volume":0,"direction":"up","x":1641254400000,"y":0},{"Date":"2022-01-05","Volume":60,"direction":"up","x":1641340800000,"y":60},{"Date":"2022-01-07","Volume":0,"direction":"up","x":1641513600000,"y":0},{"Date":"2022-01-10","Volume":0,"direction":"up","x":1641772800000,"y":0},{"Date":"2022-01-11","Volume":117,"direction":"up","x":1641859200000,"y":117},{"Date":"2022-01-13","Volume":0,"direction":"up","x":1642032000000,"y":0},{"Date":"2022-01-14","Volume":0,"direction":"up","x":1642118400000,"y":0},{"Date":"2022-01-17","Volume":0,"direction":"up","x":1642377600000,"y":0},{"Date":"2022-01-18","Volume":0,"direction":"up","x":1642464000000,"y":0},{"Date":"2022-01-19","Volume":0,"direction":"up","x":1642550400000,"y":0},{"Date":"2022-01-20","Volume":0,"direction":"up","x":1642636800000,"y":0},{"Date":"2022-01-21","Volume":0,"direction":"up","x":1642723200000,"y":0},{"Date":"2022-01-24","Volume":103,"direction":"up","x":1642982400000,"y":103},{"Date":"2022-01-25","Volume":289,"direction":"up","x":1643068800000,"y":289},{"Date":"2022-01-26","Volume":700,"direction":"up","x":1643155200000,"y":700},{"Date":"2022-01-28","Volume":0,"direction":"up","x":1643328000000,"y":0},{"Date":"2022-01-31","Volume":0,"direction":"up","x":1643587200000,"y":0},{"Date":"2022-02-01","Volume":0,"direction":"up","x":1643673600000,"y":0},{"Date":"2022-02-02","Volume":194,"direction":"up","x":1643760000000,"y":194},{"Date":"2022-02-04","Volume":0,"direction":"up","x":1643932800000,"y":0},{"Date":"2022-02-07","Volume":0,"direction":"up","x":1644192000000,"y":0},{"Date":"2022-02-08","Volume":0,"direction":"up","x":1644278400000,"y":0},{"Date":"2022-02-09","Volume":0,"direction":"up","x":1644364800000,"y":0},{"Date":"2022-02-10","Volume":0,"direction":"up","x":1644451200000,"y":0},{"Date":"2022-02-11","Volume":0,"direction":"up","x":1644537600000,"y":0},{"Date":"2022-02-14","Volume":0,"direction":"up","x":1644796800000,"y":0},{"Date":"2022-02-15","Volume":0,"direction":"up","x":1644883200000,"y":0},{"Date":"2022-02-16","Volume":0,"direction":"up","x":1644969600000,"y":0},{"Date":"2022-02-17","Volume":0,"direction":"up","x":1645056000000,"y":0},{"Date":"2022-02-18","Volume":0,"direction":"up","x":1645142400000,"y":0},{"Date":"2022-02-21","Volume":0,"direction":"up","x":1645401600000,"y":0},{"Date":"2022-02-22","Volume":0,"direction":"up","x":1645488000000,"y":0},{"Date":"2022-02-23","Volume":0,"direction":"up","x":1645574400000,"y":0},{"Date":"2022-02-24","Volume":0,"direction":"up","x":1645660800000,"y":0},{"Date":"2022-02-25","Volume":0,"direction":"up","x":1645747200000,"y":0},{"Date":"2022-02-28","Volume":0,"direction":"up","x":1646006400000,"y":0},{"Date":"2022-03-01","Volume":0,"direction":"up","x":1646092800000,"y":0},{"Date":"2022-03-02","Volume":0,"direction":"up","x":1646179200000,"y":0},{"Date":"2022-03-03","Volume":0,"direction":"up","x":1646265600000,"y":0},{"Date":"2022-03-04","Volume":0,"direction":"up","x":1646352000000,"y":0},{"Date":"2022-03-07","Volume":0,"direction":"up","x":1646611200000,"y":0},{"Date":"2022-03-08","Volume":1000,"direction":"up","x":1646697600000,"y":1000},{"Date":"2022-03-10","Volume":0,"direction":"up","x":1646870400000,"y":0},{"Date":"2022-03-11","Volume":250,"direction":"up","x":1646956800000,"y":250},{"Date":"2022-03-15","Volume":0,"direction":"up","x":1647302400000,"y":0},{"Date":"2022-03-16","Volume":0,"direction":"up","x":1647388800000,"y":0},{"Date":"2022-03-17","Volume":0,"direction":"up","x":1647475200000,"y":0},{"Date":"2022-03-18","Volume":0,"direction":"up","x":1647561600000,"y":0},{"Date":"2022-03-21","Volume":1000,"direction":"up","x":1647820800000,"y":1000},{"Date":"2022-03-23","Volume":0,"direction":"up","x":1647993600000,"y":0},{"Date":"2022-03-24","Volume":0,"direction":"up","x":1648080000000,"y":0},{"Date":"2022-03-25","Volume":0,"direction":"up","x":1648166400000,"y":0},{"Date":"2022-03-28","Volume":0,"direction":"up","x":1648425600000,"y":0},{"Date":"2022-03-29","Volume":0,"direction":"up","x":1648512000000,"y":0},{"Date":"2022-03-30","Volume":0,"direction":"up","x":1648598400000,"y":0},{"Date":"2022-03-31","Volume":0,"direction":"up","x":1648684800000,"y":0},{"Date":"2022-04-01","Volume":0,"direction":"up","x":1648771200000,"y":0},{"Date":"2022-04-04","Volume":0,"direction":"up","x":1649030400000,"y":0},{"Date":"2022-04-05","Volume":0,"direction":"up","x":1649116800000,"y":0},{"Date":"2022-04-06","Volume":0,"direction":"up","x":1649203200000,"y":0},{"Date":"2022-04-07","Volume":0,"direction":"up","x":1649289600000,"y":0},{"Date":"2022-04-08","Volume":0,"direction":"up","x":1649376000000,"y":0},{"Date":"2022-04-11","Volume":0,"direction":"up","x":1649635200000,"y":0},{"Date":"2022-04-12","Volume":0,"direction":"up","x":1649721600000,"y":0},{"Date":"2022-04-13","Volume":0,"direction":"up","x":1649808000000,"y":0},{"Date":"2022-04-14","Volume":0,"direction":"up","x":1649894400000,"y":0},{"Date":"2022-04-19","Volume":0,"direction":"up","x":1650326400000,"y":0},{"Date":"2022-04-20","Volume":202,"direction":"up","x":1650412800000,"y":202},{"Date":"2022-04-22","Volume":0,"direction":"up","x":1650585600000,"y":0},{"Date":"2022-04-25","Volume":0,"direction":"up","x":1650844800000,"y":0},{"Date":"2022-04-26","Volume":0,"direction":"up","x":1650931200000,"y":0},{"Date":"2022-04-27","Volume":0,"direction":"up","x":1651017600000,"y":0},{"Date":"2022-04-28","Volume":0,"direction":"up","x":1651104000000,"y":0},{"Date":"2022-04-29","Volume":0,"direction":"up","x":1651190400000,"y":0},{"Date":"2022-05-02","Volume":0,"direction":"up","x":1651449600000,"y":0},{"Date":"2022-05-03","Volume":0,"direction":"up","x":1651536000000,"y":0},{"Date":"2022-05-04","Volume":0,"direction":"up","x":1651622400000,"y":0},{"Date":"2022-05-05","Volume":0,"direction":"up","x":1651708800000,"y":0},{"Date":"2022-05-06","Volume":0,"direction":"up","x":1651795200000,"y":0},{"Date":"2022-05-09","Volume":0,"direction":"up","x":1652054400000,"y":0},{"Date":"2022-05-10","Volume":0,"direction":"up","x":1652140800000,"y":0},{"Date":"2022-05-11","Volume":0,"direction":"up","x":1652227200000,"y":0},{"Date":"2022-05-12","Volume":0,"direction":"up","x":1652313600000,"y":0},{"Date":"2022-05-13","Volume":0,"direction":"up","x":1652400000000,"y":0},{"Date":"2022-05-16","Volume":0,"direction":"up","x":1652659200000,"y":0},{"Date":"2022-05-17","Volume":0,"direction":"up","x":1652745600000,"y":0},{"Date":"2022-05-18","Volume":0,"direction":"up","x":1652832000000,"y":0},{"Date":"2022-05-19","Volume":125,"direction":"up","x":1652918400000,"y":125},{"Date":"2022-05-23","Volume":125,"direction":"up","x":1653264000000,"y":125},{"Date":"2022-05-25","Volume":0,"direction":"up","x":1653436800000,"y":0},{"Date":"2022-05-26","Volume":0,"direction":"up","x":1653523200000,"y":0},{"Date":"2022-05-27","Volume":0,"direction":"up","x":1653609600000,"y":0},{"Date":"2022-05-30","Volume":0,"direction":"up","x":1653868800000,"y":0},{"Date":"2022-05-31","Volume":0,"direction":"up","x":1653955200000,"y":0},{"Date":"2022-06-01","Volume":0,"direction":"up","x":1654041600000,"y":0},{"Date":"2022-06-02","Volume":0,"direction":"up","x":1654128000000,"y":0},{"Date":"2022-06-03","Volume":0,"direction":"up","x":1654214400000,"y":0},{"Date":"2022-06-06","Volume":26,"direction":"up","x":1654473600000,"y":26},{"Date":"2022-06-08","Volume":0,"direction":"up","x":1654646400000,"y":0},{"Date":"2022-06-09","Volume":0,"direction":"up","x":1654732800000,"y":0},{"Date":"2022-06-10","Volume":0,"direction":"up","x":1654819200000,"y":0},{"Date":"2022-06-13","Volume":0,"direction":"up","x":1655078400000,"y":0},{"Date":"2022-06-14","Volume":0,"direction":"up","x":1655164800000,"y":0},{"Date":"2022-06-15","Volume":0,"direction":"up","x":1655251200000,"y":0},{"Date":"2022-06-16","Volume":0,"direction":"up","x":1655337600000,"y":0},{"Date":"2022-06-17","Volume":0,"direction":"up","x":1655424000000,"y":0},{"Date":"2022-06-20","Volume":0,"direction":"up","x":1655683200000,"y":0},{"Date":"2022-06-21","Volume":0,"direction":"up","x":1655769600000,"y":0},{"Date":"2022-06-22","Volume":0,"direction":"up","x":1655856000000,"y":0},{"Date":"2022-06-23","Volume":0,"direction":"up","x":1655942400000,"y":0},{"Date":"2022-06-24","Volume":0,"direction":"up","x":1656028800000,"y":0},{"Date":"2022-06-27","Volume":0,"direction":"up","x":1656288000000,"y":0},{"Date":"2022-06-28","Volume":0,"direction":"up","x":1656374400000,"y":0},{"Date":"2022-06-29","Volume":0,"direction":"up","x":1656460800000,"y":0},{"Date":"2022-06-30","Volume":0,"direction":"up","x":1656547200000,"y":0},{"Date":"2022-07-01","Volume":0,"direction":"up","x":1656633600000,"y":0},{"Date":"2022-07-04","Volume":0,"direction":"up","x":1656892800000,"y":0},{"Date":"2022-07-05","Volume":0,"direction":"up","x":1656979200000,"y":0},{"Date":"2022-07-06","Volume":0,"direction":"up","x":1657065600000,"y":0},{"Date":"2022-07-07","Volume":0,"direction":"up","x":1657152000000,"y":0},{"Date":"2022-07-08","Volume":0,"direction":"up","x":1657238400000,"y":0},{"Date":"2022-07-11","Volume":0,"direction":"up","x":1657497600000,"y":0},{"Date":"2022-07-12","Volume":0,"direction":"up","x":1657584000000,"y":0},{"Date":"2022-07-13","Volume":0,"direction":"up","x":1657670400000,"y":0},{"Date":"2022-07-14","Volume":0,"direction":"up","x":1657756800000,"y":0},{"Date":"2022-07-15","Volume":0,"direction":"up","x":1657843200000,"y":0},{"Date":"2022-07-18","Volume":0,"direction":"up","x":1658102400000,"y":0},{"Date":"2022-07-19","Volume":0,"direction":"up","x":1658188800000,"y":0},{"Date":"2022-07-20","Volume":0,"direction":"up","x":1658275200000,"y":0},{"Date":"2022-07-21","Volume":0,"direction":"up","x":1658361600000,"y":0},{"Date":"2022-07-22","Volume":0,"direction":"up","x":1658448000000,"y":0},{"Date":"2022-07-25","Volume":0,"direction":"up","x":1658707200000,"y":0},{"Date":"2022-07-26","Volume":0,"direction":"up","x":1658793600000,"y":0},{"Date":"2022-07-27","Volume":0,"direction":"up","x":1658880000000,"y":0},{"Date":"2022-07-28","Volume":0,"direction":"up","x":1658966400000,"y":0},{"Date":"2022-07-29","Volume":0,"direction":"up","x":1659052800000,"y":0},{"Date":"2022-08-01","Volume":0,"direction":"up","x":1659312000000,"y":0},{"Date":"2022-08-02","Volume":26,"direction":"up","x":1659398400000,"y":26},{"Date":"2022-08-04","Volume":0,"direction":"up","x":1659571200000,"y":0},{"Date":"2022-08-05","Volume":0,"direction":"up","x":1659657600000,"y":0},{"Date":"2022-08-08","Volume":0,"direction":"up","x":1659916800000,"y":0},{"Date":"2022-08-09","Volume":0,"direction":"up","x":1660003200000,"y":0},{"Date":"2022-08-10","Volume":45,"direction":"up","x":1660089600000,"y":45},{"Date":"2022-08-12","Volume":45,"direction":"up","x":1660262400000,"y":45},{"Date":"2022-08-17","Volume":0,"direction":"up","x":1660694400000,"y":0},{"Date":"2022-08-18","Volume":0,"direction":"up","x":1660780800000,"y":0},{"Date":"2022-08-19","Volume":0,"direction":"up","x":1660867200000,"y":0},{"Date":"2022-08-22","Volume":0,"direction":"up","x":1661126400000,"y":0},{"Date":"2022-08-23","Volume":0,"direction":"up","x":1661212800000,"y":0},{"Date":"2022-08-24","Volume":0,"direction":"up","x":1661299200000,"y":0},{"Date":"2022-08-25","Volume":0,"direction":"up","x":1661385600000,"y":0},{"Date":"2022-08-26","Volume":0,"direction":"up","x":1661472000000,"y":0},{"Date":"2022-08-29","Volume":0,"direction":"up","x":1661731200000,"y":0},{"Date":"2022-08-30","Volume":0,"direction":"up","x":1661817600000,"y":0},{"Date":"2022-08-31","Volume":0,"direction":"up","x":1661904000000,"y":0},{"Date":"2022-09-01","Volume":0,"direction":"up","x":1661990400000,"y":0},{"Date":"2022-09-02","Volume":0,"direction":"up","x":1662076800000,"y":0},{"Date":"2022-09-05","Volume":0,"direction":"up","x":1662336000000,"y":0},{"Date":"2022-09-06","Volume":0,"direction":"up","x":1662422400000,"y":0},{"Date":"2022-09-07","Volume":0,"direction":"up","x":1662508800000,"y":0},{"Date":"2022-09-08","Volume":53,"direction":"up","x":1662595200000,"y":53},{"Date":"2022-09-12","Volume":0,"direction":"up","x":1662940800000,"y":0},{"Date":"2022-09-13","Volume":0,"direction":"up","x":1663027200000,"y":0},{"Date":"2022-09-14","Volume":0,"direction":"up","x":1663113600000,"y":0},{"Date":"2022-09-15","Volume":0,"direction":"up","x":1663200000000,"y":0},{"Date":"2022-09-16","Volume":0,"direction":"up","x":1663286400000,"y":0},{"Date":"2022-09-19","Volume":0,"direction":"up","x":1663545600000,"y":0},{"Date":"2022-09-20","Volume":0,"direction":"up","x":1663632000000,"y":0},{"Date":"2022-09-21","Volume":0,"direction":"up","x":1663718400000,"y":0},{"Date":"2022-09-22","Volume":0,"direction":"up","x":1663804800000,"y":0},{"Date":"2022-09-23","Volume":0,"direction":"up","x":1663891200000,"y":0},{"Date":"2022-09-26","Volume":0,"direction":"up","x":1664150400000,"y":0},{"Date":"2022-09-27","Volume":0,"direction":"up","x":1664236800000,"y":0},{"Date":"2022-09-28","Volume":0,"direction":"up","x":1664323200000,"y":0},{"Date":"2022-09-29","Volume":0,"direction":"up","x":1664409600000,"y":0},{"Date":"2022-09-30","Volume":0,"direction":"up","x":1664496000000,"y":0},{"Date":"2022-10-03","Volume":0,"direction":"up","x":1664755200000,"y":0},{"Date":"2022-10-04","Volume":0,"direction":"up","x":1664841600000,"y":0},{"Date":"2022-10-05","Volume":0,"direction":"up","x":1664928000000,"y":0},{"Date":"2022-10-06","Volume":0,"direction":"up","x":1665014400000,"y":0},{"Date":"2022-10-07","Volume":0,"direction":"up","x":1665100800000,"y":0},{"Date":"2022-10-10","Volume":0,"direction":"up","x":1665360000000,"y":0},{"Date":"2022-10-11","Volume":0,"direction":"up","x":1665446400000,"y":0},{"Date":"2022-10-12","Volume":0,"direction":"up","x":1665532800000,"y":0},{"Date":"2022-10-13","Volume":0,"direction":"up","x":1665619200000,"y":0},{"Date":"2022-10-14","Volume":0,"direction":"up","x":1665705600000,"y":0},{"Date":"2022-10-17","Volume":0,"direction":"up","x":1665964800000,"y":0},{"Date":"2022-10-18","Volume":0,"direction":"up","x":1666051200000,"y":0},{"Date":"2022-10-19","Volume":0,"direction":"up","x":1666137600000,"y":0},{"Date":"2022-10-20","Volume":0,"direction":"up","x":1666224000000,"y":0},{"Date":"2022-10-21","Volume":0,"direction":"up","x":1666310400000,"y":0},{"Date":"2022-10-24","Volume":0,"direction":"up","x":1666569600000,"y":0},{"Date":"2022-10-25","Volume":0,"direction":"up","x":1666656000000,"y":0},{"Date":"2022-10-26","Volume":0,"direction":"up","x":1666742400000,"y":0},{"Date":"2022-10-27","Volume":0,"direction":"up","x":1666828800000,"y":0},{"Date":"2022-10-28","Volume":0,"direction":"up","x":1666915200000,"y":0},{"Date":"2022-10-31","Volume":0,"direction":"up","x":1667174400000,"y":0},{"Date":"2022-11-01","Volume":0,"direction":"up","x":1667260800000,"y":0},{"Date":"2022-11-02","Volume":0,"direction":"up","x":1667347200000,"y":0},{"Date":"2022-11-03","Volume":0,"direction":"up","x":1667433600000,"y":0},{"Date":"2022-11-04","Volume":0,"direction":"up","x":1667520000000,"y":0},{"Date":"2022-11-07","Volume":0,"direction":"up","x":1667779200000,"y":0},{"Date":"2022-11-08","Volume":0,"direction":"up","x":1667865600000,"y":0},{"Date":"2022-11-09","Volume":0,"direction":"up","x":1667952000000,"y":0},{"Date":"2022-11-10","Volume":0,"direction":"up","x":1668038400000,"y":0},{"Date":"2022-11-11","Volume":0,"direction":"up","x":1668124800000,"y":0},{"Date":"2022-11-14","Volume":0,"direction":"up","x":1668384000000,"y":0},{"Date":"2022-11-15","Volume":0,"direction":"up","x":1668470400000,"y":0},{"Date":"2022-11-16","Volume":4,"direction":"up","x":1668556800000,"y":4},{"Date":"2022-11-18","Volume":0,"direction":"up","x":1668729600000,"y":0},{"Date":"2022-11-21","Volume":0,"direction":"up","x":1668988800000,"y":0},{"Date":"2022-11-22","Volume":0,"direction":"up","x":1669075200000,"y":0},{"Date":"2022-11-23","Volume":0,"direction":"up","x":1669161600000,"y":0},{"Date":"2022-11-24","Volume":0,"direction":"up","x":1669248000000,"y":0},{"Date":"2022-11-25","Volume":0,"direction":"up","x":1669334400000,"y":0},{"Date":"2022-11-28","Volume":0,"direction":"up","x":1669593600000,"y":0},{"Date":"2022-11-29","Volume":0,"direction":"up","x":1669680000000,"y":0},{"Date":"2022-11-30","Volume":0,"direction":"up","x":1669766400000,"y":0},{"Date":"2022-12-01","Volume":0,"direction":"up","x":1669852800000,"y":0},{"Date":"2022-12-02","Volume":0,"direction":"up","x":1669939200000,"y":0},{"Date":"2022-12-05","Volume":0,"direction":"up","x":1670198400000,"y":0},{"Date":"2022-12-06","Volume":0,"direction":"up","x":1670284800000,"y":0},{"Date":"2022-12-07","Volume":0,"direction":"up","x":1670371200000,"y":0},{"Date":"2022-12-08","Volume":0,"direction":"up","x":1670457600000,"y":0},{"Date":"2022-12-09","Volume":0,"direction":"up","x":1670544000000,"y":0},{"Date":"2022-12-12","Volume":0,"direction":"up","x":1670803200000,"y":0},{"Date":"2022-12-13","Volume":0,"direction":"up","x":1670889600000,"y":0},{"Date":"2022-12-14","Volume":0,"direction":"up","x":1670976000000,"y":0},{"Date":"2022-12-15","Volume":0,"direction":"up","x":1671062400000,"y":0},{"Date":"2022-12-16","Volume":0,"direction":"up","x":1671148800000,"y":0},{"Date":"2022-12-19","Volume":65,"direction":"up","x":1671408000000,"y":65},{"Date":"2022-12-21","Volume":0,"direction":"up","x":1671580800000,"y":0},{"Date":"2022-12-22","Volume":0,"direction":"up","x":1671667200000,"y":0},{"Date":"2022-12-23","Volume":0,"direction":"up","x":1671753600000,"y":0},{"Date":"2022-12-27","Volume":0,"direction":"up","x":1672099200000,"y":0},{"Date":"2022-12-28","Volume":0,"direction":"up","x":1672185600000,"y":0},{"Date":"2022-12-29","Volume":0,"direction":"up","x":1672272000000,"y":0},{"Date":"2022-12-30","Volume":0,"direction":"up","x":1672358400000,"y":0},{"Date":"2023-01-02","Volume":0,"direction":"up","x":1672617600000,"y":0},{"Date":"2023-01-03","Volume":0,"direction":"up","x":1672704000000,"y":0},{"Date":"2023-01-04","Volume":0,"direction":"up","x":1672790400000,"y":0},{"Date":"2023-01-05","Volume":0,"direction":"up","x":1672876800000,"y":0},{"Date":"2023-01-06","Volume":0,"direction":"up","x":1672963200000,"y":0},{"Date":"2023-01-09","Volume":0,"direction":"up","x":1673222400000,"y":0},{"Date":"2023-01-10","Volume":0,"direction":"up","x":1673308800000,"y":0},{"Date":"2023-01-11","Volume":0,"direction":"up","x":1673395200000,"y":0},{"Date":"2023-01-12","Volume":0,"direction":"up","x":1673481600000,"y":0},{"Date":"2023-01-13","Volume":0,"direction":"up","x":1673568000000,"y":0},{"Date":"2023-01-16","Volume":0,"direction":"up","x":1673827200000,"y":0},{"Date":"2023-01-17","Volume":0,"direction":"up","x":1673913600000,"y":0},{"Date":"2023-01-18","Volume":0,"direction":"up","x":1674000000000,"y":0},{"Date":"2023-01-19","Volume":0,"direction":"up","x":1674086400000,"y":0},{"Date":"2023-01-20","Volume":0,"direction":"up","x":1674172800000,"y":0},{"Date":"2023-01-23","Volume":0,"direction":"up","x":1674432000000,"y":0},{"Date":"2023-01-24","Volume":0,"direction":"up","x":1674518400000,"y":0},{"Date":"2023-01-25","Volume":0,"direction":"up","x":1674604800000,"y":0},{"Date":"2023-01-26","Volume":0,"direction":"up","x":1674691200000,"y":0},{"Date":"2023-01-27","Volume":0,"direction":"up","x":1674777600000,"y":0},{"Date":"2023-01-30","Volume":118,"direction":"up","x":1675036800000,"y":118},{"Date":"2023-02-01","Volume":0,"direction":"up","x":1675209600000,"y":0},{"Date":"2023-02-02","Volume":0,"direction":"up","x":1675296000000,"y":0},{"Date":"2023-02-03","Volume":0,"direction":"up","x":1675382400000,"y":0},{"Date":"2023-02-06","Volume":0,"direction":"up","x":1675641600000,"y":0},{"Date":"2023-02-07","Volume":47,"direction":"up","x":1675728000000,"y":47},{"Date":"2023-02-09","Volume":0,"direction":"up","x":1675900800000,"y":0},{"Date":"2023-02-10","Volume":0,"direction":"up","x":1675987200000,"y":0},{"Date":"2023-02-13","Volume":0,"direction":"up","x":1676246400000,"y":0},{"Date":"2023-02-14","Volume":0,"direction":"up","x":1676332800000,"y":0},{"Date":"2023-02-15","Volume":0,"direction":"up","x":1676419200000,"y":0},{"Date":"2023-02-16","Volume":0,"direction":"up","x":1676505600000,"y":0},{"Date":"2023-02-17","Volume":0,"direction":"up","x":1676592000000,"y":0},{"Date":"2023-02-20","Volume":0,"direction":"up","x":1676851200000,"y":0},{"Date":"2023-02-21","Volume":0,"direction":"up","x":1676937600000,"y":0},{"Date":"2023-02-22","Volume":0,"direction":"up","x":1677024000000,"y":0},{"Date":"2023-02-23","Volume":0,"direction":"up","x":1677110400000,"y":0},{"Date":"2023-02-24","Volume":0,"direction":"up","x":1677196800000,"y":0},{"Date":"2023-02-27","Volume":0,"direction":"up","x":1677456000000,"y":0},{"Date":"2023-02-28","Volume":0,"direction":"up","x":1677542400000,"y":0},{"Date":"2023-03-01","Volume":0,"direction":"up","x":1677628800000,"y":0},{"Date":"2023-03-02","Volume":0,"direction":"up","x":1677715200000,"y":0},{"Date":"2023-03-03","Volume":0,"direction":"up","x":1677801600000,"y":0},{"Date":"2023-03-06","Volume":0,"direction":"up","x":1678060800000,"y":0},{"Date":"2023-03-07","Volume":0,"direction":"up","x":1678147200000,"y":0},{"Date":"2023-03-08","Volume":0,"direction":"up","x":1678233600000,"y":0},{"Date":"2023-03-09","Volume":0,"direction":"up","x":1678320000000,"y":0},{"Date":"2023-03-10","Volume":0,"direction":"up","x":1678406400000,"y":0},{"Date":"2023-03-13","Volume":0,"direction":"up","x":1678665600000,"y":0},{"Date":"2023-03-14","Volume":0,"direction":"up","x":1678752000000,"y":0},{"Date":"2023-03-15","Volume":0,"direction":"up","x":1678838400000,"y":0},{"Date":"2023-03-16","Volume":0,"direction":"up","x":1678924800000,"y":0},{"Date":"2023-03-17","Volume":30,"direction":"up","x":1679011200000,"y":30},{"Date":"2023-03-21","Volume":0,"direction":"up","x":1679356800000,"y":0},{"Date":"2023-03-22","Volume":0,"direction":"up","x":1679443200000,"y":0},{"Date":"2023-03-23","Volume":0,"direction":"up","x":1679529600000,"y":0},{"Date":"2023-03-24","Volume":0,"direction":"up","x":1679616000000,"y":0},{"Date":"2023-03-27","Volume":0,"direction":"up","x":1679875200000,"y":0},{"Date":"2023-03-28","Volume":0,"direction":"up","x":1679961600000,"y":0},{"Date":"2023-03-29","Volume":0,"direction":"up","x":1680048000000,"y":0},{"Date":"2023-03-30","Volume":0,"direction":"up","x":1680134400000,"y":0},{"Date":"2023-03-31","Volume":0,"direction":"up","x":1680220800000,"y":0},{"Date":"2023-04-03","Volume":0,"direction":"up","x":1680480000000,"y":0},{"Date":"2023-04-04","Volume":0,"direction":"up","x":1680566400000,"y":0},{"Date":"2023-04-05","Volume":0,"direction":"up","x":1680652800000,"y":0},{"Date":"2023-04-06","Volume":0,"direction":"up","x":1680739200000,"y":0},{"Date":"2023-04-11","Volume":0,"direction":"up","x":1681171200000,"y":0},{"Date":"2023-04-12","Volume":0,"direction":"up","x":1681257600000,"y":0},{"Date":"2023-04-13","Volume":0,"direction":"up","x":1681344000000,"y":0},{"Date":"2023-04-14","Volume":0,"direction":"up","x":1681430400000,"y":0},{"Date":"2023-04-17","Volume":0,"direction":"up","x":1681689600000,"y":0},{"Date":"2023-04-18","Volume":0,"direction":"up","x":1681776000000,"y":0},{"Date":"2023-04-19","Volume":60,"direction":"up","x":1681862400000,"y":60},{"Date":"2023-04-21","Volume":0,"direction":"up","x":1682035200000,"y":0},{"Date":"2023-04-24","Volume":0,"direction":"up","x":1682294400000,"y":0},{"Date":"2023-04-25","Volume":0,"direction":"up","x":1682380800000,"y":0},{"Date":"2023-04-26","Volume":0,"direction":"up","x":1682467200000,"y":0},{"Date":"2023-04-27","Volume":0,"direction":"up","x":1682553600000,"y":0},{"Date":"2023-04-28","Volume":0,"direction":"up","x":1682640000000,"y":0},{"Date":"2023-05-02","Volume":0,"direction":"up","x":1682985600000,"y":0},{"Date":"2023-05-03","Volume":0,"direction":"up","x":1683072000000,"y":0},{"Date":"2023-05-04","Volume":0,"direction":"up","x":1683158400000,"y":0},{"Date":"2023-05-05","Volume":0,"direction":"up","x":1683244800000,"y":0},{"Date":"2023-05-08","Volume":0,"direction":"up","x":1683504000000,"y":0},{"Date":"2023-05-09","Volume":0,"direction":"up","x":1683590400000,"y":0},{"Date":"2023-05-10","Volume":0,"direction":"up","x":1683676800000,"y":0},{"Date":"2023-05-11","Volume":0,"direction":"up","x":1683763200000,"y":0},{"Date":"2023-05-12","Volume":0,"direction":"up","x":1683849600000,"y":0},{"Date":"2023-05-15","Volume":0,"direction":"up","x":1684108800000,"y":0},{"Date":"2023-05-16","Volume":0,"direction":"up","x":1684195200000,"y":0},{"Date":"2023-05-17","Volume":0,"direction":"up","x":1684281600000,"y":0},{"Date":"2023-05-18","Volume":0,"direction":"up","x":1684368000000,"y":0},{"Date":"2023-05-19","Volume":0,"direction":"up","x":1684454400000,"y":0},{"Date":"2023-05-22","Volume":0,"direction":"up","x":1684713600000,"y":0},{"Date":"2023-05-23","Volume":0,"direction":"up","x":1684800000000,"y":0},{"Date":"2023-05-24","Volume":0,"direction":"up","x":1684886400000,"y":0},{"Date":"2023-05-25","Volume":0,"direction":"up","x":1684972800000,"y":0},{"Date":"2023-05-26","Volume":0,"direction":"up","x":1685059200000,"y":0},{"Date":"2023-05-29","Volume":0,"direction":"up","x":1685318400000,"y":0},{"Date":"2023-05-30","Volume":0,"direction":"up","x":1685404800000,"y":0},{"Date":"2023-05-31","Volume":0,"direction":"up","x":1685491200000,"y":0},{"Date":"2023-06-01","Volume":0,"direction":"up","x":1685577600000,"y":0},{"Date":"2023-06-02","Volume":0,"direction":"up","x":1685664000000,"y":0},{"Date":"2023-06-05","Volume":0,"direction":"up","x":1685923200000,"y":0},{"Date":"2023-06-06","Volume":0,"direction":"up","x":1686009600000,"y":0},{"Date":"2023-06-07","Volume":0,"direction":"up","x":1686096000000,"y":0},{"Date":"2023-06-08","Volume":0,"direction":"up","x":1686182400000,"y":0},{"Date":"2023-06-09","Volume":0,"direction":"up","x":1686268800000,"y":0},{"Date":"2023-06-12","Volume":0,"direction":"up","x":1686528000000,"y":0},{"Date":"2023-06-13","Volume":0,"direction":"up","x":1686614400000,"y":0},{"Date":"2023-06-14","Volume":0,"direction":"up","x":1686700800000,"y":0},{"Date":"2023-06-15","Volume":0,"direction":"up","x":1686787200000,"y":0},{"Date":"2023-06-16","Volume":0,"direction":"up","x":1686873600000,"y":0},{"Date":"2023-06-19","Volume":0,"direction":"up","x":1687132800000,"y":0},{"Date":"2023-06-20","Volume":4,"direction":"up","x":1687219200000,"y":4},{"Date":"2023-06-22","Volume":0,"direction":"up","x":1687392000000,"y":0},{"Date":"2023-06-23","Volume":0,"direction":"up","x":1687478400000,"y":0},{"Date":"2023-06-26","Volume":0,"direction":"up","x":1687737600000,"y":0},{"Date":"2023-06-27","Volume":0,"direction":"up","x":1687824000000,"y":0},{"Date":"2023-06-28","Volume":0,"direction":"up","x":1687910400000,"y":0},{"Date":"2023-06-29","Volume":0,"direction":"up","x":1687996800000,"y":0},{"Date":"2023-06-30","Volume":0,"direction":"up","x":1688083200000,"y":0},{"Date":"2023-07-03","Volume":0,"direction":"up","x":1688342400000,"y":0},{"Date":"2023-07-04","Volume":0,"direction":"up","x":1688428800000,"y":0},{"Date":"2023-07-05","Volume":0,"direction":"up","x":1688515200000,"y":0},{"Date":"2023-07-06","Volume":0,"direction":"up","x":1688601600000,"y":0},{"Date":"2023-07-07","Volume":0,"direction":"up","x":1688688000000,"y":0},{"Date":"2023-07-10","Volume":0,"direction":"up","x":1688947200000,"y":0},{"Date":"2023-07-11","Volume":0,"direction":"up","x":1689033600000,"y":0},{"Date":"2023-07-12","Volume":0,"direction":"up","x":1689120000000,"y":0},{"Date":"2023-07-13","Volume":0,"direction":"up","x":1689206400000,"y":0},{"Date":"2023-07-14","Volume":0,"direction":"up","x":1689292800000,"y":0},{"Date":"2023-07-17","Volume":0,"direction":"up","x":1689552000000,"y":0},{"Date":"2023-07-18","Volume":0,"direction":"up","x":1689638400000,"y":0},{"Date":"2023-07-19","Volume":0,"direction":"up","x":1689724800000,"y":0},{"Date":"2023-07-20","Volume":0,"direction":"up","x":1689811200000,"y":0},{"Date":"2023-07-21","Volume":0,"direction":"up","x":1689897600000,"y":0},{"Date":"2023-07-24","Volume":0,"direction":"up","x":1690156800000,"y":0},{"Date":"2023-07-25","Volume":0,"direction":"up","x":1690243200000,"y":0},{"Date":"2023-07-26","Volume":0,"direction":"up","x":1690329600000,"y":0},{"Date":"2023-07-27","Volume":0,"direction":"up","x":1690416000000,"y":0},{"Date":"2023-07-28","Volume":300,"direction":"up","x":1690502400000,"y":300},{"Date":"2023-08-01","Volume":0,"direction":"up","x":1690848000000,"y":0},{"Date":"2023-08-02","Volume":0,"direction":"up","x":1690934400000,"y":0},{"Date":"2023-08-03","Volume":0,"direction":"up","x":1691020800000,"y":0},{"Date":"2023-08-04","Volume":0,"direction":"up","x":1691107200000,"y":0},{"Date":"2023-08-07","Volume":0,"direction":"up","x":1691366400000,"y":0},{"Date":"2023-08-08","Volume":0,"direction":"up","x":1691452800000,"y":0},{"Date":"2023-08-09","Volume":0,"direction":"up","x":1691539200000,"y":0},{"Date":"2023-08-10","Volume":75,"direction":"up","x":1691625600000,"y":75},{"Date":"2023-08-11","Volume":300,"direction":"up","x":1691712000000,"y":300},{"Date":"2023-08-16","Volume":0,"direction":"up","x":1692144000000,"y":0},{"Date":"2023-08-17","Volume":0,"direction":"up","x":1692230400000,"y":0},{"Date":"2023-08-18","Volume":0,"direction":"up","x":1692316800000,"y":0},{"Date":"2023-08-21","Volume":0,"direction":"up","x":1692576000000,"y":0},{"Date":"2023-08-22","Volume":0,"direction":"up","x":1692662400000,"y":0},{"Date":"2023-08-23","Volume":0,"direction":"up","x":1692748800000,"y":0},{"Date":"2023-08-24","Volume":0,"direction":"up","x":1692835200000,"y":0},{"Date":"2023-08-25","Volume":0,"direction":"up","x":1692921600000,"y":0},{"Date":"2023-08-28","Volume":0,"direction":"up","x":1693180800000,"y":0},{"Date":"2023-08-29","Volume":0,"direction":"up","x":1693267200000,"y":0},{"Date":"2023-08-30","Volume":0,"direction":"up","x":1693353600000,"y":0},{"Date":"2023-08-31","Volume":0,"direction":"up","x":1693440000000,"y":0},{"Date":"2023-09-01","Volume":0,"direction":"up","x":1693526400000,"y":0},{"Date":"2023-09-04","Volume":0,"direction":"up","x":1693785600000,"y":0},{"Date":"2023-09-05","Volume":172,"direction":"up","x":1693872000000,"y":172},{"Date":"2023-09-07","Volume":0,"direction":"up","x":1694044800000,"y":0},{"Date":"2023-09-15","Volume":450,"direction":"up","x":1694736000000,"y":450},{"Date":"2023-10-25","Volume":6000,"direction":"up","x":1698192000000,"y":6000},{"Date":"2024-01-17","Volume":1400,"direction":"up","x":1705449600000,"y":1400},{"Date":"2024-01-26","Volume":1400,"direction":"up","x":1706227200000,"y":1400},{"Date":"2024-02-16","Volume":1400,"direction":"up","x":1708041600000,"y":1400}],"type":"column","name":"Volume","yAxis":1,"showInLegend":false},{"group":null,"data":[{"Date":"2017-10-30","Volume":0,"direction":null,"x":1509321600000,"y":0}],"type":"column","name":"Volume","yAxis":1,"showInLegend":false}],"colors":["red","darkgreen"]},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadCSV":"Download CSV","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","downloadXLS":"Download XLS","drillUpText":"◁ Back to {series.name}","exitFullscreen":"Exit from full screen","exportData":{"annotationHeader":"Annotations","categoryDatetimeHeader":"DateTime","categoryHeader":"Category"},"hideData":"Hide data table","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbolMagnitude":1000,"numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"shortWeekdays":["Sat","Sun","Mon","Tue","Wed","Thu","Fri"],"thousandsSep":" ","viewData":"View data table","viewFullscreen":"View in full screen","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"stock","fonts":"Erica+One","debug":false},"evals":[],"jsHooks":[]}</script>
```

<!-- <div align="center">  -->

<!-- <img src="https://raw.githubusercontent.com/Fredysessie/Draft_gif/main/figures/4DDD_plot.gif" width="100%" height="480" align="center"/> -->

<!-- </div>  -->



```r
ov_plot  <- EN_Overview_plot(c("NL0010614533", "QS0011211206", "QS0011095914", "QS0011146899"), up.col = "blue")

ov_plot
```

```{=html}
<div class="tabwid"><style>.cl-179a244e{}.cl-176bf2e0{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-178bf586{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-178bf59a{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-178c1f0c{width:0.837in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-178c1f16{width:0.965in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-178c1f20{width:1.985in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-178c1f21{width:0.837in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-178c1f2a{width:0.965in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-178c1f2b{width:1.985in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-178c1f34{width:0.837in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-178c1f35{width:0.965in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-178c1f3e{width:1.985in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-179a244e'><caption style="display:table-caption;margin:0pt;text-align:center;border-bottom: 0.00pt solid transparent;border-top: 0.00pt solid transparent;border-left: 0.00pt solid transparent;border-right: 0.00pt solid transparent;padding-top:3pt;padding-bottom:3pt;padding-left:3pt;padding-right:3pt;line-height: 1;background-color:transparent;"><span>Overview of price evolution and last price</span></caption><thead><tr style="overflow-wrap:break-word;"><th class="cl-178c1f0c"><p class="cl-178bf586"><span class="cl-176bf2e0">Ticker</span></p></th><th class="cl-178c1f16"><p class="cl-178bf59a"><span class="cl-176bf2e0">Last Price</span></p></th><th class="cl-178c1f20"><p class="cl-178bf59a"><span class="cl-176bf2e0">Price evolution</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-178c1f21"><p class="cl-178bf586"><span class="cl-176bf2e0">AEX2S</span></p></td><td class="cl-178c1f2a"><p class="cl-178bf59a"><span class="cl-176bf2e0">4.526</span></p></td><td class="cl-178c1f2b"><p class="cl-178bf59a"><img style="vertical-align:baseline;width:122px;height:65px;" src="data:image/png;base64,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" /></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-178c1f21"><p class="cl-178bf586"><span class="cl-176bf2e0">AEXEN</span></p></td><td class="cl-178c1f2a"><p class="cl-178bf59a"><span class="cl-176bf2e0">4,965.720</span></p></td><td class="cl-178c1f2b"><p class="cl-178bf59a"><img style="vertical-align:baseline;width:122px;height:65px;" src="data:image/png;base64,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" /></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-178c1f21"><p class="cl-178bf586"><span class="cl-176bf2e0">AEXSH</span></p></td><td class="cl-178c1f2a"><p class="cl-178bf59a"><span class="cl-176bf2e0">113.487</span></p></td><td class="cl-178c1f2b"><p class="cl-178bf59a"><img style="vertical-align:baseline;width:122px;height:65px;" src="data:image/png;base64,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" /></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-178c1f34"><p class="cl-178bf586"><span class="cl-176bf2e0">ATAWN</span></p></td><td class="cl-178c1f35"><p class="cl-178bf59a"><span class="cl-176bf2e0">3,139.980</span></p></td><td class="cl-178c1f3e"><p class="cl-178bf59a"><img style="vertical-align:baseline;width:122px;height:65px;" src="data:image/png;base64,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" /></p></td></tr></tbody></table></div>
```


<!-- <div align="center">  -->
<!-- <img src="https://i.ibb.co/Zxj9w9c/Rplot.png" width="90%" height="480" align="center"/> -->
<!-- </div> -->


## **EN_plot()** function

This  **EN_plot()** function is distinct from the **EN_Overview_plot()** function, although they share similar parameters (*ticker*, *from*, *to*, *stock_type*, *escape*, *up.col*, *down.col*)
Note: Important to note that when using *EN_plot()*,only historical data from the past two years is available. This differs from **EN_Overview_plot()**, where data is available from the inception year of the company's listing.


### *Example 8* : Get historical performance


```r
#It is also possible to plot stock data chart for more than one ticker
#Let's plot '3D SYSTEMS CORP' chart

chart1 <- EN_plot("AAX")

chart1
```

```{=html}
<div class="highchart html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-4bcad412924c674d0950" style="width:100%;height:576px;"></div>
<script type="application/json" data-for="htmlwidget-4bcad412924c674d0950">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"AAX chart : from 2023-02-22 to 2024-02-21","style":{"fontWeight":"bold","fontSize":"20px"},"align":"center"},"yAxis":{"title":{"text":null}},"credits":{"enabled":false},"exporting":{"enabled":true,"filename":"AAX chart : from 2023-02-22 to 2024-02-21"},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"series":[{"data":[[1677024000000,1037.6,1037.7,1028.16,1035.07],[1677110400000,1035.22,1042.66,1034.46,1034.46],[1677196800000,1034.47,1040.87,1023.2,1023.29],[1677456000000,1023.29,1041.68,1023.29,1037.52],[1677542400000,1037.51,1039.66,1030.63,1032.91],[1677628800000,1032.89,1043.13,1029.42,1030.33],[1677715200000,1030.35,1037.48,1022.45,1037.47],[1677801600000,1037.47,1045.92,1037.47,1044.71],[1678060800000,1044.68,1048.44,1040.95,1044.02],[1678147200000,1044.01,1044.01,1031.23,1031.97],[1678233600000,1032,1035.82,1028.24,1034.41],[1678320000000,1034.4,1035.44,1023.73,1032.03],[1678406400000,1031.95,1031.95,1011.14,1018.99],[1678665600000,1018.97,1018.97,985.16,995.55],[1678752000000,995.54,1012.22,991.53,1009.77],[1678838400000,1009.55,1009.55,976.84,978.69],[1678924800000,978.64,995.24,970.96,992.74],[1679011200000,992.75,1008.52,981.02,986.63],[1679270400000,986.6,999.54,969.53,995.13],[1679356800000,995.14,1013.33,995.14,1004.15],[1679443200000,1004.18,1014.49,1003.28,1010.61],[1679529600000,1010.51,1020.16,1006.62,1017.66],[1679616000000,1017.69,1017.69,994.76,999.82],[1679875200000,999.82,1009.62,999.37,1002.07],[1679961600000,1002.06,1011.36,997.38,1000.84],[1680048000000,1000.84,1019.48,1000.84,1019.47],[1680134400000,1019.52,1030.47,1019.52,1029.14],[1680220800000,1029.18,1035.94,1026.89,1034.13],[1680480000000,1034.14,1039.54,1033.34,1035.3],[1680566400000,1035.29,1043.37,1033.29,1033.63],[1680652800000,1033.64,1033.64,1022.76,1026.19],[1680739200000,1026.21,1032.15,1026.21,1030.7],[1681171200000,1030.75,1038.65,1030.75,1035.25],[1681257600000,1035.24,1041.05,1025.01,1026.76],[1681344000000,1026.76,1030.71,1024.44,1029.69],[1681430400000,1029.5,1036.19,1028.11,1033.05],[1681689600000,1033.06,1035.99,1028.84,1028.97],[1681776000000,1028.95,1038.79,1028.95,1034.97],[1681862400000,1034.97,1035.46,1025.02,1029.16],[1681948800000,1029.15,1031.08,1023.05,1028.31],[1682035200000,1028.33,1029.71,1023.59,1028.71],[1682294400000,1028.71,1030.21,1022.04,1026.06],[1682380800000,1026.05,1026.05,1015.27,1016.85],[1682467200000,1016.84,1016.84,1006.63,1012.67],[1682553600000,1012.66,1015.5,1006.68,1015.38],[1682640000000,1015.37,1025.53,1010.12,1024.66],[1682985600000,1024.68,1027.26,1007.4,1008.02],[1683072000000,1007.99,1012.46,1005.72,1007.47],[1683158400000,1007.46,1008.55,998.03,1004.72],[1683244800000,1004.74,1018.04,1004.74,1017.88],[1683504000000,1017.86,1024.04,1017.86,1021.17],[1683590400000,1021.17,1021.17,1007.59,1011.28],[1683676800000,1011.3,1017.2,1007.91,1013.83],[1683763200000,1013.86,1021.98,1011.45,1016.59],[1683849600000,1016.58,1022.8,1016.58,1018.84],[1684108800000,1018.94,1026.95,1018.94,1025.56],[1684195200000,1025.55,1029.24,1022.91,1025.05],[1684281600000,1025.06,1029.09,1021.85,1028.26],[1684368000000,1028.28,1039.47,1028.28,1038.36],[1684454400000,1038.35,1047.17,1038.35,1040.39],[1684713600000,1040.39,1042.4,1038.02,1040.98],[1684800000000,1041.01,1042.14,1037.36,1037.36],[1684886400000,1037.36,1037.36,1016.42,1020.95],[1684972800000,1021.36,1028.33,1020.51,1022.27],[1685059200000,1022.28,1042.22,1022.28,1039.13],[1685318400000,1039.12,1041.15,1033.75,1034.18],[1685404800000,1034.18,1037.78,1023.13,1024.51],[1685491200000,1024.52,1024.52,1010.86,1011.59],[1685577600000,1012.16,1023.26,1012.16,1021.66],[1685664000000,1021.64,1036.08,1021.39,1035.09],[1685923200000,1035.11,1039.38,1032.47,1032.59],[1686009600000,1032.59,1032.59,1023.05,1031.76],[1686096000000,1031.77,1033.95,1027.53,1031.36],[1686182400000,1031.36,1031.36,1025.09,1030.13],[1686268800000,1030.13,1033.51,1024.78,1028.93],[1686528000000,1028.94,1034.61,1027.95,1029.93],[1686614400000,1029.9,1042.43,1029.9,1040.8],[1686700800000,1040.81,1046.84,1037.96,1045.33],[1686787200000,1045.35,1048.93,1038.33,1046.54],[1686873600000,1046.52,1050.67,1045.46,1045.46],[1687132800000,1045.46,1045.46,1038.87,1039.76],[1687219200000,1039.73,1039.73,1027.99,1028.69],[1687305600000,1028.69,1028.69,1021.24,1022.59],[1687392000000,1022.57,1022.57,1011.25,1022.11],[1687478400000,1021.94,1022.34,1013.36,1016.55],[1687737600000,1016.37,1021.41,1010.1,1017.77],[1687824000000,1017.77,1028.32,1016.71,1023.36],[1687910400000,1023.36,1034.78,1023.36,1033.34],[1687996800000,1033.34,1036.45,1031.4,1034.88],[1688083200000,1034.91,1043.23,1029.9,1040.77],[1688342400000,1040.79,1050.74,1040.79,1045.75],[1688428800000,1045.74,1051.58,1045.62,1049.17],[1688515200000,1049.22,1049.22,1035.74,1036.73],[1688601600000,1036.6,1036.6,1010.9,1012.97],[1688688000000,1012.96,1019,1006.36,1016.02],[1688947200000,1016.02,1021.48,1010.29,1019.39],[1689033600000,1019.5,1025.18,1017.15,1020.76],[1689120000000,1020.74,1041.58,1020.74,1038.44],[1689206400000,1038.43,1051.04,1038.43,1048],[1689292800000,1047.99,1056.81,1047.52,1053.88],[1689552000000,1053.89,1053.89,1042.06,1044.35],[1689638400000,1044.34,1047.72,1039.73,1045.93],[1689724800000,1045.95,1052.72,1045.75,1046.7],[1689811200000,1046.69,1046.69,1036.26,1038.07],[1689897600000,1038.1,1043.09,1035.31,1042.92],[1690156800000,1042.89,1043.41,1038.12,1041.43],[1690243200000,1041.43,1053.13,1041.43,1051.44],[1690329600000,1051.43,1052.56,1038.87,1045.89],[1690416000000,1045.87,1069.01,1045.87,1067.85],[1690502400000,1067.85,1072.08,1061.89,1071.01],[1690761600000,1071.03,1071.03,1062.76,1066.58],[1690848000000,1066.56,1066.56,1057,1058.54],[1690934400000,1058.54,1058.54,1040.4,1042.62],[1691020800000,1042.62,1042.62,1029.48,1037.64],[1691107200000,1037.64,1042.15,1033.12,1041.19],[1691366400000,1041.21,1041.72,1034.86,1039.25],[1691452800000,1039.25,1039.25,1027.25,1031.69],[1691539200000,1031.68,1043.18,1031.68,1036.04],[1691625600000,1036.05,1049.93,1036.05,1046.04],[1691712000000,1046.06,1046.06,1026.94,1029.36],[1691971200000,1029.43,1030.92,1023.27,1030.06],[1692057600000,1030.05,1033.22,1018.29,1021.46],[1692144000000,1021.41,1022.53,1015.23,1018.65],[1692230400000,1018.67,1020.16,1000.53,1000.77],[1692316800000,1000.78,1000.78,989.7,996.21],[1692576000000,996.2,1003.71,994.19,994.7],[1692662400000,994.62,1009.87,994.62,1001.35],[1692748800000,1001.38,1007.47,1000.61,1005.56],[1692835200000,1005.55,1016.74,994.75,995.11],[1692921600000,995.14,1000.59,991.21,993.24],[1693180800000,993.21,1007.14,993.21,1005.6],[1693267200000,1005.6,1012.83,1005.6,1011.76],[1693353600000,1011.75,1013.33,1005.77,1009.57],[1693440000000,1009.49,1016.57,1008.34,1008.34],[1693526400000,1008.35,1017.49,1008.35,1012.08],[1693785600000,1012.14,1023.67,1012.14,1013.13],[1693872000000,1013.13,1015.16,1004.51,1012.75],[1693958400000,1012.73,1016.15,1005.43,1011.54],[1694044800000,1011.53,1011.53,998.31,1000.6],[1694131200000,1000.59,1004.12,991.12,999.52],[1694390400000,999.49,1007.6,999.48,1000.01],[1694476800000,1000.02,1003.78,994.22,997.65],[1694563200000,997.63,997.63,989.83,994.06],[1694649600000,994.06,1008.63,993.58,1006.75],[1694736000000,1006.76,1013.24,1001.27,1001.91],[1694995200000,1001.91,1001.91,992.88,994.29],[1695081600000,994.19,1000.26,991.88,994.17],[1695168000000,994.19,1001.87,993.46,998.55],[1695254400000,998.59,998.59,984.93,988.83],[1695340800000,988.7,991.03,983.67,988.52],[1695600000000,988.57,988.95,976.35,983.44],[1695686400000,983.42,983.42,971.98,975.6],[1695772800000,975.61,981.96,974.2,977.02],[1695859200000,977.03,982.55,968.81,982.49],[1695945600000,982.48,996.23,982.48,986.13],[1696204800000,986.13,990.57,975.63,979.29],[1696291200000,978.26,981.02,970.22,970.51],[1696377600000,970.58,977.83,964.38,971.75],[1696464000000,971.74,977.9,970.7,971.76],[1696550400000,971.75,980.23,969.79,980.21],[1696809600000,980.21,985.31,976.58,979.66],[1696896000000,979.65,998.74,979.65,996.79],[1696982400000,996.77,1001.16,993.86,996.56],[1697068800000,996.59,1007.31,996.59,1002.49],[1697155200000,1002.58,1003.62,989.62,990.27],[1697414400000,990.92,995.53,987.44,992.03],[1697500800000,992.02,996.08,984.15,993.4],[1697587200000,993.4,994.18,979.64,981.55],[1697673600000,981.52,984.35,976.51,978.65],[1697760000000,978.61,978.61,963.59,963.59],[1698019200000,963.59,967.8,956.88,966.98],[1698105600000,966.95,974.57,962.59,971.69],[1698192000000,971.71,974.42,967.28,971.56],[1698278400000,971.26,971.98,961.52,968.08],[1698364800000,968.07,973.62,961.49,962.7],[1698624000000,962.72,970.31,960.79,961.79],[1698710400000,961.79,972.76,961.47,968.28],[1698796800000,968.29,977.95,965.76,974.18],[1698883200000,974.14,999.06,974.14,995.68],[1698969600000,995.67,1002.34,995.67,998.58],[1699228800000,998.56,1002.24,994.85,995.28],[1699315200000,995.3,997.42,991.78,995.38],[1699401600000,995.35,998.06,988.67,994.48],[1699488000000,994.39,1011.05,988.93,1010.39],[1699574400000,1010.42,1010.42,1000.26,1005.47],[1699833600000,1005.47,1015.77,1005.47,1015.77],[1699920000000,1015.76,1028.76,1013.27,1025.07],[1700006400000,1025.05,1034.45,1025.05,1031.81],[1700092800000,1031.82,1031.82,1019.59,1019.68],[1700179200000,1019.74,1027.22,1017.75,1026.2],[1700438400000,1026.17,1027.67,1024.33,1026.98],[1700524800000,1026.97,1027.87,1022.47,1024.01],[1700611200000,1024.03,1028.54,1023.56,1027.1],[1700697600000,1027.07,1029.43,1025.65,1029.02],[1700784000000,1029.02,1034.48,1027.84,1033.97],[1701043200000,1033.97,1034.43,1030.2,1031.01],[1701129600000,1030.99,1030.99,1024.38,1027.29],[1701216000000,1027.29,1032.63,1024.93,1029.81],[1701302400000,1029.83,1036.81,1027.32,1032.69],[1701388800000,1032.72,1042.56,1032.72,1041.56],[1701648000000,1041.55,1044.04,1038.5,1039.57],[1701734400000,1039.49,1046.21,1036.03,1044.78],[1701820800000,1044.79,1051.43,1044.79,1048.16],[1701907200000,1048.12,1048.87,1043.96,1048.22],[1701993600000,1048.22,1057.73,1048.22,1055.47],[1702252800000,1055.47,1062.87,1053.43,1061.81],[1702339200000,1061.77,1068.06,1060.55,1062.24],[1702425600000,1062.24,1068.75,1062.24,1063.51],[1702512000000,1063.65,1082.29,1063.65,1074.46],[1702598400000,1074.46,1084,1074.46,1079.31],[1702857600000,1079.21,1079.21,1070.21,1071.99],[1702944000000,1071.97,1078.13,1071.97,1076.75],[1703030400000,1076.77,1081.52,1074,1079.61],[1703116800000,1079.6,1079.6,1069.97,1074.39],[1703203200000,1074.39,1074.66,1064.23,1068.63],[1703635200000,1068.61,1074.55,1068.61,1071.67],[1703721600000,1071.71,1075.46,1070.34,1071.94],[1703808000000,1071.87,1077.01,1070.49,1071.54],[1704153600000,1071.56,1078.71,1061.68,1065.91],[1704240000000,1065.9,1066.58,1052.7,1057.38],[1704326400000,1057.35,1060.52,1053.33,1059.06],[1704412800000,1059.08,1059.08,1045.73,1055.49],[1704672000000,1055.26,1058.32,1048.46,1057.16],[1704758400000,1057.17,1058.64,1051.28,1055.52],[1704844800000,1055.5,1057.34,1050.22,1051.82],[1704931200000,1051.84,1062.22,1051.29,1051.74],[1705017600000,1051.73,1065.51,1051.73,1060.7],[1705276800000,1061.49,1064.87,1057.58,1057.83],[1705363200000,1057.79,1057.79,1049.05,1055.88],[1705449600000,1055.88,1055.88,1038.9,1045.41],[1705536000000,1045.39,1056.33,1045.39,1056.15],[1705622400000,1056.13,1063.36,1056.13,1057.78],[1705881600000,1057.95,1070.42,1057.95,1068.3],[1705968000000,1068.28,1072.7,1064.61,1070.43],[1706054400000,1070.4,1101.15,1070.4,1100.24],[1706140800000,1100.25,1113.63,1100.25,1112.98],[1706227200000,1112.99,1116.88,1105.71,1115.25],[1706486400000,1115.27,1119.31,1115.27,1118.74],[1706572800000,1118.71,1123.74,1117.49,1119.81],[1706659200000,1119.61,1122.24,1116.31,1116.31],[1706745600000,1118.01,1125.69,1116.03,1121.56],[1706832000000,1121.53,1130.46,1121.53,1123.31],[1707091200000,1123.34,1127.15,1122.47,1126.01],[1707177600000,1125.98,1136.83,1125.98,1136.2],[1707264000000,1136.18,1140.28,1134.54,1137.24],[1707350400000,1137.21,1153.56,1137.21,1152.04],[1707436800000,1152.04,1161.24,1152.04,1161.12],[1707696000000,1161.1,1166.48,1161.03,1166.48],[1707782400000,1166.48,1166.48,1140.76,1148.18],[1707868800000,1148.19,1150.21,1144.57,1147.28],[1707955200000,1147.27,1155.71,1147.27,1153.06],[1708041600000,1153.15,1164.47,1153.15,1164.46],[1708300800000,1164.41,1164.41,1156.9,1159.98],[1708387200000,1160.04,1160.04,1145.76,1147.89],[1708473600000,1147.89,1149.56,1141.96,1146.53]],"name":"Open","type":"candlestick"}],"colors":["red","darkgreen"]},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadCSV":"Download CSV","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","downloadXLS":"Download XLS","drillUpText":"◁ Back to {series.name}","exitFullscreen":"Exit from full screen","exportData":{"annotationHeader":"Annotations","categoryDatetimeHeader":"DateTime","categoryHeader":"Category"},"hideData":"Hide data table","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbolMagnitude":1000,"numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"shortWeekdays":["Sat","Sun","Mon","Tue","Wed","Thu","Fri"],"thousandsSep":" ","viewData":"View data table","viewFullscreen":"View in full screen","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"stock","fonts":[],"debug":false},"evals":[],"jsHooks":[]}</script>

# You can change up and down colors
# Etf AAPL
# EN_plot("aapl", stock_type = 'E', up.col = "blue", down.col = "pink")
```


<!-- <div align="center">  -->
<!-- <img src="https://raw.githubusercontent.com/Fredysessie/Draft_gif/main/figures/AAX_plot.gif" width="100%" height="480"/> -->
<!-- </div>  -->



```r
# It is also possible to plot stock data chart for more than one ticker
# Let's plot some equities chart

chart2 <- EN_plot(c("AAX", "QS0011016480", "AEX2S", "ADIDAS", "ADOBE", "ALFEN BEHEER", "1GOOGL"))

chart2
```

```{=html}
<div class="highchart html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-ffdd0957cf78e389d25f" style="width:100%;height:576px;"></div>
<script type="application/json" data-for="htmlwidget-ffdd0957cf78e389d25f">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"Tickers (1GOOGL, 4ALFEN, 1ADS, AEX2S, NLBM, AAX, 1ADBE) line chart from 2023-02-22 to 2024-02-21"},"yAxis":{"title":{"text":null}},"credits":{"enabled":false},"exporting":{"enabled":true,"filename":"Tickers line chart from 2023-02-22 to 2024-02-21"},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"series":[{"name":"1ADBE","data":[{"Date":"2023-11-10","Close":550,"Ticker":"1ADBE","x":1699574400000,"y":550},{"Date":"2023-11-13","Close":574,"Ticker":"1ADBE","x":1699833600000,"y":574},{"Date":"2023-11-14","Close":574,"Ticker":"1ADBE","x":1699920000000,"y":574},{"Date":"2023-11-15","Close":562.2,"Ticker":"1ADBE","x":1700006400000,"y":562.2},{"Date":"2023-11-16","Close":562.2,"Ticker":"1ADBE","x":1700092800000,"y":562.2},{"Date":"2023-11-17","Close":551,"Ticker":"1ADBE","x":1700179200000,"y":551},{"Date":"2023-11-20","Close":551,"Ticker":"1ADBE","x":1700438400000,"y":551},{"Date":"2023-11-21","Close":551,"Ticker":"1ADBE","x":1700524800000,"y":551},{"Date":"2023-11-22","Close":569.4,"Ticker":"1ADBE","x":1700611200000,"y":569.4},{"Date":"2023-11-23","Close":566.2,"Ticker":"1ADBE","x":1700697600000,"y":566.2},{"Date":"2023-11-24","Close":566.2,"Ticker":"1ADBE","x":1700784000000,"y":566.2},{"Date":"2023-11-27","Close":567,"Ticker":"1ADBE","x":1701043200000,"y":567},{"Date":"2023-11-28","Close":567,"Ticker":"1ADBE","x":1701129600000,"y":567},{"Date":"2023-11-29","Close":570.8,"Ticker":"1ADBE","x":1701216000000,"y":570.8},{"Date":"2023-11-30","Close":556,"Ticker":"1ADBE","x":1701302400000,"y":556},{"Date":"2023-12-01","Close":558,"Ticker":"1ADBE","x":1701388800000,"y":558},{"Date":"2023-12-04","Close":553.8,"Ticker":"1ADBE","x":1701648000000,"y":553.8},{"Date":"2023-12-05","Close":550.6,"Ticker":"1ADBE","x":1701734400000,"y":550.6},{"Date":"2023-12-06","Close":555.2,"Ticker":"1ADBE","x":1701820800000,"y":555.2},{"Date":"2023-12-07","Close":558.6,"Ticker":"1ADBE","x":1701907200000,"y":558.6},{"Date":"2023-12-08","Close":560.8,"Ticker":"1ADBE","x":1701993600000,"y":560.8},{"Date":"2023-12-11","Close":578.8,"Ticker":"1ADBE","x":1702252800000,"y":578.8},{"Date":"2023-12-12","Close":583,"Ticker":"1ADBE","x":1702339200000,"y":583},{"Date":"2023-12-13","Close":577.6,"Ticker":"1ADBE","x":1702425600000,"y":577.6},{"Date":"2023-12-14","Close":537,"Ticker":"1ADBE","x":1702512000000,"y":537},{"Date":"2023-12-15","Close":536.2,"Ticker":"1ADBE","x":1702598400000,"y":536.2},{"Date":"2023-12-18","Close":542.8,"Ticker":"1ADBE","x":1702857600000,"y":542.8},{"Date":"2023-12-19","Close":557,"Ticker":"1ADBE","x":1702944000000,"y":557},{"Date":"2023-12-20","Close":550.4,"Ticker":"1ADBE","x":1703030400000,"y":550.4},{"Date":"2023-12-21","Close":542.6,"Ticker":"1ADBE","x":1703116800000,"y":542.6},{"Date":"2023-12-22","Close":543,"Ticker":"1ADBE","x":1703203200000,"y":543},{"Date":"2023-12-27","Close":535.4,"Ticker":"1ADBE","x":1703635200000,"y":535.4},{"Date":"2023-12-28","Close":536.6,"Ticker":"1ADBE","x":1703721600000,"y":536.6},{"Date":"2023-12-29","Close":536.8,"Ticker":"1ADBE","x":1703808000000,"y":536.8},{"Date":"2024-01-02","Close":529.2,"Ticker":"1ADBE","x":1704153600000,"y":529.2},{"Date":"2024-01-03","Close":524.8,"Ticker":"1ADBE","x":1704240000000,"y":524.8},{"Date":"2024-01-04","Close":521,"Ticker":"1ADBE","x":1704326400000,"y":521},{"Date":"2024-01-05","Close":517,"Ticker":"1ADBE","x":1704412800000,"y":517},{"Date":"2024-01-08","Close":523.4,"Ticker":"1ADBE","x":1704672000000,"y":523.4},{"Date":"2024-01-09","Close":537,"Ticker":"1ADBE","x":1704758400000,"y":537},{"Date":"2024-01-10","Close":536.6,"Ticker":"1ADBE","x":1704844800000,"y":536.6},{"Date":"2024-01-11","Close":536.8,"Ticker":"1ADBE","x":1704931200000,"y":536.8},{"Date":"2024-01-12","Close":544,"Ticker":"1ADBE","x":1705017600000,"y":544},{"Date":"2024-01-15","Close":544.4,"Ticker":"1ADBE","x":1705276800000,"y":544.4},{"Date":"2024-01-16","Close":547,"Ticker":"1ADBE","x":1705363200000,"y":547},{"Date":"2024-01-17","Close":543.6,"Ticker":"1ADBE","x":1705449600000,"y":543.6},{"Date":"2024-01-18","Close":547.4,"Ticker":"1ADBE","x":1705536000000,"y":547.4},{"Date":"2024-01-19","Close":548.2,"Ticker":"1ADBE","x":1705622400000,"y":548.2},{"Date":"2024-01-22","Close":561.8,"Ticker":"1ADBE","x":1705881600000,"y":561.8},{"Date":"2024-01-23","Close":553.2,"Ticker":"1ADBE","x":1705968000000,"y":553.2},{"Date":"2024-01-24","Close":557.8,"Ticker":"1ADBE","x":1706054400000,"y":557.8},{"Date":"2024-01-25","Close":577.8,"Ticker":"1ADBE","x":1706140800000,"y":577.8},{"Date":"2024-01-26","Close":571.4,"Ticker":"1ADBE","x":1706227200000,"y":571.4},{"Date":"2024-01-29","Close":580,"Ticker":"1ADBE","x":1706486400000,"y":580},{"Date":"2024-01-30","Close":577.6,"Ticker":"1ADBE","x":1706572800000,"y":577.6},{"Date":"2024-01-31","Close":567,"Ticker":"1ADBE","x":1706659200000,"y":567},{"Date":"2024-02-01","Close":572.6,"Ticker":"1ADBE","x":1706745600000,"y":572.6},{"Date":"2024-02-02","Close":586,"Ticker":"1ADBE","x":1706832000000,"y":586},{"Date":"2024-02-05","Close":582.6,"Ticker":"1ADBE","x":1707091200000,"y":582.6},{"Date":"2024-02-06","Close":569,"Ticker":"1ADBE","x":1707177600000,"y":569},{"Date":"2024-02-07","Close":573.8,"Ticker":"1ADBE","x":1707264000000,"y":573.8},{"Date":"2024-02-08","Close":574.8,"Ticker":"1ADBE","x":1707350400000,"y":574.8},{"Date":"2024-02-09","Close":577.6,"Ticker":"1ADBE","x":1707436800000,"y":577.6},{"Date":"2024-02-12","Close":575.2,"Ticker":"1ADBE","x":1707696000000,"y":575.2},{"Date":"2024-02-13","Close":563.8,"Ticker":"1ADBE","x":1707782400000,"y":563.8},{"Date":"2024-02-14","Close":570,"Ticker":"1ADBE","x":1707868800000,"y":570},{"Date":"2024-02-15","Close":555,"Ticker":"1ADBE","x":1707955200000,"y":555},{"Date":"2024-02-16","Close":522.8,"Ticker":"1ADBE","x":1708041600000,"y":522.8},{"Date":"2024-02-19","Close":505.8,"Ticker":"1ADBE","x":1708300800000,"y":505.8},{"Date":"2024-02-20","Close":496.4,"Ticker":"1ADBE","x":1708387200000,"y":496.4},{"Date":"2024-02-21","Close":494.5,"Ticker":"1ADBE","x":1708473600000,"y":494.5}],"type":"line"},{"name":"1ADS","data":[{"Date":"2023-02-22","Close":139.2,"Ticker":"1ADS","x":1677024000000,"y":139.2},{"Date":"2023-02-23","Close":139.7,"Ticker":"1ADS","x":1677110400000,"y":139.7},{"Date":"2023-02-24","Close":137.4,"Ticker":"1ADS","x":1677196800000,"y":137.4},{"Date":"2023-02-27","Close":140.36,"Ticker":"1ADS","x":1677456000000,"y":140.36},{"Date":"2023-02-28","Close":142.12,"Ticker":"1ADS","x":1677542400000,"y":142.12},{"Date":"2023-03-01","Close":140.3,"Ticker":"1ADS","x":1677628800000,"y":140.3},{"Date":"2023-03-02","Close":143.24,"Ticker":"1ADS","x":1677715200000,"y":143.24},{"Date":"2023-03-03","Close":146.66,"Ticker":"1ADS","x":1677801600000,"y":146.66},{"Date":"2023-03-06","Close":146.98,"Ticker":"1ADS","x":1678060800000,"y":146.98},{"Date":"2023-03-07","Close":144.94,"Ticker":"1ADS","x":1678147200000,"y":144.94},{"Date":"2023-03-08","Close":148.26,"Ticker":"1ADS","x":1678233600000,"y":148.26},{"Date":"2023-03-09","Close":152.66,"Ticker":"1ADS","x":1678320000000,"y":152.66},{"Date":"2023-03-10","Close":148.58,"Ticker":"1ADS","x":1678406400000,"y":148.58},{"Date":"2023-03-13","Close":146.52,"Ticker":"1ADS","x":1678665600000,"y":146.52},{"Date":"2023-03-14","Close":147.84,"Ticker":"1ADS","x":1678752000000,"y":147.84},{"Date":"2023-03-15","Close":142.2,"Ticker":"1ADS","x":1678838400000,"y":142.2},{"Date":"2023-03-16","Close":142.38,"Ticker":"1ADS","x":1678924800000,"y":142.38},{"Date":"2023-03-17","Close":140.42,"Ticker":"1ADS","x":1679011200000,"y":140.42},{"Date":"2023-03-20","Close":141.16,"Ticker":"1ADS","x":1679270400000,"y":141.16},{"Date":"2023-03-21","Close":142.5,"Ticker":"1ADS","x":1679356800000,"y":142.5},{"Date":"2023-03-22","Close":140.6,"Ticker":"1ADS","x":1679443200000,"y":140.6},{"Date":"2023-03-23","Close":142.8,"Ticker":"1ADS","x":1679529600000,"y":142.8},{"Date":"2023-03-24","Close":141.3,"Ticker":"1ADS","x":1679616000000,"y":141.3},{"Date":"2023-03-27","Close":140.6,"Ticker":"1ADS","x":1679875200000,"y":140.6},{"Date":"2023-03-28","Close":141.88,"Ticker":"1ADS","x":1679961600000,"y":141.88},{"Date":"2023-03-29","Close":145.9,"Ticker":"1ADS","x":1680048000000,"y":145.9},{"Date":"2023-03-30","Close":148,"Ticker":"1ADS","x":1680134400000,"y":148},{"Date":"2023-03-31","Close":160,"Ticker":"1ADS","x":1680220800000,"y":160},{"Date":"2023-04-03","Close":164.62,"Ticker":"1ADS","x":1680480000000,"y":164.62},{"Date":"2023-04-04","Close":163.1,"Ticker":"1ADS","x":1680566400000,"y":163.1},{"Date":"2023-04-05","Close":163.2,"Ticker":"1ADS","x":1680652800000,"y":163.2},{"Date":"2023-04-06","Close":163.84,"Ticker":"1ADS","x":1680739200000,"y":163.84},{"Date":"2023-04-11","Close":166.62,"Ticker":"1ADS","x":1681171200000,"y":166.62},{"Date":"2023-04-12","Close":163.8,"Ticker":"1ADS","x":1681257600000,"y":163.8},{"Date":"2023-04-13","Close":162.8,"Ticker":"1ADS","x":1681344000000,"y":162.8},{"Date":"2023-04-14","Close":166,"Ticker":"1ADS","x":1681430400000,"y":166},{"Date":"2023-04-17","Close":162.34,"Ticker":"1ADS","x":1681689600000,"y":162.34},{"Date":"2023-04-18","Close":163.1,"Ticker":"1ADS","x":1681776000000,"y":163.1},{"Date":"2023-04-19","Close":162.46,"Ticker":"1ADS","x":1681862400000,"y":162.46},{"Date":"2023-04-20","Close":162.7,"Ticker":"1ADS","x":1681948800000,"y":162.7},{"Date":"2023-04-21","Close":162.92,"Ticker":"1ADS","x":1682035200000,"y":162.92},{"Date":"2023-04-24","Close":161.34,"Ticker":"1ADS","x":1682294400000,"y":161.34},{"Date":"2023-04-25","Close":160.74,"Ticker":"1ADS","x":1682380800000,"y":160.74},{"Date":"2023-04-26","Close":159.68,"Ticker":"1ADS","x":1682467200000,"y":159.68},{"Date":"2023-04-27","Close":158.2,"Ticker":"1ADS","x":1682553600000,"y":158.2},{"Date":"2023-04-28","Close":159.88,"Ticker":"1ADS","x":1682640000000,"y":159.88},{"Date":"2023-05-02","Close":158.72,"Ticker":"1ADS","x":1682985600000,"y":158.72},{"Date":"2023-05-03","Close":156,"Ticker":"1ADS","x":1683072000000,"y":156},{"Date":"2023-05-04","Close":156.88,"Ticker":"1ADS","x":1683158400000,"y":156.88},{"Date":"2023-05-05","Close":170.76,"Ticker":"1ADS","x":1683244800000,"y":170.76},{"Date":"2023-05-08","Close":169.16,"Ticker":"1ADS","x":1683504000000,"y":169.16},{"Date":"2023-05-09","Close":165.4,"Ticker":"1ADS","x":1683590400000,"y":165.4},{"Date":"2023-05-10","Close":162.6,"Ticker":"1ADS","x":1683676800000,"y":162.6},{"Date":"2023-05-11","Close":161.52,"Ticker":"1ADS","x":1683763200000,"y":161.52},{"Date":"2023-05-12","Close":166.5,"Ticker":"1ADS","x":1683849600000,"y":166.5},{"Date":"2023-05-15","Close":166.6,"Ticker":"1ADS","x":1684108800000,"y":166.6},{"Date":"2023-05-16","Close":162.06,"Ticker":"1ADS","x":1684195200000,"y":162.06},{"Date":"2023-05-17","Close":162.14,"Ticker":"1ADS","x":1684281600000,"y":162.14},{"Date":"2023-05-18","Close":164.26,"Ticker":"1ADS","x":1684368000000,"y":164.26},{"Date":"2023-05-19","Close":159.24,"Ticker":"1ADS","x":1684454400000,"y":159.24},{"Date":"2023-05-22","Close":162.62,"Ticker":"1ADS","x":1684713600000,"y":162.62},{"Date":"2023-05-23","Close":159,"Ticker":"1ADS","x":1684800000000,"y":159},{"Date":"2023-05-24","Close":159.38,"Ticker":"1ADS","x":1684886400000,"y":159.38},{"Date":"2023-05-25","Close":153.94,"Ticker":"1ADS","x":1684972800000,"y":153.94},{"Date":"2023-05-26","Close":155.54,"Ticker":"1ADS","x":1685059200000,"y":155.54},{"Date":"2023-05-29","Close":154.84,"Ticker":"1ADS","x":1685318400000,"y":154.84},{"Date":"2023-05-30","Close":155.92,"Ticker":"1ADS","x":1685404800000,"y":155.92},{"Date":"2023-05-31","Close":151.82,"Ticker":"1ADS","x":1685491200000,"y":151.82},{"Date":"2023-06-01","Close":150.58,"Ticker":"1ADS","x":1685577600000,"y":150.58},{"Date":"2023-06-02","Close":160,"Ticker":"1ADS","x":1685664000000,"y":160},{"Date":"2023-06-05","Close":158.7,"Ticker":"1ADS","x":1685923200000,"y":158.7},{"Date":"2023-06-06","Close":159.6,"Ticker":"1ADS","x":1686009600000,"y":159.6},{"Date":"2023-06-07","Close":159.46,"Ticker":"1ADS","x":1686096000000,"y":159.46},{"Date":"2023-06-08","Close":158.94,"Ticker":"1ADS","x":1686182400000,"y":158.94},{"Date":"2023-06-09","Close":158.76,"Ticker":"1ADS","x":1686268800000,"y":158.76},{"Date":"2023-06-12","Close":168.4,"Ticker":"1ADS","x":1686528000000,"y":168.4},{"Date":"2023-06-13","Close":173,"Ticker":"1ADS","x":1686614400000,"y":173},{"Date":"2023-06-14","Close":174.66,"Ticker":"1ADS","x":1686700800000,"y":174.66},{"Date":"2023-06-15","Close":173.3,"Ticker":"1ADS","x":1686787200000,"y":173.3},{"Date":"2023-06-16","Close":175.98,"Ticker":"1ADS","x":1686873600000,"y":175.98},{"Date":"2023-06-19","Close":171.9,"Ticker":"1ADS","x":1687132800000,"y":171.9},{"Date":"2023-06-20","Close":169.52,"Ticker":"1ADS","x":1687219200000,"y":169.52},{"Date":"2023-06-21","Close":176.02,"Ticker":"1ADS","x":1687305600000,"y":176.02},{"Date":"2023-06-22","Close":177,"Ticker":"1ADS","x":1687392000000,"y":177},{"Date":"2023-06-23","Close":176.52,"Ticker":"1ADS","x":1687478400000,"y":176.52},{"Date":"2023-06-26","Close":176.94,"Ticker":"1ADS","x":1687737600000,"y":176.94},{"Date":"2023-06-27","Close":174,"Ticker":"1ADS","x":1687824000000,"y":174},{"Date":"2023-06-28","Close":172.04,"Ticker":"1ADS","x":1687910400000,"y":172.04},{"Date":"2023-06-29","Close":173.24,"Ticker":"1ADS","x":1687996800000,"y":173.24},{"Date":"2023-06-30","Close":178.02,"Ticker":"1ADS","x":1688083200000,"y":178.02},{"Date":"2023-07-03","Close":174.5,"Ticker":"1ADS","x":1688342400000,"y":174.5},{"Date":"2023-07-04","Close":178.2,"Ticker":"1ADS","x":1688428800000,"y":178.2},{"Date":"2023-07-05","Close":174.64,"Ticker":"1ADS","x":1688515200000,"y":174.64},{"Date":"2023-07-06","Close":165.06,"Ticker":"1ADS","x":1688601600000,"y":165.06},{"Date":"2023-07-07","Close":166.5,"Ticker":"1ADS","x":1688688000000,"y":166.5},{"Date":"2023-07-10","Close":166.36,"Ticker":"1ADS","x":1688947200000,"y":166.36},{"Date":"2023-07-11","Close":171.36,"Ticker":"1ADS","x":1689033600000,"y":171.36},{"Date":"2023-07-12","Close":174.66,"Ticker":"1ADS","x":1689120000000,"y":174.66},{"Date":"2023-07-13","Close":174.58,"Ticker":"1ADS","x":1689206400000,"y":174.58},{"Date":"2023-07-14","Close":173.3,"Ticker":"1ADS","x":1689292800000,"y":173.3},{"Date":"2023-07-17","Close":172.14,"Ticker":"1ADS","x":1689552000000,"y":172.14},{"Date":"2023-07-18","Close":173.22,"Ticker":"1ADS","x":1689638400000,"y":173.22},{"Date":"2023-07-19","Close":171.86,"Ticker":"1ADS","x":1689724800000,"y":171.86},{"Date":"2023-07-20","Close":170.78,"Ticker":"1ADS","x":1689811200000,"y":170.78},{"Date":"2023-07-21","Close":172.26,"Ticker":"1ADS","x":1689897600000,"y":172.26},{"Date":"2023-07-24","Close":174.3,"Ticker":"1ADS","x":1690156800000,"y":174.3},{"Date":"2023-07-25","Close":181.58,"Ticker":"1ADS","x":1690243200000,"y":181.58},{"Date":"2023-07-26","Close":178.1,"Ticker":"1ADS","x":1690329600000,"y":178.1},{"Date":"2023-07-27","Close":181.42,"Ticker":"1ADS","x":1690416000000,"y":181.42},{"Date":"2023-07-28","Close":185.9,"Ticker":"1ADS","x":1690502400000,"y":185.9},{"Date":"2023-07-31","Close":184.26,"Ticker":"1ADS","x":1690761600000,"y":184.26},{"Date":"2023-08-01","Close":188.48,"Ticker":"1ADS","x":1690848000000,"y":188.48},{"Date":"2023-08-02","Close":178.98,"Ticker":"1ADS","x":1690934400000,"y":178.98},{"Date":"2023-08-03","Close":179.1,"Ticker":"1ADS","x":1691020800000,"y":179.1},{"Date":"2023-08-04","Close":181.24,"Ticker":"1ADS","x":1691107200000,"y":181.24},{"Date":"2023-08-07","Close":179.52,"Ticker":"1ADS","x":1691366400000,"y":179.52},{"Date":"2023-08-08","Close":175.56,"Ticker":"1ADS","x":1691452800000,"y":175.56},{"Date":"2023-08-09","Close":177.8,"Ticker":"1ADS","x":1691539200000,"y":177.8},{"Date":"2023-08-10","Close":182.34,"Ticker":"1ADS","x":1691625600000,"y":182.34},{"Date":"2023-08-11","Close":178.3,"Ticker":"1ADS","x":1691712000000,"y":178.3},{"Date":"2023-08-14","Close":177.72,"Ticker":"1ADS","x":1691971200000,"y":177.72},{"Date":"2023-08-15","Close":177.72,"Ticker":"1ADS","x":1692057600000,"y":177.72},{"Date":"2023-08-16","Close":184.3,"Ticker":"1ADS","x":1692144000000,"y":184.3},{"Date":"2023-08-17","Close":184.82,"Ticker":"1ADS","x":1692230400000,"y":184.82},{"Date":"2023-08-18","Close":183.92,"Ticker":"1ADS","x":1692316800000,"y":183.92},{"Date":"2023-08-21","Close":183.74,"Ticker":"1ADS","x":1692576000000,"y":183.74},{"Date":"2023-08-22","Close":184.36,"Ticker":"1ADS","x":1692662400000,"y":184.36},{"Date":"2023-08-23","Close":178.02,"Ticker":"1ADS","x":1692748800000,"y":178.02},{"Date":"2023-08-24","Close":175.92,"Ticker":"1ADS","x":1692835200000,"y":175.92},{"Date":"2023-08-25","Close":176,"Ticker":"1ADS","x":1692921600000,"y":176},{"Date":"2023-08-28","Close":177.9,"Ticker":"1ADS","x":1693180800000,"y":177.9},{"Date":"2023-08-29","Close":181.52,"Ticker":"1ADS","x":1693267200000,"y":181.52},{"Date":"2023-08-30","Close":183.2,"Ticker":"1ADS","x":1693353600000,"y":183.2},{"Date":"2023-08-31","Close":185,"Ticker":"1ADS","x":1693440000000,"y":185},{"Date":"2023-09-01","Close":184.62,"Ticker":"1ADS","x":1693526400000,"y":184.62},{"Date":"2023-09-04","Close":185.18,"Ticker":"1ADS","x":1693785600000,"y":185.18},{"Date":"2023-09-05","Close":182.14,"Ticker":"1ADS","x":1693872000000,"y":182.14},{"Date":"2023-09-06","Close":181.94,"Ticker":"1ADS","x":1693958400000,"y":181.94},{"Date":"2023-09-07","Close":175.88,"Ticker":"1ADS","x":1694044800000,"y":175.88},{"Date":"2023-09-08","Close":175.12,"Ticker":"1ADS","x":1694131200000,"y":175.12},{"Date":"2023-09-11","Close":177.38,"Ticker":"1ADS","x":1694390400000,"y":177.38},{"Date":"2023-09-12","Close":177.28,"Ticker":"1ADS","x":1694476800000,"y":177.28},{"Date":"2023-09-13","Close":171.06,"Ticker":"1ADS","x":1694563200000,"y":171.06},{"Date":"2023-09-14","Close":170.46,"Ticker":"1ADS","x":1694649600000,"y":170.46},{"Date":"2023-09-15","Close":173.04,"Ticker":"1ADS","x":1694736000000,"y":173.04},{"Date":"2023-09-18","Close":175,"Ticker":"1ADS","x":1694995200000,"y":175},{"Date":"2023-09-19","Close":165.36,"Ticker":"1ADS","x":1695081600000,"y":165.36},{"Date":"2023-09-20","Close":166.38,"Ticker":"1ADS","x":1695168000000,"y":166.38},{"Date":"2023-09-21","Close":163.4,"Ticker":"1ADS","x":1695254400000,"y":163.4},{"Date":"2023-09-22","Close":162.96,"Ticker":"1ADS","x":1695340800000,"y":162.96},{"Date":"2023-09-25","Close":161.42,"Ticker":"1ADS","x":1695600000000,"y":161.42},{"Date":"2023-09-26","Close":159.18,"Ticker":"1ADS","x":1695686400000,"y":159.18},{"Date":"2023-09-27","Close":157.34,"Ticker":"1ADS","x":1695772800000,"y":157.34},{"Date":"2023-09-28","Close":156.4,"Ticker":"1ADS","x":1695859200000,"y":156.4},{"Date":"2023-09-29","Close":167.02,"Ticker":"1ADS","x":1695945600000,"y":167.02},{"Date":"2023-10-02","Close":164.78,"Ticker":"1ADS","x":1696204800000,"y":164.78},{"Date":"2023-10-03","Close":161.16,"Ticker":"1ADS","x":1696291200000,"y":161.16},{"Date":"2023-10-04","Close":162.78,"Ticker":"1ADS","x":1696377600000,"y":162.78},{"Date":"2023-10-05","Close":156.56,"Ticker":"1ADS","x":1696464000000,"y":156.56},{"Date":"2023-10-06","Close":160.08,"Ticker":"1ADS","x":1696550400000,"y":160.08},{"Date":"2023-10-09","Close":165.62,"Ticker":"1ADS","x":1696809600000,"y":165.62},{"Date":"2023-10-10","Close":170.82,"Ticker":"1ADS","x":1696896000000,"y":170.82},{"Date":"2023-10-11","Close":170.4,"Ticker":"1ADS","x":1696982400000,"y":170.4},{"Date":"2023-10-12","Close":170.2,"Ticker":"1ADS","x":1697068800000,"y":170.2},{"Date":"2023-10-13","Close":167.24,"Ticker":"1ADS","x":1697155200000,"y":167.24},{"Date":"2023-10-16","Close":170.44,"Ticker":"1ADS","x":1697414400000,"y":170.44},{"Date":"2023-10-17","Close":170.5,"Ticker":"1ADS","x":1697500800000,"y":170.5},{"Date":"2023-10-18","Close":176.06,"Ticker":"1ADS","x":1697587200000,"y":176.06},{"Date":"2023-10-19","Close":174.26,"Ticker":"1ADS","x":1697673600000,"y":174.26},{"Date":"2023-10-20","Close":169.6,"Ticker":"1ADS","x":1697760000000,"y":169.6},{"Date":"2023-10-23","Close":169.12,"Ticker":"1ADS","x":1698019200000,"y":169.12},{"Date":"2023-10-24","Close":172.84,"Ticker":"1ADS","x":1698105600000,"y":172.84},{"Date":"2023-10-25","Close":171.34,"Ticker":"1ADS","x":1698192000000,"y":171.34},{"Date":"2023-10-26","Close":166.66,"Ticker":"1ADS","x":1698278400000,"y":166.66},{"Date":"2023-10-27","Close":166.72,"Ticker":"1ADS","x":1698364800000,"y":166.72},{"Date":"2023-10-30","Close":166.76,"Ticker":"1ADS","x":1698624000000,"y":166.76},{"Date":"2023-10-31","Close":166.76,"Ticker":"1ADS","x":1698710400000,"y":166.76},{"Date":"2023-11-01","Close":167,"Ticker":"1ADS","x":1698796800000,"y":167},{"Date":"2023-11-02","Close":172,"Ticker":"1ADS","x":1698883200000,"y":172},{"Date":"2023-11-03","Close":171.22,"Ticker":"1ADS","x":1698969600000,"y":171.22},{"Date":"2023-11-06","Close":172.44,"Ticker":"1ADS","x":1699228800000,"y":172.44},{"Date":"2023-11-07","Close":172.4,"Ticker":"1ADS","x":1699315200000,"y":172.4},{"Date":"2023-11-08","Close":169.74,"Ticker":"1ADS","x":1699401600000,"y":169.74},{"Date":"2023-11-09","Close":173.6,"Ticker":"1ADS","x":1699488000000,"y":173.6},{"Date":"2023-11-10","Close":171.3,"Ticker":"1ADS","x":1699574400000,"y":171.3},{"Date":"2023-11-13","Close":168.98,"Ticker":"1ADS","x":1699833600000,"y":168.98},{"Date":"2023-11-14","Close":178.38,"Ticker":"1ADS","x":1699920000000,"y":178.38},{"Date":"2023-11-15","Close":178.52,"Ticker":"1ADS","x":1700006400000,"y":178.52},{"Date":"2023-11-16","Close":176,"Ticker":"1ADS","x":1700092800000,"y":176},{"Date":"2023-11-17","Close":180.06,"Ticker":"1ADS","x":1700179200000,"y":180.06},{"Date":"2023-11-20","Close":181.54,"Ticker":"1ADS","x":1700438400000,"y":181.54},{"Date":"2023-11-21","Close":185.48,"Ticker":"1ADS","x":1700524800000,"y":185.48},{"Date":"2023-11-22","Close":187.22,"Ticker":"1ADS","x":1700611200000,"y":187.22},{"Date":"2023-11-23","Close":185.86,"Ticker":"1ADS","x":1700697600000,"y":185.86},{"Date":"2023-11-24","Close":184.68,"Ticker":"1ADS","x":1700784000000,"y":184.68},{"Date":"2023-11-27","Close":185.42,"Ticker":"1ADS","x":1701043200000,"y":185.42},{"Date":"2023-11-28","Close":186.5,"Ticker":"1ADS","x":1701129600000,"y":186.5},{"Date":"2023-11-29","Close":193.1,"Ticker":"1ADS","x":1701216000000,"y":193.1},{"Date":"2023-11-30","Close":191.78,"Ticker":"1ADS","x":1701302400000,"y":191.78},{"Date":"2023-12-01","Close":194.42,"Ticker":"1ADS","x":1701388800000,"y":194.42},{"Date":"2023-12-04","Close":194.22,"Ticker":"1ADS","x":1701648000000,"y":194.22},{"Date":"2023-12-05","Close":194.92,"Ticker":"1ADS","x":1701734400000,"y":194.92},{"Date":"2023-12-06","Close":197.28,"Ticker":"1ADS","x":1701820800000,"y":197.28},{"Date":"2023-12-07","Close":190.48,"Ticker":"1ADS","x":1701907200000,"y":190.48},{"Date":"2023-12-08","Close":193.32,"Ticker":"1ADS","x":1701993600000,"y":193.32},{"Date":"2023-12-11","Close":194.1,"Ticker":"1ADS","x":1702252800000,"y":194.1},{"Date":"2023-12-12","Close":193.72,"Ticker":"1ADS","x":1702339200000,"y":193.72},{"Date":"2023-12-13","Close":193.9,"Ticker":"1ADS","x":1702425600000,"y":193.9},{"Date":"2023-12-14","Close":197.94,"Ticker":"1ADS","x":1702512000000,"y":197.94},{"Date":"2023-12-15","Close":191.66,"Ticker":"1ADS","x":1702598400000,"y":191.66},{"Date":"2023-12-18","Close":191.5,"Ticker":"1ADS","x":1702857600000,"y":191.5},{"Date":"2023-12-19","Close":192.64,"Ticker":"1ADS","x":1702944000000,"y":192.64},{"Date":"2023-12-20","Close":196.12,"Ticker":"1ADS","x":1703030400000,"y":196.12},{"Date":"2023-12-21","Close":194.12,"Ticker":"1ADS","x":1703116800000,"y":194.12},{"Date":"2023-12-22","Close":184.36,"Ticker":"1ADS","x":1703203200000,"y":184.36},{"Date":"2023-12-27","Close":185.32,"Ticker":"1ADS","x":1703635200000,"y":185.32},{"Date":"2023-12-28","Close":184.06,"Ticker":"1ADS","x":1703721600000,"y":184.06},{"Date":"2023-12-29","Close":184.28,"Ticker":"1ADS","x":1703808000000,"y":184.28},{"Date":"2024-01-02","Close":182.2,"Ticker":"1ADS","x":1704153600000,"y":182.2},{"Date":"2024-01-03","Close":178.96,"Ticker":"1ADS","x":1704240000000,"y":178.96},{"Date":"2024-01-04","Close":173.98,"Ticker":"1ADS","x":1704326400000,"y":173.98},{"Date":"2024-01-05","Close":173.18,"Ticker":"1ADS","x":1704412800000,"y":173.18},{"Date":"2024-01-08","Close":176.58,"Ticker":"1ADS","x":1704672000000,"y":176.58},{"Date":"2024-01-09","Close":177.76,"Ticker":"1ADS","x":1704758400000,"y":177.76},{"Date":"2024-01-10","Close":179.3,"Ticker":"1ADS","x":1704844800000,"y":179.3},{"Date":"2024-01-11","Close":177.5,"Ticker":"1ADS","x":1704931200000,"y":177.5},{"Date":"2024-01-12","Close":177.56,"Ticker":"1ADS","x":1705017600000,"y":177.56},{"Date":"2024-01-15","Close":176.18,"Ticker":"1ADS","x":1705276800000,"y":176.18},{"Date":"2024-01-16","Close":171.76,"Ticker":"1ADS","x":1705363200000,"y":171.76},{"Date":"2024-01-17","Close":165.46,"Ticker":"1ADS","x":1705449600000,"y":165.46},{"Date":"2024-01-18","Close":164.56,"Ticker":"1ADS","x":1705536000000,"y":164.56},{"Date":"2024-01-19","Close":164.48,"Ticker":"1ADS","x":1705622400000,"y":164.48},{"Date":"2024-01-22","Close":166.14,"Ticker":"1ADS","x":1705881600000,"y":166.14},{"Date":"2024-01-23","Close":166.9,"Ticker":"1ADS","x":1705968000000,"y":166.9},{"Date":"2024-01-24","Close":165.62,"Ticker":"1ADS","x":1706054400000,"y":165.62},{"Date":"2024-01-25","Close":175.3,"Ticker":"1ADS","x":1706140800000,"y":175.3},{"Date":"2024-01-26","Close":177.5,"Ticker":"1ADS","x":1706227200000,"y":177.5},{"Date":"2024-01-29","Close":177.36,"Ticker":"1ADS","x":1706486400000,"y":177.36},{"Date":"2024-01-30","Close":179.52,"Ticker":"1ADS","x":1706572800000,"y":179.52},{"Date":"2024-01-31","Close":175.66,"Ticker":"1ADS","x":1706659200000,"y":175.66},{"Date":"2024-02-01","Close":172.44,"Ticker":"1ADS","x":1706745600000,"y":172.44},{"Date":"2024-02-02","Close":175.06,"Ticker":"1ADS","x":1706832000000,"y":175.06},{"Date":"2024-02-05","Close":175.46,"Ticker":"1ADS","x":1707091200000,"y":175.46},{"Date":"2024-02-06","Close":175.62,"Ticker":"1ADS","x":1707177600000,"y":175.62},{"Date":"2024-02-07","Close":175.7,"Ticker":"1ADS","x":1707264000000,"y":175.7},{"Date":"2024-02-08","Close":171.36,"Ticker":"1ADS","x":1707350400000,"y":171.36},{"Date":"2024-02-09","Close":171.94,"Ticker":"1ADS","x":1707436800000,"y":171.94},{"Date":"2024-02-12","Close":173.88,"Ticker":"1ADS","x":1707696000000,"y":173.88},{"Date":"2024-02-13","Close":171.26,"Ticker":"1ADS","x":1707782400000,"y":171.26},{"Date":"2024-02-14","Close":174.9,"Ticker":"1ADS","x":1707868800000,"y":174.9},{"Date":"2024-02-15","Close":173.94,"Ticker":"1ADS","x":1707955200000,"y":173.94},{"Date":"2024-02-16","Close":176.36,"Ticker":"1ADS","x":1708041600000,"y":176.36},{"Date":"2024-02-19","Close":179.82,"Ticker":"1ADS","x":1708300800000,"y":179.82},{"Date":"2024-02-20","Close":181.42,"Ticker":"1ADS","x":1708387200000,"y":181.42},{"Date":"2024-02-21","Close":181.58,"Ticker":"1ADS","x":1708473600000,"y":181.58}],"type":"line"},{"name":"1GOOGL","data":[{"Date":"2023-02-22","Close":86.16,"Ticker":"1GOOGL","x":1677024000000,"y":86.16},{"Date":"2023-02-23","Close":85.48,"Ticker":"1GOOGL","x":1677110400000,"y":85.48},{"Date":"2023-02-24","Close":84.39,"Ticker":"1GOOGL","x":1677196800000,"y":84.39},{"Date":"2023-02-27","Close":84.68,"Ticker":"1GOOGL","x":1677456000000,"y":84.68},{"Date":"2023-02-28","Close":85,"Ticker":"1GOOGL","x":1677542400000,"y":85},{"Date":"2023-03-01","Close":84.38,"Ticker":"1GOOGL","x":1677628800000,"y":84.38},{"Date":"2023-03-02","Close":84.82,"Ticker":"1GOOGL","x":1677715200000,"y":84.82},{"Date":"2023-03-03","Close":87.94,"Ticker":"1GOOGL","x":1677801600000,"y":87.94},{"Date":"2023-03-06","Close":89.68,"Ticker":"1GOOGL","x":1678060800000,"y":89.68},{"Date":"2023-03-07","Close":89.5,"Ticker":"1GOOGL","x":1678147200000,"y":89.5},{"Date":"2023-03-08","Close":90.65,"Ticker":"1GOOGL","x":1678233600000,"y":90.65},{"Date":"2023-03-09","Close":89.6,"Ticker":"1GOOGL","x":1678320000000,"y":89.6},{"Date":"2023-03-10","Close":86.81,"Ticker":"1GOOGL","x":1678406400000,"y":86.81},{"Date":"2023-03-13","Close":85.81,"Ticker":"1GOOGL","x":1678665600000,"y":85.81},{"Date":"2023-03-14","Close":87.34,"Ticker":"1GOOGL","x":1678752000000,"y":87.34},{"Date":"2023-03-15","Close":90.12,"Ticker":"1GOOGL","x":1678838400000,"y":90.12},{"Date":"2023-03-16","Close":93.98,"Ticker":"1GOOGL","x":1678924800000,"y":93.98},{"Date":"2023-03-17","Close":94.94,"Ticker":"1GOOGL","x":1679011200000,"y":94.94},{"Date":"2023-03-20","Close":94.17,"Ticker":"1GOOGL","x":1679270400000,"y":94.17},{"Date":"2023-03-21","Close":96.32,"Ticker":"1GOOGL","x":1679356800000,"y":96.32},{"Date":"2023-03-22","Close":97.32,"Ticker":"1GOOGL","x":1679443200000,"y":97.32},{"Date":"2023-03-23","Close":97.25,"Ticker":"1GOOGL","x":1679529600000,"y":97.25},{"Date":"2023-03-24","Close":97.19,"Ticker":"1GOOGL","x":1679616000000,"y":97.19},{"Date":"2023-03-27","Close":95.7,"Ticker":"1GOOGL","x":1679875200000,"y":95.7},{"Date":"2023-03-28","Close":92.78,"Ticker":"1GOOGL","x":1679961600000,"y":92.78},{"Date":"2023-03-29","Close":93.56,"Ticker":"1GOOGL","x":1680048000000,"y":93.56},{"Date":"2023-03-30","Close":92.2,"Ticker":"1GOOGL","x":1680134400000,"y":92.2},{"Date":"2023-03-31","Close":94.53,"Ticker":"1GOOGL","x":1680220800000,"y":94.53},{"Date":"2023-04-03","Close":94.47,"Ticker":"1GOOGL","x":1680480000000,"y":94.47},{"Date":"2023-04-04","Close":95.64,"Ticker":"1GOOGL","x":1680566400000,"y":95.64},{"Date":"2023-04-05","Close":95.37,"Ticker":"1GOOGL","x":1680652800000,"y":95.37},{"Date":"2023-04-06","Close":97.47,"Ticker":"1GOOGL","x":1680739200000,"y":97.47},{"Date":"2023-04-11","Close":96.37,"Ticker":"1GOOGL","x":1681171200000,"y":96.37},{"Date":"2023-04-12","Close":95.05,"Ticker":"1GOOGL","x":1681257600000,"y":95.05},{"Date":"2023-04-13","Close":96.3,"Ticker":"1GOOGL","x":1681344000000,"y":96.3},{"Date":"2023-04-14","Close":98.03,"Ticker":"1GOOGL","x":1681430400000,"y":98.03},{"Date":"2023-04-17","Close":96.08,"Ticker":"1GOOGL","x":1681689600000,"y":96.08},{"Date":"2023-04-18","Close":95.79,"Ticker":"1GOOGL","x":1681776000000,"y":95.79},{"Date":"2023-04-19","Close":94.91,"Ticker":"1GOOGL","x":1681862400000,"y":94.91},{"Date":"2023-04-20","Close":95.32,"Ticker":"1GOOGL","x":1681948800000,"y":95.32},{"Date":"2023-04-21","Close":96.16,"Ticker":"1GOOGL","x":1682035200000,"y":96.16},{"Date":"2023-04-24","Close":95.88,"Ticker":"1GOOGL","x":1682294400000,"y":95.88},{"Date":"2023-04-25","Close":96.2,"Ticker":"1GOOGL","x":1682380800000,"y":96.2},{"Date":"2023-04-26","Close":95,"Ticker":"1GOOGL","x":1682467200000,"y":95},{"Date":"2023-04-27","Close":97.2,"Ticker":"1GOOGL","x":1682553600000,"y":97.2},{"Date":"2023-04-28","Close":95.89,"Ticker":"1GOOGL","x":1682640000000,"y":95.89},{"Date":"2023-05-02","Close":95.33,"Ticker":"1GOOGL","x":1682985600000,"y":95.33},{"Date":"2023-05-03","Close":95.66,"Ticker":"1GOOGL","x":1683072000000,"y":95.66},{"Date":"2023-05-04","Close":95.28,"Ticker":"1GOOGL","x":1683158400000,"y":95.28},{"Date":"2023-05-05","Close":95.15,"Ticker":"1GOOGL","x":1683244800000,"y":95.15},{"Date":"2023-05-08","Close":96.92,"Ticker":"1GOOGL","x":1683504000000,"y":96.92},{"Date":"2023-05-09","Close":98.97,"Ticker":"1GOOGL","x":1683590400000,"y":98.97},{"Date":"2023-05-10","Close":98.97,"Ticker":"1GOOGL","x":1683676800000,"y":98.97},{"Date":"2023-05-11","Close":107.78,"Ticker":"1GOOGL","x":1683763200000,"y":107.78},{"Date":"2023-05-12","Close":107.72,"Ticker":"1GOOGL","x":1683849600000,"y":107.72},{"Date":"2023-05-15","Close":107.9,"Ticker":"1GOOGL","x":1684108800000,"y":107.9},{"Date":"2023-05-16","Close":110.08,"Ticker":"1GOOGL","x":1684195200000,"y":110.08},{"Date":"2023-05-17","Close":110.14,"Ticker":"1GOOGL","x":1684281600000,"y":110.14},{"Date":"2023-05-18","Close":113.54,"Ticker":"1GOOGL","x":1684368000000,"y":113.54},{"Date":"2023-05-19","Close":114.46,"Ticker":"1GOOGL","x":1684454400000,"y":114.46},{"Date":"2023-05-22","Close":116.14,"Ticker":"1GOOGL","x":1684713600000,"y":116.14},{"Date":"2023-05-23","Close":115,"Ticker":"1GOOGL","x":1684800000000,"y":115},{"Date":"2023-05-24","Close":112.34,"Ticker":"1GOOGL","x":1684886400000,"y":112.34},{"Date":"2023-05-25","Close":115.72,"Ticker":"1GOOGL","x":1684972800000,"y":115.72},{"Date":"2023-05-26","Close":116.14,"Ticker":"1GOOGL","x":1685059200000,"y":116.14},{"Date":"2023-05-29","Close":117.5,"Ticker":"1GOOGL","x":1685318400000,"y":117.5},{"Date":"2023-05-30","Close":115.54,"Ticker":"1GOOGL","x":1685404800000,"y":115.54},{"Date":"2023-05-31","Close":115.4,"Ticker":"1GOOGL","x":1685491200000,"y":115.4},{"Date":"2023-06-01","Close":114.54,"Ticker":"1GOOGL","x":1685577600000,"y":114.54},{"Date":"2023-06-02","Close":116.5,"Ticker":"1GOOGL","x":1685664000000,"y":116.5},{"Date":"2023-06-05","Close":118.46,"Ticker":"1GOOGL","x":1685923200000,"y":118.46},{"Date":"2023-06-06","Close":118.88,"Ticker":"1GOOGL","x":1686009600000,"y":118.88},{"Date":"2023-06-07","Close":116.12,"Ticker":"1GOOGL","x":1686096000000,"y":116.12},{"Date":"2023-06-08","Close":113.92,"Ticker":"1GOOGL","x":1686182400000,"y":113.92},{"Date":"2023-06-09","Close":114.12,"Ticker":"1GOOGL","x":1686268800000,"y":114.12},{"Date":"2023-06-12","Close":113.96,"Ticker":"1GOOGL","x":1686528000000,"y":113.96},{"Date":"2023-06-13","Close":115.26,"Ticker":"1GOOGL","x":1686614400000,"y":115.26},{"Date":"2023-06-14","Close":114.06,"Ticker":"1GOOGL","x":1686700800000,"y":114.06},{"Date":"2023-06-15","Close":113.5,"Ticker":"1GOOGL","x":1686787200000,"y":113.5},{"Date":"2023-06-16","Close":114.06,"Ticker":"1GOOGL","x":1686873600000,"y":114.06},{"Date":"2023-06-19","Close":112.74,"Ticker":"1GOOGL","x":1687132800000,"y":112.74},{"Date":"2023-06-20","Close":112.58,"Ticker":"1GOOGL","x":1687219200000,"y":112.58},{"Date":"2023-06-21","Close":109.82,"Ticker":"1GOOGL","x":1687305600000,"y":109.82},{"Date":"2023-06-22","Close":109.86,"Ticker":"1GOOGL","x":1687392000000,"y":109.86},{"Date":"2023-06-23","Close":111.54,"Ticker":"1GOOGL","x":1687478400000,"y":111.54},{"Date":"2023-06-26","Close":110.48,"Ticker":"1GOOGL","x":1687737600000,"y":110.48},{"Date":"2023-06-27","Close":107.46,"Ticker":"1GOOGL","x":1687824000000,"y":107.46},{"Date":"2023-06-28","Close":109.44,"Ticker":"1GOOGL","x":1687910400000,"y":109.44},{"Date":"2023-06-29","Close":109.3,"Ticker":"1GOOGL","x":1687996800000,"y":109.3},{"Date":"2023-06-30","Close":110.52,"Ticker":"1GOOGL","x":1688083200000,"y":110.52},{"Date":"2023-07-03","Close":109.5,"Ticker":"1GOOGL","x":1688342400000,"y":109.5},{"Date":"2023-07-04","Close":109.56,"Ticker":"1GOOGL","x":1688428800000,"y":109.56},{"Date":"2023-07-05","Close":111.98,"Ticker":"1GOOGL","x":1688515200000,"y":111.98},{"Date":"2023-07-06","Close":109.18,"Ticker":"1GOOGL","x":1688601600000,"y":109.18},{"Date":"2023-07-07","Close":109.82,"Ticker":"1GOOGL","x":1688688000000,"y":109.82},{"Date":"2023-07-10","Close":106.42,"Ticker":"1GOOGL","x":1688947200000,"y":106.42},{"Date":"2023-07-11","Close":106.68,"Ticker":"1GOOGL","x":1689033600000,"y":106.68},{"Date":"2023-07-12","Close":107.64,"Ticker":"1GOOGL","x":1689120000000,"y":107.64},{"Date":"2023-07-13","Close":110.9,"Ticker":"1GOOGL","x":1689206400000,"y":110.9},{"Date":"2023-07-14","Close":111.72,"Ticker":"1GOOGL","x":1689292800000,"y":111.72},{"Date":"2023-07-17","Close":111.3,"Ticker":"1GOOGL","x":1689552000000,"y":111.3},{"Date":"2023-07-18","Close":109.82,"Ticker":"1GOOGL","x":1689638400000,"y":109.82},{"Date":"2023-07-19","Close":110.46,"Ticker":"1GOOGL","x":1689724800000,"y":110.46},{"Date":"2023-07-20","Close":108.46,"Ticker":"1GOOGL","x":1689811200000,"y":108.46},{"Date":"2023-07-21","Close":108.14,"Ticker":"1GOOGL","x":1689897600000,"y":108.14},{"Date":"2023-07-24","Close":109.8,"Ticker":"1GOOGL","x":1690156800000,"y":109.8},{"Date":"2023-07-25","Close":109.68,"Ticker":"1GOOGL","x":1690243200000,"y":109.68},{"Date":"2023-07-26","Close":116.9,"Ticker":"1GOOGL","x":1690329600000,"y":116.9},{"Date":"2023-07-27","Close":120,"Ticker":"1GOOGL","x":1690416000000,"y":120},{"Date":"2023-07-28","Close":120.82,"Ticker":"1GOOGL","x":1690502400000,"y":120.82},{"Date":"2023-07-31","Close":120.72,"Ticker":"1GOOGL","x":1690761600000,"y":120.72},{"Date":"2023-08-01","Close":120.46,"Ticker":"1GOOGL","x":1690848000000,"y":120.46},{"Date":"2023-08-02","Close":117.66,"Ticker":"1GOOGL","x":1690934400000,"y":117.66},{"Date":"2023-08-03","Close":117.62,"Ticker":"1GOOGL","x":1691020800000,"y":117.62},{"Date":"2023-08-04","Close":117.96,"Ticker":"1GOOGL","x":1691107200000,"y":117.96},{"Date":"2023-08-07","Close":118.32,"Ticker":"1GOOGL","x":1691366400000,"y":118.32},{"Date":"2023-08-08","Close":118.66,"Ticker":"1GOOGL","x":1691452800000,"y":118.66},{"Date":"2023-08-09","Close":117.84,"Ticker":"1GOOGL","x":1691539200000,"y":117.84},{"Date":"2023-08-10","Close":118.58,"Ticker":"1GOOGL","x":1691625600000,"y":118.58},{"Date":"2023-08-11","Close":117.46,"Ticker":"1GOOGL","x":1691712000000,"y":117.46},{"Date":"2023-08-14","Close":120,"Ticker":"1GOOGL","x":1691971200000,"y":120},{"Date":"2023-08-15","Close":120,"Ticker":"1GOOGL","x":1692057600000,"y":120},{"Date":"2023-08-16","Close":118.88,"Ticker":"1GOOGL","x":1692144000000,"y":118.88},{"Date":"2023-08-17","Close":120.5,"Ticker":"1GOOGL","x":1692230400000,"y":120.5},{"Date":"2023-08-18","Close":117,"Ticker":"1GOOGL","x":1692316800000,"y":117},{"Date":"2023-08-21","Close":116.54,"Ticker":"1GOOGL","x":1692576000000,"y":116.54},{"Date":"2023-08-22","Close":119.98,"Ticker":"1GOOGL","x":1692662400000,"y":119.98},{"Date":"2023-08-23","Close":122.14,"Ticker":"1GOOGL","x":1692748800000,"y":122.14},{"Date":"2023-08-24","Close":120.58,"Ticker":"1GOOGL","x":1692835200000,"y":120.58},{"Date":"2023-08-25","Close":118.54,"Ticker":"1GOOGL","x":1692921600000,"y":118.54},{"Date":"2023-08-28","Close":120.78,"Ticker":"1GOOGL","x":1693180800000,"y":120.78},{"Date":"2023-08-29","Close":125.34,"Ticker":"1GOOGL","x":1693267200000,"y":125.34},{"Date":"2023-08-30","Close":123.72,"Ticker":"1GOOGL","x":1693353600000,"y":123.72},{"Date":"2023-08-31","Close":126.06,"Ticker":"1GOOGL","x":1693440000000,"y":126.06},{"Date":"2023-09-01","Close":125.88,"Ticker":"1GOOGL","x":1693526400000,"y":125.88},{"Date":"2023-09-04","Close":125.9,"Ticker":"1GOOGL","x":1693785600000,"y":125.9},{"Date":"2023-09-05","Close":126.62,"Ticker":"1GOOGL","x":1693872000000,"y":126.62},{"Date":"2023-09-06","Close":125.86,"Ticker":"1GOOGL","x":1693958400000,"y":125.86},{"Date":"2023-09-07","Close":126.2,"Ticker":"1GOOGL","x":1694044800000,"y":126.2},{"Date":"2023-09-08","Close":127.1,"Ticker":"1GOOGL","x":1694131200000,"y":127.1},{"Date":"2023-09-11","Close":126.92,"Ticker":"1GOOGL","x":1694390400000,"y":126.92},{"Date":"2023-09-12","Close":126.56,"Ticker":"1GOOGL","x":1694476800000,"y":126.56},{"Date":"2023-09-13","Close":126.26,"Ticker":"1GOOGL","x":1694563200000,"y":126.26},{"Date":"2023-09-14","Close":129.22,"Ticker":"1GOOGL","x":1694649600000,"y":129.22},{"Date":"2023-09-15","Close":128.02,"Ticker":"1GOOGL","x":1694736000000,"y":128.02},{"Date":"2023-09-18","Close":129.92,"Ticker":"1GOOGL","x":1694995200000,"y":129.92},{"Date":"2023-09-19","Close":128.52,"Ticker":"1GOOGL","x":1695081600000,"y":128.52},{"Date":"2023-09-20","Close":126.44,"Ticker":"1GOOGL","x":1695168000000,"y":126.44},{"Date":"2023-09-21","Close":122.58,"Ticker":"1GOOGL","x":1695254400000,"y":122.58},{"Date":"2023-09-22","Close":123.8,"Ticker":"1GOOGL","x":1695340800000,"y":123.8},{"Date":"2023-09-25","Close":123.42,"Ticker":"1GOOGL","x":1695600000000,"y":123.42},{"Date":"2023-09-26","Close":120.36,"Ticker":"1GOOGL","x":1695686400000,"y":120.36},{"Date":"2023-09-27","Close":122.92,"Ticker":"1GOOGL","x":1695772800000,"y":122.92},{"Date":"2023-09-28","Close":123.94,"Ticker":"1GOOGL","x":1695859200000,"y":123.94},{"Date":"2023-09-29","Close":125.18,"Ticker":"1GOOGL","x":1695945600000,"y":125.18},{"Date":"2023-10-02","Close":127.8,"Ticker":"1GOOGL","x":1696204800000,"y":127.8},{"Date":"2023-10-03","Close":126.26,"Ticker":"1GOOGL","x":1696291200000,"y":126.26},{"Date":"2023-10-04","Close":128.12,"Ticker":"1GOOGL","x":1696377600000,"y":128.12},{"Date":"2023-10-05","Close":127.46,"Ticker":"1GOOGL","x":1696464000000,"y":127.46},{"Date":"2023-10-06","Close":128.9,"Ticker":"1GOOGL","x":1696550400000,"y":128.9},{"Date":"2023-10-09","Close":130.5,"Ticker":"1GOOGL","x":1696809600000,"y":130.5},{"Date":"2023-10-10","Close":131.28,"Ticker":"1GOOGL","x":1696896000000,"y":131.28},{"Date":"2023-10-11","Close":132.62,"Ticker":"1GOOGL","x":1696982400000,"y":132.62},{"Date":"2023-10-12","Close":133.08,"Ticker":"1GOOGL","x":1697068800000,"y":133.08},{"Date":"2023-10-13","Close":130.7,"Ticker":"1GOOGL","x":1697155200000,"y":130.7},{"Date":"2023-10-16","Close":131.82,"Ticker":"1GOOGL","x":1697414400000,"y":131.82},{"Date":"2023-10-17","Close":131.08,"Ticker":"1GOOGL","x":1697500800000,"y":131.08},{"Date":"2023-10-18","Close":132.94,"Ticker":"1GOOGL","x":1697587200000,"y":132.94},{"Date":"2023-10-19","Close":130.72,"Ticker":"1GOOGL","x":1697673600000,"y":130.72},{"Date":"2023-10-20","Close":127.68,"Ticker":"1GOOGL","x":1697760000000,"y":127.68},{"Date":"2023-10-23","Close":127.94,"Ticker":"1GOOGL","x":1698019200000,"y":127.94},{"Date":"2023-10-24","Close":131.4,"Ticker":"1GOOGL","x":1698105600000,"y":131.4},{"Date":"2023-10-25","Close":119.5,"Ticker":"1GOOGL","x":1698192000000,"y":119.5},{"Date":"2023-10-26","Close":117,"Ticker":"1GOOGL","x":1698278400000,"y":117},{"Date":"2023-10-27","Close":115.06,"Ticker":"1GOOGL","x":1698364800000,"y":115.06},{"Date":"2023-10-30","Close":117.12,"Ticker":"1GOOGL","x":1698624000000,"y":117.12},{"Date":"2023-10-31","Close":116.36,"Ticker":"1GOOGL","x":1698710400000,"y":116.36},{"Date":"2023-11-01","Close":118.5,"Ticker":"1GOOGL","x":1698796800000,"y":118.5},{"Date":"2023-11-02","Close":120.1,"Ticker":"1GOOGL","x":1698883200000,"y":120.1},{"Date":"2023-11-03","Close":120.62,"Ticker":"1GOOGL","x":1698969600000,"y":120.62},{"Date":"2023-11-06","Close":120.64,"Ticker":"1GOOGL","x":1699228800000,"y":120.64},{"Date":"2023-11-07","Close":122.8,"Ticker":"1GOOGL","x":1699315200000,"y":122.8},{"Date":"2023-11-08","Close":122.4,"Ticker":"1GOOGL","x":1699401600000,"y":122.4},{"Date":"2023-11-09","Close":123.3,"Ticker":"1GOOGL","x":1699488000000,"y":123.3},{"Date":"2023-11-10","Close":122.76,"Ticker":"1GOOGL","x":1699574400000,"y":122.76},{"Date":"2023-11-13","Close":123.74,"Ticker":"1GOOGL","x":1699833600000,"y":123.74},{"Date":"2023-11-14","Close":123.56,"Ticker":"1GOOGL","x":1699920000000,"y":123.56},{"Date":"2023-11-15","Close":123.82,"Ticker":"1GOOGL","x":1700006400000,"y":123.82},{"Date":"2023-11-16","Close":125.46,"Ticker":"1GOOGL","x":1700092800000,"y":125.46},{"Date":"2023-11-17","Close":123.12,"Ticker":"1GOOGL","x":1700179200000,"y":123.12},{"Date":"2023-11-20","Close":124.34,"Ticker":"1GOOGL","x":1700438400000,"y":124.34},{"Date":"2023-11-21","Close":124.52,"Ticker":"1GOOGL","x":1700524800000,"y":124.52},{"Date":"2023-11-22","Close":128.2,"Ticker":"1GOOGL","x":1700611200000,"y":128.2},{"Date":"2023-11-23","Close":126.78,"Ticker":"1GOOGL","x":1700697600000,"y":126.78},{"Date":"2023-11-24","Close":124.5,"Ticker":"1GOOGL","x":1700784000000,"y":124.5},{"Date":"2023-11-27","Close":124.56,"Ticker":"1GOOGL","x":1701043200000,"y":124.56},{"Date":"2023-11-28","Close":124.2,"Ticker":"1GOOGL","x":1701129600000,"y":124.2},{"Date":"2023-11-29","Close":123.54,"Ticker":"1GOOGL","x":1701216000000,"y":123.54},{"Date":"2023-11-30","Close":121.12,"Ticker":"1GOOGL","x":1701302400000,"y":121.12},{"Date":"2023-12-01","Close":120.54,"Ticker":"1GOOGL","x":1701388800000,"y":120.54},{"Date":"2023-12-04","Close":118.7,"Ticker":"1GOOGL","x":1701648000000,"y":118.7},{"Date":"2023-12-05","Close":121.42,"Ticker":"1GOOGL","x":1701734400000,"y":121.42},{"Date":"2023-12-06","Close":121.22,"Ticker":"1GOOGL","x":1701820800000,"y":121.22},{"Date":"2023-12-07","Close":126.32,"Ticker":"1GOOGL","x":1701907200000,"y":126.32},{"Date":"2023-12-08","Close":125.62,"Ticker":"1GOOGL","x":1701993600000,"y":125.62},{"Date":"2023-12-11","Close":123.04,"Ticker":"1GOOGL","x":1702252800000,"y":123.04},{"Date":"2023-12-12","Close":122.66,"Ticker":"1GOOGL","x":1702339200000,"y":122.66},{"Date":"2023-12-13","Close":122.7,"Ticker":"1GOOGL","x":1702425600000,"y":122.7},{"Date":"2023-12-14","Close":118.94,"Ticker":"1GOOGL","x":1702512000000,"y":118.94},{"Date":"2023-12-15","Close":120.98,"Ticker":"1GOOGL","x":1702598400000,"y":120.98},{"Date":"2023-12-18","Close":124.1,"Ticker":"1GOOGL","x":1702857600000,"y":124.1},{"Date":"2023-12-19","Close":124.5,"Ticker":"1GOOGL","x":1702944000000,"y":124.5},{"Date":"2023-12-20","Close":128.42,"Ticker":"1GOOGL","x":1703030400000,"y":128.42},{"Date":"2023-12-21","Close":127.6,"Ticker":"1GOOGL","x":1703116800000,"y":127.6},{"Date":"2023-12-22","Close":128.04,"Ticker":"1GOOGL","x":1703203200000,"y":128.04},{"Date":"2023-12-27","Close":126.18,"Ticker":"1GOOGL","x":1703635200000,"y":126.18},{"Date":"2023-12-28","Close":126.82,"Ticker":"1GOOGL","x":1703721600000,"y":126.82},{"Date":"2023-12-29","Close":125.62,"Ticker":"1GOOGL","x":1703808000000,"y":125.62},{"Date":"2024-01-02","Close":125.46,"Ticker":"1GOOGL","x":1704153600000,"y":125.46},{"Date":"2024-01-03","Close":127.04,"Ticker":"1GOOGL","x":1704240000000,"y":127.04},{"Date":"2024-01-04","Close":126.58,"Ticker":"1GOOGL","x":1704326400000,"y":126.58},{"Date":"2024-01-05","Close":124,"Ticker":"1GOOGL","x":1704412800000,"y":124},{"Date":"2024-01-08","Close":125.36,"Ticker":"1GOOGL","x":1704672000000,"y":125.36},{"Date":"2024-01-09","Close":128.52,"Ticker":"1GOOGL","x":1704758400000,"y":128.52},{"Date":"2024-01-10","Close":129.26,"Ticker":"1GOOGL","x":1704844800000,"y":129.26},{"Date":"2024-01-11","Close":129.26,"Ticker":"1GOOGL","x":1704931200000,"y":129.26},{"Date":"2024-01-12","Close":130.28,"Ticker":"1GOOGL","x":1705017600000,"y":130.28},{"Date":"2024-01-15","Close":130.64,"Ticker":"1GOOGL","x":1705276800000,"y":130.64},{"Date":"2024-01-16","Close":131.22,"Ticker":"1GOOGL","x":1705363200000,"y":131.22},{"Date":"2024-01-17","Close":129.84,"Ticker":"1GOOGL","x":1705449600000,"y":129.84},{"Date":"2024-01-18","Close":132.54,"Ticker":"1GOOGL","x":1705536000000,"y":132.54},{"Date":"2024-01-19","Close":134.16,"Ticker":"1GOOGL","x":1705622400000,"y":134.16},{"Date":"2024-01-22","Close":135.2,"Ticker":"1GOOGL","x":1705881600000,"y":135.2},{"Date":"2024-01-23","Close":134.92,"Ticker":"1GOOGL","x":1705968000000,"y":134.92},{"Date":"2024-01-24","Close":136.42,"Ticker":"1GOOGL","x":1706054400000,"y":136.42},{"Date":"2024-01-25","Close":141.16,"Ticker":"1GOOGL","x":1706140800000,"y":141.16},{"Date":"2024-01-26","Close":139.86,"Ticker":"1GOOGL","x":1706227200000,"y":139.86},{"Date":"2024-01-29","Close":140.76,"Ticker":"1GOOGL","x":1706486400000,"y":140.76},{"Date":"2024-01-30","Close":140.74,"Ticker":"1GOOGL","x":1706572800000,"y":140.74},{"Date":"2024-01-31","Close":131.24,"Ticker":"1GOOGL","x":1706659200000,"y":131.24},{"Date":"2024-02-01","Close":130.52,"Ticker":"1GOOGL","x":1706745600000,"y":130.52},{"Date":"2024-02-02","Close":129.9,"Ticker":"1GOOGL","x":1706832000000,"y":129.9},{"Date":"2024-02-05","Close":133.7,"Ticker":"1GOOGL","x":1707091200000,"y":133.7},{"Date":"2024-02-06","Close":134.52,"Ticker":"1GOOGL","x":1707177600000,"y":134.52},{"Date":"2024-02-07","Close":134.28,"Ticker":"1GOOGL","x":1707264000000,"y":134.28},{"Date":"2024-02-08","Close":135.66,"Ticker":"1GOOGL","x":1707350400000,"y":135.66},{"Date":"2024-02-09","Close":137.78,"Ticker":"1GOOGL","x":1707436800000,"y":137.78},{"Date":"2024-02-12","Close":138.16,"Ticker":"1GOOGL","x":1707696000000,"y":138.16},{"Date":"2024-02-13","Close":136.04,"Ticker":"1GOOGL","x":1707782400000,"y":136.04},{"Date":"2024-02-14","Close":135.22,"Ticker":"1GOOGL","x":1707868800000,"y":135.22},{"Date":"2024-02-15","Close":131.74,"Ticker":"1GOOGL","x":1707955200000,"y":131.74},{"Date":"2024-02-16","Close":131.38,"Ticker":"1GOOGL","x":1708041600000,"y":131.38},{"Date":"2024-02-19","Close":131.7,"Ticker":"1GOOGL","x":1708300800000,"y":131.7},{"Date":"2024-02-20","Close":131,"Ticker":"1GOOGL","x":1708387200000,"y":131},{"Date":"2024-02-21","Close":131.52,"Ticker":"1GOOGL","x":1708473600000,"y":131.52}],"type":"line"},{"name":"4ALFEN","data":[{"Date":"2023-02-22","Close":78.24,"Ticker":"4ALFEN","x":1677024000000,"y":78.24},{"Date":"2023-02-23","Close":77.2,"Ticker":"4ALFEN","x":1677110400000,"y":77.2},{"Date":"2023-02-24","Close":75.48,"Ticker":"4ALFEN","x":1677196800000,"y":75.48},{"Date":"2023-02-27","Close":76.48,"Ticker":"4ALFEN","x":1677456000000,"y":76.48},{"Date":"2023-02-28","Close":76.34,"Ticker":"4ALFEN","x":1677542400000,"y":76.34},{"Date":"2023-03-01","Close":75.78,"Ticker":"4ALFEN","x":1677628800000,"y":75.78},{"Date":"2023-03-02","Close":74.22,"Ticker":"4ALFEN","x":1677715200000,"y":74.22},{"Date":"2023-03-03","Close":74.74,"Ticker":"4ALFEN","x":1677801600000,"y":74.74},{"Date":"2023-03-06","Close":75.88,"Ticker":"4ALFEN","x":1678060800000,"y":75.88},{"Date":"2023-03-07","Close":74.52,"Ticker":"4ALFEN","x":1678147200000,"y":74.52},{"Date":"2023-03-08","Close":74.16,"Ticker":"4ALFEN","x":1678233600000,"y":74.16},{"Date":"2023-03-09","Close":74.86,"Ticker":"4ALFEN","x":1678320000000,"y":74.86},{"Date":"2023-03-10","Close":74,"Ticker":"4ALFEN","x":1678406400000,"y":74},{"Date":"2023-03-13","Close":72.06,"Ticker":"4ALFEN","x":1678665600000,"y":72.06},{"Date":"2023-03-14","Close":72.5,"Ticker":"4ALFEN","x":1678752000000,"y":72.5},{"Date":"2023-03-15","Close":69.62,"Ticker":"4ALFEN","x":1678838400000,"y":69.62},{"Date":"2023-03-16","Close":71.54,"Ticker":"4ALFEN","x":1678924800000,"y":71.54},{"Date":"2023-03-17","Close":72.26,"Ticker":"4ALFEN","x":1679011200000,"y":72.26},{"Date":"2023-03-20","Close":72.14,"Ticker":"4ALFEN","x":1679270400000,"y":72.14},{"Date":"2023-03-21","Close":75.12,"Ticker":"4ALFEN","x":1679356800000,"y":75.12},{"Date":"2023-03-22","Close":74.86,"Ticker":"4ALFEN","x":1679443200000,"y":74.86},{"Date":"2023-03-23","Close":74.66,"Ticker":"4ALFEN","x":1679529600000,"y":74.66},{"Date":"2023-03-24","Close":72.54,"Ticker":"4ALFEN","x":1679616000000,"y":72.54},{"Date":"2023-03-27","Close":72.68,"Ticker":"4ALFEN","x":1679875200000,"y":72.68},{"Date":"2023-03-28","Close":71.42,"Ticker":"4ALFEN","x":1679961600000,"y":71.42},{"Date":"2023-03-29","Close":72.4,"Ticker":"4ALFEN","x":1680048000000,"y":72.4},{"Date":"2023-03-30","Close":73.4,"Ticker":"4ALFEN","x":1680134400000,"y":73.4},{"Date":"2023-03-31","Close":72.94,"Ticker":"4ALFEN","x":1680220800000,"y":72.94},{"Date":"2023-04-03","Close":74.76,"Ticker":"4ALFEN","x":1680480000000,"y":74.76},{"Date":"2023-04-04","Close":75.44,"Ticker":"4ALFEN","x":1680566400000,"y":75.44},{"Date":"2023-04-05","Close":73.14,"Ticker":"4ALFEN","x":1680652800000,"y":73.14},{"Date":"2023-04-06","Close":72.66,"Ticker":"4ALFEN","x":1680739200000,"y":72.66},{"Date":"2023-04-11","Close":72.94,"Ticker":"4ALFEN","x":1681171200000,"y":72.94},{"Date":"2023-04-12","Close":74.38,"Ticker":"4ALFEN","x":1681257600000,"y":74.38},{"Date":"2023-04-13","Close":73.28,"Ticker":"4ALFEN","x":1681344000000,"y":73.28},{"Date":"2023-04-14","Close":73.22,"Ticker":"4ALFEN","x":1681430400000,"y":73.22},{"Date":"2023-04-17","Close":71.52,"Ticker":"4ALFEN","x":1681689600000,"y":71.52},{"Date":"2023-04-18","Close":69.96,"Ticker":"4ALFEN","x":1681776000000,"y":69.96},{"Date":"2023-04-19","Close":70.58,"Ticker":"4ALFEN","x":1681862400000,"y":70.58},{"Date":"2023-04-20","Close":69.74,"Ticker":"4ALFEN","x":1681948800000,"y":69.74},{"Date":"2023-04-21","Close":71.84,"Ticker":"4ALFEN","x":1682035200000,"y":71.84},{"Date":"2023-04-24","Close":72.76,"Ticker":"4ALFEN","x":1682294400000,"y":72.76},{"Date":"2023-04-25","Close":74.74,"Ticker":"4ALFEN","x":1682380800000,"y":74.74},{"Date":"2023-04-26","Close":74.22,"Ticker":"4ALFEN","x":1682467200000,"y":74.22},{"Date":"2023-04-27","Close":74.52,"Ticker":"4ALFEN","x":1682553600000,"y":74.52},{"Date":"2023-04-28","Close":73.02,"Ticker":"4ALFEN","x":1682640000000,"y":73.02},{"Date":"2023-05-02","Close":74.1,"Ticker":"4ALFEN","x":1682985600000,"y":74.1},{"Date":"2023-05-03","Close":77.28,"Ticker":"4ALFEN","x":1683072000000,"y":77.28},{"Date":"2023-05-04","Close":74.9,"Ticker":"4ALFEN","x":1683158400000,"y":74.9},{"Date":"2023-05-05","Close":78.32,"Ticker":"4ALFEN","x":1683244800000,"y":78.32},{"Date":"2023-05-08","Close":77.8,"Ticker":"4ALFEN","x":1683504000000,"y":77.8},{"Date":"2023-05-09","Close":79.64,"Ticker":"4ALFEN","x":1683590400000,"y":79.64},{"Date":"2023-05-10","Close":77.32,"Ticker":"4ALFEN","x":1683676800000,"y":77.32},{"Date":"2023-05-11","Close":73.28,"Ticker":"4ALFEN","x":1683763200000,"y":73.28},{"Date":"2023-05-12","Close":73.34,"Ticker":"4ALFEN","x":1683849600000,"y":73.34},{"Date":"2023-05-15","Close":77.28,"Ticker":"4ALFEN","x":1684108800000,"y":77.28},{"Date":"2023-05-16","Close":76.98,"Ticker":"4ALFEN","x":1684195200000,"y":76.98},{"Date":"2023-05-17","Close":67.26,"Ticker":"4ALFEN","x":1684281600000,"y":67.26},{"Date":"2023-05-18","Close":66.46,"Ticker":"4ALFEN","x":1684368000000,"y":66.46},{"Date":"2023-05-19","Close":67.48,"Ticker":"4ALFEN","x":1684454400000,"y":67.48},{"Date":"2023-05-22","Close":64.9,"Ticker":"4ALFEN","x":1684713600000,"y":64.9},{"Date":"2023-05-23","Close":66.14,"Ticker":"4ALFEN","x":1684800000000,"y":66.14},{"Date":"2023-05-24","Close":66.18,"Ticker":"4ALFEN","x":1684886400000,"y":66.18},{"Date":"2023-05-25","Close":66.84,"Ticker":"4ALFEN","x":1684972800000,"y":66.84},{"Date":"2023-05-26","Close":65.44,"Ticker":"4ALFEN","x":1685059200000,"y":65.44},{"Date":"2023-05-29","Close":65.82,"Ticker":"4ALFEN","x":1685318400000,"y":65.82},{"Date":"2023-05-30","Close":66.76,"Ticker":"4ALFEN","x":1685404800000,"y":66.76},{"Date":"2023-05-31","Close":66.9,"Ticker":"4ALFEN","x":1685491200000,"y":66.9},{"Date":"2023-06-01","Close":66.58,"Ticker":"4ALFEN","x":1685577600000,"y":66.58},{"Date":"2023-06-02","Close":66.72,"Ticker":"4ALFEN","x":1685664000000,"y":66.72},{"Date":"2023-06-05","Close":65.68,"Ticker":"4ALFEN","x":1685923200000,"y":65.68},{"Date":"2023-06-06","Close":64.18,"Ticker":"4ALFEN","x":1686009600000,"y":64.18},{"Date":"2023-06-07","Close":61.86,"Ticker":"4ALFEN","x":1686096000000,"y":61.86},{"Date":"2023-06-08","Close":60.68,"Ticker":"4ALFEN","x":1686182400000,"y":60.68},{"Date":"2023-06-09","Close":61.12,"Ticker":"4ALFEN","x":1686268800000,"y":61.12},{"Date":"2023-06-12","Close":63.56,"Ticker":"4ALFEN","x":1686528000000,"y":63.56},{"Date":"2023-06-13","Close":64.44,"Ticker":"4ALFEN","x":1686614400000,"y":64.44},{"Date":"2023-06-14","Close":65.48,"Ticker":"4ALFEN","x":1686700800000,"y":65.48},{"Date":"2023-06-15","Close":66.6,"Ticker":"4ALFEN","x":1686787200000,"y":66.6},{"Date":"2023-06-16","Close":67.58,"Ticker":"4ALFEN","x":1686873600000,"y":67.58},{"Date":"2023-06-19","Close":66.58,"Ticker":"4ALFEN","x":1687132800000,"y":66.58},{"Date":"2023-06-20","Close":63.86,"Ticker":"4ALFEN","x":1687219200000,"y":63.86},{"Date":"2023-06-21","Close":63.34,"Ticker":"4ALFEN","x":1687305600000,"y":63.34},{"Date":"2023-06-22","Close":65.76,"Ticker":"4ALFEN","x":1687392000000,"y":65.76},{"Date":"2023-06-23","Close":62.44,"Ticker":"4ALFEN","x":1687478400000,"y":62.44},{"Date":"2023-06-26","Close":63.06,"Ticker":"4ALFEN","x":1687737600000,"y":63.06},{"Date":"2023-06-27","Close":60.26,"Ticker":"4ALFEN","x":1687824000000,"y":60.26},{"Date":"2023-06-28","Close":57.52,"Ticker":"4ALFEN","x":1687910400000,"y":57.52},{"Date":"2023-06-29","Close":58.66,"Ticker":"4ALFEN","x":1687996800000,"y":58.66},{"Date":"2023-06-30","Close":61.72,"Ticker":"4ALFEN","x":1688083200000,"y":61.72},{"Date":"2023-07-03","Close":61.5,"Ticker":"4ALFEN","x":1688342400000,"y":61.5},{"Date":"2023-07-04","Close":62.94,"Ticker":"4ALFEN","x":1688428800000,"y":62.94},{"Date":"2023-07-05","Close":62.58,"Ticker":"4ALFEN","x":1688515200000,"y":62.58},{"Date":"2023-07-06","Close":55.14,"Ticker":"4ALFEN","x":1688601600000,"y":55.14},{"Date":"2023-07-07","Close":57.5,"Ticker":"4ALFEN","x":1688688000000,"y":57.5},{"Date":"2023-07-10","Close":56.66,"Ticker":"4ALFEN","x":1688947200000,"y":56.66},{"Date":"2023-07-11","Close":55.42,"Ticker":"4ALFEN","x":1689033600000,"y":55.42},{"Date":"2023-07-12","Close":55.4,"Ticker":"4ALFEN","x":1689120000000,"y":55.4},{"Date":"2023-07-13","Close":55.98,"Ticker":"4ALFEN","x":1689206400000,"y":55.98},{"Date":"2023-07-14","Close":55.92,"Ticker":"4ALFEN","x":1689292800000,"y":55.92},{"Date":"2023-07-17","Close":56.4,"Ticker":"4ALFEN","x":1689552000000,"y":56.4},{"Date":"2023-07-18","Close":56.94,"Ticker":"4ALFEN","x":1689638400000,"y":56.94},{"Date":"2023-07-19","Close":59.28,"Ticker":"4ALFEN","x":1689724800000,"y":59.28},{"Date":"2023-07-20","Close":59.86,"Ticker":"4ALFEN","x":1689811200000,"y":59.86},{"Date":"2023-07-21","Close":60.3,"Ticker":"4ALFEN","x":1689897600000,"y":60.3},{"Date":"2023-07-24","Close":59.88,"Ticker":"4ALFEN","x":1690156800000,"y":59.88},{"Date":"2023-07-25","Close":59.68,"Ticker":"4ALFEN","x":1690243200000,"y":59.68},{"Date":"2023-07-26","Close":59.88,"Ticker":"4ALFEN","x":1690329600000,"y":59.88},{"Date":"2023-07-27","Close":60.78,"Ticker":"4ALFEN","x":1690416000000,"y":60.78},{"Date":"2023-07-28","Close":60.98,"Ticker":"4ALFEN","x":1690502400000,"y":60.98},{"Date":"2023-07-31","Close":63.16,"Ticker":"4ALFEN","x":1690761600000,"y":63.16},{"Date":"2023-08-01","Close":62.58,"Ticker":"4ALFEN","x":1690848000000,"y":62.58},{"Date":"2023-08-02","Close":58.6,"Ticker":"4ALFEN","x":1690934400000,"y":58.6},{"Date":"2023-08-03","Close":59.46,"Ticker":"4ALFEN","x":1691020800000,"y":59.46},{"Date":"2023-08-04","Close":60,"Ticker":"4ALFEN","x":1691107200000,"y":60},{"Date":"2023-08-07","Close":59.38,"Ticker":"4ALFEN","x":1691366400000,"y":59.38},{"Date":"2023-08-08","Close":58.24,"Ticker":"4ALFEN","x":1691452800000,"y":58.24},{"Date":"2023-08-09","Close":60.72,"Ticker":"4ALFEN","x":1691539200000,"y":60.72},{"Date":"2023-08-10","Close":62.24,"Ticker":"4ALFEN","x":1691625600000,"y":62.24},{"Date":"2023-08-11","Close":61.58,"Ticker":"4ALFEN","x":1691712000000,"y":61.58},{"Date":"2023-08-14","Close":63.76,"Ticker":"4ALFEN","x":1691971200000,"y":63.76},{"Date":"2023-08-16","Close":61.62,"Ticker":"4ALFEN","x":1692144000000,"y":61.62},{"Date":"2023-08-17","Close":59.28,"Ticker":"4ALFEN","x":1692230400000,"y":59.28},{"Date":"2023-08-18","Close":58.22,"Ticker":"4ALFEN","x":1692316800000,"y":58.22},{"Date":"2023-08-21","Close":57.14,"Ticker":"4ALFEN","x":1692576000000,"y":57.14},{"Date":"2023-08-22","Close":57.42,"Ticker":"4ALFEN","x":1692662400000,"y":57.42},{"Date":"2023-08-23","Close":51.66,"Ticker":"4ALFEN","x":1692748800000,"y":51.66},{"Date":"2023-08-24","Close":52.96,"Ticker":"4ALFEN","x":1692835200000,"y":52.96},{"Date":"2023-08-25","Close":54.64,"Ticker":"4ALFEN","x":1692921600000,"y":54.64},{"Date":"2023-08-28","Close":53.58,"Ticker":"4ALFEN","x":1693180800000,"y":53.58},{"Date":"2023-08-29","Close":54.62,"Ticker":"4ALFEN","x":1693267200000,"y":54.62},{"Date":"2023-08-30","Close":54.92,"Ticker":"4ALFEN","x":1693353600000,"y":54.92},{"Date":"2023-08-31","Close":53.46,"Ticker":"4ALFEN","x":1693440000000,"y":53.46},{"Date":"2023-09-01","Close":52.06,"Ticker":"4ALFEN","x":1693526400000,"y":52.06},{"Date":"2023-09-04","Close":50.4,"Ticker":"4ALFEN","x":1693785600000,"y":50.4},{"Date":"2023-09-05","Close":50.06,"Ticker":"4ALFEN","x":1693872000000,"y":50.06},{"Date":"2023-09-06","Close":46.15,"Ticker":"4ALFEN","x":1693958400000,"y":46.15},{"Date":"2023-09-07","Close":45.52,"Ticker":"4ALFEN","x":1694044800000,"y":45.52},{"Date":"2023-09-08","Close":43.18,"Ticker":"4ALFEN","x":1694131200000,"y":43.18},{"Date":"2023-09-11","Close":44.2,"Ticker":"4ALFEN","x":1694390400000,"y":44.2},{"Date":"2023-09-12","Close":43.52,"Ticker":"4ALFEN","x":1694476800000,"y":43.52},{"Date":"2023-09-13","Close":43.04,"Ticker":"4ALFEN","x":1694563200000,"y":43.04},{"Date":"2023-09-14","Close":45.83,"Ticker":"4ALFEN","x":1694649600000,"y":45.83},{"Date":"2023-09-15","Close":45.66,"Ticker":"4ALFEN","x":1694736000000,"y":45.66},{"Date":"2023-09-18","Close":44.85,"Ticker":"4ALFEN","x":1694995200000,"y":44.85},{"Date":"2023-09-19","Close":44.79,"Ticker":"4ALFEN","x":1695081600000,"y":44.79},{"Date":"2023-09-20","Close":46,"Ticker":"4ALFEN","x":1695168000000,"y":46},{"Date":"2023-09-21","Close":44.4,"Ticker":"4ALFEN","x":1695254400000,"y":44.4},{"Date":"2023-09-22","Close":44.11,"Ticker":"4ALFEN","x":1695340800000,"y":44.11},{"Date":"2023-09-25","Close":42.66,"Ticker":"4ALFEN","x":1695600000000,"y":42.66},{"Date":"2023-09-26","Close":41.38,"Ticker":"4ALFEN","x":1695686400000,"y":41.38},{"Date":"2023-09-27","Close":41.03,"Ticker":"4ALFEN","x":1695772800000,"y":41.03},{"Date":"2023-09-28","Close":40.46,"Ticker":"4ALFEN","x":1695859200000,"y":40.46},{"Date":"2023-09-29","Close":40.21,"Ticker":"4ALFEN","x":1695945600000,"y":40.21},{"Date":"2023-10-02","Close":38.83,"Ticker":"4ALFEN","x":1696204800000,"y":38.83},{"Date":"2023-10-03","Close":36.78,"Ticker":"4ALFEN","x":1696291200000,"y":36.78},{"Date":"2023-10-04","Close":36.33,"Ticker":"4ALFEN","x":1696377600000,"y":36.33},{"Date":"2023-10-05","Close":37.08,"Ticker":"4ALFEN","x":1696464000000,"y":37.08},{"Date":"2023-10-06","Close":36.43,"Ticker":"4ALFEN","x":1696550400000,"y":36.43},{"Date":"2023-10-09","Close":36.41,"Ticker":"4ALFEN","x":1696809600000,"y":36.41},{"Date":"2023-10-10","Close":37.05,"Ticker":"4ALFEN","x":1696896000000,"y":37.05},{"Date":"2023-10-11","Close":36.7,"Ticker":"4ALFEN","x":1696982400000,"y":36.7},{"Date":"2023-10-12","Close":36.36,"Ticker":"4ALFEN","x":1697068800000,"y":36.36},{"Date":"2023-10-13","Close":34.11,"Ticker":"4ALFEN","x":1697155200000,"y":34.11},{"Date":"2023-10-16","Close":34.31,"Ticker":"4ALFEN","x":1697414400000,"y":34.31},{"Date":"2023-10-17","Close":33.61,"Ticker":"4ALFEN","x":1697500800000,"y":33.61},{"Date":"2023-10-18","Close":32.46,"Ticker":"4ALFEN","x":1697587200000,"y":32.46},{"Date":"2023-10-19","Close":31.95,"Ticker":"4ALFEN","x":1697673600000,"y":31.95},{"Date":"2023-10-20","Close":31.05,"Ticker":"4ALFEN","x":1697760000000,"y":31.05},{"Date":"2023-10-23","Close":31.44,"Ticker":"4ALFEN","x":1698019200000,"y":31.44},{"Date":"2023-10-24","Close":31.53,"Ticker":"4ALFEN","x":1698105600000,"y":31.53},{"Date":"2023-10-25","Close":29.43,"Ticker":"4ALFEN","x":1698192000000,"y":29.43},{"Date":"2023-10-26","Close":29.16,"Ticker":"4ALFEN","x":1698278400000,"y":29.16},{"Date":"2023-10-27","Close":29.12,"Ticker":"4ALFEN","x":1698364800000,"y":29.12},{"Date":"2023-10-30","Close":28.01,"Ticker":"4ALFEN","x":1698624000000,"y":28.01},{"Date":"2023-10-31","Close":29.59,"Ticker":"4ALFEN","x":1698710400000,"y":29.59},{"Date":"2023-11-01","Close":29.9,"Ticker":"4ALFEN","x":1698796800000,"y":29.9},{"Date":"2023-11-02","Close":31.25,"Ticker":"4ALFEN","x":1698883200000,"y":31.25},{"Date":"2023-11-03","Close":33.2,"Ticker":"4ALFEN","x":1698969600000,"y":33.2},{"Date":"2023-11-06","Close":33.43,"Ticker":"4ALFEN","x":1699228800000,"y":33.43},{"Date":"2023-11-07","Close":33.91,"Ticker":"4ALFEN","x":1699315200000,"y":33.91},{"Date":"2023-11-08","Close":33.83,"Ticker":"4ALFEN","x":1699401600000,"y":33.83},{"Date":"2023-11-09","Close":36.09,"Ticker":"4ALFEN","x":1699488000000,"y":36.09},{"Date":"2023-11-10","Close":35.47,"Ticker":"4ALFEN","x":1699574400000,"y":35.47},{"Date":"2023-11-13","Close":44.68,"Ticker":"4ALFEN","x":1699833600000,"y":44.68},{"Date":"2023-11-14","Close":46.14,"Ticker":"4ALFEN","x":1699920000000,"y":46.14},{"Date":"2023-11-15","Close":47.04,"Ticker":"4ALFEN","x":1700006400000,"y":47.04},{"Date":"2023-11-16","Close":46.93,"Ticker":"4ALFEN","x":1700092800000,"y":46.93},{"Date":"2023-11-17","Close":47.7,"Ticker":"4ALFEN","x":1700179200000,"y":47.7},{"Date":"2023-11-20","Close":45.17,"Ticker":"4ALFEN","x":1700438400000,"y":45.17},{"Date":"2023-11-21","Close":44.82,"Ticker":"4ALFEN","x":1700524800000,"y":44.82},{"Date":"2023-11-22","Close":44.2,"Ticker":"4ALFEN","x":1700611200000,"y":44.2},{"Date":"2023-11-23","Close":43.05,"Ticker":"4ALFEN","x":1700697600000,"y":43.05},{"Date":"2023-11-24","Close":43.25,"Ticker":"4ALFEN","x":1700784000000,"y":43.25},{"Date":"2023-11-27","Close":44.46,"Ticker":"4ALFEN","x":1701043200000,"y":44.46},{"Date":"2023-11-28","Close":46.03,"Ticker":"4ALFEN","x":1701129600000,"y":46.03},{"Date":"2023-11-29","Close":45.23,"Ticker":"4ALFEN","x":1701216000000,"y":45.23},{"Date":"2023-11-30","Close":46.19,"Ticker":"4ALFEN","x":1701302400000,"y":46.19},{"Date":"2023-12-01","Close":45.88,"Ticker":"4ALFEN","x":1701388800000,"y":45.88},{"Date":"2023-12-04","Close":45.87,"Ticker":"4ALFEN","x":1701648000000,"y":45.87},{"Date":"2023-12-05","Close":43.5,"Ticker":"4ALFEN","x":1701734400000,"y":43.5},{"Date":"2023-12-06","Close":45.56,"Ticker":"4ALFEN","x":1701820800000,"y":45.56},{"Date":"2023-12-07","Close":46.64,"Ticker":"4ALFEN","x":1701907200000,"y":46.64},{"Date":"2023-12-08","Close":47.49,"Ticker":"4ALFEN","x":1701993600000,"y":47.49},{"Date":"2023-12-11","Close":48.46,"Ticker":"4ALFEN","x":1702252800000,"y":48.46},{"Date":"2023-12-12","Close":49.07,"Ticker":"4ALFEN","x":1702339200000,"y":49.07},{"Date":"2023-12-13","Close":51.5,"Ticker":"4ALFEN","x":1702425600000,"y":51.5},{"Date":"2023-12-14","Close":55.68,"Ticker":"4ALFEN","x":1702512000000,"y":55.68},{"Date":"2023-12-15","Close":55.9,"Ticker":"4ALFEN","x":1702598400000,"y":55.9},{"Date":"2023-12-18","Close":54.74,"Ticker":"4ALFEN","x":1702857600000,"y":54.74},{"Date":"2023-12-19","Close":53.08,"Ticker":"4ALFEN","x":1702944000000,"y":53.08},{"Date":"2023-12-20","Close":55.06,"Ticker":"4ALFEN","x":1703030400000,"y":55.06},{"Date":"2023-12-21","Close":56.04,"Ticker":"4ALFEN","x":1703116800000,"y":56.04},{"Date":"2023-12-22","Close":56.56,"Ticker":"4ALFEN","x":1703203200000,"y":56.56},{"Date":"2023-12-27","Close":58.72,"Ticker":"4ALFEN","x":1703635200000,"y":58.72},{"Date":"2023-12-28","Close":60.58,"Ticker":"4ALFEN","x":1703721600000,"y":60.58},{"Date":"2023-12-29","Close":60.24,"Ticker":"4ALFEN","x":1703808000000,"y":60.24},{"Date":"2024-01-02","Close":57.42,"Ticker":"4ALFEN","x":1704153600000,"y":57.42},{"Date":"2024-01-03","Close":53.16,"Ticker":"4ALFEN","x":1704240000000,"y":53.16},{"Date":"2024-01-04","Close":51.34,"Ticker":"4ALFEN","x":1704326400000,"y":51.34},{"Date":"2024-01-05","Close":52.46,"Ticker":"4ALFEN","x":1704412800000,"y":52.46},{"Date":"2024-01-08","Close":53.56,"Ticker":"4ALFEN","x":1704672000000,"y":53.56},{"Date":"2024-01-09","Close":55.74,"Ticker":"4ALFEN","x":1704758400000,"y":55.74},{"Date":"2024-01-10","Close":58.96,"Ticker":"4ALFEN","x":1704844800000,"y":58.96},{"Date":"2024-01-11","Close":57.98,"Ticker":"4ALFEN","x":1704931200000,"y":57.98},{"Date":"2024-01-12","Close":56.32,"Ticker":"4ALFEN","x":1705017600000,"y":56.32},{"Date":"2024-01-15","Close":56.7,"Ticker":"4ALFEN","x":1705276800000,"y":56.7},{"Date":"2024-01-16","Close":55.6,"Ticker":"4ALFEN","x":1705363200000,"y":55.6},{"Date":"2024-01-17","Close":54.72,"Ticker":"4ALFEN","x":1705449600000,"y":54.72},{"Date":"2024-01-18","Close":52.18,"Ticker":"4ALFEN","x":1705536000000,"y":52.18},{"Date":"2024-01-19","Close":51.78,"Ticker":"4ALFEN","x":1705622400000,"y":51.78},{"Date":"2024-01-22","Close":55.1,"Ticker":"4ALFEN","x":1705881600000,"y":55.1},{"Date":"2024-01-23","Close":55.44,"Ticker":"4ALFEN","x":1705968000000,"y":55.44},{"Date":"2024-01-24","Close":55.48,"Ticker":"4ALFEN","x":1706054400000,"y":55.48},{"Date":"2024-01-25","Close":53.74,"Ticker":"4ALFEN","x":1706140800000,"y":53.74},{"Date":"2024-01-26","Close":53.28,"Ticker":"4ALFEN","x":1706227200000,"y":53.28},{"Date":"2024-01-29","Close":54.24,"Ticker":"4ALFEN","x":1706486400000,"y":54.24},{"Date":"2024-01-30","Close":55.96,"Ticker":"4ALFEN","x":1706572800000,"y":55.96},{"Date":"2024-01-31","Close":56.56,"Ticker":"4ALFEN","x":1706659200000,"y":56.56},{"Date":"2024-02-01","Close":55.04,"Ticker":"4ALFEN","x":1706745600000,"y":55.04},{"Date":"2024-02-02","Close":54.26,"Ticker":"4ALFEN","x":1706832000000,"y":54.26},{"Date":"2024-02-05","Close":52.04,"Ticker":"4ALFEN","x":1707091200000,"y":52.04},{"Date":"2024-02-06","Close":50.44,"Ticker":"4ALFEN","x":1707177600000,"y":50.44},{"Date":"2024-02-07","Close":50.32,"Ticker":"4ALFEN","x":1707264000000,"y":50.32},{"Date":"2024-02-08","Close":52.7,"Ticker":"4ALFEN","x":1707350400000,"y":52.7},{"Date":"2024-02-09","Close":53.34,"Ticker":"4ALFEN","x":1707436800000,"y":53.34},{"Date":"2024-02-12","Close":56.78,"Ticker":"4ALFEN","x":1707696000000,"y":56.78},{"Date":"2024-02-13","Close":57.48,"Ticker":"4ALFEN","x":1707782400000,"y":57.48},{"Date":"2024-02-14","Close":62.5,"Ticker":"4ALFEN","x":1707868800000,"y":62.5},{"Date":"2024-02-15","Close":61.38,"Ticker":"4ALFEN","x":1707955200000,"y":61.38},{"Date":"2024-02-16","Close":57,"Ticker":"4ALFEN","x":1708041600000,"y":57},{"Date":"2024-02-19","Close":54.84,"Ticker":"4ALFEN","x":1708300800000,"y":54.84},{"Date":"2024-02-20","Close":54.3,"Ticker":"4ALFEN","x":1708387200000,"y":54.3},{"Date":"2024-02-21","Close":55.32,"Ticker":"4ALFEN","x":1708473600000,"y":55.32}],"type":"line"},{"name":"AAX","data":[{"Date":"2023-02-22","Close":1035.07,"Ticker":"AAX","x":1677024000000,"y":1035.07},{"Date":"2023-02-23","Close":1034.46,"Ticker":"AAX","x":1677110400000,"y":1034.46},{"Date":"2023-02-24","Close":1023.29,"Ticker":"AAX","x":1677196800000,"y":1023.29},{"Date":"2023-02-27","Close":1037.52,"Ticker":"AAX","x":1677456000000,"y":1037.52},{"Date":"2023-02-28","Close":1032.91,"Ticker":"AAX","x":1677542400000,"y":1032.91},{"Date":"2023-03-01","Close":1030.33,"Ticker":"AAX","x":1677628800000,"y":1030.33},{"Date":"2023-03-02","Close":1037.47,"Ticker":"AAX","x":1677715200000,"y":1037.47},{"Date":"2023-03-03","Close":1044.71,"Ticker":"AAX","x":1677801600000,"y":1044.71},{"Date":"2023-03-06","Close":1044.02,"Ticker":"AAX","x":1678060800000,"y":1044.02},{"Date":"2023-03-07","Close":1031.97,"Ticker":"AAX","x":1678147200000,"y":1031.97},{"Date":"2023-03-08","Close":1034.41,"Ticker":"AAX","x":1678233600000,"y":1034.41},{"Date":"2023-03-09","Close":1032.03,"Ticker":"AAX","x":1678320000000,"y":1032.03},{"Date":"2023-03-10","Close":1018.99,"Ticker":"AAX","x":1678406400000,"y":1018.99},{"Date":"2023-03-13","Close":995.55,"Ticker":"AAX","x":1678665600000,"y":995.55},{"Date":"2023-03-14","Close":1009.77,"Ticker":"AAX","x":1678752000000,"y":1009.77},{"Date":"2023-03-15","Close":978.69,"Ticker":"AAX","x":1678838400000,"y":978.69},{"Date":"2023-03-16","Close":992.74,"Ticker":"AAX","x":1678924800000,"y":992.74},{"Date":"2023-03-17","Close":986.63,"Ticker":"AAX","x":1679011200000,"y":986.63},{"Date":"2023-03-20","Close":995.13,"Ticker":"AAX","x":1679270400000,"y":995.13},{"Date":"2023-03-21","Close":1004.15,"Ticker":"AAX","x":1679356800000,"y":1004.15},{"Date":"2023-03-22","Close":1010.61,"Ticker":"AAX","x":1679443200000,"y":1010.61},{"Date":"2023-03-23","Close":1017.66,"Ticker":"AAX","x":1679529600000,"y":1017.66},{"Date":"2023-03-24","Close":999.82,"Ticker":"AAX","x":1679616000000,"y":999.82},{"Date":"2023-03-27","Close":1002.07,"Ticker":"AAX","x":1679875200000,"y":1002.07},{"Date":"2023-03-28","Close":1000.84,"Ticker":"AAX","x":1679961600000,"y":1000.84},{"Date":"2023-03-29","Close":1019.47,"Ticker":"AAX","x":1680048000000,"y":1019.47},{"Date":"2023-03-30","Close":1029.14,"Ticker":"AAX","x":1680134400000,"y":1029.14},{"Date":"2023-03-31","Close":1034.13,"Ticker":"AAX","x":1680220800000,"y":1034.13},{"Date":"2023-04-03","Close":1035.3,"Ticker":"AAX","x":1680480000000,"y":1035.3},{"Date":"2023-04-04","Close":1033.63,"Ticker":"AAX","x":1680566400000,"y":1033.63},{"Date":"2023-04-05","Close":1026.19,"Ticker":"AAX","x":1680652800000,"y":1026.19},{"Date":"2023-04-06","Close":1030.7,"Ticker":"AAX","x":1680739200000,"y":1030.7},{"Date":"2023-04-11","Close":1035.25,"Ticker":"AAX","x":1681171200000,"y":1035.25},{"Date":"2023-04-12","Close":1026.76,"Ticker":"AAX","x":1681257600000,"y":1026.76},{"Date":"2023-04-13","Close":1029.69,"Ticker":"AAX","x":1681344000000,"y":1029.69},{"Date":"2023-04-14","Close":1033.05,"Ticker":"AAX","x":1681430400000,"y":1033.05},{"Date":"2023-04-17","Close":1028.97,"Ticker":"AAX","x":1681689600000,"y":1028.97},{"Date":"2023-04-18","Close":1034.97,"Ticker":"AAX","x":1681776000000,"y":1034.97},{"Date":"2023-04-19","Close":1029.16,"Ticker":"AAX","x":1681862400000,"y":1029.16},{"Date":"2023-04-20","Close":1028.31,"Ticker":"AAX","x":1681948800000,"y":1028.31},{"Date":"2023-04-21","Close":1028.71,"Ticker":"AAX","x":1682035200000,"y":1028.71},{"Date":"2023-04-24","Close":1026.06,"Ticker":"AAX","x":1682294400000,"y":1026.06},{"Date":"2023-04-25","Close":1016.85,"Ticker":"AAX","x":1682380800000,"y":1016.85},{"Date":"2023-04-26","Close":1012.67,"Ticker":"AAX","x":1682467200000,"y":1012.67},{"Date":"2023-04-27","Close":1015.38,"Ticker":"AAX","x":1682553600000,"y":1015.38},{"Date":"2023-04-28","Close":1024.66,"Ticker":"AAX","x":1682640000000,"y":1024.66},{"Date":"2023-05-02","Close":1008.02,"Ticker":"AAX","x":1682985600000,"y":1008.02},{"Date":"2023-05-03","Close":1007.47,"Ticker":"AAX","x":1683072000000,"y":1007.47},{"Date":"2023-05-04","Close":1004.72,"Ticker":"AAX","x":1683158400000,"y":1004.72},{"Date":"2023-05-05","Close":1017.88,"Ticker":"AAX","x":1683244800000,"y":1017.88},{"Date":"2023-05-08","Close":1021.17,"Ticker":"AAX","x":1683504000000,"y":1021.17},{"Date":"2023-05-09","Close":1011.28,"Ticker":"AAX","x":1683590400000,"y":1011.28},{"Date":"2023-05-10","Close":1013.83,"Ticker":"AAX","x":1683676800000,"y":1013.83},{"Date":"2023-05-11","Close":1016.59,"Ticker":"AAX","x":1683763200000,"y":1016.59},{"Date":"2023-05-12","Close":1018.84,"Ticker":"AAX","x":1683849600000,"y":1018.84},{"Date":"2023-05-15","Close":1025.56,"Ticker":"AAX","x":1684108800000,"y":1025.56},{"Date":"2023-05-16","Close":1025.05,"Ticker":"AAX","x":1684195200000,"y":1025.05},{"Date":"2023-05-17","Close":1028.26,"Ticker":"AAX","x":1684281600000,"y":1028.26},{"Date":"2023-05-18","Close":1038.36,"Ticker":"AAX","x":1684368000000,"y":1038.36},{"Date":"2023-05-19","Close":1040.39,"Ticker":"AAX","x":1684454400000,"y":1040.39},{"Date":"2023-05-22","Close":1040.98,"Ticker":"AAX","x":1684713600000,"y":1040.98},{"Date":"2023-05-23","Close":1037.36,"Ticker":"AAX","x":1684800000000,"y":1037.36},{"Date":"2023-05-24","Close":1020.95,"Ticker":"AAX","x":1684886400000,"y":1020.95},{"Date":"2023-05-25","Close":1022.27,"Ticker":"AAX","x":1684972800000,"y":1022.27},{"Date":"2023-05-26","Close":1039.13,"Ticker":"AAX","x":1685059200000,"y":1039.13},{"Date":"2023-05-29","Close":1034.18,"Ticker":"AAX","x":1685318400000,"y":1034.18},{"Date":"2023-05-30","Close":1024.51,"Ticker":"AAX","x":1685404800000,"y":1024.51},{"Date":"2023-05-31","Close":1011.59,"Ticker":"AAX","x":1685491200000,"y":1011.59},{"Date":"2023-06-01","Close":1021.66,"Ticker":"AAX","x":1685577600000,"y":1021.66},{"Date":"2023-06-02","Close":1035.09,"Ticker":"AAX","x":1685664000000,"y":1035.09},{"Date":"2023-06-05","Close":1032.59,"Ticker":"AAX","x":1685923200000,"y":1032.59},{"Date":"2023-06-06","Close":1031.76,"Ticker":"AAX","x":1686009600000,"y":1031.76},{"Date":"2023-06-07","Close":1031.36,"Ticker":"AAX","x":1686096000000,"y":1031.36},{"Date":"2023-06-08","Close":1030.13,"Ticker":"AAX","x":1686182400000,"y":1030.13},{"Date":"2023-06-09","Close":1028.93,"Ticker":"AAX","x":1686268800000,"y":1028.93},{"Date":"2023-06-12","Close":1029.93,"Ticker":"AAX","x":1686528000000,"y":1029.93},{"Date":"2023-06-13","Close":1040.8,"Ticker":"AAX","x":1686614400000,"y":1040.8},{"Date":"2023-06-14","Close":1045.33,"Ticker":"AAX","x":1686700800000,"y":1045.33},{"Date":"2023-06-15","Close":1046.54,"Ticker":"AAX","x":1686787200000,"y":1046.54},{"Date":"2023-06-16","Close":1045.46,"Ticker":"AAX","x":1686873600000,"y":1045.46},{"Date":"2023-06-19","Close":1039.76,"Ticker":"AAX","x":1687132800000,"y":1039.76},{"Date":"2023-06-20","Close":1028.69,"Ticker":"AAX","x":1687219200000,"y":1028.69},{"Date":"2023-06-21","Close":1022.59,"Ticker":"AAX","x":1687305600000,"y":1022.59},{"Date":"2023-06-22","Close":1022.11,"Ticker":"AAX","x":1687392000000,"y":1022.11},{"Date":"2023-06-23","Close":1016.55,"Ticker":"AAX","x":1687478400000,"y":1016.55},{"Date":"2023-06-26","Close":1017.77,"Ticker":"AAX","x":1687737600000,"y":1017.77},{"Date":"2023-06-27","Close":1023.36,"Ticker":"AAX","x":1687824000000,"y":1023.36},{"Date":"2023-06-28","Close":1033.34,"Ticker":"AAX","x":1687910400000,"y":1033.34},{"Date":"2023-06-29","Close":1034.88,"Ticker":"AAX","x":1687996800000,"y":1034.88},{"Date":"2023-06-30","Close":1040.77,"Ticker":"AAX","x":1688083200000,"y":1040.77},{"Date":"2023-07-03","Close":1045.75,"Ticker":"AAX","x":1688342400000,"y":1045.75},{"Date":"2023-07-04","Close":1049.17,"Ticker":"AAX","x":1688428800000,"y":1049.17},{"Date":"2023-07-05","Close":1036.73,"Ticker":"AAX","x":1688515200000,"y":1036.73},{"Date":"2023-07-06","Close":1012.97,"Ticker":"AAX","x":1688601600000,"y":1012.97},{"Date":"2023-07-07","Close":1016.02,"Ticker":"AAX","x":1688688000000,"y":1016.02},{"Date":"2023-07-10","Close":1019.39,"Ticker":"AAX","x":1688947200000,"y":1019.39},{"Date":"2023-07-11","Close":1020.76,"Ticker":"AAX","x":1689033600000,"y":1020.76},{"Date":"2023-07-12","Close":1038.44,"Ticker":"AAX","x":1689120000000,"y":1038.44},{"Date":"2023-07-13","Close":1048,"Ticker":"AAX","x":1689206400000,"y":1048},{"Date":"2023-07-14","Close":1053.88,"Ticker":"AAX","x":1689292800000,"y":1053.88},{"Date":"2023-07-17","Close":1044.35,"Ticker":"AAX","x":1689552000000,"y":1044.35},{"Date":"2023-07-18","Close":1045.93,"Ticker":"AAX","x":1689638400000,"y":1045.93},{"Date":"2023-07-19","Close":1046.7,"Ticker":"AAX","x":1689724800000,"y":1046.7},{"Date":"2023-07-20","Close":1038.07,"Ticker":"AAX","x":1689811200000,"y":1038.07},{"Date":"2023-07-21","Close":1042.92,"Ticker":"AAX","x":1689897600000,"y":1042.92},{"Date":"2023-07-24","Close":1041.43,"Ticker":"AAX","x":1690156800000,"y":1041.43},{"Date":"2023-07-25","Close":1051.44,"Ticker":"AAX","x":1690243200000,"y":1051.44},{"Date":"2023-07-26","Close":1045.89,"Ticker":"AAX","x":1690329600000,"y":1045.89},{"Date":"2023-07-27","Close":1067.85,"Ticker":"AAX","x":1690416000000,"y":1067.85},{"Date":"2023-07-28","Close":1071.01,"Ticker":"AAX","x":1690502400000,"y":1071.01},{"Date":"2023-07-31","Close":1066.58,"Ticker":"AAX","x":1690761600000,"y":1066.58},{"Date":"2023-08-01","Close":1058.54,"Ticker":"AAX","x":1690848000000,"y":1058.54},{"Date":"2023-08-02","Close":1042.62,"Ticker":"AAX","x":1690934400000,"y":1042.62},{"Date":"2023-08-03","Close":1037.64,"Ticker":"AAX","x":1691020800000,"y":1037.64},{"Date":"2023-08-04","Close":1041.19,"Ticker":"AAX","x":1691107200000,"y":1041.19},{"Date":"2023-08-07","Close":1039.25,"Ticker":"AAX","x":1691366400000,"y":1039.25},{"Date":"2023-08-08","Close":1031.69,"Ticker":"AAX","x":1691452800000,"y":1031.69},{"Date":"2023-08-09","Close":1036.04,"Ticker":"AAX","x":1691539200000,"y":1036.04},{"Date":"2023-08-10","Close":1046.04,"Ticker":"AAX","x":1691625600000,"y":1046.04},{"Date":"2023-08-11","Close":1029.36,"Ticker":"AAX","x":1691712000000,"y":1029.36},{"Date":"2023-08-14","Close":1030.06,"Ticker":"AAX","x":1691971200000,"y":1030.06},{"Date":"2023-08-15","Close":1021.46,"Ticker":"AAX","x":1692057600000,"y":1021.46},{"Date":"2023-08-16","Close":1018.65,"Ticker":"AAX","x":1692144000000,"y":1018.65},{"Date":"2023-08-17","Close":1000.77,"Ticker":"AAX","x":1692230400000,"y":1000.77},{"Date":"2023-08-18","Close":996.21,"Ticker":"AAX","x":1692316800000,"y":996.21},{"Date":"2023-08-21","Close":994.7,"Ticker":"AAX","x":1692576000000,"y":994.7},{"Date":"2023-08-22","Close":1001.35,"Ticker":"AAX","x":1692662400000,"y":1001.35},{"Date":"2023-08-23","Close":1005.56,"Ticker":"AAX","x":1692748800000,"y":1005.56},{"Date":"2023-08-24","Close":995.11,"Ticker":"AAX","x":1692835200000,"y":995.11},{"Date":"2023-08-25","Close":993.24,"Ticker":"AAX","x":1692921600000,"y":993.24},{"Date":"2023-08-28","Close":1005.6,"Ticker":"AAX","x":1693180800000,"y":1005.6},{"Date":"2023-08-29","Close":1011.76,"Ticker":"AAX","x":1693267200000,"y":1011.76},{"Date":"2023-08-30","Close":1009.57,"Ticker":"AAX","x":1693353600000,"y":1009.57},{"Date":"2023-08-31","Close":1008.34,"Ticker":"AAX","x":1693440000000,"y":1008.34},{"Date":"2023-09-01","Close":1012.08,"Ticker":"AAX","x":1693526400000,"y":1012.08},{"Date":"2023-09-04","Close":1013.13,"Ticker":"AAX","x":1693785600000,"y":1013.13},{"Date":"2023-09-05","Close":1012.75,"Ticker":"AAX","x":1693872000000,"y":1012.75},{"Date":"2023-09-06","Close":1011.54,"Ticker":"AAX","x":1693958400000,"y":1011.54},{"Date":"2023-09-07","Close":1000.6,"Ticker":"AAX","x":1694044800000,"y":1000.6},{"Date":"2023-09-08","Close":999.52,"Ticker":"AAX","x":1694131200000,"y":999.52},{"Date":"2023-09-11","Close":1000.01,"Ticker":"AAX","x":1694390400000,"y":1000.01},{"Date":"2023-09-12","Close":997.65,"Ticker":"AAX","x":1694476800000,"y":997.65},{"Date":"2023-09-13","Close":994.06,"Ticker":"AAX","x":1694563200000,"y":994.06},{"Date":"2023-09-14","Close":1006.75,"Ticker":"AAX","x":1694649600000,"y":1006.75},{"Date":"2023-09-15","Close":1001.91,"Ticker":"AAX","x":1694736000000,"y":1001.91},{"Date":"2023-09-18","Close":994.29,"Ticker":"AAX","x":1694995200000,"y":994.29},{"Date":"2023-09-19","Close":994.17,"Ticker":"AAX","x":1695081600000,"y":994.17},{"Date":"2023-09-20","Close":998.55,"Ticker":"AAX","x":1695168000000,"y":998.55},{"Date":"2023-09-21","Close":988.83,"Ticker":"AAX","x":1695254400000,"y":988.83},{"Date":"2023-09-22","Close":988.52,"Ticker":"AAX","x":1695340800000,"y":988.52},{"Date":"2023-09-25","Close":983.44,"Ticker":"AAX","x":1695600000000,"y":983.44},{"Date":"2023-09-26","Close":975.6,"Ticker":"AAX","x":1695686400000,"y":975.6},{"Date":"2023-09-27","Close":977.02,"Ticker":"AAX","x":1695772800000,"y":977.02},{"Date":"2023-09-28","Close":982.49,"Ticker":"AAX","x":1695859200000,"y":982.49},{"Date":"2023-09-29","Close":986.13,"Ticker":"AAX","x":1695945600000,"y":986.13},{"Date":"2023-10-02","Close":979.29,"Ticker":"AAX","x":1696204800000,"y":979.29},{"Date":"2023-10-03","Close":970.51,"Ticker":"AAX","x":1696291200000,"y":970.51},{"Date":"2023-10-04","Close":971.75,"Ticker":"AAX","x":1696377600000,"y":971.75},{"Date":"2023-10-05","Close":971.76,"Ticker":"AAX","x":1696464000000,"y":971.76},{"Date":"2023-10-06","Close":980.21,"Ticker":"AAX","x":1696550400000,"y":980.21},{"Date":"2023-10-09","Close":979.66,"Ticker":"AAX","x":1696809600000,"y":979.66},{"Date":"2023-10-10","Close":996.79,"Ticker":"AAX","x":1696896000000,"y":996.79},{"Date":"2023-10-11","Close":996.56,"Ticker":"AAX","x":1696982400000,"y":996.56},{"Date":"2023-10-12","Close":1002.49,"Ticker":"AAX","x":1697068800000,"y":1002.49},{"Date":"2023-10-13","Close":990.27,"Ticker":"AAX","x":1697155200000,"y":990.27},{"Date":"2023-10-16","Close":992.03,"Ticker":"AAX","x":1697414400000,"y":992.03},{"Date":"2023-10-17","Close":993.4,"Ticker":"AAX","x":1697500800000,"y":993.4},{"Date":"2023-10-18","Close":981.55,"Ticker":"AAX","x":1697587200000,"y":981.55},{"Date":"2023-10-19","Close":978.65,"Ticker":"AAX","x":1697673600000,"y":978.65},{"Date":"2023-10-20","Close":963.59,"Ticker":"AAX","x":1697760000000,"y":963.59},{"Date":"2023-10-23","Close":966.98,"Ticker":"AAX","x":1698019200000,"y":966.98},{"Date":"2023-10-24","Close":971.69,"Ticker":"AAX","x":1698105600000,"y":971.69},{"Date":"2023-10-25","Close":971.56,"Ticker":"AAX","x":1698192000000,"y":971.56},{"Date":"2023-10-26","Close":968.08,"Ticker":"AAX","x":1698278400000,"y":968.08},{"Date":"2023-10-27","Close":962.7,"Ticker":"AAX","x":1698364800000,"y":962.7},{"Date":"2023-10-30","Close":961.79,"Ticker":"AAX","x":1698624000000,"y":961.79},{"Date":"2023-10-31","Close":968.28,"Ticker":"AAX","x":1698710400000,"y":968.28},{"Date":"2023-11-01","Close":974.18,"Ticker":"AAX","x":1698796800000,"y":974.18},{"Date":"2023-11-02","Close":995.68,"Ticker":"AAX","x":1698883200000,"y":995.68},{"Date":"2023-11-03","Close":998.58,"Ticker":"AAX","x":1698969600000,"y":998.58},{"Date":"2023-11-06","Close":995.28,"Ticker":"AAX","x":1699228800000,"y":995.28},{"Date":"2023-11-07","Close":995.38,"Ticker":"AAX","x":1699315200000,"y":995.38},{"Date":"2023-11-08","Close":994.48,"Ticker":"AAX","x":1699401600000,"y":994.48},{"Date":"2023-11-09","Close":1010.39,"Ticker":"AAX","x":1699488000000,"y":1010.39},{"Date":"2023-11-10","Close":1005.47,"Ticker":"AAX","x":1699574400000,"y":1005.47},{"Date":"2023-11-13","Close":1015.77,"Ticker":"AAX","x":1699833600000,"y":1015.77},{"Date":"2023-11-14","Close":1025.07,"Ticker":"AAX","x":1699920000000,"y":1025.07},{"Date":"2023-11-15","Close":1031.81,"Ticker":"AAX","x":1700006400000,"y":1031.81},{"Date":"2023-11-16","Close":1019.68,"Ticker":"AAX","x":1700092800000,"y":1019.68},{"Date":"2023-11-17","Close":1026.2,"Ticker":"AAX","x":1700179200000,"y":1026.2},{"Date":"2023-11-20","Close":1026.98,"Ticker":"AAX","x":1700438400000,"y":1026.98},{"Date":"2023-11-21","Close":1024.01,"Ticker":"AAX","x":1700524800000,"y":1024.01},{"Date":"2023-11-22","Close":1027.1,"Ticker":"AAX","x":1700611200000,"y":1027.1},{"Date":"2023-11-23","Close":1029.02,"Ticker":"AAX","x":1700697600000,"y":1029.02},{"Date":"2023-11-24","Close":1033.97,"Ticker":"AAX","x":1700784000000,"y":1033.97},{"Date":"2023-11-27","Close":1031.01,"Ticker":"AAX","x":1701043200000,"y":1031.01},{"Date":"2023-11-28","Close":1027.29,"Ticker":"AAX","x":1701129600000,"y":1027.29},{"Date":"2023-11-29","Close":1029.81,"Ticker":"AAX","x":1701216000000,"y":1029.81},{"Date":"2023-11-30","Close":1032.69,"Ticker":"AAX","x":1701302400000,"y":1032.69},{"Date":"2023-12-01","Close":1041.56,"Ticker":"AAX","x":1701388800000,"y":1041.56},{"Date":"2023-12-04","Close":1039.57,"Ticker":"AAX","x":1701648000000,"y":1039.57},{"Date":"2023-12-05","Close":1044.78,"Ticker":"AAX","x":1701734400000,"y":1044.78},{"Date":"2023-12-06","Close":1048.16,"Ticker":"AAX","x":1701820800000,"y":1048.16},{"Date":"2023-12-07","Close":1048.22,"Ticker":"AAX","x":1701907200000,"y":1048.22},{"Date":"2023-12-08","Close":1055.47,"Ticker":"AAX","x":1701993600000,"y":1055.47},{"Date":"2023-12-11","Close":1061.81,"Ticker":"AAX","x":1702252800000,"y":1061.81},{"Date":"2023-12-12","Close":1062.24,"Ticker":"AAX","x":1702339200000,"y":1062.24},{"Date":"2023-12-13","Close":1063.51,"Ticker":"AAX","x":1702425600000,"y":1063.51},{"Date":"2023-12-14","Close":1074.46,"Ticker":"AAX","x":1702512000000,"y":1074.46},{"Date":"2023-12-15","Close":1079.31,"Ticker":"AAX","x":1702598400000,"y":1079.31},{"Date":"2023-12-18","Close":1071.99,"Ticker":"AAX","x":1702857600000,"y":1071.99},{"Date":"2023-12-19","Close":1076.75,"Ticker":"AAX","x":1702944000000,"y":1076.75},{"Date":"2023-12-20","Close":1079.61,"Ticker":"AAX","x":1703030400000,"y":1079.61},{"Date":"2023-12-21","Close":1074.39,"Ticker":"AAX","x":1703116800000,"y":1074.39},{"Date":"2023-12-22","Close":1068.63,"Ticker":"AAX","x":1703203200000,"y":1068.63},{"Date":"2023-12-27","Close":1071.67,"Ticker":"AAX","x":1703635200000,"y":1071.67},{"Date":"2023-12-28","Close":1071.94,"Ticker":"AAX","x":1703721600000,"y":1071.94},{"Date":"2023-12-29","Close":1071.54,"Ticker":"AAX","x":1703808000000,"y":1071.54},{"Date":"2024-01-02","Close":1065.91,"Ticker":"AAX","x":1704153600000,"y":1065.91},{"Date":"2024-01-03","Close":1057.38,"Ticker":"AAX","x":1704240000000,"y":1057.38},{"Date":"2024-01-04","Close":1059.06,"Ticker":"AAX","x":1704326400000,"y":1059.06},{"Date":"2024-01-05","Close":1055.49,"Ticker":"AAX","x":1704412800000,"y":1055.49},{"Date":"2024-01-08","Close":1057.16,"Ticker":"AAX","x":1704672000000,"y":1057.16},{"Date":"2024-01-09","Close":1055.52,"Ticker":"AAX","x":1704758400000,"y":1055.52},{"Date":"2024-01-10","Close":1051.82,"Ticker":"AAX","x":1704844800000,"y":1051.82},{"Date":"2024-01-11","Close":1051.74,"Ticker":"AAX","x":1704931200000,"y":1051.74},{"Date":"2024-01-12","Close":1060.7,"Ticker":"AAX","x":1705017600000,"y":1060.7},{"Date":"2024-01-15","Close":1057.83,"Ticker":"AAX","x":1705276800000,"y":1057.83},{"Date":"2024-01-16","Close":1055.88,"Ticker":"AAX","x":1705363200000,"y":1055.88},{"Date":"2024-01-17","Close":1045.41,"Ticker":"AAX","x":1705449600000,"y":1045.41},{"Date":"2024-01-18","Close":1056.15,"Ticker":"AAX","x":1705536000000,"y":1056.15},{"Date":"2024-01-19","Close":1057.78,"Ticker":"AAX","x":1705622400000,"y":1057.78},{"Date":"2024-01-22","Close":1068.3,"Ticker":"AAX","x":1705881600000,"y":1068.3},{"Date":"2024-01-23","Close":1070.43,"Ticker":"AAX","x":1705968000000,"y":1070.43},{"Date":"2024-01-24","Close":1100.24,"Ticker":"AAX","x":1706054400000,"y":1100.24},{"Date":"2024-01-25","Close":1112.98,"Ticker":"AAX","x":1706140800000,"y":1112.98},{"Date":"2024-01-26","Close":1115.25,"Ticker":"AAX","x":1706227200000,"y":1115.25},{"Date":"2024-01-29","Close":1118.74,"Ticker":"AAX","x":1706486400000,"y":1118.74},{"Date":"2024-01-30","Close":1119.81,"Ticker":"AAX","x":1706572800000,"y":1119.81},{"Date":"2024-01-31","Close":1116.31,"Ticker":"AAX","x":1706659200000,"y":1116.31},{"Date":"2024-02-01","Close":1121.56,"Ticker":"AAX","x":1706745600000,"y":1121.56},{"Date":"2024-02-02","Close":1123.31,"Ticker":"AAX","x":1706832000000,"y":1123.31},{"Date":"2024-02-05","Close":1126.01,"Ticker":"AAX","x":1707091200000,"y":1126.01},{"Date":"2024-02-06","Close":1136.2,"Ticker":"AAX","x":1707177600000,"y":1136.2},{"Date":"2024-02-07","Close":1137.24,"Ticker":"AAX","x":1707264000000,"y":1137.24},{"Date":"2024-02-08","Close":1152.04,"Ticker":"AAX","x":1707350400000,"y":1152.04},{"Date":"2024-02-09","Close":1161.12,"Ticker":"AAX","x":1707436800000,"y":1161.12},{"Date":"2024-02-12","Close":1166.48,"Ticker":"AAX","x":1707696000000,"y":1166.48},{"Date":"2024-02-13","Close":1148.18,"Ticker":"AAX","x":1707782400000,"y":1148.18},{"Date":"2024-02-14","Close":1147.28,"Ticker":"AAX","x":1707868800000,"y":1147.28},{"Date":"2024-02-15","Close":1153.06,"Ticker":"AAX","x":1707955200000,"y":1153.06},{"Date":"2024-02-16","Close":1164.46,"Ticker":"AAX","x":1708041600000,"y":1164.46},{"Date":"2024-02-19","Close":1159.98,"Ticker":"AAX","x":1708300800000,"y":1159.98},{"Date":"2024-02-20","Close":1147.89,"Ticker":"AAX","x":1708387200000,"y":1147.89},{"Date":"2024-02-21","Close":1146.53,"Ticker":"AAX","x":1708473600000,"y":1146.53}],"type":"line"},{"name":"AEX2S","data":[{"Date":"2023-02-22","Close":5.656,"Ticker":"AEX2S","x":1677024000000,"y":5.656},{"Date":"2023-02-23","Close":5.656,"Ticker":"AEX2S","x":1677110400000,"y":5.656},{"Date":"2023-02-24","Close":5.796,"Ticker":"AEX2S","x":1677196800000,"y":5.796},{"Date":"2023-02-27","Close":5.635,"Ticker":"AEX2S","x":1677456000000,"y":5.635},{"Date":"2023-02-28","Close":5.697,"Ticker":"AEX2S","x":1677542400000,"y":5.697},{"Date":"2023-03-01","Close":5.752,"Ticker":"AEX2S","x":1677628800000,"y":5.752},{"Date":"2023-03-02","Close":5.664,"Ticker":"AEX2S","x":1677715200000,"y":5.664},{"Date":"2023-03-03","Close":5.584,"Ticker":"AEX2S","x":1677801600000,"y":5.584},{"Date":"2023-03-06","Close":5.598,"Ticker":"AEX2S","x":1678060800000,"y":5.598},{"Date":"2023-03-07","Close":5.722,"Ticker":"AEX2S","x":1678147200000,"y":5.722},{"Date":"2023-03-08","Close":5.695,"Ticker":"AEX2S","x":1678233600000,"y":5.695},{"Date":"2023-03-09","Close":5.698,"Ticker":"AEX2S","x":1678320000000,"y":5.698},{"Date":"2023-03-10","Close":5.853,"Ticker":"AEX2S","x":1678406400000,"y":5.853},{"Date":"2023-03-13","Close":6.105,"Ticker":"AEX2S","x":1678665600000,"y":6.105},{"Date":"2023-03-14","Close":5.934,"Ticker":"AEX2S","x":1678752000000,"y":5.934},{"Date":"2023-03-15","Close":6.274,"Ticker":"AEX2S","x":1678838400000,"y":6.274},{"Date":"2023-03-16","Close":6.089,"Ticker":"AEX2S","x":1678924800000,"y":6.089},{"Date":"2023-03-17","Close":6.168,"Ticker":"AEX2S","x":1679011200000,"y":6.168},{"Date":"2023-03-20","Close":6.058,"Ticker":"AEX2S","x":1679270400000,"y":6.058},{"Date":"2023-03-21","Close":5.941,"Ticker":"AEX2S","x":1679356800000,"y":5.941},{"Date":"2023-03-22","Close":5.851,"Ticker":"AEX2S","x":1679443200000,"y":5.851},{"Date":"2023-03-23","Close":5.824,"Ticker":"AEX2S","x":1679529600000,"y":5.824},{"Date":"2023-03-24","Close":6.01,"Ticker":"AEX2S","x":1679616000000,"y":6.01},{"Date":"2023-03-27","Close":5.947,"Ticker":"AEX2S","x":1679875200000,"y":5.947},{"Date":"2023-03-28","Close":5.982,"Ticker":"AEX2S","x":1679961600000,"y":5.982},{"Date":"2023-03-29","Close":5.792,"Ticker":"AEX2S","x":1680048000000,"y":5.792},{"Date":"2023-03-30","Close":5.682,"Ticker":"AEX2S","x":1680134400000,"y":5.682},{"Date":"2023-03-31","Close":5.627,"Ticker":"AEX2S","x":1680220800000,"y":5.627},{"Date":"2023-04-03","Close":5.597,"Ticker":"AEX2S","x":1680480000000,"y":5.597},{"Date":"2023-04-04","Close":5.599,"Ticker":"AEX2S","x":1680566400000,"y":5.599},{"Date":"2023-04-05","Close":5.639,"Ticker":"AEX2S","x":1680652800000,"y":5.639},{"Date":"2023-04-06","Close":5.58,"Ticker":"AEX2S","x":1680739200000,"y":5.58},{"Date":"2023-04-11","Close":5.535,"Ticker":"AEX2S","x":1681171200000,"y":5.535},{"Date":"2023-04-12","Close":5.591,"Ticker":"AEX2S","x":1681257600000,"y":5.591},{"Date":"2023-04-13","Close":5.577,"Ticker":"AEX2S","x":1681344000000,"y":5.577},{"Date":"2023-04-14","Close":5.554,"Ticker":"AEX2S","x":1681430400000,"y":5.554},{"Date":"2023-04-17","Close":5.6,"Ticker":"AEX2S","x":1681689600000,"y":5.6},{"Date":"2023-04-18","Close":5.533,"Ticker":"AEX2S","x":1681776000000,"y":5.533},{"Date":"2023-04-19","Close":5.576,"Ticker":"AEX2S","x":1681862400000,"y":5.576},{"Date":"2023-04-20","Close":5.565,"Ticker":"AEX2S","x":1681948800000,"y":5.565},{"Date":"2023-04-21","Close":5.546,"Ticker":"AEX2S","x":1682035200000,"y":5.546},{"Date":"2023-04-24","Close":5.542,"Ticker":"AEX2S","x":1682294400000,"y":5.542},{"Date":"2023-04-25","Close":5.641,"Ticker":"AEX2S","x":1682380800000,"y":5.641},{"Date":"2023-04-26","Close":5.71,"Ticker":"AEX2S","x":1682467200000,"y":5.71},{"Date":"2023-04-27","Close":5.653,"Ticker":"AEX2S","x":1682553600000,"y":5.653},{"Date":"2023-04-28","Close":5.555,"Ticker":"AEX2S","x":1682640000000,"y":5.555},{"Date":"2023-05-02","Close":5.768,"Ticker":"AEX2S","x":1682985600000,"y":5.768},{"Date":"2023-05-03","Close":5.771,"Ticker":"AEX2S","x":1683072000000,"y":5.771},{"Date":"2023-05-04","Close":5.819,"Ticker":"AEX2S","x":1683158400000,"y":5.819},{"Date":"2023-05-05","Close":5.675,"Ticker":"AEX2S","x":1683244800000,"y":5.675},{"Date":"2023-05-08","Close":5.645,"Ticker":"AEX2S","x":1683504000000,"y":5.645},{"Date":"2023-05-09","Close":5.711,"Ticker":"AEX2S","x":1683590400000,"y":5.711},{"Date":"2023-05-10","Close":5.714,"Ticker":"AEX2S","x":1683676800000,"y":5.714},{"Date":"2023-05-11","Close":5.661,"Ticker":"AEX2S","x":1683763200000,"y":5.661},{"Date":"2023-05-12","Close":5.63,"Ticker":"AEX2S","x":1683849600000,"y":5.63},{"Date":"2023-05-15","Close":5.584,"Ticker":"AEX2S","x":1684108800000,"y":5.584},{"Date":"2023-05-16","Close":5.585,"Ticker":"AEX2S","x":1684195200000,"y":5.585},{"Date":"2023-05-17","Close":5.554,"Ticker":"AEX2S","x":1684281600000,"y":5.554},{"Date":"2023-05-18","Close":5.422,"Ticker":"AEX2S","x":1684368000000,"y":5.422},{"Date":"2023-05-19","Close":5.398,"Ticker":"AEX2S","x":1684454400000,"y":5.398},{"Date":"2023-05-22","Close":5.393,"Ticker":"AEX2S","x":1684713600000,"y":5.393},{"Date":"2023-05-23","Close":5.418,"Ticker":"AEX2S","x":1684800000000,"y":5.418},{"Date":"2023-05-24","Close":5.586,"Ticker":"AEX2S","x":1684886400000,"y":5.586},{"Date":"2023-05-25","Close":5.572,"Ticker":"AEX2S","x":1684972800000,"y":5.572},{"Date":"2023-05-26","Close":5.387,"Ticker":"AEX2S","x":1685059200000,"y":5.387},{"Date":"2023-05-29","Close":5.441,"Ticker":"AEX2S","x":1685318400000,"y":5.441},{"Date":"2023-05-30","Close":5.548,"Ticker":"AEX2S","x":1685404800000,"y":5.548},{"Date":"2023-05-31","Close":5.664,"Ticker":"AEX2S","x":1685491200000,"y":5.664},{"Date":"2023-06-01","Close":5.552,"Ticker":"AEX2S","x":1685577600000,"y":5.552},{"Date":"2023-06-02","Close":5.423,"Ticker":"AEX2S","x":1685664000000,"y":5.423},{"Date":"2023-06-05","Close":5.45,"Ticker":"AEX2S","x":1685923200000,"y":5.45},{"Date":"2023-06-06","Close":5.461,"Ticker":"AEX2S","x":1686009600000,"y":5.461},{"Date":"2023-06-07","Close":5.471,"Ticker":"AEX2S","x":1686096000000,"y":5.471},{"Date":"2023-06-08","Close":5.482,"Ticker":"AEX2S","x":1686182400000,"y":5.482},{"Date":"2023-06-09","Close":5.507,"Ticker":"AEX2S","x":1686268800000,"y":5.507},{"Date":"2023-06-12","Close":5.496,"Ticker":"AEX2S","x":1686528000000,"y":5.496},{"Date":"2023-06-13","Close":5.391,"Ticker":"AEX2S","x":1686614400000,"y":5.391},{"Date":"2023-06-14","Close":5.341,"Ticker":"AEX2S","x":1686700800000,"y":5.341},{"Date":"2023-06-15","Close":5.325,"Ticker":"AEX2S","x":1686787200000,"y":5.325},{"Date":"2023-06-16","Close":5.325,"Ticker":"AEX2S","x":1686873600000,"y":5.325},{"Date":"2023-06-19","Close":5.381,"Ticker":"AEX2S","x":1687132800000,"y":5.381},{"Date":"2023-06-20","Close":5.464,"Ticker":"AEX2S","x":1687219200000,"y":5.464},{"Date":"2023-06-21","Close":5.522,"Ticker":"AEX2S","x":1687305600000,"y":5.522},{"Date":"2023-06-22","Close":5.523,"Ticker":"AEX2S","x":1687392000000,"y":5.523},{"Date":"2023-06-23","Close":5.562,"Ticker":"AEX2S","x":1687478400000,"y":5.562},{"Date":"2023-06-26","Close":5.554,"Ticker":"AEX2S","x":1687737600000,"y":5.554},{"Date":"2023-06-27","Close":5.51,"Ticker":"AEX2S","x":1687824000000,"y":5.51},{"Date":"2023-06-28","Close":5.407,"Ticker":"AEX2S","x":1687910400000,"y":5.407},{"Date":"2023-06-29","Close":5.392,"Ticker":"AEX2S","x":1687996800000,"y":5.392},{"Date":"2023-06-30","Close":5.324,"Ticker":"AEX2S","x":1688083200000,"y":5.324},{"Date":"2023-07-03","Close":5.29,"Ticker":"AEX2S","x":1688342400000,"y":5.29},{"Date":"2023-07-04","Close":5.26,"Ticker":"AEX2S","x":1688428800000,"y":5.26},{"Date":"2023-07-05","Close":5.381,"Ticker":"AEX2S","x":1688515200000,"y":5.381},{"Date":"2023-07-06","Close":5.614,"Ticker":"AEX2S","x":1688601600000,"y":5.614},{"Date":"2023-07-07","Close":5.613,"Ticker":"AEX2S","x":1688688000000,"y":5.613},{"Date":"2023-07-10","Close":5.584,"Ticker":"AEX2S","x":1688947200000,"y":5.584},{"Date":"2023-07-11","Close":5.585,"Ticker":"AEX2S","x":1689033600000,"y":5.585},{"Date":"2023-07-12","Close":5.404,"Ticker":"AEX2S","x":1689120000000,"y":5.404},{"Date":"2023-07-13","Close":5.312,"Ticker":"AEX2S","x":1689206400000,"y":5.312},{"Date":"2023-07-14","Close":5.257,"Ticker":"AEX2S","x":1689292800000,"y":5.257},{"Date":"2023-07-17","Close":5.335,"Ticker":"AEX2S","x":1689552000000,"y":5.335},{"Date":"2023-07-18","Close":5.322,"Ticker":"AEX2S","x":1689638400000,"y":5.322},{"Date":"2023-07-19","Close":5.316,"Ticker":"AEX2S","x":1689724800000,"y":5.316},{"Date":"2023-07-20","Close":5.392,"Ticker":"AEX2S","x":1689811200000,"y":5.392},{"Date":"2023-07-21","Close":5.335,"Ticker":"AEX2S","x":1689897600000,"y":5.335},{"Date":"2023-07-24","Close":5.37,"Ticker":"AEX2S","x":1690156800000,"y":5.37},{"Date":"2023-07-25","Close":5.256,"Ticker":"AEX2S","x":1690243200000,"y":5.256},{"Date":"2023-07-26","Close":5.314,"Ticker":"AEX2S","x":1690329600000,"y":5.314},{"Date":"2023-07-27","Close":5.088,"Ticker":"AEX2S","x":1690416000000,"y":5.088},{"Date":"2023-07-28","Close":5.061,"Ticker":"AEX2S","x":1690502400000,"y":5.061},{"Date":"2023-07-31","Close":5.094,"Ticker":"AEX2S","x":1690761600000,"y":5.094},{"Date":"2023-08-01","Close":5.168,"Ticker":"AEX2S","x":1690848000000,"y":5.168},{"Date":"2023-08-02","Close":5.313,"Ticker":"AEX2S","x":1690934400000,"y":5.313},{"Date":"2023-08-03","Close":5.364,"Ticker":"AEX2S","x":1691020800000,"y":5.364},{"Date":"2023-08-04","Close":5.328,"Ticker":"AEX2S","x":1691107200000,"y":5.328},{"Date":"2023-08-07","Close":5.324,"Ticker":"AEX2S","x":1691366400000,"y":5.324},{"Date":"2023-08-08","Close":5.396,"Ticker":"AEX2S","x":1691452800000,"y":5.396},{"Date":"2023-08-09","Close":5.353,"Ticker":"AEX2S","x":1691539200000,"y":5.353},{"Date":"2023-08-10","Close":5.231,"Ticker":"AEX2S","x":1691625600000,"y":5.231},{"Date":"2023-08-11","Close":5.397,"Ticker":"AEX2S","x":1691712000000,"y":5.397},{"Date":"2023-08-14","Close":5.386,"Ticker":"AEX2S","x":1691971200000,"y":5.386},{"Date":"2023-08-15","Close":5.486,"Ticker":"AEX2S","x":1692057600000,"y":5.486},{"Date":"2023-08-16","Close":5.519,"Ticker":"AEX2S","x":1692144000000,"y":5.519},{"Date":"2023-08-17","Close":5.801,"Ticker":"AEX2S","x":1692230400000,"y":5.801},{"Date":"2023-08-18","Close":5.843,"Ticker":"AEX2S","x":1692316800000,"y":5.843},{"Date":"2023-08-21","Close":5.872,"Ticker":"AEX2S","x":1692576000000,"y":5.872},{"Date":"2023-08-22","Close":5.799,"Ticker":"AEX2S","x":1692662400000,"y":5.799},{"Date":"2023-08-23","Close":5.761,"Ticker":"AEX2S","x":1692748800000,"y":5.761},{"Date":"2023-08-24","Close":5.868,"Ticker":"AEX2S","x":1692835200000,"y":5.868},{"Date":"2023-08-25","Close":5.88,"Ticker":"AEX2S","x":1692921600000,"y":5.88},{"Date":"2023-08-28","Close":5.75,"Ticker":"AEX2S","x":1693180800000,"y":5.75},{"Date":"2023-08-29","Close":5.682,"Ticker":"AEX2S","x":1693267200000,"y":5.682},{"Date":"2023-08-30","Close":5.69,"Ticker":"AEX2S","x":1693353600000,"y":5.69},{"Date":"2023-08-31","Close":5.716,"Ticker":"AEX2S","x":1693440000000,"y":5.716},{"Date":"2023-09-01","Close":5.68,"Ticker":"AEX2S","x":1693526400000,"y":5.68},{"Date":"2023-09-04","Close":5.664,"Ticker":"AEX2S","x":1693785600000,"y":5.664},{"Date":"2023-09-05","Close":5.671,"Ticker":"AEX2S","x":1693872000000,"y":5.671},{"Date":"2023-09-06","Close":5.696,"Ticker":"AEX2S","x":1693958400000,"y":5.696},{"Date":"2023-09-07","Close":5.785,"Ticker":"AEX2S","x":1694044800000,"y":5.785},{"Date":"2023-09-08","Close":5.796,"Ticker":"AEX2S","x":1694131200000,"y":5.796},{"Date":"2023-09-11","Close":5.804,"Ticker":"AEX2S","x":1694390400000,"y":5.804},{"Date":"2023-09-12","Close":5.841,"Ticker":"AEX2S","x":1694476800000,"y":5.841},{"Date":"2023-09-13","Close":5.87,"Ticker":"AEX2S","x":1694563200000,"y":5.87},{"Date":"2023-09-14","Close":5.72,"Ticker":"AEX2S","x":1694649600000,"y":5.72},{"Date":"2023-09-15","Close":5.767,"Ticker":"AEX2S","x":1694736000000,"y":5.767},{"Date":"2023-09-18","Close":5.86,"Ticker":"AEX2S","x":1694995200000,"y":5.86},{"Date":"2023-09-19","Close":5.876,"Ticker":"AEX2S","x":1695081600000,"y":5.876},{"Date":"2023-09-20","Close":5.824,"Ticker":"AEX2S","x":1695168000000,"y":5.824},{"Date":"2023-09-21","Close":5.93,"Ticker":"AEX2S","x":1695254400000,"y":5.93},{"Date":"2023-09-22","Close":5.958,"Ticker":"AEX2S","x":1695340800000,"y":5.958},{"Date":"2023-09-25","Close":6.02,"Ticker":"AEX2S","x":1695600000000,"y":6.02},{"Date":"2023-09-26","Close":6.108,"Ticker":"AEX2S","x":1695686400000,"y":6.108},{"Date":"2023-09-27","Close":6.105,"Ticker":"AEX2S","x":1695772800000,"y":6.105},{"Date":"2023-09-28","Close":6.035,"Ticker":"AEX2S","x":1695859200000,"y":6.035},{"Date":"2023-09-29","Close":5.99,"Ticker":"AEX2S","x":1695945600000,"y":5.99},{"Date":"2023-10-02","Close":6.071,"Ticker":"AEX2S","x":1696204800000,"y":6.071},{"Date":"2023-10-03","Close":6.149,"Ticker":"AEX2S","x":1696291200000,"y":6.149},{"Date":"2023-10-04","Close":6.128,"Ticker":"AEX2S","x":1696377600000,"y":6.128},{"Date":"2023-10-05","Close":6.115,"Ticker":"AEX2S","x":1696464000000,"y":6.115},{"Date":"2023-10-06","Close":6.033,"Ticker":"AEX2S","x":1696550400000,"y":6.033},{"Date":"2023-10-09","Close":6.05,"Ticker":"AEX2S","x":1696809600000,"y":6.05},{"Date":"2023-10-10","Close":5.837,"Ticker":"AEX2S","x":1696896000000,"y":5.837},{"Date":"2023-10-11","Close":5.856,"Ticker":"AEX2S","x":1696982400000,"y":5.856},{"Date":"2023-10-12","Close":5.799,"Ticker":"AEX2S","x":1697068800000,"y":5.799},{"Date":"2023-10-13","Close":5.92,"Ticker":"AEX2S","x":1697155200000,"y":5.92},{"Date":"2023-10-16","Close":5.901,"Ticker":"AEX2S","x":1697414400000,"y":5.901},{"Date":"2023-10-17","Close":5.881,"Ticker":"AEX2S","x":1697500800000,"y":5.881},{"Date":"2023-10-18","Close":5.998,"Ticker":"AEX2S","x":1697587200000,"y":5.998},{"Date":"2023-10-19","Close":6.032,"Ticker":"AEX2S","x":1697673600000,"y":6.032},{"Date":"2023-10-20","Close":6.222,"Ticker":"AEX2S","x":1697760000000,"y":6.222},{"Date":"2023-10-23","Close":6.177,"Ticker":"AEX2S","x":1698019200000,"y":6.177},{"Date":"2023-10-24","Close":6.135,"Ticker":"AEX2S","x":1698105600000,"y":6.135},{"Date":"2023-10-25","Close":6.129,"Ticker":"AEX2S","x":1698192000000,"y":6.129},{"Date":"2023-10-26","Close":6.18,"Ticker":"AEX2S","x":1698278400000,"y":6.18},{"Date":"2023-10-27","Close":6.269,"Ticker":"AEX2S","x":1698364800000,"y":6.269},{"Date":"2023-10-30","Close":6.277,"Ticker":"AEX2S","x":1698624000000,"y":6.277},{"Date":"2023-10-31","Close":6.199,"Ticker":"AEX2S","x":1698710400000,"y":6.199},{"Date":"2023-11-01","Close":6.134,"Ticker":"AEX2S","x":1698796800000,"y":6.134},{"Date":"2023-11-02","Close":5.9,"Ticker":"AEX2S","x":1698883200000,"y":5.9},{"Date":"2023-11-03","Close":5.897,"Ticker":"AEX2S","x":1698969600000,"y":5.897},{"Date":"2023-11-06","Close":5.918,"Ticker":"AEX2S","x":1699228800000,"y":5.918},{"Date":"2023-11-07","Close":5.913,"Ticker":"AEX2S","x":1699315200000,"y":5.913},{"Date":"2023-11-08","Close":5.933,"Ticker":"AEX2S","x":1699401600000,"y":5.933},{"Date":"2023-11-09","Close":5.7,"Ticker":"AEX2S","x":1699488000000,"y":5.7},{"Date":"2023-11-10","Close":5.746,"Ticker":"AEX2S","x":1699574400000,"y":5.746},{"Date":"2023-11-13","Close":5.64,"Ticker":"AEX2S","x":1699833600000,"y":5.64},{"Date":"2023-11-14","Close":5.571,"Ticker":"AEX2S","x":1699920000000,"y":5.571},{"Date":"2023-11-15","Close":5.504,"Ticker":"AEX2S","x":1700006400000,"y":5.504},{"Date":"2023-11-16","Close":5.602,"Ticker":"AEX2S","x":1700092800000,"y":5.602},{"Date":"2023-11-17","Close":5.534,"Ticker":"AEX2S","x":1700179200000,"y":5.534},{"Date":"2023-11-20","Close":5.526,"Ticker":"AEX2S","x":1700438400000,"y":5.526},{"Date":"2023-11-21","Close":5.541,"Ticker":"AEX2S","x":1700524800000,"y":5.541},{"Date":"2023-11-22","Close":5.521,"Ticker":"AEX2S","x":1700611200000,"y":5.521},{"Date":"2023-11-23","Close":5.49,"Ticker":"AEX2S","x":1700697600000,"y":5.49},{"Date":"2023-11-24","Close":5.444,"Ticker":"AEX2S","x":1700784000000,"y":5.444},{"Date":"2023-11-27","Close":5.469,"Ticker":"AEX2S","x":1701043200000,"y":5.469},{"Date":"2023-11-28","Close":5.512,"Ticker":"AEX2S","x":1701129600000,"y":5.512},{"Date":"2023-11-29","Close":5.505,"Ticker":"AEX2S","x":1701216000000,"y":5.505},{"Date":"2023-11-30","Close":5.462,"Ticker":"AEX2S","x":1701302400000,"y":5.462},{"Date":"2023-12-01","Close":5.374,"Ticker":"AEX2S","x":1701388800000,"y":5.374},{"Date":"2023-12-04","Close":5.389,"Ticker":"AEX2S","x":1701648000000,"y":5.389},{"Date":"2023-12-05","Close":5.343,"Ticker":"AEX2S","x":1701734400000,"y":5.343},{"Date":"2023-12-06","Close":5.315,"Ticker":"AEX2S","x":1701820800000,"y":5.315},{"Date":"2023-12-07","Close":5.315,"Ticker":"AEX2S","x":1701907200000,"y":5.315},{"Date":"2023-12-08","Close":5.241,"Ticker":"AEX2S","x":1701993600000,"y":5.241},{"Date":"2023-12-11","Close":5.184,"Ticker":"AEX2S","x":1702252800000,"y":5.184},{"Date":"2023-12-12","Close":5.19,"Ticker":"AEX2S","x":1702339200000,"y":5.19},{"Date":"2023-12-13","Close":5.18,"Ticker":"AEX2S","x":1702425600000,"y":5.18},{"Date":"2023-12-14","Close":5.143,"Ticker":"AEX2S","x":1702512000000,"y":5.143},{"Date":"2023-12-15","Close":5.103,"Ticker":"AEX2S","x":1702598400000,"y":5.103},{"Date":"2023-12-18","Close":5.159,"Ticker":"AEX2S","x":1702857600000,"y":5.159},{"Date":"2023-12-19","Close":5.117,"Ticker":"AEX2S","x":1702944000000,"y":5.117},{"Date":"2023-12-20","Close":5.103,"Ticker":"AEX2S","x":1703030400000,"y":5.103},{"Date":"2023-12-21","Close":5.154,"Ticker":"AEX2S","x":1703116800000,"y":5.154},{"Date":"2023-12-22","Close":5.213,"Ticker":"AEX2S","x":1703203200000,"y":5.213},{"Date":"2023-12-27","Close":5.203,"Ticker":"AEX2S","x":1703635200000,"y":5.203},{"Date":"2023-12-28","Close":5.202,"Ticker":"AEX2S","x":1703721600000,"y":5.202},{"Date":"2023-12-29","Close":5.206,"Ticker":"AEX2S","x":1703808000000,"y":5.206},{"Date":"2024-01-02","Close":5.262,"Ticker":"AEX2S","x":1704153600000,"y":5.262},{"Date":"2024-01-03","Close":5.309,"Ticker":"AEX2S","x":1704240000000,"y":5.309},{"Date":"2024-01-04","Close":5.303,"Ticker":"AEX2S","x":1704326400000,"y":5.303},{"Date":"2024-01-05","Close":5.326,"Ticker":"AEX2S","x":1704412800000,"y":5.326},{"Date":"2024-01-08","Close":5.326,"Ticker":"AEX2S","x":1704672000000,"y":5.326},{"Date":"2024-01-09","Close":5.348,"Ticker":"AEX2S","x":1704758400000,"y":5.348},{"Date":"2024-01-10","Close":5.385,"Ticker":"AEX2S","x":1704844800000,"y":5.385},{"Date":"2024-01-11","Close":5.394,"Ticker":"AEX2S","x":1704931200000,"y":5.394},{"Date":"2024-01-12","Close":5.293,"Ticker":"AEX2S","x":1705017600000,"y":5.293},{"Date":"2024-01-15","Close":5.331,"Ticker":"AEX2S","x":1705276800000,"y":5.331},{"Date":"2024-01-16","Close":5.345,"Ticker":"AEX2S","x":1705363200000,"y":5.345},{"Date":"2024-01-17","Close":5.445,"Ticker":"AEX2S","x":1705449600000,"y":5.445},{"Date":"2024-01-18","Close":5.351,"Ticker":"AEX2S","x":1705536000000,"y":5.351},{"Date":"2024-01-19","Close":5.343,"Ticker":"AEX2S","x":1705622400000,"y":5.343},{"Date":"2024-01-22","Close":5.256,"Ticker":"AEX2S","x":1705881600000,"y":5.256},{"Date":"2024-01-23","Close":5.228,"Ticker":"AEX2S","x":1705968000000,"y":5.228},{"Date":"2024-01-24","Close":4.976,"Ticker":"AEX2S","x":1706054400000,"y":4.976},{"Date":"2024-01-25","Close":4.879,"Ticker":"AEX2S","x":1706140800000,"y":4.879},{"Date":"2024-01-26","Close":4.847,"Ticker":"AEX2S","x":1706227200000,"y":4.847},{"Date":"2024-01-29","Close":4.825,"Ticker":"AEX2S","x":1706486400000,"y":4.825},{"Date":"2024-01-30","Close":4.818,"Ticker":"AEX2S","x":1706572800000,"y":4.818},{"Date":"2024-01-31","Close":4.848,"Ticker":"AEX2S","x":1706659200000,"y":4.848},{"Date":"2024-02-01","Close":4.804,"Ticker":"AEX2S","x":1706745600000,"y":4.804},{"Date":"2024-02-02","Close":4.8,"Ticker":"AEX2S","x":1706832000000,"y":4.8},{"Date":"2024-02-05","Close":4.781,"Ticker":"AEX2S","x":1707091200000,"y":4.781},{"Date":"2024-02-06","Close":4.704,"Ticker":"AEX2S","x":1707177600000,"y":4.704},{"Date":"2024-02-07","Close":4.716,"Ticker":"AEX2S","x":1707264000000,"y":4.716},{"Date":"2024-02-08","Close":4.563,"Ticker":"AEX2S","x":1707350400000,"y":4.563},{"Date":"2024-02-09","Close":4.478,"Ticker":"AEX2S","x":1707436800000,"y":4.478},{"Date":"2024-02-12","Close":4.449,"Ticker":"AEX2S","x":1707696000000,"y":4.449},{"Date":"2024-02-13","Close":4.578,"Ticker":"AEX2S","x":1707782400000,"y":4.578},{"Date":"2024-02-14","Close":4.568,"Ticker":"AEX2S","x":1707868800000,"y":4.568},{"Date":"2024-02-15","Close":4.513,"Ticker":"AEX2S","x":1707955200000,"y":4.513},{"Date":"2024-02-16","Close":4.402,"Ticker":"AEX2S","x":1708041600000,"y":4.402},{"Date":"2024-02-19","Close":4.429,"Ticker":"AEX2S","x":1708300800000,"y":4.429},{"Date":"2024-02-20","Close":4.509,"Ticker":"AEX2S","x":1708387200000,"y":4.509},{"Date":"2024-02-21","Close":4.526,"Ticker":"AEX2S","x":1708473600000,"y":4.526}],"type":"line"},{"name":"NLBM","data":[{"Date":"2023-02-22","Close":1503.21,"Ticker":"NLBM","x":1677024000000,"y":1503.21},{"Date":"2023-02-23","Close":1502.92,"Ticker":"NLBM","x":1677110400000,"y":1502.92},{"Date":"2023-02-24","Close":1491.54,"Ticker":"NLBM","x":1677196800000,"y":1491.54},{"Date":"2023-02-27","Close":1514.01,"Ticker":"NLBM","x":1677456000000,"y":1514.01},{"Date":"2023-02-28","Close":1518.6,"Ticker":"NLBM","x":1677542400000,"y":1518.6},{"Date":"2023-03-01","Close":1527.36,"Ticker":"NLBM","x":1677628800000,"y":1527.36},{"Date":"2023-03-02","Close":1540.18,"Ticker":"NLBM","x":1677715200000,"y":1540.18},{"Date":"2023-03-03","Close":1574.51,"Ticker":"NLBM","x":1677801600000,"y":1574.51},{"Date":"2023-03-06","Close":1557.77,"Ticker":"NLBM","x":1678060800000,"y":1557.77},{"Date":"2023-03-07","Close":1533.75,"Ticker":"NLBM","x":1678147200000,"y":1533.75},{"Date":"2023-03-08","Close":1550.86,"Ticker":"NLBM","x":1678233600000,"y":1550.86},{"Date":"2023-03-09","Close":1549.44,"Ticker":"NLBM","x":1678320000000,"y":1549.44},{"Date":"2023-03-10","Close":1517,"Ticker":"NLBM","x":1678406400000,"y":1517},{"Date":"2023-03-13","Close":1460.45,"Ticker":"NLBM","x":1678665600000,"y":1460.45},{"Date":"2023-03-14","Close":1487.08,"Ticker":"NLBM","x":1678752000000,"y":1487.08},{"Date":"2023-03-15","Close":1397.38,"Ticker":"NLBM","x":1678838400000,"y":1397.38},{"Date":"2023-03-16","Close":1414.24,"Ticker":"NLBM","x":1678924800000,"y":1414.24},{"Date":"2023-03-17","Close":1392.64,"Ticker":"NLBM","x":1679011200000,"y":1392.64},{"Date":"2023-03-20","Close":1402.38,"Ticker":"NLBM","x":1679270400000,"y":1402.38},{"Date":"2023-03-21","Close":1437.39,"Ticker":"NLBM","x":1679356800000,"y":1437.39},{"Date":"2023-03-22","Close":1433.2,"Ticker":"NLBM","x":1679443200000,"y":1433.2},{"Date":"2023-03-23","Close":1425.57,"Ticker":"NLBM","x":1679529600000,"y":1425.57},{"Date":"2023-03-24","Close":1394.73,"Ticker":"NLBM","x":1679616000000,"y":1394.73},{"Date":"2023-03-27","Close":1406.63,"Ticker":"NLBM","x":1679875200000,"y":1406.63},{"Date":"2023-03-28","Close":1414.44,"Ticker":"NLBM","x":1679961600000,"y":1414.44},{"Date":"2023-03-29","Close":1466.59,"Ticker":"NLBM","x":1680048000000,"y":1466.59},{"Date":"2023-03-30","Close":1490.54,"Ticker":"NLBM","x":1680134400000,"y":1490.54},{"Date":"2023-03-31","Close":1511.06,"Ticker":"NLBM","x":1680220800000,"y":1511.06},{"Date":"2023-04-03","Close":1478.77,"Ticker":"NLBM","x":1680480000000,"y":1478.77},{"Date":"2023-04-04","Close":1451.41,"Ticker":"NLBM","x":1680566400000,"y":1451.41},{"Date":"2023-04-05","Close":1424.32,"Ticker":"NLBM","x":1680652800000,"y":1424.32},{"Date":"2023-04-06","Close":1434.85,"Ticker":"NLBM","x":1680739200000,"y":1434.85},{"Date":"2023-04-11","Close":1469.07,"Ticker":"NLBM","x":1681171200000,"y":1469.07},{"Date":"2023-04-12","Close":1469.24,"Ticker":"NLBM","x":1681257600000,"y":1469.24},{"Date":"2023-04-13","Close":1473.03,"Ticker":"NLBM","x":1681344000000,"y":1473.03},{"Date":"2023-04-14","Close":1475.55,"Ticker":"NLBM","x":1681430400000,"y":1475.55},{"Date":"2023-04-17","Close":1489.78,"Ticker":"NLBM","x":1681689600000,"y":1489.78},{"Date":"2023-04-18","Close":1496.62,"Ticker":"NLBM","x":1681776000000,"y":1496.62},{"Date":"2023-04-19","Close":1481.94,"Ticker":"NLBM","x":1681862400000,"y":1481.94},{"Date":"2023-04-20","Close":1458.35,"Ticker":"NLBM","x":1681948800000,"y":1458.35},{"Date":"2023-04-21","Close":1439.47,"Ticker":"NLBM","x":1682035200000,"y":1439.47},{"Date":"2023-04-24","Close":1426.44,"Ticker":"NLBM","x":1682294400000,"y":1426.44},{"Date":"2023-04-25","Close":1399.02,"Ticker":"NLBM","x":1682380800000,"y":1399.02},{"Date":"2023-04-26","Close":1397.06,"Ticker":"NLBM","x":1682467200000,"y":1397.06},{"Date":"2023-04-27","Close":1399.56,"Ticker":"NLBM","x":1682553600000,"y":1399.56},{"Date":"2023-04-28","Close":1406.7,"Ticker":"NLBM","x":1682640000000,"y":1406.7},{"Date":"2023-05-02","Close":1384.15,"Ticker":"NLBM","x":1682985600000,"y":1384.15},{"Date":"2023-05-03","Close":1400.2,"Ticker":"NLBM","x":1683072000000,"y":1400.2},{"Date":"2023-05-04","Close":1358.35,"Ticker":"NLBM","x":1683158400000,"y":1358.35},{"Date":"2023-05-05","Close":1382.29,"Ticker":"NLBM","x":1683244800000,"y":1382.29},{"Date":"2023-05-08","Close":1394.58,"Ticker":"NLBM","x":1683504000000,"y":1394.58},{"Date":"2023-05-09","Close":1388.71,"Ticker":"NLBM","x":1683590400000,"y":1388.71},{"Date":"2023-05-10","Close":1373.09,"Ticker":"NLBM","x":1683676800000,"y":1373.09},{"Date":"2023-05-11","Close":1357.28,"Ticker":"NLBM","x":1683763200000,"y":1357.28},{"Date":"2023-05-12","Close":1367.55,"Ticker":"NLBM","x":1683849600000,"y":1367.55},{"Date":"2023-05-15","Close":1381.63,"Ticker":"NLBM","x":1684108800000,"y":1381.63},{"Date":"2023-05-16","Close":1373.87,"Ticker":"NLBM","x":1684195200000,"y":1373.87},{"Date":"2023-05-17","Close":1375.33,"Ticker":"NLBM","x":1684281600000,"y":1375.33},{"Date":"2023-05-18","Close":1395.42,"Ticker":"NLBM","x":1684368000000,"y":1395.42},{"Date":"2023-05-19","Close":1392.56,"Ticker":"NLBM","x":1684454400000,"y":1392.56},{"Date":"2023-05-22","Close":1389.97,"Ticker":"NLBM","x":1684713600000,"y":1389.97},{"Date":"2023-05-23","Close":1383.17,"Ticker":"NLBM","x":1684800000000,"y":1383.17},{"Date":"2023-05-24","Close":1358.25,"Ticker":"NLBM","x":1684886400000,"y":1358.25},{"Date":"2023-05-25","Close":1344.02,"Ticker":"NLBM","x":1684972800000,"y":1344.02},{"Date":"2023-05-26","Close":1358.58,"Ticker":"NLBM","x":1685059200000,"y":1358.58},{"Date":"2023-05-29","Close":1355.62,"Ticker":"NLBM","x":1685318400000,"y":1355.62},{"Date":"2023-05-30","Close":1330.26,"Ticker":"NLBM","x":1685404800000,"y":1330.26},{"Date":"2023-05-31","Close":1307.45,"Ticker":"NLBM","x":1685491200000,"y":1307.45},{"Date":"2023-06-01","Close":1327.12,"Ticker":"NLBM","x":1685577600000,"y":1327.12},{"Date":"2023-06-02","Close":1371.35,"Ticker":"NLBM","x":1685664000000,"y":1371.35},{"Date":"2023-06-05","Close":1367.47,"Ticker":"NLBM","x":1685923200000,"y":1367.47},{"Date":"2023-06-06","Close":1368.31,"Ticker":"NLBM","x":1686009600000,"y":1368.31},{"Date":"2023-06-07","Close":1369.28,"Ticker":"NLBM","x":1686096000000,"y":1369.28},{"Date":"2023-06-08","Close":1378.78,"Ticker":"NLBM","x":1686182400000,"y":1378.78},{"Date":"2023-06-09","Close":1362.03,"Ticker":"NLBM","x":1686268800000,"y":1362.03},{"Date":"2023-06-12","Close":1365.34,"Ticker":"NLBM","x":1686528000000,"y":1365.34},{"Date":"2023-06-13","Close":1383.59,"Ticker":"NLBM","x":1686614400000,"y":1383.59},{"Date":"2023-06-14","Close":1389.03,"Ticker":"NLBM","x":1686700800000,"y":1389.03},{"Date":"2023-06-15","Close":1381.7,"Ticker":"NLBM","x":1686787200000,"y":1381.7},{"Date":"2023-06-16","Close":1379.53,"Ticker":"NLBM","x":1686873600000,"y":1379.53},{"Date":"2023-06-19","Close":1360.32,"Ticker":"NLBM","x":1687132800000,"y":1360.32},{"Date":"2023-06-20","Close":1330.68,"Ticker":"NLBM","x":1687219200000,"y":1330.68},{"Date":"2023-06-21","Close":1335.23,"Ticker":"NLBM","x":1687305600000,"y":1335.23},{"Date":"2023-06-22","Close":1337.24,"Ticker":"NLBM","x":1687392000000,"y":1337.24},{"Date":"2023-06-23","Close":1328.92,"Ticker":"NLBM","x":1687478400000,"y":1328.92},{"Date":"2023-06-26","Close":1338.21,"Ticker":"NLBM","x":1687737600000,"y":1338.21},{"Date":"2023-06-27","Close":1338.62,"Ticker":"NLBM","x":1687824000000,"y":1338.62},{"Date":"2023-06-28","Close":1344.5,"Ticker":"NLBM","x":1687910400000,"y":1344.5},{"Date":"2023-06-29","Close":1350.84,"Ticker":"NLBM","x":1687996800000,"y":1350.84},{"Date":"2023-06-30","Close":1356.78,"Ticker":"NLBM","x":1688083200000,"y":1356.78},{"Date":"2023-07-03","Close":1359.27,"Ticker":"NLBM","x":1688342400000,"y":1359.27},{"Date":"2023-07-04","Close":1356,"Ticker":"NLBM","x":1688428800000,"y":1356},{"Date":"2023-07-05","Close":1331.12,"Ticker":"NLBM","x":1688515200000,"y":1331.12},{"Date":"2023-07-06","Close":1293.82,"Ticker":"NLBM","x":1688601600000,"y":1293.82},{"Date":"2023-07-07","Close":1319.35,"Ticker":"NLBM","x":1688688000000,"y":1319.35},{"Date":"2023-07-10","Close":1321.49,"Ticker":"NLBM","x":1688947200000,"y":1321.49},{"Date":"2023-07-11","Close":1340.97,"Ticker":"NLBM","x":1689033600000,"y":1340.97},{"Date":"2023-07-12","Close":1366.92,"Ticker":"NLBM","x":1689120000000,"y":1366.92},{"Date":"2023-07-13","Close":1376.37,"Ticker":"NLBM","x":1689206400000,"y":1376.37},{"Date":"2023-07-14","Close":1364.24,"Ticker":"NLBM","x":1689292800000,"y":1364.24},{"Date":"2023-07-17","Close":1359.17,"Ticker":"NLBM","x":1689552000000,"y":1359.17},{"Date":"2023-07-18","Close":1374.59,"Ticker":"NLBM","x":1689638400000,"y":1374.59},{"Date":"2023-07-19","Close":1374.68,"Ticker":"NLBM","x":1689724800000,"y":1374.68},{"Date":"2023-07-20","Close":1389.95,"Ticker":"NLBM","x":1689811200000,"y":1389.95},{"Date":"2023-07-21","Close":1377.67,"Ticker":"NLBM","x":1689897600000,"y":1377.67},{"Date":"2023-07-24","Close":1390.57,"Ticker":"NLBM","x":1690156800000,"y":1390.57},{"Date":"2023-07-25","Close":1420.07,"Ticker":"NLBM","x":1690243200000,"y":1420.07},{"Date":"2023-07-26","Close":1415.98,"Ticker":"NLBM","x":1690329600000,"y":1415.98},{"Date":"2023-07-27","Close":1419.78,"Ticker":"NLBM","x":1690416000000,"y":1419.78},{"Date":"2023-07-28","Close":1425.99,"Ticker":"NLBM","x":1690502400000,"y":1425.99},{"Date":"2023-07-31","Close":1436.73,"Ticker":"NLBM","x":1690761600000,"y":1436.73},{"Date":"2023-08-01","Close":1413,"Ticker":"NLBM","x":1690848000000,"y":1413},{"Date":"2023-08-02","Close":1403.43,"Ticker":"NLBM","x":1690934400000,"y":1403.43},{"Date":"2023-08-03","Close":1389.01,"Ticker":"NLBM","x":1691020800000,"y":1389.01},{"Date":"2023-08-04","Close":1390.22,"Ticker":"NLBM","x":1691107200000,"y":1390.22},{"Date":"2023-08-07","Close":1389.23,"Ticker":"NLBM","x":1691366400000,"y":1389.23},{"Date":"2023-08-08","Close":1371.51,"Ticker":"NLBM","x":1691452800000,"y":1371.51},{"Date":"2023-08-09","Close":1379.31,"Ticker":"NLBM","x":1691539200000,"y":1379.31},{"Date":"2023-08-10","Close":1380.77,"Ticker":"NLBM","x":1691625600000,"y":1380.77},{"Date":"2023-08-11","Close":1361.87,"Ticker":"NLBM","x":1691712000000,"y":1361.87},{"Date":"2023-08-14","Close":1360.06,"Ticker":"NLBM","x":1691971200000,"y":1360.06},{"Date":"2023-08-15","Close":1340.22,"Ticker":"NLBM","x":1692057600000,"y":1340.22},{"Date":"2023-08-16","Close":1342.55,"Ticker":"NLBM","x":1692144000000,"y":1342.55},{"Date":"2023-08-17","Close":1331,"Ticker":"NLBM","x":1692230400000,"y":1331},{"Date":"2023-08-18","Close":1312.23,"Ticker":"NLBM","x":1692316800000,"y":1312.23},{"Date":"2023-08-21","Close":1302.98,"Ticker":"NLBM","x":1692576000000,"y":1302.98},{"Date":"2023-08-22","Close":1323.54,"Ticker":"NLBM","x":1692662400000,"y":1323.54},{"Date":"2023-08-23","Close":1322.4,"Ticker":"NLBM","x":1692748800000,"y":1322.4},{"Date":"2023-08-24","Close":1311.42,"Ticker":"NLBM","x":1692835200000,"y":1311.42},{"Date":"2023-08-25","Close":1312.7,"Ticker":"NLBM","x":1692921600000,"y":1312.7},{"Date":"2023-08-28","Close":1327.58,"Ticker":"NLBM","x":1693180800000,"y":1327.58},{"Date":"2023-08-29","Close":1340.52,"Ticker":"NLBM","x":1693267200000,"y":1340.52},{"Date":"2023-08-30","Close":1342.71,"Ticker":"NLBM","x":1693353600000,"y":1342.71},{"Date":"2023-08-31","Close":1344.08,"Ticker":"NLBM","x":1693440000000,"y":1344.08},{"Date":"2023-09-01","Close":1358.11,"Ticker":"NLBM","x":1693526400000,"y":1358.11},{"Date":"2023-09-04","Close":1357.43,"Ticker":"NLBM","x":1693785600000,"y":1357.43},{"Date":"2023-09-05","Close":1352.11,"Ticker":"NLBM","x":1693872000000,"y":1352.11},{"Date":"2023-09-06","Close":1354.69,"Ticker":"NLBM","x":1693958400000,"y":1354.69},{"Date":"2023-09-07","Close":1333.15,"Ticker":"NLBM","x":1694044800000,"y":1333.15},{"Date":"2023-09-08","Close":1334.53,"Ticker":"NLBM","x":1694131200000,"y":1334.53},{"Date":"2023-09-11","Close":1339.66,"Ticker":"NLBM","x":1694390400000,"y":1339.66},{"Date":"2023-09-12","Close":1308.03,"Ticker":"NLBM","x":1694476800000,"y":1308.03},{"Date":"2023-09-13","Close":1291.74,"Ticker":"NLBM","x":1694563200000,"y":1291.74},{"Date":"2023-09-14","Close":1318.65,"Ticker":"NLBM","x":1694649600000,"y":1318.65},{"Date":"2023-09-15","Close":1327.83,"Ticker":"NLBM","x":1694736000000,"y":1327.83},{"Date":"2023-09-18","Close":1302.07,"Ticker":"NLBM","x":1694995200000,"y":1302.07},{"Date":"2023-09-19","Close":1294.84,"Ticker":"NLBM","x":1695081600000,"y":1294.84},{"Date":"2023-09-20","Close":1311.76,"Ticker":"NLBM","x":1695168000000,"y":1311.76},{"Date":"2023-09-21","Close":1287.95,"Ticker":"NLBM","x":1695254400000,"y":1287.95},{"Date":"2023-09-22","Close":1284.8,"Ticker":"NLBM","x":1695340800000,"y":1284.8},{"Date":"2023-09-25","Close":1276.58,"Ticker":"NLBM","x":1695600000000,"y":1276.58},{"Date":"2023-09-26","Close":1275.9,"Ticker":"NLBM","x":1695686400000,"y":1275.9},{"Date":"2023-09-27","Close":1278.94,"Ticker":"NLBM","x":1695772800000,"y":1278.94},{"Date":"2023-09-28","Close":1290.27,"Ticker":"NLBM","x":1695859200000,"y":1290.27},{"Date":"2023-09-29","Close":1304.06,"Ticker":"NLBM","x":1695945600000,"y":1304.06},{"Date":"2023-10-02","Close":1287.35,"Ticker":"NLBM","x":1696204800000,"y":1287.35},{"Date":"2023-10-03","Close":1262.64,"Ticker":"NLBM","x":1696291200000,"y":1262.64},{"Date":"2023-10-04","Close":1257.84,"Ticker":"NLBM","x":1696377600000,"y":1257.84},{"Date":"2023-10-05","Close":1253.08,"Ticker":"NLBM","x":1696464000000,"y":1253.08},{"Date":"2023-10-06","Close":1266.78,"Ticker":"NLBM","x":1696550400000,"y":1266.78},{"Date":"2023-10-09","Close":1259.97,"Ticker":"NLBM","x":1696809600000,"y":1259.97},{"Date":"2023-10-10","Close":1289.22,"Ticker":"NLBM","x":1696896000000,"y":1289.22},{"Date":"2023-10-11","Close":1283.63,"Ticker":"NLBM","x":1696982400000,"y":1283.63},{"Date":"2023-10-12","Close":1256.26,"Ticker":"NLBM","x":1697068800000,"y":1256.26},{"Date":"2023-10-13","Close":1236.57,"Ticker":"NLBM","x":1697155200000,"y":1236.57},{"Date":"2023-10-16","Close":1244.66,"Ticker":"NLBM","x":1697414400000,"y":1244.66},{"Date":"2023-10-17","Close":1236.52,"Ticker":"NLBM","x":1697500800000,"y":1236.52},{"Date":"2023-10-18","Close":1203.12,"Ticker":"NLBM","x":1697587200000,"y":1203.12},{"Date":"2023-10-19","Close":1199.13,"Ticker":"NLBM","x":1697673600000,"y":1199.13},{"Date":"2023-10-20","Close":1166.66,"Ticker":"NLBM","x":1697760000000,"y":1166.66},{"Date":"2023-10-23","Close":1170.75,"Ticker":"NLBM","x":1698019200000,"y":1170.75},{"Date":"2023-10-24","Close":1175.13,"Ticker":"NLBM","x":1698105600000,"y":1175.13},{"Date":"2023-10-25","Close":1159.27,"Ticker":"NLBM","x":1698192000000,"y":1159.27},{"Date":"2023-10-26","Close":1161.11,"Ticker":"NLBM","x":1698278400000,"y":1161.11},{"Date":"2023-10-27","Close":1165.02,"Ticker":"NLBM","x":1698364800000,"y":1165.02},{"Date":"2023-10-30","Close":1149.23,"Ticker":"NLBM","x":1698624000000,"y":1149.23},{"Date":"2023-10-31","Close":1170.65,"Ticker":"NLBM","x":1698710400000,"y":1170.65},{"Date":"2023-11-01","Close":1165.68,"Ticker":"NLBM","x":1698796800000,"y":1165.68},{"Date":"2023-11-02","Close":1200.54,"Ticker":"NLBM","x":1698883200000,"y":1200.54},{"Date":"2023-11-03","Close":1213.53,"Ticker":"NLBM","x":1698969600000,"y":1213.53},{"Date":"2023-11-06","Close":1207.87,"Ticker":"NLBM","x":1699228800000,"y":1207.87},{"Date":"2023-11-07","Close":1193.25,"Ticker":"NLBM","x":1699315200000,"y":1193.25},{"Date":"2023-11-08","Close":1198.55,"Ticker":"NLBM","x":1699401600000,"y":1198.55},{"Date":"2023-11-09","Close":1211.7,"Ticker":"NLBM","x":1699488000000,"y":1211.7},{"Date":"2023-11-10","Close":1188.72,"Ticker":"NLBM","x":1699574400000,"y":1188.72},{"Date":"2023-11-13","Close":1197.69,"Ticker":"NLBM","x":1699833600000,"y":1197.69},{"Date":"2023-11-14","Close":1236.21,"Ticker":"NLBM","x":1699920000000,"y":1236.21},{"Date":"2023-11-15","Close":1260.36,"Ticker":"NLBM","x":1700006400000,"y":1260.36},{"Date":"2023-11-16","Close":1240.16,"Ticker":"NLBM","x":1700092800000,"y":1240.16},{"Date":"2023-11-17","Close":1253.27,"Ticker":"NLBM","x":1700179200000,"y":1253.27},{"Date":"2023-11-20","Close":1250.46,"Ticker":"NLBM","x":1700438400000,"y":1250.46},{"Date":"2023-11-21","Close":1245.89,"Ticker":"NLBM","x":1700524800000,"y":1245.89},{"Date":"2023-11-22","Close":1260.85,"Ticker":"NLBM","x":1700611200000,"y":1260.85},{"Date":"2023-11-23","Close":1268.91,"Ticker":"NLBM","x":1700697600000,"y":1268.91},{"Date":"2023-11-24","Close":1274.32,"Ticker":"NLBM","x":1700784000000,"y":1274.32},{"Date":"2023-11-27","Close":1281.01,"Ticker":"NLBM","x":1701043200000,"y":1281.01},{"Date":"2023-11-28","Close":1279.24,"Ticker":"NLBM","x":1701129600000,"y":1279.24},{"Date":"2023-11-29","Close":1291.82,"Ticker":"NLBM","x":1701216000000,"y":1291.82},{"Date":"2023-11-30","Close":1299.54,"Ticker":"NLBM","x":1701302400000,"y":1299.54},{"Date":"2023-12-01","Close":1310.8,"Ticker":"NLBM","x":1701388800000,"y":1310.8},{"Date":"2023-12-04","Close":1306.91,"Ticker":"NLBM","x":1701648000000,"y":1306.91},{"Date":"2023-12-05","Close":1308.22,"Ticker":"NLBM","x":1701734400000,"y":1308.22},{"Date":"2023-12-06","Close":1315.21,"Ticker":"NLBM","x":1701820800000,"y":1315.21},{"Date":"2023-12-07","Close":1317.52,"Ticker":"NLBM","x":1701907200000,"y":1317.52},{"Date":"2023-12-08","Close":1327.42,"Ticker":"NLBM","x":1701993600000,"y":1327.42},{"Date":"2023-12-11","Close":1340.17,"Ticker":"NLBM","x":1702252800000,"y":1340.17},{"Date":"2023-12-12","Close":1342.04,"Ticker":"NLBM","x":1702339200000,"y":1342.04},{"Date":"2023-12-13","Close":1345.96,"Ticker":"NLBM","x":1702425600000,"y":1345.96},{"Date":"2023-12-14","Close":1400.15,"Ticker":"NLBM","x":1702512000000,"y":1400.15},{"Date":"2023-12-15","Close":1391.61,"Ticker":"NLBM","x":1702598400000,"y":1391.61},{"Date":"2023-12-18","Close":1441.74,"Ticker":"NLBM","x":1702857600000,"y":1441.74},{"Date":"2023-12-19","Close":1452.59,"Ticker":"NLBM","x":1702944000000,"y":1452.59},{"Date":"2023-12-20","Close":1455.63,"Ticker":"NLBM","x":1703030400000,"y":1455.63},{"Date":"2023-12-21","Close":1449.4,"Ticker":"NLBM","x":1703116800000,"y":1449.4},{"Date":"2023-12-22","Close":1452.16,"Ticker":"NLBM","x":1703203200000,"y":1452.16},{"Date":"2023-12-27","Close":1456.6,"Ticker":"NLBM","x":1703635200000,"y":1456.6},{"Date":"2023-12-28","Close":1455.14,"Ticker":"NLBM","x":1703721600000,"y":1455.14},{"Date":"2023-12-29","Close":1449.97,"Ticker":"NLBM","x":1703808000000,"y":1449.97},{"Date":"2024-01-02","Close":1444.02,"Ticker":"NLBM","x":1704153600000,"y":1444.02},{"Date":"2024-01-03","Close":1417.61,"Ticker":"NLBM","x":1704240000000,"y":1417.61},{"Date":"2024-01-04","Close":1418.02,"Ticker":"NLBM","x":1704326400000,"y":1418.02},{"Date":"2024-01-05","Close":1410.52,"Ticker":"NLBM","x":1704412800000,"y":1410.52},{"Date":"2024-01-08","Close":1404.86,"Ticker":"NLBM","x":1704672000000,"y":1404.86},{"Date":"2024-01-09","Close":1383.97,"Ticker":"NLBM","x":1704758400000,"y":1383.97},{"Date":"2024-01-10","Close":1379.45,"Ticker":"NLBM","x":1704844800000,"y":1379.45},{"Date":"2024-01-11","Close":1370.68,"Ticker":"NLBM","x":1704931200000,"y":1370.68},{"Date":"2024-01-12","Close":1372.35,"Ticker":"NLBM","x":1705017600000,"y":1372.35},{"Date":"2024-01-15","Close":1369.01,"Ticker":"NLBM","x":1705276800000,"y":1369.01},{"Date":"2024-01-16","Close":1357.66,"Ticker":"NLBM","x":1705363200000,"y":1357.66},{"Date":"2024-01-17","Close":1345.18,"Ticker":"NLBM","x":1705449600000,"y":1345.18},{"Date":"2024-01-18","Close":1354.13,"Ticker":"NLBM","x":1705536000000,"y":1354.13},{"Date":"2024-01-19","Close":1346.75,"Ticker":"NLBM","x":1705622400000,"y":1346.75},{"Date":"2024-01-22","Close":1355.84,"Ticker":"NLBM","x":1705881600000,"y":1355.84},{"Date":"2024-01-23","Close":1366.09,"Ticker":"NLBM","x":1705968000000,"y":1366.09},{"Date":"2024-01-24","Close":1387.4,"Ticker":"NLBM","x":1706054400000,"y":1387.4},{"Date":"2024-01-25","Close":1381.16,"Ticker":"NLBM","x":1706140800000,"y":1381.16},{"Date":"2024-01-26","Close":1391.15,"Ticker":"NLBM","x":1706227200000,"y":1391.15},{"Date":"2024-01-29","Close":1392.34,"Ticker":"NLBM","x":1706486400000,"y":1392.34},{"Date":"2024-01-30","Close":1390.42,"Ticker":"NLBM","x":1706572800000,"y":1390.42},{"Date":"2024-01-31","Close":1399.83,"Ticker":"NLBM","x":1706659200000,"y":1399.83},{"Date":"2024-02-01","Close":1399.01,"Ticker":"NLBM","x":1706745600000,"y":1399.01},{"Date":"2024-02-02","Close":1401.34,"Ticker":"NLBM","x":1706832000000,"y":1401.34},{"Date":"2024-02-05","Close":1383.02,"Ticker":"NLBM","x":1707091200000,"y":1383.02},{"Date":"2024-02-06","Close":1400.55,"Ticker":"NLBM","x":1707177600000,"y":1400.55},{"Date":"2024-02-07","Close":1385.03,"Ticker":"NLBM","x":1707264000000,"y":1385.03},{"Date":"2024-02-08","Close":1415.13,"Ticker":"NLBM","x":1707350400000,"y":1415.13},{"Date":"2024-02-09","Close":1415.96,"Ticker":"NLBM","x":1707436800000,"y":1415.96},{"Date":"2024-02-12","Close":1419.48,"Ticker":"NLBM","x":1707696000000,"y":1419.48},{"Date":"2024-02-13","Close":1375.62,"Ticker":"NLBM","x":1707782400000,"y":1375.62},{"Date":"2024-02-14","Close":1373.08,"Ticker":"NLBM","x":1707868800000,"y":1373.08},{"Date":"2024-02-15","Close":1380.83,"Ticker":"NLBM","x":1707955200000,"y":1380.83},{"Date":"2024-02-16","Close":1394.22,"Ticker":"NLBM","x":1708041600000,"y":1394.22},{"Date":"2024-02-19","Close":1366.29,"Ticker":"NLBM","x":1708300800000,"y":1366.29},{"Date":"2024-02-20","Close":1347.83,"Ticker":"NLBM","x":1708387200000,"y":1347.83},{"Date":"2024-02-21","Close":1341.77,"Ticker":"NLBM","x":1708473600000,"y":1341.77}],"type":"line"}],"xAxis":{"title":{"text":""}}},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadCSV":"Download CSV","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","downloadXLS":"Download XLS","drillUpText":"◁ Back to {series.name}","exitFullscreen":"Exit from full screen","exportData":{"annotationHeader":"Annotations","categoryDatetimeHeader":"DateTime","categoryHeader":"Category"},"hideData":"Hide data table","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbolMagnitude":1000,"numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"shortWeekdays":["Sat","Sun","Mon","Tue","Wed","Thu","Fri"],"thousandsSep":" ","viewData":"View data table","viewFullscreen":"View in full screen","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"stock","fonts":[],"debug":false},"evals":[],"jsHooks":[]}</script>
```


<!-- <div align="center">  -->
<!-- <img src="https://github.com/Fredysessie/Draft_gif/blob/main/figures/Tickers_plot.gif?raw=true" width="100%" height="480"/> -->
<!-- </div>  -->



```r
# It is also possible to plot stock data chart for more than one ticker
# Let's plot three ETFs chart

chart3 <- EN_plot(c("IE0007G78AC4", "MANA", "3TSM"), stock_type = 'E')

chart3
```

```{=html}
<div class="highchart html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-aa45cd907b10211305aa" style="width:100%;height:576px;"></div>
<script type="application/json" data-for="htmlwidget-aa45cd907b10211305aa">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"Tickers (MANA, ASIG, 3TSM) line chart from 2023-02-22 to 2024-02-21"},"yAxis":{"title":{"text":null}},"credits":{"enabled":false},"exporting":{"enabled":true,"filename":"Tickers line chart from 2023-02-22 to 2024-02-21"},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"series":[{"name":"3TSM","data":[{"Date":"2023-02-23","Close":1.0448,"Ticker":"3TSM","x":1677110400000,"y":1.0448},{"Date":"2023-02-27","Close":1.0328,"Ticker":"3TSM","x":1677456000000,"y":1.0328},{"Date":"2023-03-08","Close":1.0842,"Ticker":"3TSM","x":1678233600000,"y":1.0842},{"Date":"2023-03-09","Close":1.063,"Ticker":"3TSM","x":1678320000000,"y":1.063},{"Date":"2023-03-13","Close":0.9502,"Ticker":"3TSM","x":1678665600000,"y":0.9502},{"Date":"2023-03-14","Close":1.0149,"Ticker":"3TSM","x":1678752000000,"y":1.0149},{"Date":"2023-03-15","Close":0.9672,"Ticker":"3TSM","x":1678838400000,"y":0.9672},{"Date":"2023-03-16","Close":0.9672,"Ticker":"3TSM","x":1678924800000,"y":0.9672},{"Date":"2023-03-17","Close":0.9672,"Ticker":"3TSM","x":1679011200000,"y":0.9672},{"Date":"2023-03-20","Close":0.9672,"Ticker":"3TSM","x":1679270400000,"y":0.9672},{"Date":"2023-03-21","Close":1.0943,"Ticker":"3TSM","x":1679356800000,"y":1.0943},{"Date":"2023-03-22","Close":1.0943,"Ticker":"3TSM","x":1679443200000,"y":1.0943},{"Date":"2023-03-23","Close":1.224,"Ticker":"3TSM","x":1679529600000,"y":1.224},{"Date":"2023-03-24","Close":1.224,"Ticker":"3TSM","x":1679616000000,"y":1.224},{"Date":"2023-03-27","Close":1.1588,"Ticker":"3TSM","x":1679875200000,"y":1.1588},{"Date":"2023-03-28","Close":1.106,"Ticker":"3TSM","x":1679961600000,"y":1.106},{"Date":"2023-03-29","Close":1.106,"Ticker":"3TSM","x":1680048000000,"y":1.106},{"Date":"2023-03-30","Close":1.1802,"Ticker":"3TSM","x":1680134400000,"y":1.1802},{"Date":"2023-03-31","Close":1.1802,"Ticker":"3TSM","x":1680220800000,"y":1.1802},{"Date":"2023-04-03","Close":1.1639,"Ticker":"3TSM","x":1680480000000,"y":1.1639},{"Date":"2023-04-04","Close":1.1632,"Ticker":"3TSM","x":1680566400000,"y":1.1632},{"Date":"2023-04-05","Close":1.1375,"Ticker":"3TSM","x":1680652800000,"y":1.1375},{"Date":"2023-04-06","Close":1.1375,"Ticker":"3TSM","x":1680739200000,"y":1.1375},{"Date":"2023-04-11","Close":1.1375,"Ticker":"3TSM","x":1681171200000,"y":1.1375},{"Date":"2023-04-12","Close":1.1375,"Ticker":"3TSM","x":1681257600000,"y":1.1375},{"Date":"2023-04-13","Close":1.1375,"Ticker":"3TSM","x":1681344000000,"y":1.1375},{"Date":"2023-04-14","Close":1.1375,"Ticker":"3TSM","x":1681430400000,"y":1.1375},{"Date":"2023-04-17","Close":1.1375,"Ticker":"3TSM","x":1681689600000,"y":1.1375},{"Date":"2023-04-18","Close":1.1375,"Ticker":"3TSM","x":1681776000000,"y":1.1375},{"Date":"2023-04-19","Close":1.1375,"Ticker":"3TSM","x":1681862400000,"y":1.1375},{"Date":"2023-04-20","Close":1.1375,"Ticker":"3TSM","x":1681948800000,"y":1.1375},{"Date":"2023-04-21","Close":1.1375,"Ticker":"3TSM","x":1682035200000,"y":1.1375},{"Date":"2023-04-24","Close":1.1375,"Ticker":"3TSM","x":1682294400000,"y":1.1375},{"Date":"2023-04-25","Close":1.1375,"Ticker":"3TSM","x":1682380800000,"y":1.1375},{"Date":"2023-04-26","Close":1.1375,"Ticker":"3TSM","x":1682467200000,"y":1.1375},{"Date":"2023-04-27","Close":1.1375,"Ticker":"3TSM","x":1682553600000,"y":1.1375},{"Date":"2023-04-28","Close":1.1375,"Ticker":"3TSM","x":1682640000000,"y":1.1375},{"Date":"2023-05-02","Close":1.1375,"Ticker":"3TSM","x":1682985600000,"y":1.1375},{"Date":"2023-05-03","Close":1.1375,"Ticker":"3TSM","x":1683072000000,"y":1.1375},{"Date":"2023-05-04","Close":1.1375,"Ticker":"3TSM","x":1683158400000,"y":1.1375},{"Date":"2023-05-05","Close":1.1375,"Ticker":"3TSM","x":1683244800000,"y":1.1375},{"Date":"2023-05-08","Close":1.1375,"Ticker":"3TSM","x":1683504000000,"y":1.1375},{"Date":"2023-05-09","Close":1.1375,"Ticker":"3TSM","x":1683590400000,"y":1.1375},{"Date":"2023-05-10","Close":1.1375,"Ticker":"3TSM","x":1683676800000,"y":1.1375},{"Date":"2023-05-11","Close":1.1375,"Ticker":"3TSM","x":1683763200000,"y":1.1375},{"Date":"2023-05-12","Close":1.1375,"Ticker":"3TSM","x":1683849600000,"y":1.1375},{"Date":"2023-05-15","Close":0.8337,"Ticker":"3TSM","x":1684108800000,"y":0.8337},{"Date":"2023-05-16","Close":0.8991,"Ticker":"3TSM","x":1684195200000,"y":0.8991},{"Date":"2023-05-17","Close":1.0155,"Ticker":"3TSM","x":1684281600000,"y":1.0155},{"Date":"2023-05-18","Close":1.13,"Ticker":"3TSM","x":1684368000000,"y":1.13},{"Date":"2023-05-19","Close":1.0788,"Ticker":"3TSM","x":1684454400000,"y":1.0788},{"Date":"2023-05-22","Close":1.0638,"Ticker":"3TSM","x":1684713600000,"y":1.0638},{"Date":"2023-05-23","Close":1.0391,"Ticker":"3TSM","x":1684800000000,"y":1.0391},{"Date":"2023-05-24","Close":1.003,"Ticker":"3TSM","x":1684886400000,"y":1.003},{"Date":"2023-05-25","Close":1.4134,"Ticker":"3TSM","x":1684972800000,"y":1.4134},{"Date":"2023-05-26","Close":1.4921,"Ticker":"3TSM","x":1685059200000,"y":1.4921},{"Date":"2023-05-29","Close":1.4347,"Ticker":"3TSM","x":1685318400000,"y":1.4347},{"Date":"2023-05-30","Close":1.4765,"Ticker":"3TSM","x":1685404800000,"y":1.4765},{"Date":"2023-05-31","Close":1.2973,"Ticker":"3TSM","x":1685491200000,"y":1.2973},{"Date":"2023-06-01","Close":1.3205,"Ticker":"3TSM","x":1685577600000,"y":1.3205},{"Date":"2023-06-02","Close":1.3093,"Ticker":"3TSM","x":1685664000000,"y":1.3093},{"Date":"2023-06-05","Close":1.275,"Ticker":"3TSM","x":1685923200000,"y":1.275},{"Date":"2023-06-06","Close":1.3224,"Ticker":"3TSM","x":1686009600000,"y":1.3224},{"Date":"2023-06-07","Close":1.3857,"Ticker":"3TSM","x":1686096000000,"y":1.3857},{"Date":"2023-06-08","Close":1.3347,"Ticker":"3TSM","x":1686182400000,"y":1.3347},{"Date":"2023-06-09","Close":1.441,"Ticker":"3TSM","x":1686268800000,"y":1.441},{"Date":"2023-06-12","Close":1.607,"Ticker":"3TSM","x":1686528000000,"y":1.607},{"Date":"2023-06-13","Close":1.6694,"Ticker":"3TSM","x":1686614400000,"y":1.6694},{"Date":"2023-06-14","Close":1.5869,"Ticker":"3TSM","x":1686700800000,"y":1.5869},{"Date":"2023-06-15","Close":1.5517,"Ticker":"3TSM","x":1686787200000,"y":1.5517},{"Date":"2023-06-16","Close":1.5075,"Ticker":"3TSM","x":1686873600000,"y":1.5075},{"Date":"2023-06-19","Close":1.4866,"Ticker":"3TSM","x":1687132800000,"y":1.4866},{"Date":"2023-06-20","Close":1.4647,"Ticker":"3TSM","x":1687219200000,"y":1.4647},{"Date":"2023-06-21","Close":1.3702,"Ticker":"3TSM","x":1687305600000,"y":1.3702},{"Date":"2023-06-22","Close":1.4047,"Ticker":"3TSM","x":1687392000000,"y":1.4047},{"Date":"2023-06-23","Close":1.3517,"Ticker":"3TSM","x":1687478400000,"y":1.3517},{"Date":"2023-06-26","Close":1.371,"Ticker":"3TSM","x":1687737600000,"y":1.371},{"Date":"2023-06-27","Close":1.338,"Ticker":"3TSM","x":1687824000000,"y":1.338},{"Date":"2023-06-28","Close":1.3432,"Ticker":"3TSM","x":1687910400000,"y":1.3432},{"Date":"2023-06-29","Close":1.3197,"Ticker":"3TSM","x":1687996800000,"y":1.3197},{"Date":"2023-06-30","Close":1.3405,"Ticker":"3TSM","x":1688083200000,"y":1.3405},{"Date":"2023-07-03","Close":1.3824,"Ticker":"3TSM","x":1688342400000,"y":1.3824},{"Date":"2023-07-04","Close":1.4265,"Ticker":"3TSM","x":1688428800000,"y":1.4265},{"Date":"2023-07-05","Close":1.3744,"Ticker":"3TSM","x":1688515200000,"y":1.3744},{"Date":"2023-07-06","Close":1.2456,"Ticker":"3TSM","x":1688601600000,"y":1.2456},{"Date":"2023-07-07","Close":1.3189,"Ticker":"3TSM","x":1688688000000,"y":1.3189},{"Date":"2023-07-10","Close":1.2937,"Ticker":"3TSM","x":1688947200000,"y":1.2937},{"Date":"2023-07-11","Close":1.3041,"Ticker":"3TSM","x":1689033600000,"y":1.3041},{"Date":"2023-07-12","Close":1.4086,"Ticker":"3TSM","x":1689120000000,"y":1.4086},{"Date":"2023-07-13","Close":1.4269,"Ticker":"3TSM","x":1689206400000,"y":1.4269},{"Date":"2023-07-14","Close":1.511,"Ticker":"3TSM","x":1689292800000,"y":1.511},{"Date":"2023-07-17","Close":1.3806,"Ticker":"3TSM","x":1689552000000,"y":1.3806},{"Date":"2023-07-18","Close":1.3182,"Ticker":"3TSM","x":1689638400000,"y":1.3182},{"Date":"2023-07-19","Close":1.3719,"Ticker":"3TSM","x":1689724800000,"y":1.3719},{"Date":"2023-07-20","Close":1.1866,"Ticker":"3TSM","x":1689811200000,"y":1.1866},{"Date":"2023-07-21","Close":1.147,"Ticker":"3TSM","x":1689897600000,"y":1.147},{"Date":"2023-07-24","Close":1.1513,"Ticker":"3TSM","x":1690156800000,"y":1.1513},{"Date":"2023-07-25","Close":1.2622,"Ticker":"3TSM","x":1690243200000,"y":1.2622},{"Date":"2023-07-26","Close":1.1948,"Ticker":"3TSM","x":1690329600000,"y":1.1948},{"Date":"2023-07-27","Close":1.2807,"Ticker":"3TSM","x":1690416000000,"y":1.2807},{"Date":"2023-07-28","Close":1.2715,"Ticker":"3TSM","x":1690502400000,"y":1.2715},{"Date":"2023-07-31","Close":1.1958,"Ticker":"3TSM","x":1690761600000,"y":1.1958},{"Date":"2023-08-01","Close":1.1919,"Ticker":"3TSM","x":1690848000000,"y":1.1919},{"Date":"2023-08-02","Close":1.086,"Ticker":"3TSM","x":1690934400000,"y":1.086},{"Date":"2023-08-03","Close":1.069,"Ticker":"3TSM","x":1691020800000,"y":1.069},{"Date":"2023-08-04","Close":1.1171,"Ticker":"3TSM","x":1691107200000,"y":1.1171},{"Date":"2023-08-07","Close":1.0787,"Ticker":"3TSM","x":1691366400000,"y":1.0787},{"Date":"2023-08-08","Close":1.0358,"Ticker":"3TSM","x":1691452800000,"y":1.0358},{"Date":"2023-08-09","Close":1.0196,"Ticker":"3TSM","x":1691539200000,"y":1.0196},{"Date":"2023-08-10","Close":1.0589,"Ticker":"3TSM","x":1691625600000,"y":1.0589},{"Date":"2023-08-11","Close":0.9813,"Ticker":"3TSM","x":1691712000000,"y":0.9813},{"Date":"2023-08-14","Close":0.9894,"Ticker":"3TSM","x":1691971200000,"y":0.9894},{"Date":"2023-08-15","Close":0.9528,"Ticker":"3TSM","x":1692057600000,"y":0.9528},{"Date":"2023-08-16","Close":0.9735,"Ticker":"3TSM","x":1692144000000,"y":0.9735},{"Date":"2023-08-17","Close":0.9718,"Ticker":"3TSM","x":1692230400000,"y":0.9718},{"Date":"2023-08-18","Close":0.9206,"Ticker":"3TSM","x":1692316800000,"y":0.9206},{"Date":"2023-08-21","Close":0.9322,"Ticker":"3TSM","x":1692576000000,"y":0.9322},{"Date":"2023-08-22","Close":0.9812,"Ticker":"3TSM","x":1692662400000,"y":0.9812},{"Date":"2023-08-23","Close":1.056,"Ticker":"3TSM","x":1692748800000,"y":1.056},{"Date":"2023-08-24","Close":0.9953,"Ticker":"3TSM","x":1692835200000,"y":0.9953},{"Date":"2023-08-25","Close":0.9784,"Ticker":"3TSM","x":1692921600000,"y":0.9784},{"Date":"2023-08-28","Close":1.02,"Ticker":"3TSM","x":1693180800000,"y":1.02},{"Date":"2023-08-29","Close":1.0486,"Ticker":"3TSM","x":1693267200000,"y":1.0486},{"Date":"2023-08-30","Close":1.0543,"Ticker":"3TSM","x":1693353600000,"y":1.0543},{"Date":"2023-08-31","Close":1.0159,"Ticker":"3TSM","x":1693440000000,"y":1.0159},{"Date":"2023-09-01","Close":1.0125,"Ticker":"3TSM","x":1693526400000,"y":1.0125},{"Date":"2023-09-04","Close":1.0449,"Ticker":"3TSM","x":1693785600000,"y":1.0449},{"Date":"2023-09-05","Close":1.0513,"Ticker":"3TSM","x":1693872000000,"y":1.0513},{"Date":"2023-09-06","Close":0.9796,"Ticker":"3TSM","x":1693958400000,"y":0.9796},{"Date":"2023-09-07","Close":0.8717,"Ticker":"3TSM","x":1694044800000,"y":0.8717},{"Date":"2023-09-08","Close":0.898,"Ticker":"3TSM","x":1694131200000,"y":0.898},{"Date":"2023-09-11","Close":0.8867,"Ticker":"3TSM","x":1694390400000,"y":0.8867},{"Date":"2023-09-12","Close":0.9213,"Ticker":"3TSM","x":1694476800000,"y":0.9213},{"Date":"2023-09-13","Close":0.9436,"Ticker":"3TSM","x":1694563200000,"y":0.9436},{"Date":"2023-09-14","Close":0.9738,"Ticker":"3TSM","x":1694649600000,"y":0.9738},{"Date":"2023-09-15","Close":0.8958,"Ticker":"3TSM","x":1694736000000,"y":0.8958},{"Date":"2023-09-18","Close":0.8771,"Ticker":"3TSM","x":1694995200000,"y":0.8771},{"Date":"2023-09-19","Close":0.8495,"Ticker":"3TSM","x":1695081600000,"y":0.8495},{"Date":"2023-09-20","Close":0.8559,"Ticker":"3TSM","x":1695168000000,"y":0.8559},{"Date":"2023-09-21","Close":0.784,"Ticker":"3TSM","x":1695254400000,"y":0.784},{"Date":"2023-09-22","Close":0.7959,"Ticker":"3TSM","x":1695340800000,"y":0.7959},{"Date":"2023-09-25","Close":0.7896,"Ticker":"3TSM","x":1695600000000,"y":0.7896},{"Date":"2023-09-26","Close":0.755,"Ticker":"3TSM","x":1695686400000,"y":0.755},{"Date":"2023-09-27","Close":0.7732,"Ticker":"3TSM","x":1695772800000,"y":0.7732},{"Date":"2023-09-28","Close":0.8024,"Ticker":"3TSM","x":1695859200000,"y":0.8024},{"Date":"2023-09-29","Close":0.8314,"Ticker":"3TSM","x":1695945600000,"y":0.8314},{"Date":"2023-10-02","Close":0.8618,"Ticker":"3TSM","x":1696204800000,"y":0.8618},{"Date":"2023-10-03","Close":0.8009,"Ticker":"3TSM","x":1696291200000,"y":0.8009},{"Date":"2023-10-04","Close":0.7927,"Ticker":"3TSM","x":1696377600000,"y":0.7927},{"Date":"2023-10-05","Close":0.8202,"Ticker":"3TSM","x":1696464000000,"y":0.8202},{"Date":"2023-10-06","Close":0.8774,"Ticker":"3TSM","x":1696550400000,"y":0.8774},{"Date":"2023-10-09","Close":0.8574,"Ticker":"3TSM","x":1696809600000,"y":0.8574},{"Date":"2023-10-10","Close":0.9031,"Ticker":"3TSM","x":1696896000000,"y":0.9031},{"Date":"2023-10-11","Close":0.9362,"Ticker":"3TSM","x":1696982400000,"y":0.9362},{"Date":"2023-10-12","Close":0.992,"Ticker":"3TSM","x":1697068800000,"y":0.992},{"Date":"2023-10-13","Close":0.9317,"Ticker":"3TSM","x":1697155200000,"y":0.9317},{"Date":"2023-10-16","Close":0.9424,"Ticker":"3TSM","x":1697414400000,"y":0.9424},{"Date":"2023-10-17","Close":0.921,"Ticker":"3TSM","x":1697500800000,"y":0.921},{"Date":"2023-10-18","Close":0.8835,"Ticker":"3TSM","x":1697587200000,"y":0.8835},{"Date":"2023-10-19","Close":0.9848,"Ticker":"3TSM","x":1697673600000,"y":0.9848},{"Date":"2023-10-20","Close":0.9236,"Ticker":"3TSM","x":1697760000000,"y":0.9236},{"Date":"2023-10-23","Close":0.9347,"Ticker":"3TSM","x":1698019200000,"y":0.9347},{"Date":"2023-10-24","Close":0.9385,"Ticker":"3TSM","x":1698105600000,"y":0.9385},{"Date":"2023-10-25","Close":0.8549,"Ticker":"3TSM","x":1698192000000,"y":0.8549},{"Date":"2023-10-26","Close":0.8061,"Ticker":"3TSM","x":1698278400000,"y":0.8061},{"Date":"2023-10-27","Close":0.7929,"Ticker":"3TSM","x":1698364800000,"y":0.7929},{"Date":"2023-10-30","Close":0.7698,"Ticker":"3TSM","x":1698624000000,"y":0.7698},{"Date":"2023-10-31","Close":0.7534,"Ticker":"3TSM","x":1698710400000,"y":0.7534},{"Date":"2023-11-01","Close":0.7905,"Ticker":"3TSM","x":1698796800000,"y":0.7905},{"Date":"2023-11-02","Close":0.8739,"Ticker":"3TSM","x":1698883200000,"y":0.8739},{"Date":"2023-11-03","Close":0.9243,"Ticker":"3TSM","x":1698969600000,"y":0.9243},{"Date":"2023-11-06","Close":0.9224,"Ticker":"3TSM","x":1699228800000,"y":0.9224},{"Date":"2023-11-07","Close":0.9432,"Ticker":"3TSM","x":1699315200000,"y":0.9432},{"Date":"2023-11-08","Close":0.9312,"Ticker":"3TSM","x":1699401600000,"y":0.9312},{"Date":"2023-11-09","Close":0.9563,"Ticker":"3TSM","x":1699488000000,"y":0.9563},{"Date":"2023-11-10","Close":1.0641,"Ticker":"3TSM","x":1699574400000,"y":1.0641},{"Date":"2023-11-13","Close":1.0528,"Ticker":"3TSM","x":1699833600000,"y":1.0528},{"Date":"2023-11-14","Close":1.1197,"Ticker":"3TSM","x":1699920000000,"y":1.1197},{"Date":"2023-11-15","Close":1.1136,"Ticker":"3TSM","x":1700006400000,"y":1.1136},{"Date":"2023-11-16","Close":1.0864,"Ticker":"3TSM","x":1700092800000,"y":1.0864},{"Date":"2023-11-17","Close":1.0986,"Ticker":"3TSM","x":1700179200000,"y":1.0986},{"Date":"2023-11-20","Close":1.1297,"Ticker":"3TSM","x":1700438400000,"y":1.1297},{"Date":"2023-11-21","Close":1.1013,"Ticker":"3TSM","x":1700524800000,"y":1.1013},{"Date":"2023-11-22","Close":1.0899,"Ticker":"3TSM","x":1700611200000,"y":1.0899},{"Date":"2023-11-23","Close":1.0928,"Ticker":"3TSM","x":1700697600000,"y":1.0928},{"Date":"2023-11-24","Close":1.0546,"Ticker":"3TSM","x":1700784000000,"y":1.0546},{"Date":"2023-11-27","Close":1.0273,"Ticker":"3TSM","x":1701043200000,"y":1.0273},{"Date":"2023-11-28","Close":1.0558,"Ticker":"3TSM","x":1701129600000,"y":1.0558},{"Date":"2023-11-29","Close":1.0924,"Ticker":"3TSM","x":1701216000000,"y":1.0924},{"Date":"2023-11-30","Close":1.0453,"Ticker":"3TSM","x":1701302400000,"y":1.0453},{"Date":"2023-12-01","Close":1.072,"Ticker":"3TSM","x":1701388800000,"y":1.072},{"Date":"2023-12-04","Close":0.9967,"Ticker":"3TSM","x":1701648000000,"y":0.9967},{"Date":"2023-12-05","Close":1.0194,"Ticker":"3TSM","x":1701734400000,"y":1.0194},{"Date":"2023-12-06","Close":1.0647,"Ticker":"3TSM","x":1701820800000,"y":1.0647},{"Date":"2023-12-07","Close":1.0979,"Ticker":"3TSM","x":1701907200000,"y":1.0979},{"Date":"2023-12-08","Close":1.1297,"Ticker":"3TSM","x":1701993600000,"y":1.1297},{"Date":"2023-12-11","Close":1.1462,"Ticker":"3TSM","x":1702252800000,"y":1.1462},{"Date":"2023-12-12","Close":1.1596,"Ticker":"3TSM","x":1702339200000,"y":1.1596},{"Date":"2023-12-13","Close":1.1901,"Ticker":"3TSM","x":1702425600000,"y":1.1901},{"Date":"2023-12-14","Close":1.2386,"Ticker":"3TSM","x":1702512000000,"y":1.2386},{"Date":"2023-12-15","Close":1.2654,"Ticker":"3TSM","x":1702598400000,"y":1.2654},{"Date":"2023-12-18","Close":1.2167,"Ticker":"3TSM","x":1702857600000,"y":1.2167},{"Date":"2023-12-19","Close":1.2512,"Ticker":"3TSM","x":1702944000000,"y":1.2512},{"Date":"2023-12-20","Close":1.2009,"Ticker":"3TSM","x":1703030400000,"y":1.2009},{"Date":"2023-12-21","Close":1.1901,"Ticker":"3TSM","x":1703116800000,"y":1.1901},{"Date":"2023-12-22","Close":1.2282,"Ticker":"3TSM","x":1703203200000,"y":1.2282},{"Date":"2023-12-27","Close":1.2507,"Ticker":"3TSM","x":1703635200000,"y":1.2507},{"Date":"2023-12-28","Close":1.2811,"Ticker":"3TSM","x":1703721600000,"y":1.2811},{"Date":"2023-12-29","Close":1.2339,"Ticker":"3TSM","x":1703808000000,"y":1.2339},{"Date":"2024-01-02","Close":1.1729,"Ticker":"3TSM","x":1704153600000,"y":1.1729},{"Date":"2024-01-03","Close":1.1162,"Ticker":"3TSM","x":1704240000000,"y":1.1162},{"Date":"2024-01-04","Close":1.1187,"Ticker":"3TSM","x":1704326400000,"y":1.1187},{"Date":"2024-01-05","Close":1.1143,"Ticker":"3TSM","x":1704412800000,"y":1.1143},{"Date":"2024-01-08","Close":1.1758,"Ticker":"3TSM","x":1704672000000,"y":1.1758},{"Date":"2024-01-09","Close":1.1384,"Ticker":"3TSM","x":1704758400000,"y":1.1384},{"Date":"2024-01-10","Close":1.1297,"Ticker":"3TSM","x":1704844800000,"y":1.1297},{"Date":"2024-01-11","Close":1.1089,"Ticker":"3TSM","x":1704931200000,"y":1.1089},{"Date":"2024-01-12","Close":1.1488,"Ticker":"3TSM","x":1705017600000,"y":1.1488},{"Date":"2024-01-15","Close":1.1539,"Ticker":"3TSM","x":1705276800000,"y":1.1539},{"Date":"2024-01-16","Close":1.1718,"Ticker":"3TSM","x":1705363200000,"y":1.1718},{"Date":"2024-01-17","Close":1.1455,"Ticker":"3TSM","x":1705449600000,"y":1.1455},{"Date":"2024-01-18","Close":1.5021,"Ticker":"3TSM","x":1705536000000,"y":1.5021},{"Date":"2024-01-19","Close":1.5722,"Ticker":"3TSM","x":1705622400000,"y":1.5722},{"Date":"2024-01-22","Close":1.568,"Ticker":"3TSM","x":1705881600000,"y":1.568},{"Date":"2024-01-23","Close":1.5807,"Ticker":"3TSM","x":1705968000000,"y":1.5807},{"Date":"2024-01-24","Close":1.7588,"Ticker":"3TSM","x":1706054400000,"y":1.7588},{"Date":"2024-01-25","Close":1.7369,"Ticker":"3TSM","x":1706140800000,"y":1.7369},{"Date":"2024-01-26","Close":1.7505,"Ticker":"3TSM","x":1706227200000,"y":1.7505},{"Date":"2024-01-29","Close":1.7044,"Ticker":"3TSM","x":1706486400000,"y":1.7044},{"Date":"2024-01-30","Close":1.7062,"Ticker":"3TSM","x":1706572800000,"y":1.7062},{"Date":"2024-01-31","Close":1.5597,"Ticker":"3TSM","x":1706659200000,"y":1.5597},{"Date":"2024-02-01","Close":1.5506,"Ticker":"3TSM","x":1706745600000,"y":1.5506},{"Date":"2024-02-02","Close":1.6306,"Ticker":"3TSM","x":1706832000000,"y":1.6306},{"Date":"2024-02-05","Close":1.7339,"Ticker":"3TSM","x":1707091200000,"y":1.7339},{"Date":"2024-02-06","Close":1.8006,"Ticker":"3TSM","x":1707177600000,"y":1.8006},{"Date":"2024-02-07","Close":2.0037,"Ticker":"3TSM","x":1707264000000,"y":2.0037},{"Date":"2024-02-08","Close":2.4365,"Ticker":"3TSM","x":1707350400000,"y":2.4365},{"Date":"2024-02-09","Close":2.4557,"Ticker":"3TSM","x":1707436800000,"y":2.4557},{"Date":"2024-02-12","Close":2.4801,"Ticker":"3TSM","x":1707696000000,"y":2.4801},{"Date":"2024-02-13","Close":2.2309,"Ticker":"3TSM","x":1707782400000,"y":2.2309},{"Date":"2024-02-14","Close":2.2385,"Ticker":"3TSM","x":1707868800000,"y":2.2385},{"Date":"2024-02-15","Close":2.2561,"Ticker":"3TSM","x":1707955200000,"y":2.2561},{"Date":"2024-02-16","Close":2.1954,"Ticker":"3TSM","x":1708041600000,"y":2.1954},{"Date":"2024-02-19","Close":2.021,"Ticker":"3TSM","x":1708300800000,"y":2.021},{"Date":"2024-02-20","Close":2.0371,"Ticker":"3TSM","x":1708387200000,"y":2.0371},{"Date":"2024-02-21","Close":2.0118,"Ticker":"3TSM","x":1708473600000,"y":2.0118}],"type":"line"},{"name":"ASIG","data":[{"Date":"2023-02-22","Close":4.552,"Ticker":"ASIG","x":1677024000000,"y":4.552},{"Date":"2023-02-23","Close":4.5351,"Ticker":"ASIG","x":1677110400000,"y":4.5351},{"Date":"2023-02-24","Close":4.5512,"Ticker":"ASIG","x":1677196800000,"y":4.5512},{"Date":"2023-02-27","Close":4.5416,"Ticker":"ASIG","x":1677456000000,"y":4.5416},{"Date":"2023-02-28","Close":4.5356,"Ticker":"ASIG","x":1677542400000,"y":4.5356},{"Date":"2023-03-01","Close":4.5495,"Ticker":"ASIG","x":1677628800000,"y":4.5495},{"Date":"2023-03-02","Close":4.5426,"Ticker":"ASIG","x":1677715200000,"y":4.5426},{"Date":"2023-03-03","Close":4.551,"Ticker":"ASIG","x":1677801600000,"y":4.551},{"Date":"2023-03-06","Close":4.5625,"Ticker":"ASIG","x":1678060800000,"y":4.5625},{"Date":"2023-03-07","Close":4.5426,"Ticker":"ASIG","x":1678147200000,"y":4.5426},{"Date":"2023-03-08","Close":4.536,"Ticker":"ASIG","x":1678233600000,"y":4.536},{"Date":"2023-03-09","Close":4.5389,"Ticker":"ASIG","x":1678320000000,"y":4.5389},{"Date":"2023-03-10","Close":4.5769,"Ticker":"ASIG","x":1678406400000,"y":4.5769},{"Date":"2023-03-13","Close":4.585,"Ticker":"ASIG","x":1678665600000,"y":4.585},{"Date":"2023-03-14","Close":4.6094,"Ticker":"ASIG","x":1678752000000,"y":4.6094},{"Date":"2023-03-15","Close":4.6266,"Ticker":"ASIG","x":1678838400000,"y":4.6266},{"Date":"2023-03-16","Close":4.579,"Ticker":"ASIG","x":1678924800000,"y":4.579},{"Date":"2023-03-17","Close":4.5796,"Ticker":"ASIG","x":1679011200000,"y":4.5796},{"Date":"2023-03-20","Close":4.6164,"Ticker":"ASIG","x":1679270400000,"y":4.6164},{"Date":"2023-03-21","Close":4.6117,"Ticker":"ASIG","x":1679356800000,"y":4.6117},{"Date":"2023-03-22","Close":4.584,"Ticker":"ASIG","x":1679443200000,"y":4.584},{"Date":"2023-03-23","Close":4.6152,"Ticker":"ASIG","x":1679529600000,"y":4.6152},{"Date":"2023-03-24","Close":4.6348,"Ticker":"ASIG","x":1679616000000,"y":4.6348},{"Date":"2023-03-27","Close":4.6084,"Ticker":"ASIG","x":1679875200000,"y":4.6084},{"Date":"2023-03-28","Close":4.596,"Ticker":"ASIG","x":1679961600000,"y":4.596},{"Date":"2023-03-29","Close":4.5835,"Ticker":"ASIG","x":1680048000000,"y":4.5835},{"Date":"2023-03-30","Close":4.582,"Ticker":"ASIG","x":1680134400000,"y":4.582},{"Date":"2023-03-31","Close":4.5989,"Ticker":"ASIG","x":1680220800000,"y":4.5989},{"Date":"2023-04-03","Close":4.6399,"Ticker":"ASIG","x":1680480000000,"y":4.6399},{"Date":"2023-04-04","Close":4.5535,"Ticker":"ASIG","x":1680566400000,"y":4.5535},{"Date":"2023-04-05","Close":4.6496,"Ticker":"ASIG","x":1680652800000,"y":4.6496},{"Date":"2023-04-06","Close":4.6526,"Ticker":"ASIG","x":1680739200000,"y":4.6526},{"Date":"2023-04-11","Close":4.615,"Ticker":"ASIG","x":1681171200000,"y":4.615},{"Date":"2023-04-12","Close":4.6273,"Ticker":"ASIG","x":1681257600000,"y":4.6273},{"Date":"2023-04-13","Close":4.6323,"Ticker":"ASIG","x":1681344000000,"y":4.6323},{"Date":"2023-04-14","Close":4.6246,"Ticker":"ASIG","x":1681430400000,"y":4.6246},{"Date":"2023-04-17","Close":4.6362,"Ticker":"ASIG","x":1681689600000,"y":4.6362},{"Date":"2023-04-18","Close":4.6314,"Ticker":"ASIG","x":1681776000000,"y":4.6314},{"Date":"2023-04-19","Close":4.6174,"Ticker":"ASIG","x":1681862400000,"y":4.6174},{"Date":"2023-04-20","Close":4.6388,"Ticker":"ASIG","x":1681948800000,"y":4.6388},{"Date":"2023-04-21","Close":4.631,"Ticker":"ASIG","x":1682035200000,"y":4.631},{"Date":"2023-04-24","Close":4.6333,"Ticker":"ASIG","x":1682294400000,"y":4.6333},{"Date":"2023-04-25","Close":4.6422,"Ticker":"ASIG","x":1682380800000,"y":4.6422},{"Date":"2023-04-26","Close":4.6674,"Ticker":"ASIG","x":1682467200000,"y":4.6674},{"Date":"2023-04-27","Close":4.6422,"Ticker":"ASIG","x":1682553600000,"y":4.6422},{"Date":"2023-04-28","Close":4.6404,"Ticker":"ASIG","x":1682640000000,"y":4.6404},{"Date":"2023-05-02","Close":4.64,"Ticker":"ASIG","x":1682985600000,"y":4.64},{"Date":"2023-05-03","Close":4.654,"Ticker":"ASIG","x":1683072000000,"y":4.654},{"Date":"2023-05-04","Close":4.6578,"Ticker":"ASIG","x":1683158400000,"y":4.6578},{"Date":"2023-05-05","Close":4.6536,"Ticker":"ASIG","x":1683244800000,"y":4.6536},{"Date":"2023-05-08","Close":4.6653,"Ticker":"ASIG","x":1683504000000,"y":4.6653},{"Date":"2023-05-09","Close":4.6453,"Ticker":"ASIG","x":1683590400000,"y":4.6453},{"Date":"2023-05-10","Close":4.6445,"Ticker":"ASIG","x":1683676800000,"y":4.6445},{"Date":"2023-05-11","Close":4.6568,"Ticker":"ASIG","x":1683763200000,"y":4.6568},{"Date":"2023-05-12","Close":4.6574,"Ticker":"ASIG","x":1683849600000,"y":4.6574},{"Date":"2023-05-15","Close":4.648,"Ticker":"ASIG","x":1684108800000,"y":4.648},{"Date":"2023-05-16","Close":4.6405,"Ticker":"ASIG","x":1684195200000,"y":4.6405},{"Date":"2023-05-17","Close":4.6243,"Ticker":"ASIG","x":1684281600000,"y":4.6243},{"Date":"2023-05-18","Close":4.618,"Ticker":"ASIG","x":1684368000000,"y":4.618},{"Date":"2023-05-19","Close":4.6219,"Ticker":"ASIG","x":1684454400000,"y":4.6219},{"Date":"2023-05-22","Close":4.6008,"Ticker":"ASIG","x":1684713600000,"y":4.6008},{"Date":"2023-05-23","Close":4.6026,"Ticker":"ASIG","x":1684800000000,"y":4.6026},{"Date":"2023-05-24","Close":4.6106,"Ticker":"ASIG","x":1684886400000,"y":4.6106},{"Date":"2023-05-25","Close":4.5991,"Ticker":"ASIG","x":1684972800000,"y":4.5991},{"Date":"2023-05-26","Close":4.5888,"Ticker":"ASIG","x":1685059200000,"y":4.5888},{"Date":"2023-05-29","Close":4.5936,"Ticker":"ASIG","x":1685318400000,"y":4.5936},{"Date":"2023-05-30","Close":4.605,"Ticker":"ASIG","x":1685404800000,"y":4.605},{"Date":"2023-05-31","Close":4.6174,"Ticker":"ASIG","x":1685491200000,"y":4.6174},{"Date":"2023-06-01","Close":4.6311,"Ticker":"ASIG","x":1685577600000,"y":4.6311},{"Date":"2023-06-02","Close":4.6231,"Ticker":"ASIG","x":1685664000000,"y":4.6231},{"Date":"2023-06-05","Close":4.6233,"Ticker":"ASIG","x":1685923200000,"y":4.6233},{"Date":"2023-06-06","Close":4.6207,"Ticker":"ASIG","x":1686009600000,"y":4.6207},{"Date":"2023-06-07","Close":4.619,"Ticker":"ASIG","x":1686096000000,"y":4.619},{"Date":"2023-06-08","Close":4.6204,"Ticker":"ASIG","x":1686182400000,"y":4.6204},{"Date":"2023-06-09","Close":4.6072,"Ticker":"ASIG","x":1686268800000,"y":4.6072},{"Date":"2023-06-12","Close":4.6198,"Ticker":"ASIG","x":1686528000000,"y":4.6198},{"Date":"2023-06-13","Close":4.624,"Ticker":"ASIG","x":1686614400000,"y":4.624},{"Date":"2023-06-14","Close":4.6257,"Ticker":"ASIG","x":1686700800000,"y":4.6257},{"Date":"2023-06-15","Close":4.6364,"Ticker":"ASIG","x":1686787200000,"y":4.6364},{"Date":"2023-06-16","Close":4.6263,"Ticker":"ASIG","x":1686873600000,"y":4.6263},{"Date":"2023-06-19","Close":4.6293,"Ticker":"ASIG","x":1687132800000,"y":4.6293},{"Date":"2023-06-20","Close":4.6385,"Ticker":"ASIG","x":1687219200000,"y":4.6385},{"Date":"2023-06-21","Close":4.6448,"Ticker":"ASIG","x":1687305600000,"y":4.6448},{"Date":"2023-06-22","Close":4.6442,"Ticker":"ASIG","x":1687392000000,"y":4.6442},{"Date":"2023-06-23","Close":4.6457,"Ticker":"ASIG","x":1687478400000,"y":4.6457},{"Date":"2023-06-26","Close":4.6553,"Ticker":"ASIG","x":1687737600000,"y":4.6553},{"Date":"2023-06-27","Close":4.6379,"Ticker":"ASIG","x":1687824000000,"y":4.6379},{"Date":"2023-06-28","Close":4.6349,"Ticker":"ASIG","x":1687910400000,"y":4.6349},{"Date":"2023-06-29","Close":4.6317,"Ticker":"ASIG","x":1687996800000,"y":4.6317},{"Date":"2023-06-30","Close":4.6366,"Ticker":"ASIG","x":1688083200000,"y":4.6366},{"Date":"2023-07-03","Close":4.6462,"Ticker":"ASIG","x":1688342400000,"y":4.6462},{"Date":"2023-07-04","Close":4.6175,"Ticker":"ASIG","x":1688428800000,"y":4.6175},{"Date":"2023-07-05","Close":4.6317,"Ticker":"ASIG","x":1688515200000,"y":4.6317},{"Date":"2023-07-06","Close":4.6055,"Ticker":"ASIG","x":1688601600000,"y":4.6055},{"Date":"2023-07-07","Close":4.6099,"Ticker":"ASIG","x":1688688000000,"y":4.6099},{"Date":"2023-07-10","Close":4.6067,"Ticker":"ASIG","x":1688947200000,"y":4.6067},{"Date":"2023-07-11","Close":4.6135,"Ticker":"ASIG","x":1689033600000,"y":4.6135},{"Date":"2023-07-12","Close":4.6377,"Ticker":"ASIG","x":1689120000000,"y":4.6377},{"Date":"2023-07-13","Close":4.6507,"Ticker":"ASIG","x":1689206400000,"y":4.6507},{"Date":"2023-07-14","Close":4.658,"Ticker":"ASIG","x":1689292800000,"y":4.658},{"Date":"2023-07-17","Close":4.6581,"Ticker":"ASIG","x":1689552000000,"y":4.6581},{"Date":"2023-07-18","Close":4.6484,"Ticker":"ASIG","x":1689638400000,"y":4.6484},{"Date":"2023-07-19","Close":4.6455,"Ticker":"ASIG","x":1689724800000,"y":4.6455},{"Date":"2023-07-20","Close":4.6464,"Ticker":"ASIG","x":1689811200000,"y":4.6464},{"Date":"2023-07-21","Close":4.6501,"Ticker":"ASIG","x":1689897600000,"y":4.6501},{"Date":"2023-07-24","Close":4.6503,"Ticker":"ASIG","x":1690156800000,"y":4.6503},{"Date":"2023-07-25","Close":4.636,"Ticker":"ASIG","x":1690243200000,"y":4.636},{"Date":"2023-07-26","Close":4.6424,"Ticker":"ASIG","x":1690329600000,"y":4.6424},{"Date":"2023-07-27","Close":4.6446,"Ticker":"ASIG","x":1690416000000,"y":4.6446},{"Date":"2023-07-28","Close":4.6372,"Ticker":"ASIG","x":1690502400000,"y":4.6372},{"Date":"2023-07-31","Close":4.6441,"Ticker":"ASIG","x":1690761600000,"y":4.6441},{"Date":"2023-08-01","Close":4.6412,"Ticker":"ASIG","x":1690848000000,"y":4.6412},{"Date":"2023-08-02","Close":4.6298,"Ticker":"ASIG","x":1690934400000,"y":4.6298},{"Date":"2023-08-03","Close":4.6397,"Ticker":"ASIG","x":1691020800000,"y":4.6397},{"Date":"2023-08-04","Close":4.6377,"Ticker":"ASIG","x":1691107200000,"y":4.6377},{"Date":"2023-08-07","Close":4.636,"Ticker":"ASIG","x":1691366400000,"y":4.636},{"Date":"2023-08-08","Close":4.6535,"Ticker":"ASIG","x":1691452800000,"y":4.6535},{"Date":"2023-08-09","Close":4.6463,"Ticker":"ASIG","x":1691539200000,"y":4.6463},{"Date":"2023-08-10","Close":4.6391,"Ticker":"ASIG","x":1691625600000,"y":4.6391},{"Date":"2023-08-11","Close":4.6347,"Ticker":"ASIG","x":1691712000000,"y":4.6347},{"Date":"2023-08-14","Close":4.607,"Ticker":"ASIG","x":1691971200000,"y":4.607},{"Date":"2023-08-15","Close":4.5997,"Ticker":"ASIG","x":1692057600000,"y":4.5997},{"Date":"2023-08-16","Close":4.5956,"Ticker":"ASIG","x":1692144000000,"y":4.5956},{"Date":"2023-08-17","Close":4.5843,"Ticker":"ASIG","x":1692230400000,"y":4.5843},{"Date":"2023-08-18","Close":4.5836,"Ticker":"ASIG","x":1692316800000,"y":4.5836},{"Date":"2023-08-21","Close":4.5682,"Ticker":"ASIG","x":1692576000000,"y":4.5682},{"Date":"2023-08-22","Close":4.5621,"Ticker":"ASIG","x":1692662400000,"y":4.5621},{"Date":"2023-08-23","Close":4.5779,"Ticker":"ASIG","x":1692748800000,"y":4.5779},{"Date":"2023-08-24","Close":4.5783,"Ticker":"ASIG","x":1692835200000,"y":4.5783},{"Date":"2023-08-25","Close":4.5795,"Ticker":"ASIG","x":1692921600000,"y":4.5795},{"Date":"2023-08-28","Close":4.5765,"Ticker":"ASIG","x":1693180800000,"y":4.5765},{"Date":"2023-08-29","Close":4.6002,"Ticker":"ASIG","x":1693267200000,"y":4.6002},{"Date":"2023-08-30","Close":4.5994,"Ticker":"ASIG","x":1693353600000,"y":4.5994},{"Date":"2023-08-31","Close":4.6043,"Ticker":"ASIG","x":1693440000000,"y":4.6043},{"Date":"2023-09-01","Close":4.6206,"Ticker":"ASIG","x":1693526400000,"y":4.6206},{"Date":"2023-09-04","Close":4.6147,"Ticker":"ASIG","x":1693785600000,"y":4.6147},{"Date":"2023-09-05","Close":4.602,"Ticker":"ASIG","x":1693872000000,"y":4.602},{"Date":"2023-09-06","Close":4.5901,"Ticker":"ASIG","x":1693958400000,"y":4.5901},{"Date":"2023-09-07","Close":4.5998,"Ticker":"ASIG","x":1694044800000,"y":4.5998},{"Date":"2023-09-08","Close":4.6114,"Ticker":"ASIG","x":1694131200000,"y":4.6114},{"Date":"2023-09-11","Close":4.6077,"Ticker":"ASIG","x":1694390400000,"y":4.6077},{"Date":"2023-09-12","Close":4.5723,"Ticker":"ASIG","x":1694476800000,"y":4.5723},{"Date":"2023-09-13","Close":4.6022,"Ticker":"ASIG","x":1694563200000,"y":4.6022},{"Date":"2023-09-14","Close":4.6093,"Ticker":"ASIG","x":1694649600000,"y":4.6093},{"Date":"2023-09-15","Close":4.5915,"Ticker":"ASIG","x":1694736000000,"y":4.5915},{"Date":"2023-09-18","Close":4.59,"Ticker":"ASIG","x":1694995200000,"y":4.59},{"Date":"2023-09-19","Close":4.6036,"Ticker":"ASIG","x":1695081600000,"y":4.6036},{"Date":"2023-09-20","Close":4.6161,"Ticker":"ASIG","x":1695168000000,"y":4.6161},{"Date":"2023-09-21","Close":4.5765,"Ticker":"ASIG","x":1695254400000,"y":4.5765},{"Date":"2023-09-22","Close":4.575,"Ticker":"ASIG","x":1695340800000,"y":4.575},{"Date":"2023-09-25","Close":4.5811,"Ticker":"ASIG","x":1695600000000,"y":4.5811},{"Date":"2023-09-26","Close":4.5891,"Ticker":"ASIG","x":1695686400000,"y":4.5891},{"Date":"2023-09-27","Close":4.5507,"Ticker":"ASIG","x":1695772800000,"y":4.5507},{"Date":"2023-09-28","Close":4.5563,"Ticker":"ASIG","x":1695859200000,"y":4.5563},{"Date":"2023-09-29","Close":4.591,"Ticker":"ASIG","x":1695945600000,"y":4.591},{"Date":"2023-10-02","Close":4.5932,"Ticker":"ASIG","x":1696204800000,"y":4.5932},{"Date":"2023-10-03","Close":4.5732,"Ticker":"ASIG","x":1696291200000,"y":4.5732},{"Date":"2023-10-04","Close":4.5395,"Ticker":"ASIG","x":1696377600000,"y":4.5395},{"Date":"2023-10-05","Close":4.5155,"Ticker":"ASIG","x":1696464000000,"y":4.5155},{"Date":"2023-10-06","Close":4.5731,"Ticker":"ASIG","x":1696550400000,"y":4.5731},{"Date":"2023-10-09","Close":4.556,"Ticker":"ASIG","x":1696809600000,"y":4.556},{"Date":"2023-10-10","Close":4.5826,"Ticker":"ASIG","x":1696896000000,"y":4.5826},{"Date":"2023-10-11","Close":4.5902,"Ticker":"ASIG","x":1696982400000,"y":4.5902},{"Date":"2023-10-12","Close":4.5542,"Ticker":"ASIG","x":1697068800000,"y":4.5542},{"Date":"2023-10-13","Close":4.5841,"Ticker":"ASIG","x":1697155200000,"y":4.5841},{"Date":"2023-10-16","Close":4.5624,"Ticker":"ASIG","x":1697414400000,"y":4.5624},{"Date":"2023-10-17","Close":4.5577,"Ticker":"ASIG","x":1697500800000,"y":4.5577},{"Date":"2023-10-18","Close":4.5385,"Ticker":"ASIG","x":1697587200000,"y":4.5385},{"Date":"2023-10-19","Close":4.5268,"Ticker":"ASIG","x":1697673600000,"y":4.5268},{"Date":"2023-10-20","Close":4.5348,"Ticker":"ASIG","x":1697760000000,"y":4.5348},{"Date":"2023-10-23","Close":4.5124,"Ticker":"ASIG","x":1698019200000,"y":4.5124},{"Date":"2023-10-24","Close":4.5357,"Ticker":"ASIG","x":1698105600000,"y":4.5357},{"Date":"2023-10-25","Close":4.5285,"Ticker":"ASIG","x":1698192000000,"y":4.5285},{"Date":"2023-10-26","Close":4.549,"Ticker":"ASIG","x":1698278400000,"y":4.549},{"Date":"2023-10-27","Close":4.534,"Ticker":"ASIG","x":1698364800000,"y":4.534},{"Date":"2023-10-30","Close":4.5481,"Ticker":"ASIG","x":1698624000000,"y":4.5481},{"Date":"2023-10-31","Close":4.5582,"Ticker":"ASIG","x":1698710400000,"y":4.5582},{"Date":"2023-11-01","Close":4.5569,"Ticker":"ASIG","x":1698796800000,"y":4.5569},{"Date":"2023-11-02","Close":4.5966,"Ticker":"ASIG","x":1698883200000,"y":4.5966},{"Date":"2023-11-03","Close":4.5762,"Ticker":"ASIG","x":1698969600000,"y":4.5762},{"Date":"2023-11-06","Close":4.6017,"Ticker":"ASIG","x":1699228800000,"y":4.6017},{"Date":"2023-11-07","Close":4.6152,"Ticker":"ASIG","x":1699315200000,"y":4.6152},{"Date":"2023-11-08","Close":4.6129,"Ticker":"ASIG","x":1699401600000,"y":4.6129},{"Date":"2023-11-09","Close":4.6039,"Ticker":"ASIG","x":1699488000000,"y":4.6039},{"Date":"2023-11-10","Close":4.6008,"Ticker":"ASIG","x":1699574400000,"y":4.6008},{"Date":"2023-11-13","Close":4.6111,"Ticker":"ASIG","x":1699833600000,"y":4.6111},{"Date":"2023-11-14","Close":4.6339,"Ticker":"ASIG","x":1699920000000,"y":4.6339},{"Date":"2023-11-15","Close":4.6292,"Ticker":"ASIG","x":1700006400000,"y":4.6292},{"Date":"2023-11-16","Close":4.639,"Ticker":"ASIG","x":1700092800000,"y":4.639},{"Date":"2023-11-17","Close":4.6459,"Ticker":"ASIG","x":1700179200000,"y":4.6459},{"Date":"2023-11-20","Close":4.6414,"Ticker":"ASIG","x":1700438400000,"y":4.6414},{"Date":"2023-11-21","Close":4.6561,"Ticker":"ASIG","x":1700524800000,"y":4.6561},{"Date":"2023-11-22","Close":4.6685,"Ticker":"ASIG","x":1700611200000,"y":4.6685},{"Date":"2023-11-23","Close":4.6661,"Ticker":"ASIG","x":1700697600000,"y":4.6661},{"Date":"2023-11-24","Close":4.661,"Ticker":"ASIG","x":1700784000000,"y":4.661},{"Date":"2023-11-27","Close":4.6584,"Ticker":"ASIG","x":1701043200000,"y":4.6584},{"Date":"2023-11-28","Close":4.6732,"Ticker":"ASIG","x":1701129600000,"y":4.6732},{"Date":"2023-11-29","Close":4.702,"Ticker":"ASIG","x":1701216000000,"y":4.702},{"Date":"2023-11-30","Close":4.6968,"Ticker":"ASIG","x":1701302400000,"y":4.6968},{"Date":"2023-12-01","Close":4.706,"Ticker":"ASIG","x":1701388800000,"y":4.706},{"Date":"2023-12-04","Close":4.7168,"Ticker":"ASIG","x":1701648000000,"y":4.7168},{"Date":"2023-12-05","Close":4.7257,"Ticker":"ASIG","x":1701734400000,"y":4.7257},{"Date":"2023-12-06","Close":4.7355,"Ticker":"ASIG","x":1701820800000,"y":4.7355},{"Date":"2023-12-07","Close":4.7386,"Ticker":"ASIG","x":1701907200000,"y":4.7386},{"Date":"2023-12-08","Close":4.7334,"Ticker":"ASIG","x":1701993600000,"y":4.7334},{"Date":"2023-12-11","Close":4.7202,"Ticker":"ASIG","x":1702252800000,"y":4.7202},{"Date":"2023-12-12","Close":4.7373,"Ticker":"ASIG","x":1702339200000,"y":4.7373},{"Date":"2023-12-13","Close":4.7332,"Ticker":"ASIG","x":1702425600000,"y":4.7332},{"Date":"2023-12-14","Close":4.7785,"Ticker":"ASIG","x":1702512000000,"y":4.7785},{"Date":"2023-12-15","Close":4.7706,"Ticker":"ASIG","x":1702598400000,"y":4.7706},{"Date":"2023-12-18","Close":4.7831,"Ticker":"ASIG","x":1702857600000,"y":4.7831},{"Date":"2023-12-19","Close":4.799,"Ticker":"ASIG","x":1702944000000,"y":4.799},{"Date":"2023-12-20","Close":4.7977,"Ticker":"ASIG","x":1703030400000,"y":4.7977},{"Date":"2023-12-21","Close":4.8033,"Ticker":"ASIG","x":1703116800000,"y":4.8033},{"Date":"2023-12-22","Close":4.8005,"Ticker":"ASIG","x":1703203200000,"y":4.8005},{"Date":"2023-12-27","Close":4.8131,"Ticker":"ASIG","x":1703635200000,"y":4.8131},{"Date":"2023-12-28","Close":4.8223,"Ticker":"ASIG","x":1703721600000,"y":4.8223},{"Date":"2023-12-29","Close":4.8041,"Ticker":"ASIG","x":1703808000000,"y":4.8041},{"Date":"2024-01-02","Close":4.7951,"Ticker":"ASIG","x":1704153600000,"y":4.7951},{"Date":"2024-01-03","Close":4.8339,"Ticker":"ASIG","x":1704240000000,"y":4.8339},{"Date":"2024-01-04","Close":4.8028,"Ticker":"ASIG","x":1704326400000,"y":4.8028},{"Date":"2024-01-05","Close":4.7999,"Ticker":"ASIG","x":1704412800000,"y":4.7999},{"Date":"2024-01-08","Close":4.793,"Ticker":"ASIG","x":1704672000000,"y":4.793},{"Date":"2024-01-09","Close":4.7895,"Ticker":"ASIG","x":1704758400000,"y":4.7895},{"Date":"2024-01-10","Close":4.796,"Ticker":"ASIG","x":1704844800000,"y":4.796},{"Date":"2024-01-11","Close":4.8037,"Ticker":"ASIG","x":1704931200000,"y":4.8037},{"Date":"2024-01-12","Close":4.8268,"Ticker":"ASIG","x":1705017600000,"y":4.8268},{"Date":"2024-01-15","Close":4.8285,"Ticker":"ASIG","x":1705276800000,"y":4.8285},{"Date":"2024-01-16","Close":4.8131,"Ticker":"ASIG","x":1705363200000,"y":4.8131},{"Date":"2024-01-17","Close":4.8026,"Ticker":"ASIG","x":1705449600000,"y":4.8026},{"Date":"2024-01-18","Close":4.7987,"Ticker":"ASIG","x":1705536000000,"y":4.7987},{"Date":"2024-01-19","Close":4.7904,"Ticker":"ASIG","x":1705622400000,"y":4.7904},{"Date":"2024-01-22","Close":4.798,"Ticker":"ASIG","x":1705881600000,"y":4.798},{"Date":"2024-01-23","Close":4.8026,"Ticker":"ASIG","x":1705968000000,"y":4.8026},{"Date":"2024-01-24","Close":4.7994,"Ticker":"ASIG","x":1706054400000,"y":4.7994},{"Date":"2024-01-25","Close":4.8062,"Ticker":"ASIG","x":1706140800000,"y":4.8062},{"Date":"2024-01-26","Close":4.8019,"Ticker":"ASIG","x":1706227200000,"y":4.8019},{"Date":"2024-01-29","Close":4.8043,"Ticker":"ASIG","x":1706486400000,"y":4.8043},{"Date":"2024-01-30","Close":4.8153,"Ticker":"ASIG","x":1706572800000,"y":4.8153},{"Date":"2024-01-31","Close":4.8554,"Ticker":"ASIG","x":1706659200000,"y":4.8554},{"Date":"2024-02-01","Close":4.867,"Ticker":"ASIG","x":1706745600000,"y":4.867},{"Date":"2024-02-02","Close":4.8431,"Ticker":"ASIG","x":1706832000000,"y":4.8431},{"Date":"2024-02-05","Close":4.7937,"Ticker":"ASIG","x":1707091200000,"y":4.7937},{"Date":"2024-02-06","Close":4.8185,"Ticker":"ASIG","x":1707177600000,"y":4.8185},{"Date":"2024-02-07","Close":4.8248,"Ticker":"ASIG","x":1707264000000,"y":4.8248},{"Date":"2024-02-08","Close":4.8041,"Ticker":"ASIG","x":1707350400000,"y":4.8041},{"Date":"2024-02-09","Close":4.811,"Ticker":"ASIG","x":1707436800000,"y":4.811},{"Date":"2024-02-12","Close":4.8121,"Ticker":"ASIG","x":1707696000000,"y":4.8121},{"Date":"2024-02-13","Close":4.8165,"Ticker":"ASIG","x":1707782400000,"y":4.8165},{"Date":"2024-02-14","Close":4.7996,"Ticker":"ASIG","x":1707868800000,"y":4.7996},{"Date":"2024-02-15","Close":4.8121,"Ticker":"ASIG","x":1707955200000,"y":4.8121},{"Date":"2024-02-16","Close":4.8035,"Ticker":"ASIG","x":1708041600000,"y":4.8035},{"Date":"2024-02-19","Close":4.8015,"Ticker":"ASIG","x":1708300800000,"y":4.8015},{"Date":"2024-02-20","Close":4.8191,"Ticker":"ASIG","x":1708387200000,"y":4.8191},{"Date":"2024-02-21","Close":4.8231,"Ticker":"ASIG","x":1708473600000,"y":4.8231}],"type":"line"},{"name":"MANA","data":[{"Date":"2023-02-22","Close":3.7454,"Ticker":"MANA","x":1677024000000,"y":3.7454},{"Date":"2023-02-24","Close":3.6047,"Ticker":"MANA","x":1677196800000,"y":3.6047},{"Date":"2023-02-27","Close":3.6406,"Ticker":"MANA","x":1677456000000,"y":3.6406},{"Date":"2023-02-28","Close":3.5327,"Ticker":"MANA","x":1677542400000,"y":3.5327},{"Date":"2023-03-01","Close":3.53,"Ticker":"MANA","x":1677628800000,"y":3.53},{"Date":"2023-03-02","Close":3.45,"Ticker":"MANA","x":1677715200000,"y":3.45},{"Date":"2023-03-03","Close":3.27,"Ticker":"MANA","x":1677801600000,"y":3.27},{"Date":"2023-03-06","Close":3.1304,"Ticker":"MANA","x":1678060800000,"y":3.1304},{"Date":"2023-03-07","Close":3.2319,"Ticker":"MANA","x":1678147200000,"y":3.2319},{"Date":"2023-03-08","Close":3.1267,"Ticker":"MANA","x":1678233600000,"y":3.1267},{"Date":"2023-03-09","Close":2.9971,"Ticker":"MANA","x":1678320000000,"y":2.9971},{"Date":"2023-03-13","Close":3.0721,"Ticker":"MANA","x":1678665600000,"y":3.0721},{"Date":"2023-03-14","Close":3.4797,"Ticker":"MANA","x":1678752000000,"y":3.4797},{"Date":"2023-03-15","Close":3.3312,"Ticker":"MANA","x":1678838400000,"y":3.3312},{"Date":"2023-03-16","Close":3.0793,"Ticker":"MANA","x":1678924800000,"y":3.0793},{"Date":"2023-03-17","Close":3.3262,"Ticker":"MANA","x":1679011200000,"y":3.3262},{"Date":"2023-03-20","Close":3.3663,"Ticker":"MANA","x":1679270400000,"y":3.3663},{"Date":"2023-03-21","Close":3.3663,"Ticker":"MANA","x":1679356800000,"y":3.3663},{"Date":"2023-03-22","Close":3.2646,"Ticker":"MANA","x":1679443200000,"y":3.2646},{"Date":"2023-03-23","Close":3.2921,"Ticker":"MANA","x":1679529600000,"y":3.2921},{"Date":"2023-03-24","Close":3.1854,"Ticker":"MANA","x":1679616000000,"y":3.1854},{"Date":"2023-03-27","Close":3.1125,"Ticker":"MANA","x":1679875200000,"y":3.1125},{"Date":"2023-03-28","Close":3,"Ticker":"MANA","x":1679961600000,"y":3},{"Date":"2023-03-29","Close":3,"Ticker":"MANA","x":1680048000000,"y":3},{"Date":"2023-03-30","Close":3.0907,"Ticker":"MANA","x":1680134400000,"y":3.0907},{"Date":"2023-03-31","Close":3.0406,"Ticker":"MANA","x":1680220800000,"y":3.0406},{"Date":"2023-04-03","Close":3.1493,"Ticker":"MANA","x":1680480000000,"y":3.1493},{"Date":"2023-04-04","Close":3.1228,"Ticker":"MANA","x":1680566400000,"y":3.1228},{"Date":"2023-04-05","Close":3.1877,"Ticker":"MANA","x":1680652800000,"y":3.1877},{"Date":"2023-04-06","Close":3.2081,"Ticker":"MANA","x":1680739200000,"y":3.2081},{"Date":"2023-04-11","Close":3.2081,"Ticker":"MANA","x":1681171200000,"y":3.2081},{"Date":"2023-04-12","Close":3.1073,"Ticker":"MANA","x":1681257600000,"y":3.1073},{"Date":"2023-04-13","Close":3.2029,"Ticker":"MANA","x":1681344000000,"y":3.2029},{"Date":"2023-04-14","Close":3.2029,"Ticker":"MANA","x":1681430400000,"y":3.2029},{"Date":"2023-04-17","Close":3.5035,"Ticker":"MANA","x":1681689600000,"y":3.5035},{"Date":"2023-04-18","Close":3.576,"Ticker":"MANA","x":1681776000000,"y":3.576},{"Date":"2023-04-19","Close":3.5228,"Ticker":"MANA","x":1681862400000,"y":3.5228},{"Date":"2023-04-20","Close":3.2696,"Ticker":"MANA","x":1681948800000,"y":3.2696},{"Date":"2023-04-21","Close":3.2696,"Ticker":"MANA","x":1682035200000,"y":3.2696},{"Date":"2023-04-24","Close":2.9373,"Ticker":"MANA","x":1682294400000,"y":2.9373},{"Date":"2023-04-25","Close":2.8519,"Ticker":"MANA","x":1682380800000,"y":2.8519},{"Date":"2023-04-26","Close":2.8883,"Ticker":"MANA","x":1682467200000,"y":2.8883},{"Date":"2023-04-27","Close":2.8443,"Ticker":"MANA","x":1682553600000,"y":2.8443},{"Date":"2023-04-28","Close":2.9045,"Ticker":"MANA","x":1682640000000,"y":2.9045},{"Date":"2023-05-02","Close":2.7804,"Ticker":"MANA","x":1682985600000,"y":2.7804},{"Date":"2023-05-03","Close":2.7524,"Ticker":"MANA","x":1683072000000,"y":2.7524},{"Date":"2023-05-04","Close":2.7524,"Ticker":"MANA","x":1683158400000,"y":2.7524},{"Date":"2023-05-05","Close":2.7992,"Ticker":"MANA","x":1683244800000,"y":2.7992},{"Date":"2023-05-08","Close":2.7992,"Ticker":"MANA","x":1683504000000,"y":2.7992},{"Date":"2023-05-09","Close":2.7992,"Ticker":"MANA","x":1683590400000,"y":2.7992},{"Date":"2023-05-10","Close":2.437,"Ticker":"MANA","x":1683676800000,"y":2.437},{"Date":"2023-05-11","Close":2.461,"Ticker":"MANA","x":1683763200000,"y":2.461},{"Date":"2023-05-12","Close":2.3769,"Ticker":"MANA","x":1683849600000,"y":2.3769},{"Date":"2023-05-15","Close":2.5061,"Ticker":"MANA","x":1684108800000,"y":2.5061},{"Date":"2023-05-16","Close":2.4967,"Ticker":"MANA","x":1684195200000,"y":2.4967},{"Date":"2023-05-17","Close":2.6566,"Ticker":"MANA","x":1684281600000,"y":2.6566},{"Date":"2023-05-18","Close":2.6796,"Ticker":"MANA","x":1684368000000,"y":2.6796},{"Date":"2023-05-19","Close":2.6341,"Ticker":"MANA","x":1684454400000,"y":2.6341},{"Date":"2023-05-22","Close":2.5543,"Ticker":"MANA","x":1684713600000,"y":2.5543},{"Date":"2023-05-23","Close":2.5641,"Ticker":"MANA","x":1684800000000,"y":2.5641},{"Date":"2023-05-24","Close":2.4329,"Ticker":"MANA","x":1684886400000,"y":2.4329},{"Date":"2023-05-25","Close":2.4878,"Ticker":"MANA","x":1684972800000,"y":2.4878},{"Date":"2023-05-26","Close":2.5098,"Ticker":"MANA","x":1685059200000,"y":2.5098},{"Date":"2023-05-29","Close":2.5654,"Ticker":"MANA","x":1685318400000,"y":2.5654},{"Date":"2023-05-30","Close":2.5511,"Ticker":"MANA","x":1685404800000,"y":2.5511},{"Date":"2023-05-31","Close":2.4867,"Ticker":"MANA","x":1685491200000,"y":2.4867},{"Date":"2023-06-01","Close":2.5157,"Ticker":"MANA","x":1685577600000,"y":2.5157},{"Date":"2023-06-02","Close":2.5877,"Ticker":"MANA","x":1685664000000,"y":2.5877},{"Date":"2023-06-05","Close":2.7397,"Ticker":"MANA","x":1685923200000,"y":2.7397},{"Date":"2023-06-06","Close":2.4294,"Ticker":"MANA","x":1686009600000,"y":2.4294},{"Date":"2023-06-07","Close":2.31,"Ticker":"MANA","x":1686096000000,"y":2.31},{"Date":"2023-06-08","Close":2.2424,"Ticker":"MANA","x":1686182400000,"y":2.2424},{"Date":"2023-06-09","Close":2.2486,"Ticker":"MANA","x":1686268800000,"y":2.2486},{"Date":"2023-06-12","Close":1.8049,"Ticker":"MANA","x":1686528000000,"y":1.8049},{"Date":"2023-06-13","Close":1.8077,"Ticker":"MANA","x":1686614400000,"y":1.8077},{"Date":"2023-06-14","Close":1.8431,"Ticker":"MANA","x":1686700800000,"y":1.8431},{"Date":"2023-06-15","Close":1.7376,"Ticker":"MANA","x":1686787200000,"y":1.7376},{"Date":"2023-06-16","Close":1.7475,"Ticker":"MANA","x":1686873600000,"y":1.7475},{"Date":"2023-06-19","Close":1.7493,"Ticker":"MANA","x":1687132800000,"y":1.7493},{"Date":"2023-06-20","Close":1.7504,"Ticker":"MANA","x":1687219200000,"y":1.7504},{"Date":"2023-06-21","Close":1.9274,"Ticker":"MANA","x":1687305600000,"y":1.9274},{"Date":"2023-06-22","Close":1.9329,"Ticker":"MANA","x":1687392000000,"y":1.9329},{"Date":"2023-06-23","Close":2.0001,"Ticker":"MANA","x":1687478400000,"y":2.0001},{"Date":"2023-06-26","Close":2.0344,"Ticker":"MANA","x":1687737600000,"y":2.0344},{"Date":"2023-06-27","Close":2.0208,"Ticker":"MANA","x":1687824000000,"y":2.0208},{"Date":"2023-06-28","Close":1.9515,"Ticker":"MANA","x":1687910400000,"y":1.9515},{"Date":"2023-06-29","Close":1.9411,"Ticker":"MANA","x":1687996800000,"y":1.9411},{"Date":"2023-06-30","Close":1.9465,"Ticker":"MANA","x":1688083200000,"y":1.9465},{"Date":"2023-07-03","Close":2.1557,"Ticker":"MANA","x":1688342400000,"y":2.1557},{"Date":"2023-07-04","Close":2.1186,"Ticker":"MANA","x":1688428800000,"y":2.1186},{"Date":"2023-07-05","Close":2.0142,"Ticker":"MANA","x":1688515200000,"y":2.0142},{"Date":"2023-07-06","Close":1.9967,"Ticker":"MANA","x":1688601600000,"y":1.9967},{"Date":"2023-07-07","Close":1.9957,"Ticker":"MANA","x":1688688000000,"y":1.9957},{"Date":"2023-07-10","Close":1.9795,"Ticker":"MANA","x":1688947200000,"y":1.9795},{"Date":"2023-07-11","Close":2.0152,"Ticker":"MANA","x":1689033600000,"y":2.0152},{"Date":"2023-07-12","Close":2.0385,"Ticker":"MANA","x":1689120000000,"y":2.0385},{"Date":"2023-07-13","Close":2.0483,"Ticker":"MANA","x":1689206400000,"y":2.0483},{"Date":"2023-07-14","Close":2.2275,"Ticker":"MANA","x":1689292800000,"y":2.2275},{"Date":"2023-07-17","Close":2.1081,"Ticker":"MANA","x":1689552000000,"y":2.1081},{"Date":"2023-07-18","Close":2.0559,"Ticker":"MANA","x":1689638400000,"y":2.0559},{"Date":"2023-07-19","Close":2.0441,"Ticker":"MANA","x":1689724800000,"y":2.0441},{"Date":"2023-07-20","Close":2.0756,"Ticker":"MANA","x":1689811200000,"y":2.0756},{"Date":"2023-07-21","Close":2.0754,"Ticker":"MANA","x":1689897600000,"y":2.0754},{"Date":"2023-07-24","Close":2.0023,"Ticker":"MANA","x":1690156800000,"y":2.0023},{"Date":"2023-07-25","Close":1.9903,"Ticker":"MANA","x":1690243200000,"y":1.9903},{"Date":"2023-07-26","Close":1.9918,"Ticker":"MANA","x":1690329600000,"y":1.9918},{"Date":"2023-07-27","Close":2.0223,"Ticker":"MANA","x":1690416000000,"y":2.0223},{"Date":"2023-07-28","Close":2.0292,"Ticker":"MANA","x":1690502400000,"y":2.0292},{"Date":"2023-07-31","Close":1.9999,"Ticker":"MANA","x":1690761600000,"y":1.9999},{"Date":"2023-08-01","Close":1.9668,"Ticker":"MANA","x":1690848000000,"y":1.9668},{"Date":"2023-08-02","Close":1.9588,"Ticker":"MANA","x":1690934400000,"y":1.9588},{"Date":"2023-08-03","Close":1.9407,"Ticker":"MANA","x":1691020800000,"y":1.9407},{"Date":"2023-08-04","Close":1.9087,"Ticker":"MANA","x":1691107200000,"y":1.9087},{"Date":"2023-08-07","Close":1.9085,"Ticker":"MANA","x":1691366400000,"y":1.9085},{"Date":"2023-08-08","Close":1.9344,"Ticker":"MANA","x":1691452800000,"y":1.9344},{"Date":"2023-08-09","Close":1.9206,"Ticker":"MANA","x":1691539200000,"y":1.9206},{"Date":"2023-08-10","Close":1.9155,"Ticker":"MANA","x":1691625600000,"y":1.9155},{"Date":"2023-08-11","Close":1.9246,"Ticker":"MANA","x":1691712000000,"y":1.9246},{"Date":"2023-08-14","Close":1.9213,"Ticker":"MANA","x":1691971200000,"y":1.9213},{"Date":"2023-08-15","Close":1.8859,"Ticker":"MANA","x":1692057600000,"y":1.8859},{"Date":"2023-08-16","Close":1.7651,"Ticker":"MANA","x":1692144000000,"y":1.7651},{"Date":"2023-08-17","Close":1.7199,"Ticker":"MANA","x":1692230400000,"y":1.7199},{"Date":"2023-08-18","Close":1.607,"Ticker":"MANA","x":1692316800000,"y":1.607},{"Date":"2023-08-21","Close":1.5488,"Ticker":"MANA","x":1692576000000,"y":1.5488},{"Date":"2023-08-22","Close":1.581,"Ticker":"MANA","x":1692662400000,"y":1.581},{"Date":"2023-08-23","Close":1.6061,"Ticker":"MANA","x":1692748800000,"y":1.6061},{"Date":"2023-08-24","Close":1.6045,"Ticker":"MANA","x":1692835200000,"y":1.6045},{"Date":"2023-08-25","Close":1.6034,"Ticker":"MANA","x":1692921600000,"y":1.6034},{"Date":"2023-08-28","Close":1.5952,"Ticker":"MANA","x":1693180800000,"y":1.5952},{"Date":"2023-08-29","Close":1.6454,"Ticker":"MANA","x":1693267200000,"y":1.6454},{"Date":"2023-08-30","Close":1.6007,"Ticker":"MANA","x":1693353600000,"y":1.6007},{"Date":"2023-08-31","Close":1.5961,"Ticker":"MANA","x":1693440000000,"y":1.5961},{"Date":"2023-09-01","Close":1.5544,"Ticker":"MANA","x":1693526400000,"y":1.5544},{"Date":"2023-09-04","Close":1.5366,"Ticker":"MANA","x":1693785600000,"y":1.5366},{"Date":"2023-09-05","Close":1.5594,"Ticker":"MANA","x":1693872000000,"y":1.5594},{"Date":"2023-09-06","Close":1.5555,"Ticker":"MANA","x":1693958400000,"y":1.5555},{"Date":"2023-09-07","Close":1.5708,"Ticker":"MANA","x":1694044800000,"y":1.5708},{"Date":"2023-09-08","Close":1.5569,"Ticker":"MANA","x":1694131200000,"y":1.5569},{"Date":"2023-09-11","Close":1.4269,"Ticker":"MANA","x":1694390400000,"y":1.4269},{"Date":"2023-09-12","Close":1.4632,"Ticker":"MANA","x":1694476800000,"y":1.4632},{"Date":"2023-09-13","Close":1.4789,"Ticker":"MANA","x":1694563200000,"y":1.4789},{"Date":"2023-09-14","Close":1.5505,"Ticker":"MANA","x":1694649600000,"y":1.5505},{"Date":"2023-09-15","Close":1.5553,"Ticker":"MANA","x":1694736000000,"y":1.5553},{"Date":"2023-09-18","Close":1.5779,"Ticker":"MANA","x":1694995200000,"y":1.5779},{"Date":"2023-09-19","Close":1.5937,"Ticker":"MANA","x":1695081600000,"y":1.5937},{"Date":"2023-09-20","Close":1.5723,"Ticker":"MANA","x":1695168000000,"y":1.5723},{"Date":"2023-09-21","Close":1.575,"Ticker":"MANA","x":1695254400000,"y":1.575},{"Date":"2023-09-22","Close":1.5749,"Ticker":"MANA","x":1695340800000,"y":1.5749},{"Date":"2023-09-25","Close":1.6081,"Ticker":"MANA","x":1695600000000,"y":1.6081},{"Date":"2023-09-26","Close":1.5852,"Ticker":"MANA","x":1695686400000,"y":1.5852},{"Date":"2023-09-27","Close":1.6005,"Ticker":"MANA","x":1695772800000,"y":1.6005},{"Date":"2023-09-28","Close":1.6033,"Ticker":"MANA","x":1695859200000,"y":1.6033},{"Date":"2023-09-29","Close":1.6454,"Ticker":"MANA","x":1695945600000,"y":1.6454},{"Date":"2023-10-02","Close":1.7305,"Ticker":"MANA","x":1696204800000,"y":1.7305},{"Date":"2023-10-03","Close":1.6652,"Ticker":"MANA","x":1696291200000,"y":1.6652},{"Date":"2023-10-04","Close":1.5999,"Ticker":"MANA","x":1696377600000,"y":1.5999},{"Date":"2023-10-05","Close":1.5981,"Ticker":"MANA","x":1696464000000,"y":1.5981},{"Date":"2023-10-06","Close":1.6026,"Ticker":"MANA","x":1696550400000,"y":1.6026},{"Date":"2023-10-09","Close":1.5244,"Ticker":"MANA","x":1696809600000,"y":1.5244},{"Date":"2023-10-10","Close":1.4952,"Ticker":"MANA","x":1696896000000,"y":1.4952},{"Date":"2023-10-11","Close":1.4679,"Ticker":"MANA","x":1696982400000,"y":1.4679},{"Date":"2023-10-12","Close":1.5055,"Ticker":"MANA","x":1697068800000,"y":1.5055},{"Date":"2023-10-13","Close":1.5107,"Ticker":"MANA","x":1697155200000,"y":1.5107},{"Date":"2023-10-16","Close":1.5557,"Ticker":"MANA","x":1697414400000,"y":1.5557},{"Date":"2023-10-17","Close":1.5117,"Ticker":"MANA","x":1697500800000,"y":1.5117},{"Date":"2023-10-18","Close":1.5041,"Ticker":"MANA","x":1697587200000,"y":1.5041},{"Date":"2023-10-19","Close":1.4835,"Ticker":"MANA","x":1697673600000,"y":1.4835},{"Date":"2023-10-20","Close":1.5452,"Ticker":"MANA","x":1697760000000,"y":1.5452},{"Date":"2023-10-23","Close":1.6356,"Ticker":"MANA","x":1698019200000,"y":1.6356},{"Date":"2023-10-24","Close":1.8105,"Ticker":"MANA","x":1698105600000,"y":1.8105},{"Date":"2023-10-25","Close":1.916,"Ticker":"MANA","x":1698192000000,"y":1.916},{"Date":"2023-10-26","Close":1.8188,"Ticker":"MANA","x":1698278400000,"y":1.8188},{"Date":"2023-10-27","Close":1.8579,"Ticker":"MANA","x":1698364800000,"y":1.8579},{"Date":"2023-10-30","Close":2.0086,"Ticker":"MANA","x":1698624000000,"y":2.0086},{"Date":"2023-10-31","Close":1.9427,"Ticker":"MANA","x":1698710400000,"y":1.9427},{"Date":"2023-11-01","Close":1.9467,"Ticker":"MANA","x":1698796800000,"y":1.9467},{"Date":"2023-11-02","Close":2.1157,"Ticker":"MANA","x":1698883200000,"y":2.1157},{"Date":"2023-11-03","Close":2.1318,"Ticker":"MANA","x":1698969600000,"y":2.1318},{"Date":"2023-11-06","Close":2.2343,"Ticker":"MANA","x":1699228800000,"y":2.2343},{"Date":"2023-11-07","Close":2.1753,"Ticker":"MANA","x":1699315200000,"y":2.1753},{"Date":"2023-11-08","Close":2.2382,"Ticker":"MANA","x":1699401600000,"y":2.2382},{"Date":"2023-11-09","Close":2.1753,"Ticker":"MANA","x":1699488000000,"y":2.1753},{"Date":"2023-11-10","Close":2.2613,"Ticker":"MANA","x":1699574400000,"y":2.2613},{"Date":"2023-11-13","Close":2.5685,"Ticker":"MANA","x":1699833600000,"y":2.5685},{"Date":"2023-11-14","Close":2.2944,"Ticker":"MANA","x":1699920000000,"y":2.2944},{"Date":"2023-11-15","Close":2.3241,"Ticker":"MANA","x":1700006400000,"y":2.3241},{"Date":"2023-11-16","Close":2.3053,"Ticker":"MANA","x":1700092800000,"y":2.3053},{"Date":"2023-11-17","Close":2.1604,"Ticker":"MANA","x":1700179200000,"y":2.1604},{"Date":"2023-11-20","Close":2.2297,"Ticker":"MANA","x":1700438400000,"y":2.2297},{"Date":"2023-11-21","Close":2.1203,"Ticker":"MANA","x":1700524800000,"y":2.1203},{"Date":"2023-11-22","Close":2.0569,"Ticker":"MANA","x":1700611200000,"y":2.0569},{"Date":"2023-11-23","Close":2.1044,"Ticker":"MANA","x":1700697600000,"y":2.1044},{"Date":"2023-11-24","Close":2.1632,"Ticker":"MANA","x":1700784000000,"y":2.1632},{"Date":"2023-11-27","Close":2.2833,"Ticker":"MANA","x":1701043200000,"y":2.2833},{"Date":"2023-11-28","Close":2.2462,"Ticker":"MANA","x":1701129600000,"y":2.2462},{"Date":"2023-11-29","Close":2.2564,"Ticker":"MANA","x":1701216000000,"y":2.2564},{"Date":"2023-11-30","Close":2.2536,"Ticker":"MANA","x":1701302400000,"y":2.2536},{"Date":"2023-12-01","Close":2.301,"Ticker":"MANA","x":1701388800000,"y":2.301},{"Date":"2023-12-04","Close":2.3524,"Ticker":"MANA","x":1701648000000,"y":2.3524},{"Date":"2023-12-05","Close":2.4339,"Ticker":"MANA","x":1701734400000,"y":2.4339},{"Date":"2023-12-06","Close":2.5929,"Ticker":"MANA","x":1701820800000,"y":2.5929},{"Date":"2023-12-07","Close":2.5913,"Ticker":"MANA","x":1701907200000,"y":2.5913},{"Date":"2023-12-08","Close":2.7111,"Ticker":"MANA","x":1701993600000,"y":2.7111},{"Date":"2023-12-11","Close":2.5776,"Ticker":"MANA","x":1702252800000,"y":2.5776},{"Date":"2023-12-12","Close":2.5508,"Ticker":"MANA","x":1702339200000,"y":2.5508},{"Date":"2023-12-13","Close":2.537,"Ticker":"MANA","x":1702425600000,"y":2.537},{"Date":"2023-12-14","Close":2.6335,"Ticker":"MANA","x":1702512000000,"y":2.6335},{"Date":"2023-12-15","Close":2.5897,"Ticker":"MANA","x":1702598400000,"y":2.5897},{"Date":"2023-12-18","Close":2.3867,"Ticker":"MANA","x":1702857600000,"y":2.3867},{"Date":"2023-12-19","Close":2.4884,"Ticker":"MANA","x":1702944000000,"y":2.4884},{"Date":"2023-12-20","Close":2.6132,"Ticker":"MANA","x":1703030400000,"y":2.6132},{"Date":"2023-12-21","Close":2.6653,"Ticker":"MANA","x":1703116800000,"y":2.6653},{"Date":"2023-12-22","Close":2.6777,"Ticker":"MANA","x":1703203200000,"y":2.6777},{"Date":"2023-12-27","Close":2.8504,"Ticker":"MANA","x":1703635200000,"y":2.8504},{"Date":"2023-12-28","Close":2.6991,"Ticker":"MANA","x":1703721600000,"y":2.6991},{"Date":"2023-12-29","Close":2.669,"Ticker":"MANA","x":1703808000000,"y":2.669},{"Date":"2024-01-02","Close":2.757,"Ticker":"MANA","x":1704153600000,"y":2.757},{"Date":"2024-01-03","Close":2.4558,"Ticker":"MANA","x":1704240000000,"y":2.4558},{"Date":"2024-01-04","Close":2.4357,"Ticker":"MANA","x":1704326400000,"y":2.4357},{"Date":"2024-01-05","Close":2.3099,"Ticker":"MANA","x":1704412800000,"y":2.3099},{"Date":"2024-01-08","Close":2.2526,"Ticker":"MANA","x":1704672000000,"y":2.2526},{"Date":"2024-01-09","Close":2.1912,"Ticker":"MANA","x":1704758400000,"y":2.1912},{"Date":"2024-01-10","Close":2.253,"Ticker":"MANA","x":1704844800000,"y":2.253},{"Date":"2024-01-11","Close":2.4439,"Ticker":"MANA","x":1704931200000,"y":2.4439},{"Date":"2024-01-12","Close":2.415,"Ticker":"MANA","x":1705017600000,"y":2.415},{"Date":"2024-01-15","Close":2.3216,"Ticker":"MANA","x":1705276800000,"y":2.3216},{"Date":"2024-01-16","Close":2.3927,"Ticker":"MANA","x":1705363200000,"y":2.3927},{"Date":"2024-01-17","Close":2.385,"Ticker":"MANA","x":1705449600000,"y":2.385},{"Date":"2024-01-18","Close":2.323,"Ticker":"MANA","x":1705536000000,"y":2.323},{"Date":"2024-01-19","Close":2.3053,"Ticker":"MANA","x":1705622400000,"y":2.3053},{"Date":"2024-01-22","Close":2.3286,"Ticker":"MANA","x":1705881600000,"y":2.3286},{"Date":"2024-01-23","Close":2.1721,"Ticker":"MANA","x":1705968000000,"y":2.1721},{"Date":"2024-01-24","Close":2.2729,"Ticker":"MANA","x":1706054400000,"y":2.2729},{"Date":"2024-01-25","Close":2.2489,"Ticker":"MANA","x":1706140800000,"y":2.2489},{"Date":"2024-01-26","Close":2.3377,"Ticker":"MANA","x":1706227200000,"y":2.3377},{"Date":"2024-01-29","Close":2.3662,"Ticker":"MANA","x":1706486400000,"y":2.3662},{"Date":"2024-01-30","Close":2.3899,"Ticker":"MANA","x":1706572800000,"y":2.3899},{"Date":"2024-01-31","Close":2.3067,"Ticker":"MANA","x":1706659200000,"y":2.3067},{"Date":"2024-02-01","Close":2.2518,"Ticker":"MANA","x":1706745600000,"y":2.2518},{"Date":"2024-02-02","Close":2.3231,"Ticker":"MANA","x":1706832000000,"y":2.3231},{"Date":"2024-02-05","Close":2.2791,"Ticker":"MANA","x":1707091200000,"y":2.2791},{"Date":"2024-02-06","Close":2.2818,"Ticker":"MANA","x":1707177600000,"y":2.2818},{"Date":"2024-02-07","Close":2.254,"Ticker":"MANA","x":1707264000000,"y":2.254},{"Date":"2024-02-08","Close":2.3589,"Ticker":"MANA","x":1707350400000,"y":2.3589},{"Date":"2024-02-09","Close":2.4684,"Ticker":"MANA","x":1707436800000,"y":2.4684},{"Date":"2024-02-12","Close":2.5287,"Ticker":"MANA","x":1707696000000,"y":2.5287},{"Date":"2024-02-13","Close":2.4692,"Ticker":"MANA","x":1707782400000,"y":2.4692},{"Date":"2024-02-14","Close":2.5569,"Ticker":"MANA","x":1707868800000,"y":2.5569},{"Date":"2024-02-15","Close":2.6035,"Ticker":"MANA","x":1707955200000,"y":2.6035},{"Date":"2024-02-16","Close":2.6204,"Ticker":"MANA","x":1708041600000,"y":2.6204},{"Date":"2024-02-19","Close":2.6762,"Ticker":"MANA","x":1708300800000,"y":2.6762},{"Date":"2024-02-20","Close":2.5511,"Ticker":"MANA","x":1708387200000,"y":2.5511},{"Date":"2024-02-21","Close":2.3996,"Ticker":"MANA","x":1708473600000,"y":2.3996}],"type":"line"}],"xAxis":{"title":{"text":""}}},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadCSV":"Download CSV","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","downloadXLS":"Download XLS","drillUpText":"◁ Back to {series.name}","exitFullscreen":"Exit from full screen","exportData":{"annotationHeader":"Annotations","categoryDatetimeHeader":"DateTime","categoryHeader":"Category"},"hideData":"Hide data table","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbolMagnitude":1000,"numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"shortWeekdays":["Sat","Sun","Mon","Tue","Wed","Thu","Fri"],"thousandsSep":" ","viewData":"View data table","viewFullscreen":"View in full screen","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"stock","fonts":[],"debug":false},"evals":[],"jsHooks":[]}</script>
```



<!-- <div align="center">  -->
<!-- <img src="https://github.com/Fredysessie/Draft_gif/blob/main/figures/Etfs_plot.gif?raw=true" width="100%" height="480"> -->
<!-- </div>  -->


## **EN_Ticker_infos()** function

This function retrieves detailed information for a given stock ticker on the Euronext exchange.
It includes information such as currency, last traded price, valuation close, volume, turnover,
transactions, VWAP (Volume Weighted Average Price), open, high, low, threshold, previous close,
52-week range, and market capitalization.
The data is returned as a data frame.

*Inputs* :
- *ticker* A character string representing the company's ticker, name, or ISIN.
- *stock_type*   The type of the ticker: 'Eq_Ind' for Stocks and Indexes, 'Fund' or "F" for Fund tickers,'Bond' or "B" for Bond tickers, and 'Etfs' or "E" for EFTs.
- *escape* Boolean, either TRUE or FALSE. If escape is True, it means you're providing the DNA
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
   <td style="text-align:left;"> 36.82 </td>
   <td style="text-align:left;"> [21/02/2024 17:35] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Valuation Close </td>
   <td style="text-align:left;"> 36.82 </td>
   <td style="text-align:left;"> [21/02/2024] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume </td>
   <td style="text-align:left;"> 143,154 </td>
   <td style="text-align:left;"> [21/02/2024 17:35] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turnover </td>
   <td style="text-align:left;"> 5,271,059 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Transactions </td>
   <td style="text-align:left;"> 1,111 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VWAP </td>
   <td style="text-align:left;"> 36.8209 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Open </td>
   <td style="text-align:left;"> 36.96 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> High </td>
   <td style="text-align:left;"> 37.13 </td>
   <td style="text-align:left;"> [09:02] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Low </td>
   <td style="text-align:left;"> 36.60 </td>
   <td style="text-align:left;"> [09:43] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Threshold </td>
   <td style="text-align:left;"> 40.50      -      33.14 </td>
   <td style="text-align:left;"> [22/02/2024 07:30] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Previous Close </td>
   <td style="text-align:left;"> 36.85 </td>
   <td style="text-align:left;"> [20/02/2024] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 52 Week </td>
   <td style="text-align:left;"> 28.83      -      48.53 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Market Cap </td>
   <td style="text-align:left;"> 4.072B </td>
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
   <td style="text-align:left;"> 4,487.46 </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> High </td>
   <td style="text-align:left;"> 4,493.99 </td>
   <td style="text-align:left;"> [09:00] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Low </td>
   <td style="text-align:left;"> 4,464.25 </td>
   <td style="text-align:left;"> [16:31] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Previous Close </td>
   <td style="text-align:left;"> 4,487.43 </td>
   <td style="text-align:left;"> [20/02/2024] </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 52 Week </td>
   <td style="text-align:left;"> 3,696.85      -      4,553.63 </td>
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
   <td style="text-align:left;"> [21/02/2024] </td>
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
escape: A Boolean value (either TRUE or FALSE). If escape is set to True, it indicates that the DNA (ISIN-Market identifier) is provided directly. Using True for escape can help avoid time-consuming operations. If escape is set to False, the function expects the Ticker symbol, name, or ISIN, along with the type of market to which it belongs.
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
   <td style="text-align:left;"> 1OK98KQ84 </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 500 </td>
   <td style="text-align:left;"> Trading at last </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98KQ83 </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 249 </td>
   <td style="text-align:left;"> Trading at last </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98KQ82 </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98KQ81 </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 150 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98KQ80 </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 95 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98KQ7Z </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 268 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98KQ7Y </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 25 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98KQ7X </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 221 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98KQ7W </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 163 </td>
   <td style="text-align:left;"> Auction </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1OK98KQ7V </td>
   <td style="text-align:left;"> 17:35:16 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 227 </td>
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
   <td style="text-align:left;"> 5FC6JN8N </td>
   <td style="text-align:left;"> 15:00:38 </td>
   <td style="text-align:left;"> 10.005 </td>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> OffBook On Exchange </td>
  </tr>
</tbody>
</table>


### *Example 10.c* : Get Previous intraday prices of ETF AAPL by providing directly the ISIN-Market identifier


```r
intra_2 = EN_intraday_Data("XS2337099563-XAMS", escape = TRUE, day_type = 'Previous')
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
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 09:04:20 </td>
   <td style="text-align:left;"> 6.6587 </td>
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
   <td style="text-align:left;"> 18:05:03 </td>
   <td style="text-align:left;"> 4,482.11 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Closing Reference index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 18:00:01 </td>
   <td style="text-align:left;"> 4,482.11 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Closing Reference index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 18:00:00 </td>
   <td style="text-align:left;"> 4,482.07 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:53:45 </td>
   <td style="text-align:left;"> 4,482.08 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:53:30 </td>
   <td style="text-align:left;"> 4,482.07 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:52:15 </td>
   <td style="text-align:left;"> 4,482.08 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:52:00 </td>
   <td style="text-align:left;"> 4,482.07 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:51:00 </td>
   <td style="text-align:left;"> 4,482.08 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:50:45 </td>
   <td style="text-align:left;"> 4,482.07 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
  <tr>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 17:49:45 </td>
   <td style="text-align:left;"> 4,482.08 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> Real-time index </td>
  </tr>
</tbody>
</table>


## **En_Market.Sumarry()** function

The *En_Market.Sumarry()* function retrieve from Euronext the summaries of a giving Stock Market.

*Input* :
  - *stock_choice*: A character string specifying the market of interest. Available options include "a" or "amsterdam" for Amsterdam, "b" or "brussels" for Brussels, "d" or "dublin" for Dublin, "l" or "lisbon" for Lisbon, "m" or "milan" for Milan, "p" or "paris" for Paris, and "o" or "oslo" for Oslo.

*Return Value* :
A list containing summary data for the selected market, including information on stock indices and currency rates. The list includes the following components:
* Indices_summary: A data frame summarizing stock market indices for the selected market. It includes columns for the index name, last price, and percentage change. If the summary is not available, this component will be set to NA.

* EU_indices: A data frame summarizing EURONEXT indices for the selected market. It includes columns for the instrument name, last price, and percentage change. If the summary is not available, this component will be set to NA.

* Currency_rate: A data frame summarizing currency exchange rates for the selected market. It includes columns for the instrument name, last price, and percentage change. If the summary is not available, this component will be set to NA.

### *Example 11* : Retrieve Stocks Summary data


```r
# Retrieve summary data for 'Paris stock'
En_Market.Sumarry("p")

```



```
#> [1] "Summary data for 'Amsterdam stock indices'"
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Index </th>
   <th style="text-align:right;"> Last price </th>
   <th style="text-align:right;"> Change (%) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> CAC 40 </td>
   <td style="text-align:right;"> 7812.09 </td>
   <td style="text-align:right;"> 0.22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAC ALL SHARES </td>
   <td style="text-align:right;"> 9491.97 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAC NEXT 20 </td>
   <td style="text-align:right;"> 10998.09 </td>
   <td style="text-align:right;"> 0.49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAC SMALL </td>
   <td style="text-align:right;"> 11576.84 </td>
   <td style="text-align:right;"> -0.51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBF 120 </td>
   <td style="text-align:right;"> 5906.90 </td>
   <td style="text-align:right;"> 0.22 </td>
  </tr>
</tbody>
</table>

```
#> [1] "Summary data for 'EURONEXT indices'"
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Instrument name </th>
   <th style="text-align:right;"> Last price </th>
   <th style="text-align:right;"> Day change relative (%) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> EURONEXT 100 </td>
   <td style="text-align:right;"> 1445.06 </td>
   <td style="text-align:right;"> 0.23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CLIMATE EUROPE </td>
   <td style="text-align:right;"> 1858.95 </td>
   <td style="text-align:right;"> -0.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LOW CARBON 100 </td>
   <td style="text-align:right;"> 159.58 </td>
   <td style="text-align:right;"> -0.23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NEXT BIOTECH </td>
   <td style="text-align:right;"> 2265.23 </td>
   <td style="text-align:right;"> 0.23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ESG 80 </td>
   <td style="text-align:right;"> 2006.55 </td>
   <td style="text-align:right;"> 0.08 </td>
  </tr>
</tbody>
</table>

```
#> [1] "Summary data for 'Currency rate'"
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Instrument name </th>
   <th style="text-align:right;"> Last price </th>
   <th style="text-align:right;"> Day change relative (%) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> EUR / USD </td>
   <td style="text-align:right;"> 1.08362 </td>
   <td style="text-align:right;"> 0.15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EUR / GBP </td>
   <td style="text-align:right;"> 0.85678 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EUR / JPY </td>
   <td style="text-align:right;"> 162.84100 </td>
   <td style="text-align:right;"> 0.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EUR / CHF </td>
   <td style="text-align:right;"> 0.95125 </td>
   <td style="text-align:right;"> -0.05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GBP / USD </td>
   <td style="text-align:right;"> 1.26477 </td>
   <td style="text-align:right;"> 0.08 </td>
  </tr>
</tbody>
</table>

## **EN_Get_OB()** function :

*Purpose* : Retrieves order book data for a given stock or ETF ticker on the Euronext exchange.

*Inputs*:
•	ticker: A character string representing the company's (equity or ETF) ticker, name, or ISIN.
•	stock_type: The type of the ticker. It can be 'Equity' for stocks or 'Etf' for ETFs.

*Output* : Returns a data frame containing order book data with columns representing buy (bid) and sell (ask) orders, including order quantity and price.

### *Example 12* : Get order book data


```r
# Get order book data for ABC ARBITRAGE ticker
ABCA_OB <- EN_Get_OB("ABCA")
print(ABCA_OB)

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> B_order </th>
   <th style="text-align:right;"> B_quantity </th>
   <th style="text-align:left;"> Bid_Price </th>
   <th style="text-align:left;"> Ask_Price </th>
   <th style="text-align:right;"> A_quantity </th>
   <th style="text-align:right;"> A_order </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 742 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 3004 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:left;"> 4.35 </td>
   <td style="text-align:left;"> 3.7 </td>
   <td style="text-align:right;"> 768 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 400 </td>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:right;"> 20000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1508 </td>
   <td style="text-align:left;"> 3.8 </td>
   <td style="text-align:left;"> 3.75 </td>
   <td style="text-align:right;"> 203 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 189 </td>
   <td style="text-align:left;"> 3.75 </td>
   <td style="text-align:left;"> 3.81 </td>
   <td style="text-align:right;"> 20000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 664 </td>
   <td style="text-align:left;"> 3.74 </td>
   <td style="text-align:left;"> 3.85 </td>
   <td style="text-align:right;"> 5000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1500 </td>
   <td style="text-align:left;"> 3.73 </td>
   <td style="text-align:left;"> 3.86 </td>
   <td style="text-align:right;"> 129 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 102 </td>
   <td style="text-align:left;"> 3.72 </td>
   <td style="text-align:left;"> 3.88 </td>
   <td style="text-align:right;"> 500 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 140 </td>
   <td style="text-align:left;"> 3.715 </td>
   <td style="text-align:left;"> 3.9 </td>
   <td style="text-align:right;"> 6179 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 2077 </td>
   <td style="text-align:left;"> 3.71 </td>
   <td style="text-align:left;"> 3.92 </td>
   <td style="text-align:right;"> 127 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 7345 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:right;"> 55910 </td>
   <td style="text-align:right;"> 20 </td>
  </tr>
</tbody>
</table>


```r
# Get order book data for MSFT ETF
MSFT_OB <- EN_Get_OB("MSFT", stock_type = 'Etf')
print(MSFT_OB)

```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> B_order </th>
   <th style="text-align:right;"> B_quantity </th>
   <th style="text-align:left;"> Bid_Price </th>
   <th style="text-align:left;"> Ask_Price </th>
   <th style="text-align:right;"> A_quantity </th>
   <th style="text-align:right;"> A_order </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

## **EN_OrderBook.Chart()** function

*Purpose* : Retrieves order book data from Euronext for a given stock or ETF ticker and plots its chart.
*Inputs *:
- ticker: The ticker symbol for which the order book chart will be plotted.
- bid.col: Color for bid prices in the chart. Default is '#00FF00' (green).
- ask.col: Color for ask prices in the chart. Default is '#FF0000' (red).
- plot_type: Type of visualization ('depth' or 'barh'). Default is 'depth'
- stock_type: The type of the ticker. It can be 'Equity' for stocks or 'Etf' for ETFs.

*Output* : Returns a Highchart plot displaying the order book for the provided ticker.


### *Example 13* : Plot Order Book chart


```r
# Plot order book chart for ABC ARBITRAGE ticker using default colors
ABCA_OB_chart <- EN_OrderBook.Chart("FR0004040608", plot_type = 'barh')

ABCA_OB_chart
```

```{=html}
<div class="highchart html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-6364be078def3019a5e3" style="width:100%;height:576px;"></div>
<script type="application/json" data-for="htmlwidget-6364be078def3019a5e3">{"x":{"hc_opts":{"chart":{"reflow":true,"type":"bar","margin":[60,25,50,50]},"title":{"text":"ABC ARBITRAGE Buy & Sell Orders"},"yAxis":[{"max":20000,"title":{"text":null},"width":175,"reversed":true},{"max":20000,"offset":0,"title":{"text":null},"left":300,"width":175}],"credits":{"enabled":false},"exporting":{"enabled":true,"filename":"ABC_ARBITRAGE_Buy_Sell_Orders_"},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"legend":{"enabled":true,"align":"left","verticalAlign":"top","y":-15},"tooltip":{"formatter":"function () { return '<b>' + this.series.name + ' : ' + this.point.category + '<\/b><br/>' + 'Quantity: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0); }"},"xAxis":{"categories":[4.35,4,3.92,3.9,3.88,3.86,3.85,3.81,3.8,3.75,3.75,3.74,3.73,3.72,3.72,3.715,3.71,3.7],"labels":{"useHTML":true,"formatter":"function() { return '<div class=\"xlabel\">'+ this.value +'<\/div>'; }"},"lineWidth":0,"tickWidth":0,"offset":-240},"series":[{"data":[23,400,127,6179,500,129,5000,20000,1508,null,null,null,null,null,null,null,null,null],"yAxis":1,"name":"Sell Orders","color":"#FF0000"},{"data":[null,null,null,null,null,null,null,null,null,203,189,664,1500,20000,102,140,2077,768],"yAxis":0,"name":"Buy Orders","color":"darkgreen"}]},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadCSV":"Download CSV","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","downloadXLS":"Download XLS","drillUpText":"◁ Back to {series.name}","exitFullscreen":"Exit from full screen","exportData":{"annotationHeader":"Annotations","categoryDatetimeHeader":"DateTime","categoryHeader":"Category"},"hideData":"Hide data table","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbolMagnitude":1000,"numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"shortWeekdays":["Sat","Sun","Mon","Tue","Wed","Thu","Fri"],"thousandsSep":" ","viewData":"View data table","viewFullscreen":"View in full screen","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"chart","fonts":[],"debug":false},"evals":["hc_opts.tooltip.formatter","hc_opts.xAxis.labels.formatter"],"jsHooks":[]}</script>
```

<!-- <div align="center">  -->

<!-- <img src="https://github.com/Fredysessie/Draft_gif/blob/main/figures/OB_Market_Barh_ABC_arbitrage.png?raw=true" width="90%" height="480"> -->

<!-- </div>  -->



```r
# Plot order book Market Depth chart for LEBON ticker with default colors ie "darkgreen" and "red"

# In case you want to change colors 
# ALBON_OB_chart <- EN_OrderBook.Chart("ALBON", bid.col = 'cyan', ask.col ='gold')

ALBON_OB_chart <- EN_OrderBook.Chart("ALBON") #Using default parameters
ALBON_OB_chart
```

```{=html}
<div class="highchart html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-730669768dc579d8e10b" style="width:100%;height:576px;"></div>
<script type="application/json" data-for="htmlwidget-730669768dc579d8e10b">{"x":{"hc_opts":{"chart":{"reflow":true,"type":"area","zoomType":"xy"},"title":{"text":"LEBON Market Depth"},"yAxis":[{"lineWidth":1,"gridLineWidth":1,"title":{"text":null},"tickWidth":1,"tickLength":5,"tickPosition":"inside","labels":{"align":"left","x":8}},{"opposite":true,"linkedTo":0,"lineWidth":1,"gridLineWidth":0,"title":{"text":null},"tickWidth":1,"tickLength":5,"tickPosition":"inside","labels":{"align":"right","x":-8}}],"credits":{"enabled":false},"exporting":{"enabled":true,"filename":"LEBON_Market_Depth_"},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"},"area":{"fillOpacity":0.2,"lineWidth":1,"step":"center"}},"xAxis":{"minPadding":0,"maxPadding":0,"plotLines":[{"color":"#FF0000","value":93,"width":1,"label":{"text":"Actual price","rotation":90}}],"title":{"text":"Price"}},"legend":{"enabled":false},"tooltip":{"headerFormat":"<span style=\"font-size=10px;\">Price: {point.key}<\/span><br/>","valueDecimals":0},"series":[{"name":"Bids","data":[{"x":null,"y":1},{"x":93,"y":3},{"x":92.6,"y":10},{"x":92.4,"y":11},{"x":92.2,"y":10},{"x":92,"y":16},{"x":91.6,"y":10},{"x":91.4,"y":10},{"x":91.2,"y":20},{"x":91,"y":11}],"color":"darkgreen"},{"name":"Asks","data":[{"x":null,"y":1},{"x":93.4,"y":20},{"x":93.6,"y":10},{"x":93.8,"y":80},{"x":94.4,"y":4},{"x":95.6,"y":50},{"x":96,"y":32},{"x":97,"y":30},{"x":98,"y":6},{"x":99.6,"y":26}],"color":"#FF0000"}]},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadCSV":"Download CSV","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","downloadXLS":"Download XLS","drillUpText":"◁ Back to {series.name}","exitFullscreen":"Exit from full screen","exportData":{"annotationHeader":"Annotations","categoryDatetimeHeader":"DateTime","categoryHeader":"Category"},"hideData":"Hide data table","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbolMagnitude":1000,"numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"shortWeekdays":["Sat","Sun","Mon","Tue","Wed","Thu","Fri"],"thousandsSep":" ","viewData":"View data table","viewFullscreen":"View in full screen","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"chart","fonts":[],"debug":false},"evals":[],"jsHooks":[]}</script>
```

<!-- <div align="center">  -->

<!-- <img src="https://github.com/Fredysessie/Draft_gif/blob/main/figures/OB_Market_depth.png?raw=true" width="90%" height="480"> -->

<!-- </div>  -->



**Authors** : <br> 
* [Koffi Frederic Sessie](https://github.com/Koffi-Fredysessie) (<koffisessie@gmail.com>)

**Creator** : Koffi Frederic Sessie <br>  **cph (Copyright Holder)** : Koffi Frederic Sessie <br>


**License** : MIT 2024, Koffi Frederic SESSIE. All rights reserved.
