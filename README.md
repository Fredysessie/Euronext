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

### *Example 2.c* : Show in detail Paris Euronext Stocks


```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-788b6255a354e5e784fb" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-788b6255a354e5e784fb">{"x":{"filter":"none","vertical":false,"extensions":["ColReorder","RowReorder","Buttons","Responsive"],"data":[["1000MERCIS","2CRSI","A.S.T. GROUPE","AB SCIENCE","ABC ARBITRAGE","ABEO","ABIONYX PHARMA","ABIVAX","ABL Diagnostics","ABO GROUP","ACANTHE DEV.","ACCOR","ACHETER-LOUER.FR","ACTEOS","ACTIA GROUP","ACTICOR BIOTECH","ACTIVIUM GROUP","ADC SIIC","ADEUNIS","ADOCIA","ADOMOS","ADP","ADUX","ADVICENNE","ADVINI","AELIS FARMA","AERKOMM INC","AFFLUENT MED BSAR","AFFLUENT MEDICAL","AFYREN","AG3I","AGENCE AUTO","AGP MALAGA SOCIMI","AGRIPOWER","AGROGENERATION","AIR FRANCE -KLM","AIR LIQUIDE","AIRBUS","AIRWELL","AKWEL","ALAN ALLMAN","ALCHIMIE","ALD","ALGREEN","ALPES (COMPAGNIE)","ALPHA MOS","ALSTOM","ALTAMIR","ALTAREA","ALTAREIT","ALTEN","ALTHEORA","ALTUR INVEST.","ALVEEN","AMA CORPORATION","AMATHEON AGRI","AMOEBA","AMPLITUDE SURGICAL","AMUNDI","ANDINO GLOBAL","ANTIN INFRA PARTN","APERAM","APODACA INVERSIONE","AQUILA","ARAMIS GROUP","ARCELORMITTAL SA","ARCHOS","ARCURE","ARDOIN ST AMAND A","ARDOIN ST AMAND B","AREF THALASSA","ARGAN","ARIMELIA ITG","ARKEMA","AROCA DEL PINAR","ARTEA","ARTMARKET COM","ARTOIS NOM.","ARVERNE GROUP","ARVERNE WARRANT","ASHLER ET MANSON","ASSYSTEM","ASTICKSO XXI","ATARI","ATEME","ATLAND","ATOS","AUBAY","AUDACIA","AUGROS COSMETICS","AUPLATA MINING GR","AUREA","AURES TECHNOLOGIES","AVENIR TELECOM","AXA","AXA NV24","AXWAY SOFTWARE","AZ LEASING","AZOREAN TECH","BAIKOWSKI","BAINS MER MONACO","BALYO","BARBARA BUI","BARINGS CORE SPAIN","BASSAC","BASTIDE LE CONFORT","BATLA MINERALS","BD MULTI MEDIA","BEACONSMIND","BEBO HEALTH","BELIEVE","BENETEAU","BERNARD LOISEAU","BIC","BIGBEN INTERACTIVE","BILENDI","BIO-UV GROUP","BIOMERIEUX","BIOPHYTIS","BIOPHYTIS BSA","BIOPHYTIS BSA","BIOSENIC","BIOSYNEX","BLEECKER","BLUE SHARK POWER","BLUELINEA","BNP PARIBAS ACT.A","BOA CONCEPT","BODY ONE","BOIRON","BOLLORE","BONDUELLE","BONYF","BOOSTHEAT","BOURRELIER GROUP","BOURSE DIRECT","BOUYGUES","BOUYGUES NV24","BROADPEAK","BUREAU VERITAS","BURELLE","CA TOULOUSE 31 CCI","CABASSE","CAFOM","CAMBODGE NOM.","CAPELLI","CAPGEMINI","CARBIOS","CARMAT","CARMILA","CARPINIENNE PART.","CARREFOUR","CASINO GUICHARD","CATANA GROUP","CATERING INTL SCES","CATERPILLAR INC","CBI","CBI BSA","CBO TERRITORIA","CEGEDIM","CELLECTIS","CELYAD ONCOLOGY","CERINNOV GROUP","CFI","CFM INDOSUEZWEALTH","CGG","CH.FER DEPARTEMENT","CH.FER VAR GARD N.","CHARGEURS","CHARWOOD ENERGY","CHAUSSERIA","CHEOPS TECHNOLOGY","CHRISTIAN DIOR","CIBOX INTER A CTIV","CIE DU MONT BLANC","CLARANOVA","CLARIANE","CLASQUIN","CMG CLEANTECH","CNOVA","COFACE","COFIDUR","COGELEC","COGRA","COHERIS","COIL","COLIPAYS","COMPAGNIE ODET","CONDOR TECHNOLOG","CONSORT NT","CONSTRUCTEURS BOIS","CORE SPAIN HOLDCO","COREP LIGHTING","CORETECH 5","COTY","COURBET","COURTOIS","COVIVIO","COVIVIO HOTELS","CRCAM ALP.PROV.CCI","CRCAM ATL.VEND.CCI","CRCAM BRIE PIC2CCI","CRCAM ILLE-VIL.CCI","CRCAM LANGUED CCI","CRCAM LOIRE HTE L.","CRCAM MORBIHAN CCI","CRCAM NORD CCI","CRCAM NORM.SEINE","CRCAM PARIS ET IDF","CRCAM SUD R.A.CCI","CRCAM TOURAINE CCI","CREDIT AGRICOLE","CROSSJECT","CROSSWOOD","CYBERGUN","CYBERGUN BSA K1","CYBERGUN BSA K2A","CYBERGUN BSA K2B","D.L.S.I.","DAMARIS","DAMARTEX","DANONE","DASSAULT AVIATION","DASSAULT SYSTEMES","DBT","DBV TECHNOLOGIES","DEEZER","DEEZER WARRANTS","DEKUPLE","DELFINGEN","DELTA PLUS GROUP","DERICHEBOURG","DEVERNOIS","DIAGNOSTIC MED BSA","DIAGNOSTIC MEDICAL","DMS IMAGING","DNXCORP","DOCK.PETR.AMBES AM","DOLFINES","DONTNOD","DRONE VOLT","DRONE VOLT BS26","DYNAFOND","DYNEX ENERGY SA","E PANGO","EASSON HOLDINGS","EAUX DE ROYAN","EAVS","ECOLUTIONS","ECOMIAM","ECOSLOPS","EDENRED","EDILIZIACROBATICA","EDITIONS DU SIGNE","EDUFORM ACTION","EDUNIVERSAL","EGIDE","EIFFAGE","EKINOPS","ELEC.STRASBOURG","ELECT. MADAGASCAR","ELIOR GROUP","ELIS","ELIX","EMBENTION","EMOVA GROUP","ENCRES DUBUIT","ENENSYS","ENERGISME","ENERTIME","ENGIE","ENIBLOCK","ENOGIA","ENTECH","ENTREPARTICULIERS","ENTREPRENDRE","EO2","EQUASENS","ERAMET","EROLD","ESKER","ESSILORLUXOTTICA","ESSO","EURASIA FONC INV","EURASIA GROUPE","EURAZEO","EURO RESSOURCES","EUROAPI","EUROBIO-SCIENTIFIC","EUROFINS CEREP","EUROFINS SCIE.NV24","EUROFINS SCIENT.","EUROLAND CORPORATE","EUROLOG CANOLA","EURONEXT","EUROPACORP","EUROPLASMA","EUTELSAT COMMUNIC.","EVERGREEN","EXACOMPTA CLAIREF.","EXAIL TECHNOLOGIES","EXCLUSIVE NETWORKS","EXEL INDUSTRIES","EXPLOSIFS PROD.CHI","FACEPHI","FAIFEY INVEST","FASHION B AIR","FAYENC.SARREGUEMI.","FD","FDJ","FERM.CAS.MUN.CANNE","FERMENTALG","FIDUCIAL OFF.SOL.","FIDUCIAL REAL EST.","FIGEAC AERO","FILL UP MEDIA","FIN.ETANG BERRE","FIN.OUEST AFRICAIN","FINANCIERE MARJOS","FINATIS","FINAXO","FIPP","FIRSTCAUTION","FLEURY MICHON","FLORENTAISE","FNAC DARTY","FNPTECHNOLOGIESSA","FOCUSENTERTAINMENT","FONCIERE 7 INVEST","FONCIERE EURIS","FONCIERE INEA","FONCIERE LYONNAISE","FONCIERE VINDI","FONCIERE VOLTA","FORESTIERE EQUAT.","FORSEE POWER","FORVIA","FOUNTAINE PAJOT","FRANCAISE ENERGIE","FRANCE SOIR GROUPE","FRANCE TOURISME","FREELANCE.COM","FREY","G.A.I.","GALEO","GALIMMO","GASCOGNE","GAUMONT","GAUSSIN","GEA GRENOBL.ELECT.","GECI INTL","GECINA","GENERAL ELECTRIC","GENEURO","GENFIT","GENOWAY","GENSIGHT BIOLOGICS","GENTLEMENS EQUITY","GETLINK SE","GEVELOT","GL EVENTS","GLASS TO POWER A","GLASS TO POWER B","GLASS TO POWER WAR","GLOBAL BIOENERGIES","GLOBAL PIELAGO","GOLD BY GOLD","GPE GROUP PIZZORNO","GPE PAROT (AUTO)","GRAINES VOLTZ","GROLLEAU","GROUPE BERKEM","GROUPE CARNIVOR","GROUPE CRIT","GROUPE GUILLIN","GROUPE JAJ","GROUPE LDLC","GROUPE OKWIND","GROUPE PARTOUCHE","GROUPE PLUS-VALUES","GROUPE SFPI","GROUPE TERA","GROUPIMO","GT BIOPHARMA INC","GTT","GUANDAO PUER INVES","GUERBET","GUILLEMOT","HAFFNER ENERGY","HAMILTON GLOBAL OP","HAULOTTE GROUP","HDF","HEALTHCARE ACTIVOS","HERIGE","HERMES INTL","HEXAOM","HF COMPANY","HIGH CO","HIPAY GROUP","HITECHPROS","HK","HOCHE BAINS L.BAIN","HOFFMANN","HOME CONCEPT","HOPENING","HOPIUM","HOPSCOTCH GROUPE","HOT.MAJESTIC CANNE","HOTELES BESTPRICE","HOTELIM","HOTELS DE PARIS","HOTL.IMMOB.NICE","HUNYVERS","HYBRIGENICS","HYDRAULIQUE PB","HYDRO-EXPLOIT.","HYDROGEN REFUELING","I.CERAM","I2S","IANTE INVESTMENTS","ICADE","ICAPE HOLDING","ID LOGISTICS GROUP","IDI","IDS","IDSUD","IGIS NEPTUNE","IKONISYS","ILBE","IMALLIANCE","IMERYS","IMM.PARIS.PERLE","IMMERSION","IMMOB.DASSAULT","IMPLANET","IMPRIMERIE CHIRAT","IMPULSE FITNESS","INDLE FIN.ENTREPR.","INFOCLIP","INFOTEL","INMARK","INMOSUPA","INNATE PHARMA","INNELEC MULTIMEDIA","INNOVATIVE RFK SPA","INSTALLUX","INTEGRAGEN","INTEGRITAS VIAGER","INTERPARFUMS","INTEXA","INTRASENSE","INVENTIVA","INVIBES ADVERTSING","IPOSA PROPERTIES","IPSEN","IPSOS","ISPD","IT LINK","ITALY INNOVAZIONI","ITESOFT","JACQUES BOGART","JACQUET METALS","JCDECAUX","JSA TECHNOLOGY","JUNGLE21","KALRAY","KAUFMAN ET BROAD","KERING","KERLINK","KEYRUS","KKO INTERNATIONAL","KLARSEN","KLEPIERRE","KOMPUESTOS","KUMULUS VAPE","L","LA PERLA FASHION","LABO EUROMEDIS","LACROIX GROUP","LAGARDERE SA","LANSON-BCC","LARGO","LATECOERE","LAURENT-PERRIER","LDC","LEBON","LECTRA","LECTRA NV24","LEGRAND","LEPERMISLIBRE","LES HOTELS BAVEREZ","LEXIBOOK LINGUIST.","LHYFE","LINEDATA SERVICES","LISI","LLAMA GROUP","LLEIDA","LNA SANTE","LOCASYSTEM INTL","LOGIC INSTRUMENT","LOMBARD ET MEDOT","LUCIBEL","LUMIBIRD","LVMH","M.R.M","M2I","MAAT PHARMA","MADE","MAGILLEM","MAIS.ANTOINE BAUD","MAISON CLIO BLUE","MAISONS DU MONDE","MAKING SCIENCE","MALTERIES FCO-BEL.","MANITOU BF","MAQ ADMON. URBANAS","MARE NOSTRUM","MAROC TELECOM","MASTRAD","MASTRAD BS29","MAUNA KEA TECH","MAUREL ET PROM","MBWS","MCPHY ENERGY","MDV","MEDESIS PHARMA","MEDIA 6","MEDIA LAB","MEDIANTECHNOLOGIES","MEDINCELL","MEDIOCREDITO EUROP","MEMSCAP REGPT","MERCIALYS","MERIDIA RE IV","MERSEN","METABOLIC EXPLORER","METALLIANCE","METAVISIO","METHANOR","METRICS IN BALANCE","METROPOLE TV","MEXEDIA","MG INTERNATIONAL","MGI DIGITAL GRAPHI","MICHELIN","MICROPOLE","MIGUET ET ASSOCIES","MILIBOO","MINT","MND","MON COURTIER ENERG","MONCEY (FIN.) NOM.","MONTEA","MONTEPINO LOGISTIC","MOULINVEST","MR BRICOLAGE","MUNIC","MUTTER VENTURES","MYHOTELMATCH","NACON","NAMR","NANOBIOTIX","NEOEN","NEOLIFE","NEOVACS","NETGEM","NETMEDIA GROUP","NEURONES","NEXANS","NEXITY","NEXTEDIA","NFL BIOSCIENCES","NHOA","NICOX","NOKIA","NORTEM BIOGROUP","NOVACYT","NOVATECH IND.","NR21","NRJ GROUP","NSC GROUPE","NSE","OBIZ","OCTOPUS BIOSAFETY","OENEO","OK PROPERTIES","OL GROUPE","OMER-DECUGIS & CIE","ONCODESIGN PM","ONE EXPERIENCE","ONLINEFORMAPRO","ORANGE","ORAPI","ORBIS PROPERTIES","ORDISSIMO","OREGE","ORINOQUIA","ORPEA","OSE IMMUNO","OSMOSUN","OSMOZIS","OVH","PACTE NOVATION","PAREF","PARROT","PART.INDLES MINI.","PARX MATERIALS NV","PASSAT","PATRIMOINE ET COMM","PAULIC MEUNERIE","PERNOD RICARD","PERRIER (GERARD)","PERSEIDA RENTA","PET SERVICE","PEUGEOT INVEST","PHARNEXT","PHAXIAM Tx","PHONE WEB","PHOTONIKE CAPITAL","PIERRE VAC BSA ACT","PIERRE VAC BSA CRE","PIERRE VACANCES","PISCINES DESJOYAUX","PIXIUM VISION","PLACOPLATRE","PLANT ADVANCED","PLANT ADVANCED BS","PLAST.VAL LOIRE","PLASTIC OMNIUM","PLUXEE","POUJOULAT","POULAILLON","POXEL","PRECIA","PREDILIFE","PRISMAFLEX INTL","PROACTIS SA","PRODWARE","PRODWAYS","PROLOGUE","PROLOGUE BSA","PROP.IMMEUBLES","PUBLICIS GROUPE SA","QUADIENT","QUADPACK","QUANTUM GENOMICS","QWAMPLIFY","RACING FORCE","RALLYE","RAMSAY GEN SANTE","RAPID NUTRITION","REALITES","REMY COINTREAU","RENAULT","RES GESTAE SOCIMI","REWORLD MEDIA","REXEL","RIBER","ROBERTET","ROBERTET CDV 87","ROBERTET CI","ROCHE BOBOIS","ROCTOOL","ROCTOOL BSA 2020-2","ROUGIER S.A.","RUBIS","S.E.B.","SAFE","SAFRAN","SAGAX REAL ESTATE","SAINT GOBAIN","SAINT GOBAIN NV24","SAINT JEAN GROUPE","SAMSE","SANOFI","SANOFI NV24","SAPMER","SARTORIUS STED BIO","SAVENCIA","SAVONNERIE NYONS","SCBSM","SCEMI","SCHLUMBERGER","SCHNEIDER ELECTRIC","SCIENTIA SCHOOL","SCOR SE","SECHE ENVIRONNEM.","SEGRO PLC","SEIF SPA","SELCODIS","SELECTIRENTE","SEMPLICEMENTE SpA","SENSORION","SEQUA PETROLEUM NV","SERGEFERRARI GROUP","SES","SHOWROOMPRIVE","SIDETRADE","SIGNAUX GIROD","SII","SILC","SIMAT","SIRIUS MEDIA","SMAIO","SMALTO","SMALTO BSA","SMART GOOD THINGS","SMCP","SMTPC","SOC FRANC CASINOS","SOCIETE GENERALE","SODEXO","SODITECH","SOGECLAIR","SOITEC","SOLOCAL GROUP","SOLUTIONS 30 SE","SOLVAY","SOPRA STERIA GROUP","SPARTOO","SPEED RABBIT PIZZA","SPIE","SPINEGUARD","SPINEWAY","SQLI","ST DUPONT","STEF","STELLANTIS NV","STIF","STMICROELECTRONICS","STRADIM ESPAC.FIN","STREAMWIDE","STREAMWIDE BS25","STREAMWIDE BS25-2","STREIT MECANIQUE","SUMO RESOURCES PLC","SWORD GROUP","SYENSQO","SYNERGIE","TARKETT","TATATU","TAYNINH","TECHNICOLOR CS","TECHNIP ENERGIES","TELEPERFORMANCE","TELEVERBIER","TELEVISTA","TERACT","TERACT BS","TF1","TF1 NV24","TFF GROUP","THALES","THE AZUR SELECTION","THE BLOCKCHAIN GP","THERACLION","THERANEXUS","THERAVET","THERMADOR GROUPE","TIKEHAU CAPITAL","TIPIAK","TITAN CEMENT","TME PHARMA","TME PHARMA BSA Y","TME PHARMA BSA Z","TONNER DRONES","TOOLUX SANDING","TOOSLA","TOTALENERGIES","TotalEnergiesGabon","TOUAX","TOUR EIFFEL","TRAMWAYS DE ROUEN","TRANSGENE","TRIGANO","TRILOGIQ","TROC ILE","TRONICS","TTI","TXCOM","U10 CORP","UBISOFT ENTERTAIN","UCAPITAL GLOBAL","UMALIS GROUP","UNIBAIL-RODAMCO-WE","UNIBEL","UNION TECH.INFOR.","UNITI","UPERGY","UV GERMI","VALBIOTIS","VALEO","VALERIO TX","VALLOUREC","VALLOUREC BSA 21","VALNEVA","VANDOR REAL ESTATE","VANTIVA","VANTIVA BSA 2024","VAZIVA","VENTE UNIQUE.COM","VEOLIA ENVIRON.","VEOM GROUP","VERALLIA","VERGNET","VERIMATRIX","VERNEY CARRON","VERSITY","VETOQUINOL","VIALIFE","VICAT","VIEL ET COMPAGNIE","VINCI","VINPAI","VIRBAC","VIRTUALWARE","VISIATIV","VISIATIV BS","VISIOMED GROUP","VITURA","VIVENDI SE","VOGO","VOLTALIA","VOYAGEURS DU MONDE","VRANKEN-POMMERY","VREF SEVILLE","VusionGroup","WAGA ENERGY","WALLIX","WAVESTONE","WE.CONNECT","WEACCESS GROUP","WEDIA","WELL","WENDEL","WEYA","WHITENI R CAJAL","WINFARM","WITBE","WIZIBOAT","WORLDLINE","X-FAB","XILAM ANIMATION","ZCCM","ZCI LIMITED"],["ALMIL","AL2SI","ALAST","AB","ABCA","ABEO","ABNX","ABVX","ABLD","ABO","ACAN","AC","ALALO","EOS","ALATI","ALACT","MLACT","ALDV","ALARF","ADOC","ALADO","ADP","ADUX","ALDVI","ALAVI","AELIS","AKOM","AFMBS","AFME","ALAFY","MLAGI","MLAA","MLAGP","ALAGP","ALAGR","AF","AI","AIR","ALAIR","AKW","AAA","ALCHI","ALD","ALGRE","CDA","ALNEO","ALO","LTA","ALTA","AREIT","ATE","ALORA","ALTUR","MLALV","ALAMA","MLAAH","ALMIB","AMPLI","AMUN","MLAIG","ANTIN","APAM","MLASO","ALAQU","ARAMI","MT","ALJXR","ALCUR","MLARD","ARDO","MLARE","ARG","MLARI","AKE","MLARO","ARTE","PRC","ARTO","ARVEN","ARVBS","MLAEM","ASY","MLAST","ALATA","ATEME","ATLD","ATO","AUB","ALAUD","AUGR","ALAMG","AURE","ALAUR","AVT","CS","CSNV","AXW","MLAZL","MLAAT","ALBKK","BAIN","BALYO","BUI","MLBAR","BASS","BLC","MLBAT","ALBDM","MLBMD","MLBBO","BLV","BEN","ALDBL","BB","BIG","ALBLD","ALTUV","BIM","ALBPS","BPSBS","BPBS","BIOS","ALBIO","BLEE","MLBSP","ALBLU","BNP","ALBOA","MLONE","BOI","BOL","BON","MLBON","ALBOO","ALBOU","BSD","EN","ENNV","ALBPK","BVI","BUR","CAT31","ALCAB","CAFO","CBDG","ALCAP","CAP","ALCRB","ALCAR","CARM","CARP","CA","CO","CATG","ALCIS","CATR","ALCBI","CBIBS","CBOT","CGM","ALCLS","CYAD","ALPCV","CFI","MLCFM","CGG","MLCFD","MLCVG","CRI","ALCWE","CHSR","MLCHE","CDI","ALCBX","MLCMB","CLA","CLARI","ALCLA","MLCMG","CNV","COFA","ALCOF","ALLEC","ALCOG","COH","ALCOI","MLCLP","ODET","MLMFI","MLCNT","MLLCB","MLCOE","MLCOR","MLCOT","COTY","MLCOU","COUR","COV","COVH","CRAP","CRAV","CRBP2","CIV","CRLA","CRLO","CMO","CNDF","CCN","CAF","CRSU","CRTO","ACA","ALCJ","CROS","ALCYB","CYBK1","CYBKA","CYBKB","ALDLS","MLDAM","ALDAR","BN","AM","DSY","ALDBT","DBV","DEEZR","DEEZW","DKUPL","ALDEL","ALDLT","DBG","ALDEV","DMSBS","ALDMS","ALIMG","ALDNX","DPAM","ALDOL","ALDNE","ALDRV","BNBS","MLDYN","MLDYX","ALAGO","MLEAS","MLEDR","MLEAV","MLECO","ALECO","ALESA","EDEN","ALEAC","MLEDS","MLEFA","MLEDU","ALGID","FGR","EKI","ELEC","EEM","ELIOR","ELIS","MLERH","MLUAV","ALEMV","ALDUB","ALNN6","ALNRG","ALENE","ENGI","ALENI","ALENO","ALESE","ALENT","ALENR","ALEO2","EQS","ERA","ALPLA","ALESK","EL","ES","EFI","ALEUA","RF","EUR","EAPI","ALERS","ALECR","ERFNV","ERF","MLERO","MLCAN","ENX","ALECP","ALEUP","ETL","EGR","ALEXA","EXA","EXN","EXE","EXPL","ALPHI","MLECE","ALFBA","FAYE","MLFDV","FDJ","FCMC","FALG","SACI","ORIA","FGA","ALFUM","BERR","FOAF","FINM","FNTS","MLFXO","FIPP","MLFIR","ALFLE","ALFLO","FNAC","MLFNP","ALFOC","LEBL","EURS","INEA","FLY","MLVIN","SPEL","FORE","FORSE","FRVIA","ALFPC","FDE","MLFSG","MLFTI","ALFRE","FREY","MLGAI","MLGAL","GALIM","ALBI","GAM","ALGAU","GEA","ALGEC","GFC","GNE","GNRO","GNFT","ALGEN","SIGHT","MLGEQ","GET","ALGEV","GLO","MLGLA","MLGLB","MLGLW","ALGBE","MLNDG","ALGLD","GPE","ALPAR","GRVO","ALGRO","ALKEM","MLGRC","CEN","ALGIL","GJAJ","ALLDL","ALOKW","PARP","MLPVG","SFPI","ALGTR","ALIMO","GTBP","GTT","MLGDI","GBT","GUI","ALHAF","ALHGO","PIG","HDF","MLHAY","ALHRG","RMS","ALHEX","ALHF","HCO","ALHYP","ALHIT","MLHK","MLHBB","ALHGR","MLHCF","MLHPE","ALHPI","ALHOP","MLHMC","MLHBP","MLHOT","HDP","MLHIN","ALHUN","ALHYG","MLHYD","MLHYE","ALHRS","ALICR","ALI2S","MLINT","ICAD","ALICA","IDL","IDIP","MLIDS","ALIDS","MLABC","ALIKO","ALIE","MLIML","NK","MLIPP","ALIMR","IMDA","ALIMP","MLIMP","MLIFS","INFE","MLIFC","INF","MLINM","MLISP","IPH","ALINN","MLIRF","ALLUX","ALINT","MLVIE","ITP","ITXT","ALINS","IVA","ALINV","MLIPO","IPN","IPS","ALISP","ALITL","MLITN","ITE","JBOG","JCQ","DEC","MLJSA","MLJ21","ALKAL","KOF","KER","ALKLK","ALKEY","ALKKO","ALKLA","LI","ALKOM","ALVAP","OR","ALPER","ALEMG","LACR","MMB","ALLAN","ALLGO","LAT","LPE","LOUP","ALBON","LSS","LSSNV","LR","ALLPL","ALLHB","ALLEX","LHYFE","LIN","FII","ALLAM","ALLLN","LNA","MLLOI","ALLOG","MLCAC","ALUCI","LBIRD","MC","MRM","ALMII","MAAT","MLMAD","MLMGL","MLMAB","MLCLI","MDM","ALMKS","MALT","MTU","MLMAQ","ALMAR","IAM","ALMAS","MASBS","ALMKT","MAU","MBWS","MCPHY","MLMDV","ALMDP","EDI","MLLAB","ALMDT","MEDCL","MLMCE","MEMS","MERY","MLMIV","MRN","METEX","MLETA","ALTHO","ALMET","MLMIB","MMT","ALMEX","ALMGI","ALMDG","ML","ALMIC","MLNMA","ALMLB","ALMIN","ALMND","ALMCE","FMONC","MONT","MLMTP","ALMOU","ALMRB","ALMUN","MLMUT","MHM","NACON","ALNMR","NANO","NEOEN","ALNLF","ALNEV","ALNTG","ALNMG","NRO","NEX","NXI","ALNXT","ALNFL","NHOA","ALCOX","NOKIA","MLBIO","ALNOV","MLNOV","NR21","NRG","ALNSC","ALNSE","ALBIZ","MLOCT","SBT","MLOKP","OLG","ALODC","ALOPM","ALEXP","MLONL","ORA","ORAP","MLORB","ALORD","OREGE","MLORQ","ORP","OSE","ALWTR","ALOSM","OVH","MLPAC","PAR","PARRO","MLHOP","MLPRX","PSAT","PAT","ALPAU","RI","PERR","MLPER","MLPET","PEUG","ALPHA","PHXM","MLPHW","MLPHO","VACBS","VACBT","VAC","ALPDX","ALPIX","MLPLC","ALPAT","PATBS","PVL","POM","PLX","ALPJT","ALPOU","POXEL","ALPM","ALPRE","ALPRI","PROAC","ALPRO","PWG","ALPRG","PROBT","MLPRI","PUB","QDT","ALQP","ALQGC","ALQWA","ALRFG","RAL","GDS","ALRPD","ALREA","RCO","RNO","MLJDL","ALREW","RXL","ALRIB","RBT","CBR","CBE","RBO","ALROC","ROCBT","ALRGR","RUI","SK","ALSAF","SAF","MLSAG","SGO","SGONV","SABE","SAMS","SAN","SANNV","ALMER","DIM","SAVE","MLSDN","CBSM","MLCMI","SLB","SU","MLSCI","SCR","SCHP","SGRO","ALSEI","SLCO","SELER","MLSMP","ALSEN","MLSEQ","SEFER","SESG","SRP","ALBFR","ALGIR","SII","MLSIL","MLMAT","ALSRS","ALSMA","MLSML","SMLBS","MLSGT","SMCP","ALTPC","SFCA","GLE","SW","SEC","ALSOG","SOI","LOCAL","S30","SOLB","SOP","ALSPT","MLSRP","SPIE","ALSGD","ALSPW","SQI","DPT","STF","STLAP","ALSTI","STMPA","ALSAS","ALSTW","STWBS","STRBS","MLSTR","MLSUM","SWP","SYENS","SDG","TKTT","ALTTU","TAYN","TCHCS","TE","TEP","TVRB","MLVST","TRACT","TERBS","TFI","TFINV","TFF","HO","MLAZR","ALTBG","ALTHE","ALTHX","ALVET","THEP","TKO","TIPI","TITC","ALTME","TMBSY","TMBSZ","ALTD","ALTLX","ALTOO","TTE","EC","TOUP","EIFF","MLTRA","TNG","TRI","ALTRI","MLTRO","ALTRO","ALTTI","ALTXC","ALU10","UBI","MLALE","MLUMG","URW","UNBL","FPG","ALUNT","ALUPG","ALUVI","ALVAL","FR","ALVIO","VK","VKBS","VLA","MLVRE","VANTI","VANBS","MLVAZ","ALVU","VIE","ALVG","VRLA","ALVER","VMX","MLVER","MLVSY","VETO","ALVIA","VCT","VIL","DG","ALVIN","VIRP","MLVIR","ALVIV","VIVBS","ALVMG","VTR","VIV","ALVGO","VLTSA","ALVDM","VRAP","MLVRF","VU","WAGA","ALLIX","WAVE","ALWEC","MLWEA","ALWED","MLWEL","MF","MLWEY","MLWRC","ALWF","ALWIT","MLWIZ","WLN","XFAB","XIL","MLZAM","CV"],["FR0010285965","FR0013341781","FR0000076887","FR0010557264","FR0004040608","FR0013185857","FR0012616852","FR0012333284","FR001400AHX6","BE0974278104","FR0000064602","FR0000120404","FR001400JAP8","FR0000076861","FR0000076655","FR0014005OJ5","FR0010979377","BE0974269012","FR0013284627","FR0011184241","FR001400JAL7","FR0010340141","FR0012821890","FR0013296746","FR0000053043","FR0014007ZB4","US00774B2088","FR001400FL38","FR0013333077","FR0014005AC9","FR0011908045","FR0014005WE9","ES0105478004","FR0013452281","FR0010641449","FR001400J770","FR0000120073","NL0000235190","FR0014003V77","FR0000053027","FR0000062465","FR0014000JX7","FR0013258662","FR001400IV58","FR0000053324","FR0013421286","FR0010220475","FR0000053837","FR0000033219","FR0000039216","FR0000071946","FR0000061244","FR0010395681","FR0013253812","GB00BNKGZC51","NL0010273694","FR0011051598","FR0012789667","FR0004125920","ES0105744009","FR0014005AL0","LU0569974404","ES0105658001","FR0010340711","FR0014003U94","LU1598757687","FR001400KO61","FR0013398997","FR0005057635","FR0004070795","ES0105661005","FR0010481960","ES0105601001","FR0010313833","ES0105486007","FR0012185536","FR0000074783","FR0000076952","FR001400JWR8","FR0014003AC4","FR0012968485","FR0000074148","ES0105708004","FR0010478248","FR0011992700","FR0013455482","FR0000051732","FR0000063737","FR00140059B5","FR0000061780","FR0013410370","FR0000039232","FR0013183589","FR001400CFI7","FR0000120628","FR001400M7B2","FR0011040500","IT0004812258","PTAZR0AM0006","FR0013384369","MC0000031187","FR0013258399","FR0000062788","ES0105362000","FR0004023208","FR0000035370","FR0010436170","FR0000035305","CH0451123589","CH1148983609","FR0014003FE9","FR0000035164","FR0000066961","FR0000120966","FR0000074072","FR0004174233","FR0013345493","FR0013280286","FR0012816825","FR0013507290","FR001400LN79","BE0974280126","FR0011005933","FR0000062150","FR0013340973","FR0011041011","FR0000131104","FR0011365907","FR0010106039","FR0000061129","FR0000039299","FR0000063935","BE6333353298","FR001400IAM7","FR0000054421","FR0000074254","FR0000120503","FR001400M3D7","FR001400AJZ7","FR0006174348","FR0000061137","FR0000045544","FR001400DIY6","FR0010151589","FR0000079659","FR0012969095","FR0000125338","FR0011648716","FR0010907956","FR0010828137","FR0000064156","FR0000120172","FR0000125585","FR0010193052","FR0000064446","US1491231015","FR0014007LW0","FR001400D0X2","FR0010193979","FR0000053506","FR0010425595","BE0974260896","FR0013178712","FR0000037475","MC0010000826","FR0013181864","FR0000037871","FR0000051567","FR0000130692","FR001400AJ60","FR0000060907","FR0010447086","FR0000130403","FR0000054322","FR0000060428","FR0013426004","FR0010386334","FR0004152882","FR0013406881","NL0010949392","FR0010667147","FR0013257409","FR0013335742","FR0011071570","FR0004031763","BE0160342011","FR0010959684","FR0000062234","BE6252013725","FR0000077828","FR00140007I9","ES0105660007","FR0010035816","FR0013371507","US2220702037","FR0004998318","FR0000065393","FR0000064578","FR0000060303","FR0000044323","FR0000185506","FR0010483768","FR0000045213","FR0010461053","FR0000045239","FR0000045551","FR0000185514","FR0000044364","FR0000045528","FR0000045346","FR0000045304","FR0000045072","FR0011716265","FR0000050395","FR0014004QR6","FR0013507977","FR0013507985","FR0013508009","FR0010404368","FR0000077885","FR0000185423","FR0000120644","FR0014004L86","FR0014003TT8","FR001400LO86","FR0010417345","FR001400AYG6","FR0014004JF6","FR0000062978","FR0000054132","FR0013283108","FR0000053381","FR0000060840","FR001400IAQ8","FR0012202497","BE0974289218","FR0010436584","FR0000065260","FR0014004QZ9","FR0013331212","FR0013088606","FR0014007951","FR0000052920","LU0881232630","FR0014004339","HK0000038783","FR0007200100","FR0010536185","DE000A0XYM45","FR0013534617","FR0011490648","FR0010908533","IT0005351504","FR0000052755","FR0010882886","FR0010439265","FR0000072373","FR0000130452","FR0011466069","FR0000031023","FR0000035719","FR0011950732","FR0012435121","ES0105726006","ES0105639001","FR0013356755","FR0004030708","FR0013330792","FR0013399359","FR0011915339","FR0010208488","FR001400C2Z4","FR0014004974","FR0014004362","FR0010424697","FR0000045122","FR0010465534","FR0012882389","FR0000131757","FR0010211037","FR0000035818","FR0000121667","FR0000120669","FR0000061475","FR0010844001","FR0000121121","FR0000054678","FR0014008VX5","FR0013240934","FR0013256518","FR001400M7C0","FR0014000MR3","FR0010157115","ES0105586004","NL0006294274","FR0010490920","FR001400CF13","FR0010221234","FR0000035784","FR0000064164","FR0000062671","FR0014005DA7","FR0004527638","FR0014003AQ4","ES0105029005","ES0105553004","FR0004034593","FR0000031973","FR0012300424","FR0013451333","FR0000062101","FR0011271600","FR0000061418","FR0000060535","FR0011665280","FR001400AEM6","FR0000062341","SN0000033192","FR0000060824","FR0000035123","FR0010487272","FR0000038184","CH0120879058","FR0000074759","FR001400GO75","FR0011476928","FR0013230067","FR0012419307","FR0000065930","FR0000038499","FR0010341032","FR0000033409","FR0011605617","FR0000053944","CI0000053161","FR0014005SB3","FR0000121147","FR0010485268","FR0013030152","FR0013222346","FR0010823724","FR0004187367","FR0010588079","FR0000053415","FR0011100759","FR0000030611","FR0000124414","FR0000034894","FR0013495298","FR0000053035","FR001400M1R1","FR0010040865","US3696043013","CH0308403085","FR0004163111","FR0004053510","FR0013183985","PTGVE1AE0009","FR0010533075","FR0000033888","FR0000066672","IT0005454167","IT0005454175","IT0005454134","FR0011052257","ES0105537007","FR0011208693","FR0010214064","FR0013204070","FR0000065971","FR0014005ZM5","FR00140069V2","FR0000076960","FR0000036675","FR0012819381","FR0004010338","FR0000075442","FR0013439627","FR0012612646","FR0010529719","FR0004155000","FR0013429404","FR0014000RP6","US36254L2097","FR0011726835","LU1840650458","FR0000032526","FR0000066722","FR0014007ND6","GB00BMDXQ672","FR0000066755","FR0014003VY4","ES0105498002","FR0000066540","FR0000052292","FR0004159473","FR0000038531","FR0000054231","FR0012821916","FR0010396309","DE000A11Q133","FR0000051302","FR0013451044","FR0012336691","FR0010312181","FR0014000U63","FR0000065278","FR0006226791","ES0105664009","FR0000053738","FR0004165801","FR0006563904","FR0014007LQ2","FR0004153930","FR0000064735","FR0005843125","FR0014001PM5","FR0014005IU4","FR0005854700","ES0105479002","FR0000035081","FR001400A3Q3","FR0010929125","FR0000051393","FR0000079691","FR0000062184","ES0105551008","FR00140048X2","IT0005380602","FR0010086371","FR0000120859","FR0006859039","FR0013060100","FR0000033243","FR0013470168","FR0000065773","ES0105590006","FR0000066219","FR0011158823","FR0000071797","ES0105511002","ES0105473005","FR0010331421","FR0000064297","IT0005391161","FR0000060451","FR0010908723","FR0014003FN0","FR0004024222","FR0000064958","FR0011179886","FR0013233012","BE0974299316","ES0105417002","FR0010259150","FR0000073298","ES0109429037","FR0000072597","IT0005336521","FR0004026151","FR0012872141","FR0000033904","FR0000077919","FR0010680033","ES0105636007","FR0010722819","FR0004007813","FR0000121485","FR0013156007","FR0004029411","FR0013374667","FR0011038348","FR0000121964","ES0105425005","FR0013419876","FR0000120321","NL0012191662","FR0000075343","FR0000066607","FR0000130213","FR0004027068","FR0013308582","FR001400JY13","FR0006864484","FR0013204336","FR0000121295","FR0000065484","FR001400MMI2","FR0010307819","FR001400F2Z1","FR0007080254","FR0000033599","FR0014009YQ1","FR0004156297","FR0000050353","BE0974334667","ES0105089009","FR0004170017","FR0004155208","FR0000044943","FR0006205019","FR0011884378","FR0000038242","FR0000121014","FR00140085W6","FR0013270626","FR0012634822","FR0010328302","FR0010827741","FR0000061657","FR0011092089","FR0013153541","ES0105463006","FR0000030074","FR0000038606","ES0105447009","FR0013400835","MA0000011488","FR0004155687","FR0013472446","FR0010609263","FR0000051070","FR0000060873","FR0011742329","FR0014006PT9","FR0010844464","FR0000064404","IT0005324105","FR0011049824","FR0004065605","IT0004844848","FR0010298620","FR0010241638","ES0105559001","FR0000039620","FR0004177046","FR0010492181","FR00140066X4","FR0011217710","BE0974328602","FR0000053225","IT0005450819","FR0010204453","FR0010353888","FR001400AJ45","FR0000077570","FR0010500363","FR0013053535","FR0004172450","FR00140050Q2","FR001400H3A0","FR0000076986","BE0003853703","ES0105549002","FR0011033083","FR0004034320","FR0013462231","ES0105697009","FR001400IE67","FR0013482791","FR0014003J32","FR0011341205","FR0011675362","FR0011636083","FR001400MV37","FR0004154060","FR0000072993","FR0004050250","FR0000044448","FR0010112524","FR0004171346","FR0014003XT0","FR0012650166","FR0013018124","FI0009000681","ES0105719001","FR0010397232","FR0000185464","FR0014001PV6","FR0000121691","FR0000064529","FR0004065639","FR0014003711","FR0013310281","FR0000052680","ES0105698007","FR0010428771","FR0014003T71","FR001400CM63","FR0013266772","FR0004174712","FR0000133308","FR0000075392","ES0105490009","FR0013318052","FR0010609206","ES0105534004","FR0000184798","FR0012127173","FR001400IUV6","FR0013231180","FR0014005HJ9","FR0000077992","FR0010263202","FR0004038263","FR0006823092","NL0012650535","FR0000038465","FR0011027135","FR0013479730","FR0000120693","FR0000061459","ES0105612008","NL0015001HZ9","FR0000064784","FR001400JXB0","FR001400K4B1","FR0000185480","BE0948608451","FR001400B4H9","FR001400B4G1","FR0000073041","FR0000061608","FR001400JX97","FR0000030769","FR0010785790","FR0011844067","FR0013252186","FR0000124570","NL0015001W49","FR0000066441","FR0013015583","FR0012432516","FR0014004EC4","FR0010169920","FR0004044600","FR0004052561","FR0010313486","FR0012613610","FR0010380626","FR0013398617","FR0000061376","FR0000130577","FR0000120560","ES0105118006","FR0011648971","FR0010889386","IT0005466963","FR0000060618","FR0000044471","GB00BM9PTW47","FR0011858190","FR0000130395","FR0000131906","ES0105550000","FR0010820274","FR0010451203","FR0000075954","FR0000039091","FR0000045619","FR0000045601","FR0013344173","FR0010523167","FR0013477593","FR0000037640","FR0013269123","FR0000121709","FR001400F1V2","FR0000073272","ES0105651006","FR0000125007","FR001400M7D8","FR0000060121","FR0000060071","FR0000120578","FR001400M6Z3","FR0010776617","FR0013154002","FR0000120107","FR0013155975","FR0006239109","FR0010972091","AN8068571086","FR0000121972","ES0105592002","FR0010411983","FR0000039109","GB00B5ZN1N88","IT0005353484","FR0000065492","FR0004175842","IT0005072811","FR0012596468","NL0010623518","FR0011950682","LU0088087324","FR0013006558","FR0010202606","FR0000060790","FR0000074122","FR0010679365","CI0000000832","FR0010812230","FR0014005I80","FR0011131788","FR0010649228","FR001400LBS6","FR0013214145","FR0004016699","FR0010209809","FR0000130809","FR0000121220","FR0000078321","FR0000065864","FR0013227113","FR00140006O9","FR0013379484","BE0003470755","FR0000050809","FR00140043Y1","FR0000054371","FR0012757854","FR0011464452","FR001400BVK2","FR0011289040","FR0000054199","FR0000064271","NL00150001Q9","FR001400MDW2","NL0000226223","FR0000074775","FR0010528059","FR001400DG11","FR001400DGA0","FR0000063976","GB00B8GJBS16","FR0004180578","BE0974464977","FR0000032658","FR0004188670","IT0005507857","FR0000063307","FR001400I939","NL0014559478","FR0000051807","CH0008175645","FR0011076595","FR001400BMH7","FR0014000TB2","FR0000054900","FR001400M3E5","FR0013295789","FR0000121329","GRS528003007","FR0011053636","FR0010120402","FR0013286259","BE0974387194","FR0013333432","FR0013230612","FR0000066482","BE0974338700","NL0015000YE1","NL0015001SS1","NL0015001SR3","FR001400H2X4","LU0394945660","FR00140062B9","FR0000120271","GA0000121459","FR0000033003","FR0000036816","FR0000031866","FR0005175080","FR0005691656","FR0010397901","FR0000031106","FR0004175099","FR0010383877","FR0010654087","FR0000079147","FR0000054470","GB00BJ9M4V82","FR0011776889","FR0013326246","FR0000054215","FR0000074197","FR0012709160","FR0010337865","FR0011898584","FR0013254851","FR0013176526","FR0010095596","FR0013506730","FR00140030K7","FR0004056851","ES0105623005","FR0013505062","FR0013526225","FR0014007T10","FR0010766667","FR0000124141","FR0013530102","FR0013447729","FR001400JXA2","FR0010291245","FR0006174496","FR0014003I41","FR0004186856","FR0010326090","FR0000031775","FR0000050049","FR0000125486","FR001400AXT1","FR0000031577","ES0105704003","FR0004029478","FR0014003O76","FR0013481835","FR0010309096","FR0000127771","FR0011532225","FR0011995588","FR0004045847","FR0000062796","ES0105492005","FR0010282822","FR0012532810","FR0010131409","FR0013357621","FR0013079092","FR0010688465","FR0010688440","FR0004152700","FR0000121204","FR0010768770","ES0105399002","FR0014000P11","FR0013143872","FR00140047H7","FR0011981968","BE0974310428","FR0004034072","ZM0000000037","BMG9887P1068"],["ALXP","ALXP","ALXP","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XBRU, XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","XMLI","XPAR","ALXP","XPAR","ALXP","XPAR","XPAR, XAMS","ALXP","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XMLI","XMLI","XMLI","ALXP","ALXP","XPAR, XAMS","XPAR","XPAR","ALXP","XPAR","XPAR","ALXP","XPAR","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","ALXP","XMLI","ALXP","XPAR","XPAR","XMLI","XPAR","XAMS, XBRU, XPAR","XMLI","ALXP","XPAR","XAMS, XPAR","ALXP","ALXP","XMLI","XMLI","XMLI","XPAR","XMLI","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","XPAR","XMLI","XPAR","XMLI","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","XMLI","XMLI","ALXP","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","XMLI","ALXP","XMLI","XMLI","XPAR","XPAR","ALXP","XPAR","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","ALXP","XBRU, XPAR","ALXP","XPAR","XMLI","ALXP","XPAR","ALXP","XMLI","XPAR","XPAR","XPAR","XMLI","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","XPAR","XPAR","ALXP","XBRU, XPAR","ALXP","XPAR","XMLI","XPAR","XMLI","XMLI","XPAR","ALXP","XPAR","XMLI","XPAR","ALXP","XMLI","XPAR","XPAR","ALXP","XMLI","XPAR","XPAR","ALXP","ALXP","ALXP","XPAR","ALXP","XMLI","XPAR","XMLI","XMLI","XMLI","XMLI","XMLI","XMLI","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","ALXP","ALXP","ALXP","XMLI","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","ALXP","ALXB, ALXP","ALXP","XPAR","ALXP","ALXP","ALXP","ALXP","XMLI","XMLI","ALXP","XMLI","XMLI","XMLI","XMLI","ALXP","ALXP","XPAR","ALXP","XMLI","XMLI","XMLI","ALXP","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XMLI","XMLI","ALXP","ALXP","ALXP","ALXP","ALXP","XPAR, XBRU","ALXP","ALXP","ALXP","ALXP","ALXP","ALXP","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XMLI","XMLI","XPAR, XAMS, XBRU","ALXP","ALXP","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XMLI","ALXP","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","XMLI","XPAR","XMLI","ALXP","ALXP","XPAR","XMLI","ALXP","XPAR","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","XMLI","ALXP","XPAR","XMLI","XMLI","XPAR","ALXP","XPAR","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","XPAR","ALXP","XPAR","XMLI","XMLI","XMLI","ALXP","XMLI","ALXP","XPAR","ALXP","XPAR","ALXP","ALXP","XMLI","XPAR","ALXP","XPAR","ALXP","ALXP","XPAR","XMLI","XPAR","ALXP","ALXP","XPAR","XPAR","XMLI","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XMLI","ALXP","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","XMLI","XMLI","ALXP","XMLI","XMLI","ALXP","ALXP","XMLI","XMLI","XMLI","XPAR","XMLI","ALXP","ALXP","XMLI","XMLI","ALXP","ALXP","ALXP","XMLI","XPAR","ALXP","XPAR","XPAR","XMLI","ALXP","XMLI","ALXP","ALXP","XMLI","XPAR","XMLI","ALXP","XPAR","ALXP","XMLI","XMLI","XPAR","XMLI","XPAR","XMLI","XMLI","XPAR","ALXP","XMLI","ALXP","ALXP","XMLI","XPAR","XPAR","ALXP","XPAR","ALXP","XMLI","XPAR","XPAR","ALXP","ALXP","XMLI","XPAR","XPAR","XPAR","XPAR","XMLI","XMLI","ALXP","XPAR","XPAR","ALXP","ALXP","ALXP","ALXP","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","ALXP","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP, ALXB","ALXP","XPAR","XMLI","ALXP","XMLI","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","XMLI","XMLI","XMLI","XPAR","ALXP","XPAR","XPAR","XMLI","ALXP","XPAR","ALXP","ALXP","ALXP","XPAR","XPAR","XPAR","XMLI","ALXP","XPAR","XMLI","ALXP","XPAR","XMLI","XPAR","XPAR","XMLI","XPAR","XPAR","XMLI","ALXP","ALXP","XMLI","XPAR","ALXP","ALXP","ALXP","XPAR","ALXP","XMLI","ALXP","ALXP","ALXP","ALXP","XPAR","XBRU, XPAR","XMLI","ALXP","ALXP","ALXP","XMLI","XPAR","XPAR","ALXP","XPAR","XPAR","ALXP","ALXP","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","ALXP","XPAR","XMLI","ALXP","XMLI","XPAR","XPAR","ALXP","ALXP","ALXP","XMLI","XPAR","XMLI","XPAR","ALXP","ALXP","ALXP","XMLI","XPAR","XPAR","XMLI","ALXP","XPAR","XMLI","XPAR","XPAR","ALXP","ALXP","XPAR","XMLI","XPAR","XPAR","XMLI","XMLI","XPAR","XPAR","ALXP","XPAR","XPAR","XMLI","XMLI","XPAR","ALXP","XPAR","XMLI","XMLI","XPAR","XPAR","XPAR","ALXP","ALXP","XMLI","ALXP","ALXP","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","ALXP","ALXP","ALXP","XPAR","ALXP","XPAR","ALXP","ALXP","XMLI","XPAR","XPAR","ALXP","ALXP","ALXP","ALXP","XPAR","XPAR","ALXP","ALXP","XPAR","XPAR","XMLI","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","ALXP","ALXP","XPAR","XPAR","ALXP","XPAR","XMLI","XPAR, XAMS, XBRU","XPAR","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XMLI","XPAR","XMLI","XPAR","XPAR","XMLI","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XMLI","ALXP","XMLI","XPAR","XPAR","XPAR","ALXP","ALXP","XPAR","XMLI","XMLI","ALXP","ALXP","XMLI","XMLI","XMLI","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","XBRU, XPAR","XPAR","ALXP","XMLI","XPAR","ALXP","ALXP","XPAR","XPAR","XPAR","XPAR","ALXP","XPAR","ALXP","ALXP","ALXP","ALXP","XMLI","XMLI","XPAR","XBRU, XPAR","XPAR","XPAR","ALXP","XPAR","XPAR","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","XPAR","XPAR","XPAR","XPAR","XMLI","ALXP","ALXP","ALXP","ALXP, ALXB","XPAR","XPAR","XPAR","XBRU, XPAR","ALXP","ALXP","ALXP","ALXP","ALXP","ALXP","XPAR, XBRU","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","ALXP","XMLI","ALXP","ALXP","ALXP","ALXP","XPAR","XMLI","XMLI","XPAR","XPAR","XPAR","ALXP","ALXP","ALXP","ALXP","XPAR","ALXP","XPAR","XPAR","XPAR","XMLI","XPAR","XPAR","XMLI","ALXP","XPAR","ALXP","XPAR","ALXP","XPAR","XMLI","XMLI","XPAR","ALXP","XPAR","XPAR","XPAR","ALXP","XPAR","XMLI","ALXP","ALXP","ALXP","XPAR","XPAR","ALXP","XPAR","ALXP","XPAR, XBRU","XMLI","XPAR","XPAR","ALXP","XPAR","ALXP","XMLI","ALXP","XMLI","XPAR","XMLI","XMLI","ALXP","ALXP","XMLI","XPAR","XPAR","XPAR","XMLI","XPAR"],["€26.00","€4.14","€0.962","€3.14","€4.39","€13.15","€1.108","€11.60","€9.70","€5.80","€0.388","€37.27","€0.001","€1.24","€3.86","€4.33","€1.27","€0.0605","€0.396","€9.85","€0.0145","€119.60","€1.31","€1.622","€15.10","€13.35","€2.80","€0.01","€1.59","€1.87","€0.35","€1.94","€3.00","€1.49","€0.0513","€11.282","€167.48","€150.52","€5.30","€15.52","€10.30","€0.67","€5.36","€0.0009","€13.80","€0.75","€11.70","€24.20","€76.70","€442.00","€143.90","€0.554","€11.00","€0.08","€0.211","€0.09","€0.478","€3.34","€59.80","NANA","€15.95","€31.55","€70.00","€3.98","€3.88","€26.535","€0.1608","€4.10","€180.00","€72.00","€8.75","€80.80","€2.97","€97.26","€14.60","€13.70","€5.21","€5","€8.299","€0.06","€3.20","€54.60","€9.85","€0.142","€4.31","€41.60","€2.477","€40.90","€4.20","€6.60","€0.0015","€4.80","€3.41","€0.148","€29.99","€29.00","€28.80","€0.625","€0.055","€16.85","€104.00","€0.80","€7.20","€1.50","€45.90","€19.86","€0.20","€1.564","€8.00","€3.98","€12.40","€11.20","€3.50","€63.25","€2.58","€15.02","€2.39","€101.80","€0.0046","€0.004","€0.0003","€0.0344","€7.48","€163.00","€7.40","€1.085","€53.44","€25.50","€0.268","€35.64","€6.275","€9.34","€12.00","€0.0007","€51.50","€4.87","€32.95","€34.12","€2.82","€24.69","€390.00","€63.55","€2.23","€9.26","€6","€6.28","€210.00","€21.55","€4.13","€15.78","€6.30","€14.945","€0.501","€5.61","€9.42","€295.00","€0.388","€0.002","€3.59","€16.00","€2.728","€0.393","€2.87","€0.54","€1","€0.399","€735.00","€6","€11.90","€4.01","€8.00","€63.50","€777.00","€0.0154","€128.00","€2.55","€2.05","€127.00","€2.16","€1.565","€12.64","€342.00","€8.00","€8.70","€5.05","€4.60","€1.98","€1","€13.00","€70.00","€4.04","€16.60","€9.00","€0.05","€10.724","€3.40","€135.00","€41.64","€16.40","€70.00","€81.60","€18.20","€57.62","€52.28","€55.50","€64.20","€13.26","€75.00","€66.49","€116.00","€75.00","€12.21","€3.91","€8.40","€0.0402","€0.0005","€0.001","€0.0005","€13.05","€9.00","€3.92","€60.89","€172.20","€43.94","€5.22","€1.599","€2.035","€0.0005","€30.30","€42.00","€71.40","€4.508","€10.50","€0.005","€1.125","€0.0225","€23.00","€490.00","€0.001","€4.10","€0.0087","€0.001","€0.70","€1.50","€0.88","€1.56","€84.00","€13.00","€1.25","€3.40","€0.85","€55.40","€12.20","€0.24","€0.695","€0.20","€0.685","€95.72","€4.40","€105.00","€3.30","€2.674","€20.94","NANA","€7.70","€1.175","€3.04","€0.68","€0.0119","€0.63","€14.10","€0.406","€1.705","€8.66","€0.834","€4.06","€5.02","€47.80","€62.30","€0.16","€157.80","€188.30","€57.95","€0.262","€3.44","€77.65","€3.50","€6.166","€16.64","€25","NANA","€54.16","€2.30","€1","€80.70","€0.398","€0.0016","€3.85","€2.34","€154.00","€21.60","€19.04","€57.00","€112.00","€2.15","€19.80","€0.062","€14.00","€0.476","€38.82","€1","€0.833","€28.00","€187.00","€5.80","€6.90","€11.20","€58.00","€0.092","€2.92","€2.52","€0.111","€33.40","€20.10","€2.20","€23.24","€0.25","€13.84","€0.615","€0.12","€36.50","€68.20","€4.10","€6.95","€650.00","€2.51","€15.655","€115.00","€44.00","€0.005","€0.03","€3.67","€26.80","€94.50","€0.73","€15.20","€3.46","€96.00","€0.3248","€93.00","€2.2395","€96.80","€128.00","€1.10","€3.435","€4.09","€0.386","€0.021","€15.335","€230.00","€21.10","NANA","€4.80","NANA","€2.11","€4.92","€1.07","€56.80","€8.25","€27.20","€5.14","€2.32","€26.00","€74.40","€30.50","€1.44","€17.02","€19.35","€21.70","€0.01","€1.83","€5.66","€0.45","€0.55","€130.20","€0.454","€25.70","€5.11","€0.515","€48.80","€2.41","€10.10","€1.43","€30.00","€2","€19.50","€5.78","€2.82","€7.18","€16.50","€115.00","€65.00","€10.20","€16.30","€8.25","€0.056","€18.50","€4","€3.24","€26.20","€3.10","€220.00","€13.75","€0.0164","€700.00","€96.00","€13.86","€4.22","€6.35","€4.62","€30.24","€10.20","€329.50","€66.40","€0.312","€186.00","€11.43","€1.40","€1.12","€0.36","€30.68","€45.00","€1.83","€47.00","€0.07","€6.40","€13.20","€60.00","€2.00","€45.80","€17.90","€1.62","€2.24","€6.40","€1.58","€292.00","€0.768","€115.00","€50.30","€2.90","€0.33","€3.26","€6.60","€18.74","€107.80","€62.05","€2.94","€29.90","€8.80","€3.98","€6.54","€18.24","€18.50","€0.54","€3.40","€22.40","€29.65","€413.10","€0.812","€6.56","€0.0802","€2.39","€23.27","€0.79","€6.90","€418.80","€7.20","€5.06","€26.40","€20.00","€41.20","€2.29","€0.0167","€121.00","€130.00","€91.40","€31.40","NANA","€93.54","€0.8361","€57.50","€3.515","€5.02","€62.00","€22.90","€0.551","€0.74","€20.30","€15.10","€0.938","€14.80","€0.4385","€11.74","€807.50","€19.70","€3.78","€7.22","€7.40","€4.42","€198.00","€1.98","€4.352","€11.40","€645.00","€20.70","€8.30","€0.50","€8.40","€0.0094","NANA","€0.47","€5.305","€2.87","€2.286","€9.40","€0.78","€10.10","€1.04","€3.86","€8.76","€4.30","€7.80","€10.52","€18.55","€35.70","€0.50","€8.50","€1.06","€3.05","€0.108","€12.21","€14.40","€5.65","€13.80","€30.92","€1.075","€0.16","€1.61","€3.49","€0.812","€7.90","€7","€75.40","€9.95","€22.65","€7.80","€0.786","€3.55","€0.815","€1.452","€1.435","€6.92","€24.26","€0.0731","€1.7002","€0.98","€0.0427","€43.95","€90.25","€14.65","€0.542","€2.195","€0.66","€0.424","€3.328","€5.40","€0.576","€8.70","€55.00","€7.62","€50.00","€27.00","€6.78","€0.242","€11.15","€12.00","€2.10","€4.52","€1.34","€0.508","€3.18","€10.518","€6.66","€13.60","€0.58","€0.40","€1.32","€0.0134","€3.60","€7.14","€11.45","€9.475","€8.00","€44.00","€2.78","€10.00","€0.44","€5.05","€18.45","€2.41","€154.85","€101.00","€0.71","€4.80","€99.50","€0.0001","€3.65","€0.825","€0.145","€0.10","€0.20","€1.208","€15.80","€0.3764","€496.00","€4.98","€0.01","€3.15","€10.23","€27.035","€15.00","€5.20","€0.4845","€34.70","€4.76","€5.88","€0.072","€8.40","€0.968","€0.203","€0.002","€25.00","€95.56","€20.20","€18.90","€0.1026","€3.44","€4.32","€0.113","€18.30","€0.085","€17.50","€98.54","€37.44","€7.00","€3.47","€25.09","€2.10","€812.00","€188.00","€730.00","€46.30","€1.74","€0.01","€14.50","€23.06","€114.00","€0.0035","€176.42","€1.1385","€67.78","NANA","€19.50","€202.00","€86.50","€83.30","€5.90","€250.40","€52.80","€30.40","€9.00","€4.00","€43.655","€195.96","€5.65","€28.44","€116.40","€11.30","€0.25","€0.29","€91.00","€0.81","€0.70","€0.0105","€6.05","€5.84","€1.09","€163.00","€18.50","€70.00","€0.416","€2.20","€0.712","€2.70","€0.0145","€0.04","€16.998","€2.61","€27.50","€1.82","€21.76","€78.12","€1.32","€18.70","€142.20","€0.0833","€2.438","€22.21","€222.00","€0.444","€8.50","€30.42","€0.2535","€0.0034","€41.20","€0.0658","€117.60","€22.45","€7.099","€42.705","€6.40","€23.70","NANA","NANA","€8.30","€0.005","€35.30","€83.38","€33.45","€9.48","€6.20","€1.21","€1.63","€18.37","€138.45","€57.00","€3.00","€1.00","€0.001","€7.79","NANA","€46.00","€133.70","€2.34","€0.10","€0.518","€0.799","€1.285","€81.00","€21.55","€85.50","€25.45","€0.2365","€0.0029","€0.03","€0.58","€2.30","€0.66","€59.72","€155.40","€4.80","€13.50","€5","€1.20","€145.70","€5.00","€3.96","€3.80","€3.22","€11.70","€1.15","€22.67","€0.27","€3.00","€70.56","€995.00","€0.63","€1.89","€2.36","€3.98","€4.00","€11.385","€0.1195","€13.495","NANA","€3.658","€6.00","€0.1516","€0.0022","€27.40","€14.30","€29.34","€0.236","€34.10","€2.1995","€0.483","€8.90","€0.99","€100.80","€14.20","€34.50","€7.90","€116.14","€5.30","€338.00","€7.20","€27.30","€0.80","€0.252","€12.90","€10.32","€4.84","€7.78","€129.50","€15.75","€3.75","€144.20","€22.70","€9.43","€57.90","€14.90","€2.42","€25.20","€0.34","€84.75","€0.39","€3.00","€5.08","€4.03","€3.50","€11.96","€7.815","€4.72","€1.44","€0.20"],[4.84,-3.27,-4.75,-0.95,1.97,-3.31,-5.3,1.4,null,-1.69,null,0.4,-9.09,5.08,-1.03,3.1,-17.53,-9.02,0.25,2.07,-16.18,-3,3.15,-2.87,1.34,null,26.13,null,-0.31,-1.06,12.18,null,4.17,-26.24,-10,-2.22,null,-0.54,4.95,-6.17,null,-1.18,-3.77,null,-1.57,-6.19,0.78,null,-1.03,null,0.07,-4.15,null,null,-1.4,null,-2.45,1.21,-0.99,null,1.14,2.4,null,2.05,-1.15,0.45,-19.4,-1.68,-3.74,-18.18,null,-0.86,null,-0.84,null,-5.52,0.39,null,null,20,null,5,null,1.43,-6.3,-0.48,-5.78,0.74,-0.47,-8.33,null,0.84,3.33,-0.67,-0.28,null,2.86,null,null,-6.39,0.97,-1.23,-0.69,null,-2.34,-0.5,-9.09,1.43,-3.03,-0.5,4.91,0.36,null,-0.39,-7.53,-0.13,-2.45,0.99,null,null,null,-1.71,-1.58,null,1.37,null,-2.02,-0.78,-17.28,-0.22,1.62,0.86,null,-22.22,null,-2.6,0.24,null,0.71,-0.48,-0.76,-0.02,null,-0.43,-0.74,3.29,0.72,1.41,-0.24,-1.87,null,-1.68,-4.84,-1.58,0.64,-1.67,1.04,null,-0.28,-1.11,-2.57,2.08,1.41,-10,null,-2.18,1.38,-2.31,-0.17,2.82,11.11,-0.78,0.39,-10.98,null,5.37,-1.91,-1.17,72.8,null,0.08,-0.58,-0.62,0.12,null,0.66,null,-0.27,-6.47,null,-0.49,null,null,-37.5,-2.72,6.25,3.85,-2.76,0.31,-4.76,-1.35,1.34,-0.67,1.32,1.44,0.31,0.45,0.67,-1.5,1.75,-1.32,-1.07,16.02,null,-2.9,null,null,null,-1.14,-5.26,-3.92,-1.2,-0.81,-0.5,-6.79,-3.15,-0.73,-87.5,-0.98,0.48,2.73,-1.62,2.94,4.17,null,-2.17,2.68,0.41,null,-2.38,-4.4,null,null,null,-2.22,null,null,null,-66.22,5.26,-8.6,-0.18,-3.94,null,17.8,null,1.48,-1.12,0.92,0.48,null,1.83,1.45,null,10,null,-4.4,null,10.19,-14.86,-2,null,-1.45,null,-3.7,2.53,null,-0.42,-1.19,-5.6,-0.69,0.87,2.39,0.77,null,0.13,null,-0.68,-2.8,11.61,null,-0.22,-8,null,-0.19,0.76,6.67,4.73,null,0.65,-0.46,-0.31,-2.06,1.82,-2.27,null,-9.49,-23.91,-23.84,0.62,-4.07,14.74,null,-0.53,-1.36,0.29,null,-2.52,null,-27.36,-10.64,null,null,0.5,-2.22,-3.09,8.7,6.79,-11.51,-25,0.27,0.59,5.67,-11.46,-7.8,-1.38,0.51,-3.77,-0.45,null,null,-0.81,-0.74,-10,null,0.66,-0.57,-1.54,-4.53,null,-2.63,-2.47,0.39,2.33,-1.15,2.25,6.04,-30,-1.26,1.77,null,null,-9.43,null,2.43,null,-7.76,-2.74,0.61,0.74,2.8,-4.92,null,0.81,-1.61,null,-2.85,null,0.46,null,null,null,null,129.17,1.01,null,9.59,2.2,-14.02,0.41,-1.23,-2.32,null,null,4.8,-2.99,2.12,0.36,0.28,-0.6,null,11.11,-2.86,null,-5.71,-7.74,-1.07,2.22,15.71,0.77,1.31,8.91,null,-5.2,1.45,1.05,-2.67,-19.62,-6.62,null,-1.18,-3.77,-0.15,0.91,0.65,106.67,null,-0.71,null,null,-1.48,-3.43,-8.5,0.43,-11.39,null,null,-0.83,null,-2.35,null,null,-0.67,-0.62,-0.63,null,3.78,-8.73,-1.76,null,-7.82,null,11.86,null,1.51,-0.08,1.38,-0.33,null,null,6.17,0.33,2.04,null,null,6.67,0.34,0.9,-0.98,0.31,-5.2,null,-0.6,null,1.17,-7.58,null,null,-1.12,2.35,2.74,7.01,-0.6,-1.22,-1.52,null,-1.88,null,0.34,0.12,0.88,-2.36,-0.59,2.99,-1.72,-1.43,-1.33,-0.49,null,-0.21,9.63,null,0.51,0.37,-1.5,1.61,1.12,-1.33,13.33,null,null,-1.4,null,4.88,2.73,null,null,null,-4.08,null,-0.21,1.34,null,-1.12,null,1.3,null,-0.95,1.98,-1.02,null,-0.26,-0.38,null,-1.11,6.61,null,-4.5,2.69,-40,-0.89,-5.26,null,-0.29,-1.28,0.47,14.29,null,1.16,-0.25,null,-0.66,-2.71,null,-4.03,0.78,-1.75,null,-1.81,-1.89,37.98,1.76,-1.22,-0.41,-6.58,-0.81,1.67,-3.09,5.87,-1.41,2.65,0.92,1.85,-1.4,-1.48,8,3.13,10.13,-3.51,-1.3,-2.91,-0.74,0.89,null,3.72,null,3.96,3.91,-0.74,-1.55,-0.63,-0.72,0.91,null,-0.85,-9.09,5.6,0.75,-1.64,-1.24,0.44,0.26,null,null,2.58,null,-2.22,5.21,0.27,0.42,-1.18,null,9.23,null,0.51,null,null,14.58,2.84,7.3,-20,-1.95,-0.63,-10.17,null,null,-50,-0.94,-1.92,-0.68,null,null,-1.22,0.58,-0.83,null,2.86,1.82,-2.81,2.01,33.33,null,0.93,1.51,null,-2.29,2.38,-2.7,0.71,1.67,-3.41,-0.57,-1.34,1.42,null,null,0.52,1.94,0.25,-11.74,0.01,0.22,-2.25,-9.09,-1.36,-0.43,0.26,null,0.57,null,0.16,null,null,null,0.83,0.73,-10.61,-0.32,null,null,-0.55,5.26,-0.73,-0.08,2.73,-0.07,-0.85,4,-7.41,7.41,-0.55,-33.06,17.85,-4.55,-0.17,-0.93,0.37,0.31,2.21,null,30,15.79,-1.93,-6.25,null,null,-15.85,-0.95,-0.36,-0.55,-1.2,0.15,-9.59,1.08,3.53,-1.54,2.18,-3.43,2.59,-3.27,-1.16,-0.07,-10.42,-32,-1.9,4.11,0.17,1.45,0.13,2.02,-1.54,-2.07,null,null,-13.09,25,-2.62,-1.91,0.3,0.42,null,null,null,-1.66,-1.67,7.55,null,null,-90,-1.58,null,1.32,-0.15,null,-1.19,0.39,1.14,1.58,-4.03,-0.46,null,1.19,7.01,26.09,5.63,2.65,19.79,1.54,0.91,1.7,-2.44,-1.1,3.85,-0.17,-0.95,-3.85,null,null,-19.5,1.74,0.88,13.81,-1.46,11.11,0.68,1.53,1.61,null,-1.67,-1.73,-1.72,1.11,-2.05,0.15,null,-2.19,null,0.93,null,1.48,-1.38,-1.87,-1.67,0.89,223.46,5,null,10.61,-0.59,7.58,-0.86,-4.59,-0.53,-0.93,1.35,-4,-0.73,12.68,-3.89,-1.53,1.47,1.26,1.7,1.17,0.64,null,2.56,-6.2,-3.87,-2.53,null,null,null,-17.07,-0.59,-11.36,11.11,-7.64,-0.49,-28.57,1.87,-12.92,-0.63,-0.69,null],["https://live.euronext.com/en/product/equities/FR0010285965-ALXP","https://live.euronext.com/en/product/equities/FR0013341781-ALXP","https://live.euronext.com/en/product/equities/FR0000076887-ALXP","https://live.euronext.com/en/product/equities/FR0010557264-XPAR","https://live.euronext.com/en/product/equities/FR0004040608-XPAR","https://live.euronext.com/en/product/equities/FR0013185857-XPAR","https://live.euronext.com/en/product/equities/FR0012616852-XPAR","https://live.euronext.com/en/product/equities/FR0012333284-XPAR","https://live.euronext.com/en/product/equities/FR001400AHX6-XPAR","https://live.euronext.com/en/product/equities/BE0974278104-XBRU","https://live.euronext.com/en/product/equities/FR0000064602-XPAR","https://live.euronext.com/en/product/equities/FR0000120404-XPAR","https://live.euronext.com/en/product/equities/FR001400JAP8-ALXP","https://live.euronext.com/en/product/equities/FR0000076861-XPAR","https://live.euronext.com/en/product/equities/FR0000076655-ALXP","https://live.euronext.com/en/product/equities/FR0014005OJ5-ALXP","https://live.euronext.com/en/product/equities/FR0010979377-XMLI","https://live.euronext.com/en/product/equities/BE0974269012-XPAR","https://live.euronext.com/en/product/equities/FR0013284627-ALXP","https://live.euronext.com/en/product/equities/FR0011184241-XPAR","https://live.euronext.com/en/product/equities/FR001400JAL7-ALXP","https://live.euronext.com/en/product/equities/FR0010340141-XPAR","https://live.euronext.com/en/product/equities/FR0012821890-XPAR","https://live.euronext.com/en/product/equities/FR0013296746-ALXP","https://live.euronext.com/en/product/equities/FR0000053043-ALXP","https://live.euronext.com/en/product/equities/FR0014007ZB4-XPAR","https://live.euronext.com/en/product/equities/US00774B2088-XPAR","https://live.euronext.com/en/product/equities/FR001400FL38-XPAR","https://live.euronext.com/en/product/equities/FR0013333077-XPAR","https://live.euronext.com/en/product/equities/FR0014005AC9-ALXP","https://live.euronext.com/en/product/equities/FR0011908045-XMLI","https://live.euronext.com/en/product/equities/FR0014005WE9-XMLI","https://live.euronext.com/en/product/equities/ES0105478004-XMLI","https://live.euronext.com/en/product/equities/FR0013452281-ALXP","https://live.euronext.com/en/product/equities/FR0010641449-ALXP","https://live.euronext.com/en/product/equities/FR001400J770-XPAR","https://live.euronext.com/en/product/equities/FR0000120073-XPAR","https://live.euronext.com/en/product/equities/NL0000235190-XPAR","https://live.euronext.com/en/product/equities/FR0014003V77-ALXP","https://live.euronext.com/en/product/equities/FR0000053027-XPAR","https://live.euronext.com/en/product/equities/FR0000062465-XPAR","https://live.euronext.com/en/product/equities/FR0014000JX7-ALXP","https://live.euronext.com/en/product/equities/FR0013258662-XPAR","https://live.euronext.com/en/product/equities/FR001400IV58-ALXP","https://live.euronext.com/en/product/equities/FR0000053324-XPAR","https://live.euronext.com/en/product/equities/FR0013421286-ALXP","https://live.euronext.com/en/product/equities/FR0010220475-XPAR","https://live.euronext.com/en/product/equities/FR0000053837-XPAR","https://live.euronext.com/en/product/equities/FR0000033219-XPAR","https://live.euronext.com/en/product/equities/FR0000039216-XPAR","https://live.euronext.com/en/product/equities/FR0000071946-XPAR","https://live.euronext.com/en/product/equities/FR0000061244-ALXP","https://live.euronext.com/en/product/equities/FR0010395681-XPAR","https://live.euronext.com/en/product/equities/FR0013253812-XMLI","https://live.euronext.com/en/product/equities/GB00BNKGZC51-ALXP","https://live.euronext.com/en/product/equities/NL0010273694-XMLI","https://live.euronext.com/en/product/equities/FR0011051598-ALXP","https://live.euronext.com/en/product/equities/FR0012789667-XPAR","https://live.euronext.com/en/product/equities/FR0004125920-XPAR","https://live.euronext.com/en/product/equities/ES0105744009-XMLI","https://live.euronext.com/en/product/equities/FR0014005AL0-XPAR","https://live.euronext.com/en/product/equities/LU0569974404-XAMS","https://live.euronext.com/en/product/equities/ES0105658001-XMLI","https://live.euronext.com/en/product/equities/FR0010340711-ALXP","https://live.euronext.com/en/product/equities/FR0014003U94-XPAR","https://live.euronext.com/en/product/equities/LU1598757687-XAMS","https://live.euronext.com/en/product/equities/FR001400KO61-ALXP","https://live.euronext.com/en/product/equities/FR0013398997-ALXP","https://live.euronext.com/en/product/equities/FR0005057635-XMLI","https://live.euronext.com/en/product/equities/FR0004070795-XMLI","https://live.euronext.com/en/product/equities/ES0105661005-XMLI","https://live.euronext.com/en/product/equities/FR0010481960-XPAR","https://live.euronext.com/en/product/equities/ES0105601001-XMLI","https://live.euronext.com/en/product/equities/FR0010313833-XPAR","https://live.euronext.com/en/product/equities/ES0105486007-XMLI","https://live.euronext.com/en/product/equities/FR0012185536-XPAR","https://live.euronext.com/en/product/equities/FR0000074783-XPAR","https://live.euronext.com/en/product/equities/FR0000076952-XPAR","https://live.euronext.com/en/product/equities/FR001400JWR8-XPAR","https://live.euronext.com/en/product/equities/FR0014003AC4-XPAR","https://live.euronext.com/en/product/equities/FR0012968485-XMLI","https://live.euronext.com/en/product/equities/FR0000074148-XPAR","https://live.euronext.com/en/product/equities/ES0105708004-XMLI","https://live.euronext.com/en/product/equities/FR0010478248-ALXP","https://live.euronext.com/en/product/equities/FR0011992700-XPAR","https://live.euronext.com/en/product/equities/FR0013455482-XPAR","https://live.euronext.com/en/product/equities/FR0000051732-XPAR","https://live.euronext.com/en/product/equities/FR0000063737-XPAR","https://live.euronext.com/en/product/equities/FR00140059B5-ALXP","https://live.euronext.com/en/product/equities/FR0000061780-XPAR","https://live.euronext.com/en/product/equities/FR0013410370-ALXP","https://live.euronext.com/en/product/equities/FR0000039232-XPAR","https://live.euronext.com/en/product/equities/FR0013183589-ALXP","https://live.euronext.com/en/product/equities/FR001400CFI7-XPAR","https://live.euronext.com/en/product/equities/FR0000120628-XPAR","https://live.euronext.com/en/product/equities/FR001400M7B2-XPAR","https://live.euronext.com/en/product/equities/FR0011040500-XPAR","https://live.euronext.com/en/product/equities/IT0004812258-XMLI","https://live.euronext.com/en/product/equities/PTAZR0AM0006-XMLI","https://live.euronext.com/en/product/equities/FR0013384369-ALXP","https://live.euronext.com/en/product/equities/MC0000031187-XPAR","https://live.euronext.com/en/product/equities/FR0013258399-XPAR","https://live.euronext.com/en/product/equities/FR0000062788-XPAR","https://live.euronext.com/en/product/equities/ES0105362000-XMLI","https://live.euronext.com/en/product/equities/FR0004023208-XPAR","https://live.euronext.com/en/product/equities/FR0000035370-XPAR","https://live.euronext.com/en/product/equities/FR0010436170-XMLI","https://live.euronext.com/en/product/equities/FR0000035305-ALXP","https://live.euronext.com/en/product/equities/CH0451123589-XMLI","https://live.euronext.com/en/product/equities/CH1148983609-XMLI","https://live.euronext.com/en/product/equities/FR0014003FE9-XPAR","https://live.euronext.com/en/product/equities/FR0000035164-XPAR","https://live.euronext.com/en/product/equities/FR0000066961-ALXP","https://live.euronext.com/en/product/equities/FR0000120966-XPAR","https://live.euronext.com/en/product/equities/FR0000074072-XPAR","https://live.euronext.com/en/product/equities/FR0004174233-ALXP","https://live.euronext.com/en/product/equities/FR0013345493-ALXP","https://live.euronext.com/en/product/equities/FR0013280286-XPAR","https://live.euronext.com/en/product/equities/FR0012816825-ALXP","https://live.euronext.com/en/product/equities/FR0013507290-ALXP","https://live.euronext.com/en/product/equities/FR001400LN79-ALXP","https://live.euronext.com/en/product/equities/BE0974280126-XBRU","https://live.euronext.com/en/product/equities/FR0011005933-ALXP","https://live.euronext.com/en/product/equities/FR0000062150-XPAR","https://live.euronext.com/en/product/equities/FR0013340973-XMLI","https://live.euronext.com/en/product/equities/FR0011041011-ALXP","https://live.euronext.com/en/product/equities/FR0000131104-XPAR","https://live.euronext.com/en/product/equities/FR0011365907-ALXP","https://live.euronext.com/en/product/equities/FR0010106039-XMLI","https://live.euronext.com/en/product/equities/FR0000061129-XPAR","https://live.euronext.com/en/product/equities/FR0000039299-XPAR","https://live.euronext.com/en/product/equities/FR0000063935-XPAR","https://live.euronext.com/en/product/equities/BE6333353298-XMLI","https://live.euronext.com/en/product/equities/FR001400IAM7-ALXP","https://live.euronext.com/en/product/equities/FR0000054421-ALXP","https://live.euronext.com/en/product/equities/FR0000074254-XPAR","https://live.euronext.com/en/product/equities/FR0000120503-XPAR","https://live.euronext.com/en/product/equities/FR001400M3D7-XPAR","https://live.euronext.com/en/product/equities/FR001400AJZ7-ALXP","https://live.euronext.com/en/product/equities/FR0006174348-XPAR","https://live.euronext.com/en/product/equities/FR0000061137-XPAR","https://live.euronext.com/en/product/equities/FR0000045544-XPAR","https://live.euronext.com/en/product/equities/FR001400DIY6-ALXP","https://live.euronext.com/en/product/equities/FR0010151589-XPAR","https://live.euronext.com/en/product/equities/FR0000079659-XPAR","https://live.euronext.com/en/product/equities/FR0012969095-ALXP","https://live.euronext.com/en/product/equities/FR0000125338-XPAR","https://live.euronext.com/en/product/equities/FR0011648716-ALXP","https://live.euronext.com/en/product/equities/FR0010907956-ALXP","https://live.euronext.com/en/product/equities/FR0010828137-XPAR","https://live.euronext.com/en/product/equities/FR0000064156-XPAR","https://live.euronext.com/en/product/equities/FR0000120172-XPAR","https://live.euronext.com/en/product/equities/FR0000125585-XPAR","https://live.euronext.com/en/product/equities/FR0010193052-XPAR","https://live.euronext.com/en/product/equities/FR0000064446-ALXP","https://live.euronext.com/en/product/equities/US1491231015-XPAR","https://live.euronext.com/en/product/equities/FR0014007LW0-ALXP","https://live.euronext.com/en/product/equities/FR001400D0X2-ALXP","https://live.euronext.com/en/product/equities/FR0010193979-XPAR","https://live.euronext.com/en/product/equities/FR0000053506-XPAR","https://live.euronext.com/en/product/equities/FR0010425595-ALXP","https://live.euronext.com/en/product/equities/BE0974260896-XBRU","https://live.euronext.com/en/product/equities/FR0013178712-ALXP","https://live.euronext.com/en/product/equities/FR0000037475-XPAR","https://live.euronext.com/en/product/equities/MC0010000826-XMLI","https://live.euronext.com/en/product/equities/FR0013181864-XPAR","https://live.euronext.com/en/product/equities/FR0000037871-XMLI","https://live.euronext.com/en/product/equities/FR0000051567-XMLI","https://live.euronext.com/en/product/equities/FR0000130692-XPAR","https://live.euronext.com/en/product/equities/FR001400AJ60-ALXP","https://live.euronext.com/en/product/equities/FR0000060907-XPAR","https://live.euronext.com/en/product/equities/FR0010447086-XMLI","https://live.euronext.com/en/product/equities/FR0000130403-XPAR","https://live.euronext.com/en/product/equities/FR0000054322-ALXP","https://live.euronext.com/en/product/equities/FR0000060428-XMLI","https://live.euronext.com/en/product/equities/FR0013426004-XPAR","https://live.euronext.com/en/product/equities/FR0010386334-XPAR","https://live.euronext.com/en/product/equities/FR0004152882-ALXP","https://live.euronext.com/en/product/equities/FR0013406881-XMLI","https://live.euronext.com/en/product/equities/NL0010949392-XPAR","https://live.euronext.com/en/product/equities/FR0010667147-XPAR","https://live.euronext.com/en/product/equities/FR0013257409-ALXP","https://live.euronext.com/en/product/equities/FR0013335742-ALXP","https://live.euronext.com/en/product/equities/FR0011071570-ALXP","https://live.euronext.com/en/product/equities/FR0004031763-XPAR","https://live.euronext.com/en/product/equities/BE0160342011-ALXP","https://live.euronext.com/en/product/equities/FR0010959684-XMLI","https://live.euronext.com/en/product/equities/FR0000062234-XPAR","https://live.euronext.com/en/product/equities/BE6252013725-XMLI","https://live.euronext.com/en/product/equities/FR0000077828-XMLI","https://live.euronext.com/en/product/equities/FR00140007I9-XMLI","https://live.euronext.com/en/product/equities/ES0105660007-XMLI","https://live.euronext.com/en/product/equities/FR0010035816-XMLI","https://live.euronext.com/en/product/equities/FR0013371507-XMLI","https://live.euronext.com/en/product/equities/US2220702037-XPAR","https://live.euronext.com/en/product/equities/FR0004998318-XMLI","https://live.euronext.com/en/product/equities/FR0000065393-XPAR","https://live.euronext.com/en/product/equities/FR0000064578-XPAR","https://live.euronext.com/en/product/equities/FR0000060303-XPAR","https://live.euronext.com/en/product/equities/FR0000044323-XPAR","https://live.euronext.com/en/product/equities/FR0000185506-XPAR","https://live.euronext.com/en/product/equities/FR0010483768-XPAR","https://live.euronext.com/en/product/equities/FR0000045213-XPAR","https://live.euronext.com/en/product/equities/FR0010461053-XPAR","https://live.euronext.com/en/product/equities/FR0000045239-XPAR","https://live.euronext.com/en/product/equities/FR0000045551-XPAR","https://live.euronext.com/en/product/equities/FR0000185514-XPAR","https://live.euronext.com/en/product/equities/FR0000044364-XPAR","https://live.euronext.com/en/product/equities/FR0000045528-XPAR","https://live.euronext.com/en/product/equities/FR0000045346-XPAR","https://live.euronext.com/en/product/equities/FR0000045304-XPAR","https://live.euronext.com/en/product/equities/FR0000045072-XPAR","https://live.euronext.com/en/product/equities/FR0011716265-ALXP","https://live.euronext.com/en/product/equities/FR0000050395-XPAR","https://live.euronext.com/en/product/equities/FR0014004QR6-ALXP","https://live.euronext.com/en/product/equities/FR0013507977-ALXP","https://live.euronext.com/en/product/equities/FR0013507985-ALXP","https://live.euronext.com/en/product/equities/FR0013508009-ALXP","https://live.euronext.com/en/product/equities/FR0010404368-ALXP","https://live.euronext.com/en/product/equities/FR0000077885-XMLI","https://live.euronext.com/en/product/equities/FR0000185423-ALXP","https://live.euronext.com/en/product/equities/FR0000120644-XPAR","https://live.euronext.com/en/product/equities/FR0014004L86-XPAR","https://live.euronext.com/en/product/equities/FR0014003TT8-XPAR","https://live.euronext.com/en/product/equities/FR001400LO86-ALXP","https://live.euronext.com/en/product/equities/FR0010417345-XPAR","https://live.euronext.com/en/product/equities/FR001400AYG6-XPAR","https://live.euronext.com/en/product/equities/FR0014004JF6-XPAR","https://live.euronext.com/en/product/equities/FR0000062978-XPAR","https://live.euronext.com/en/product/equities/FR0000054132-ALXP","https://live.euronext.com/en/product/equities/FR0013283108-ALXP","https://live.euronext.com/en/product/equities/FR0000053381-XPAR","https://live.euronext.com/en/product/equities/FR0000060840-ALXP","https://live.euronext.com/en/product/equities/FR001400IAQ8-ALXP","https://live.euronext.com/en/product/equities/FR0012202497-ALXP","https://live.euronext.com/en/product/equities/BE0974289218-ALXB","https://live.euronext.com/en/product/equities/FR0010436584-ALXP","https://live.euronext.com/en/product/equities/FR0000065260-XPAR","https://live.euronext.com/en/product/equities/FR0014004QZ9-ALXP","https://live.euronext.com/en/product/equities/FR0013331212-ALXP","https://live.euronext.com/en/product/equities/FR0013088606-ALXP","https://live.euronext.com/en/product/equities/FR0014007951-ALXP","https://live.euronext.com/en/product/equities/FR0000052920-XMLI","https://live.euronext.com/en/product/equities/LU0881232630-XMLI","https://live.euronext.com/en/product/equities/FR0014004339-ALXP","https://live.euronext.com/en/product/equities/HK0000038783-XMLI","https://live.euronext.com/en/product/equities/FR0007200100-XMLI","https://live.euronext.com/en/product/equities/FR0010536185-XMLI","https://live.euronext.com/en/product/equities/DE000A0XYM45-XMLI","https://live.euronext.com/en/product/equities/FR0013534617-ALXP","https://live.euronext.com/en/product/equities/FR0011490648-ALXP","https://live.euronext.com/en/product/equities/FR0010908533-XPAR","https://live.euronext.com/en/product/equities/IT0005351504-ALXP","https://live.euronext.com/en/product/equities/FR0000052755-XMLI","https://live.euronext.com/en/product/equities/FR0010882886-XMLI","https://live.euronext.com/en/product/equities/FR0010439265-XMLI","https://live.euronext.com/en/product/equities/FR0000072373-ALXP","https://live.euronext.com/en/product/equities/FR0000130452-XPAR","https://live.euronext.com/en/product/equities/FR0011466069-XPAR","https://live.euronext.com/en/product/equities/FR0000031023-XPAR","https://live.euronext.com/en/product/equities/FR0000035719-XPAR","https://live.euronext.com/en/product/equities/FR0011950732-XPAR","https://live.euronext.com/en/product/equities/FR0012435121-XPAR","https://live.euronext.com/en/product/equities/ES0105726006-XMLI","https://live.euronext.com/en/product/equities/ES0105639001-XMLI","https://live.euronext.com/en/product/equities/FR0013356755-ALXP","https://live.euronext.com/en/product/equities/FR0004030708-ALXP","https://live.euronext.com/en/product/equities/FR0013330792-ALXP","https://live.euronext.com/en/product/equities/FR0013399359-ALXP","https://live.euronext.com/en/product/equities/FR0011915339-ALXP","https://live.euronext.com/en/product/equities/FR0010208488-XPAR","https://live.euronext.com/en/product/equities/FR001400C2Z4-ALXP","https://live.euronext.com/en/product/equities/FR0014004974-ALXP","https://live.euronext.com/en/product/equities/FR0014004362-ALXP","https://live.euronext.com/en/product/equities/FR0010424697-ALXP","https://live.euronext.com/en/product/equities/FR0000045122-ALXP","https://live.euronext.com/en/product/equities/FR0010465534-ALXP","https://live.euronext.com/en/product/equities/FR0012882389-XPAR","https://live.euronext.com/en/product/equities/FR0000131757-XPAR","https://live.euronext.com/en/product/equities/FR0010211037-ALXP","https://live.euronext.com/en/product/equities/FR0000035818-ALXP","https://live.euronext.com/en/product/equities/FR0000121667-XPAR","https://live.euronext.com/en/product/equities/FR0000120669-XPAR","https://live.euronext.com/en/product/equities/FR0000061475-XPAR","https://live.euronext.com/en/product/equities/FR0010844001-ALXP","https://live.euronext.com/en/product/equities/FR0000121121-XPAR","https://live.euronext.com/en/product/equities/FR0000054678-XPAR","https://live.euronext.com/en/product/equities/FR0014008VX5-XPAR","https://live.euronext.com/en/product/equities/FR0013240934-ALXP","https://live.euronext.com/en/product/equities/FR0013256518-ALXP","https://live.euronext.com/en/product/equities/FR001400M7C0-XPAR","https://live.euronext.com/en/product/equities/FR0014000MR3-XPAR","https://live.euronext.com/en/product/equities/FR0010157115-XMLI","https://live.euronext.com/en/product/equities/ES0105586004-XMLI","https://live.euronext.com/en/product/equities/NL0006294274-XPAR","https://live.euronext.com/en/product/equities/FR0010490920-ALXP","https://live.euronext.com/en/product/equities/FR001400CF13-ALXP","https://live.euronext.com/en/product/equities/FR0010221234-XPAR","https://live.euronext.com/en/product/equities/FR0000035784-XPAR","https://live.euronext.com/en/product/equities/FR0000064164-ALXP","https://live.euronext.com/en/product/equities/FR0000062671-XPAR","https://live.euronext.com/en/product/equities/FR0014005DA7-XPAR","https://live.euronext.com/en/product/equities/FR0004527638-XPAR","https://live.euronext.com/en/product/equities/FR0014003AQ4-XPAR","https://live.euronext.com/en/product/equities/ES0105029005-ALXP","https://live.euronext.com/en/product/equities/ES0105553004-XMLI","https://live.euronext.com/en/product/equities/FR0004034593-ALXP","https://live.euronext.com/en/product/equities/FR0000031973-XPAR","https://live.euronext.com/en/product/equities/FR0012300424-XMLI","https://live.euronext.com/en/product/equities/FR0013451333-XPAR","https://live.euronext.com/en/product/equities/FR0000062101-XPAR","https://live.euronext.com/en/product/equities/FR0011271600-XPAR","https://live.euronext.com/en/product/equities/FR0000061418-XPAR","https://live.euronext.com/en/product/equities/FR0000060535-XPAR","https://live.euronext.com/en/product/equities/FR0011665280-XPAR","https://live.euronext.com/en/product/equities/FR001400AEM6-ALXP","https://live.euronext.com/en/product/equities/FR0000062341-XPAR","https://live.euronext.com/en/product/equities/SN0000033192-XPAR","https://live.euronext.com/en/product/equities/FR0000060824-XPAR","https://live.euronext.com/en/product/equities/FR0000035123-XPAR","https://live.euronext.com/en/product/equities/FR0010487272-XMLI","https://live.euronext.com/en/product/equities/FR0000038184-XPAR","https://live.euronext.com/en/product/equities/CH0120879058-XMLI","https://live.euronext.com/en/product/equities/FR0000074759-ALXP","https://live.euronext.com/en/product/equities/FR001400GO75-ALXP","https://live.euronext.com/en/product/equities/FR0011476928-XPAR","https://live.euronext.com/en/product/equities/FR0013230067-XMLI","https://live.euronext.com/en/product/equities/FR0012419307-ALXP","https://live.euronext.com/en/product/equities/FR0000065930-XPAR","https://live.euronext.com/en/product/equities/FR0000038499-XPAR","https://live.euronext.com/en/product/equities/FR0010341032-XPAR","https://live.euronext.com/en/product/equities/FR0000033409-XPAR","https://live.euronext.com/en/product/equities/FR0011605617-XMLI","https://live.euronext.com/en/product/equities/FR0000053944-XPAR","https://live.euronext.com/en/product/equities/CI0000053161-XPAR","https://live.euronext.com/en/product/equities/FR0014005SB3-XPAR","https://live.euronext.com/en/product/equities/FR0000121147-XPAR","https://live.euronext.com/en/product/equities/FR0010485268-ALXP","https://live.euronext.com/en/product/equities/FR0013030152-XPAR","https://live.euronext.com/en/product/equities/FR0013222346-XMLI","https://live.euronext.com/en/product/equities/FR0010823724-XMLI","https://live.euronext.com/en/product/equities/FR0004187367-ALXP","https://live.euronext.com/en/product/equities/FR0010588079-XPAR","https://live.euronext.com/en/product/equities/FR0000053415-XMLI","https://live.euronext.com/en/product/equities/FR0011100759-XMLI","https://live.euronext.com/en/product/equities/FR0000030611-XPAR","https://live.euronext.com/en/product/equities/FR0000124414-ALXP","https://live.euronext.com/en/product/equities/FR0000034894-XPAR","https://live.euronext.com/en/product/equities/FR0013495298-ALXP","https://live.euronext.com/en/product/equities/FR0000053035-XPAR","https://live.euronext.com/en/product/equities/FR001400M1R1-ALXP","https://live.euronext.com/en/product/equities/FR0010040865-XPAR","https://live.euronext.com/en/product/equities/US3696043013-XPAR","https://live.euronext.com/en/product/equities/CH0308403085-XPAR","https://live.euronext.com/en/product/equities/FR0004163111-XPAR","https://live.euronext.com/en/product/equities/FR0004053510-ALXP","https://live.euronext.com/en/product/equities/FR0013183985-XPAR","https://live.euronext.com/en/product/equities/PTGVE1AE0009-XMLI","https://live.euronext.com/en/product/equities/FR0010533075-XPAR","https://live.euronext.com/en/product/equities/FR0000033888-ALXP","https://live.euronext.com/en/product/equities/FR0000066672-XPAR","https://live.euronext.com/en/product/equities/IT0005454167-XMLI","https://live.euronext.com/en/product/equities/IT0005454175-XMLI","https://live.euronext.com/en/product/equities/IT0005454134-XMLI","https://live.euronext.com/en/product/equities/FR0011052257-ALXP","https://live.euronext.com/en/product/equities/ES0105537007-XMLI","https://live.euronext.com/en/product/equities/FR0011208693-ALXP","https://live.euronext.com/en/product/equities/FR0010214064-XPAR","https://live.euronext.com/en/product/equities/FR0013204070-ALXP","https://live.euronext.com/en/product/equities/FR0000065971-XPAR","https://live.euronext.com/en/product/equities/FR0014005ZM5-ALXP","https://live.euronext.com/en/product/equities/FR00140069V2-ALXP","https://live.euronext.com/en/product/equities/FR0000076960-XMLI","https://live.euronext.com/en/product/equities/FR0000036675-XPAR","https://live.euronext.com/en/product/equities/FR0012819381-ALXP","https://live.euronext.com/en/product/equities/FR0004010338-XPAR","https://live.euronext.com/en/product/equities/FR0000075442-ALXP","https://live.euronext.com/en/product/equities/FR0013439627-ALXP","https://live.euronext.com/en/product/equities/FR0012612646-XPAR","https://live.euronext.com/en/product/equities/FR0010529719-XMLI","https://live.euronext.com/en/product/equities/FR0004155000-XPAR","https://live.euronext.com/en/product/equities/FR0013429404-ALXP","https://live.euronext.com/en/product/equities/FR0014000RP6-ALXP","https://live.euronext.com/en/product/equities/US36254L2097-XPAR","https://live.euronext.com/en/product/equities/FR0011726835-XPAR","https://live.euronext.com/en/product/equities/LU1840650458-XMLI","https://live.euronext.com/en/product/equities/FR0000032526-XPAR","https://live.euronext.com/en/product/equities/FR0000066722-XPAR","https://live.euronext.com/en/product/equities/FR0014007ND6-ALXP","https://live.euronext.com/en/product/equities/GB00BMDXQ672-ALXP","https://live.euronext.com/en/product/equities/FR0000066755-XPAR","https://live.euronext.com/en/product/equities/FR0014003VY4-XPAR","https://live.euronext.com/en/product/equities/ES0105498002-XMLI","https://live.euronext.com/en/product/equities/FR0000066540-ALXP","https://live.euronext.com/en/product/equities/FR0000052292-XPAR","https://live.euronext.com/en/product/equities/FR0004159473-ALXP","https://live.euronext.com/en/product/equities/FR0000038531-ALXP","https://live.euronext.com/en/product/equities/FR0000054231-XPAR","https://live.euronext.com/en/product/equities/FR0012821916-ALXP","https://live.euronext.com/en/product/equities/FR0010396309-ALXP","https://live.euronext.com/en/product/equities/DE000A11Q133-XMLI","https://live.euronext.com/en/product/equities/FR0000051302-XMLI","https://live.euronext.com/en/product/equities/FR0013451044-ALXP","https://live.euronext.com/en/product/equities/FR0012336691-XMLI","https://live.euronext.com/en/product/equities/FR0010312181-XMLI","https://live.euronext.com/en/product/equities/FR0014000U63-ALXP","https://live.euronext.com/en/product/equities/FR0000065278-ALXP","https://live.euronext.com/en/product/equities/FR0006226791-XMLI","https://live.euronext.com/en/product/equities/ES0105664009-XMLI","https://live.euronext.com/en/product/equities/FR0000053738-XMLI","https://live.euronext.com/en/product/equities/FR0004165801-XPAR","https://live.euronext.com/en/product/equities/FR0006563904-XMLI","https://live.euronext.com/en/product/equities/FR0014007LQ2-ALXP","https://live.euronext.com/en/product/equities/FR0004153930-ALXP","https://live.euronext.com/en/product/equities/FR0000064735-XMLI","https://live.euronext.com/en/product/equities/FR0005843125-XMLI","https://live.euronext.com/en/product/equities/FR0014001PM5-ALXP","https://live.euronext.com/en/product/equities/FR0014005IU4-ALXP","https://live.euronext.com/en/product/equities/FR0005854700-ALXP","https://live.euronext.com/en/product/equities/ES0105479002-XMLI","https://live.euronext.com/en/product/equities/FR0000035081-XPAR","https://live.euronext.com/en/product/equities/FR001400A3Q3-ALXP","https://live.euronext.com/en/product/equities/FR0010929125-XPAR","https://live.euronext.com/en/product/equities/FR0000051393-XPAR","https://live.euronext.com/en/product/equities/FR0000079691-XMLI","https://live.euronext.com/en/product/equities/FR0000062184-ALXP","https://live.euronext.com/en/product/equities/ES0105551008-XMLI","https://live.euronext.com/en/product/equities/FR00140048X2-ALXP","https://live.euronext.com/en/product/equities/IT0005380602-ALXP","https://live.euronext.com/en/product/equities/FR0010086371-XMLI","https://live.euronext.com/en/product/equities/FR0000120859-XPAR","https://live.euronext.com/en/product/equities/FR0006859039-XMLI","https://live.euronext.com/en/product/equities/FR0013060100-ALXP","https://live.euronext.com/en/product/equities/FR0000033243-XPAR","https://live.euronext.com/en/product/equities/FR0013470168-ALXP","https://live.euronext.com/en/product/equities/FR0000065773-XMLI","https://live.euronext.com/en/product/equities/ES0105590006-XMLI","https://live.euronext.com/en/product/equities/FR0000066219-XPAR","https://live.euronext.com/en/product/equities/FR0011158823-XMLI","https://live.euronext.com/en/product/equities/FR0000071797-XPAR","https://live.euronext.com/en/product/equities/ES0105511002-XMLI","https://live.euronext.com/en/product/equities/ES0105473005-XMLI","https://live.euronext.com/en/product/equities/FR0010331421-XPAR","https://live.euronext.com/en/product/equities/FR0000064297-ALXP","https://live.euronext.com/en/product/equities/IT0005391161-XMLI","https://live.euronext.com/en/product/equities/FR0000060451-ALXP","https://live.euronext.com/en/product/equities/FR0010908723-ALXP","https://live.euronext.com/en/product/equities/FR0014003FN0-XMLI","https://live.euronext.com/en/product/equities/FR0004024222-XPAR","https://live.euronext.com/en/product/equities/FR0000064958-XPAR","https://live.euronext.com/en/product/equities/FR0011179886-ALXP","https://live.euronext.com/en/product/equities/FR0013233012-XPAR","https://live.euronext.com/en/product/equities/BE0974299316-ALXP","https://live.euronext.com/en/product/equities/ES0105417002-XMLI","https://live.euronext.com/en/product/equities/FR0010259150-XPAR","https://live.euronext.com/en/product/equities/FR0000073298-XPAR","https://live.euronext.com/en/product/equities/ES0109429037-ALXP","https://live.euronext.com/en/product/equities/FR0000072597-ALXP","https://live.euronext.com/en/product/equities/IT0005336521-XMLI","https://live.euronext.com/en/product/equities/FR0004026151-XPAR","https://live.euronext.com/en/product/equities/FR0012872141-XPAR","https://live.euronext.com/en/product/equities/FR0000033904-XPAR","https://live.euronext.com/en/product/equities/FR0000077919-XPAR","https://live.euronext.com/en/product/equities/FR0010680033-XMLI","https://live.euronext.com/en/product/equities/ES0105636007-XMLI","https://live.euronext.com/en/product/equities/FR0010722819-ALXP","https://live.euronext.com/en/product/equities/FR0004007813-XPAR","https://live.euronext.com/en/product/equities/FR0000121485-XPAR","https://live.euronext.com/en/product/equities/FR0013156007-ALXP","https://live.euronext.com/en/product/equities/FR0004029411-ALXP","https://live.euronext.com/en/product/equities/FR0013374667-ALXP","https://live.euronext.com/en/product/equities/FR0011038348-ALXP","https://live.euronext.com/en/product/equities/FR0000121964-XPAR","https://live.euronext.com/en/product/equities/ES0105425005-ALXP","https://live.euronext.com/en/product/equities/FR0013419876-ALXP","https://live.euronext.com/en/product/equities/FR0000120321-XPAR","https://live.euronext.com/en/product/equities/NL0012191662-ALXP","https://live.euronext.com/en/product/equities/FR0000075343-ALXP","https://live.euronext.com/en/product/equities/FR0000066607-XPAR","https://live.euronext.com/en/product/equities/FR0000130213-XPAR","https://live.euronext.com/en/product/equities/FR0004027068-ALXP","https://live.euronext.com/en/product/equities/FR0013308582-ALXP","https://live.euronext.com/en/product/equities/FR001400JY13-XPAR","https://live.euronext.com/en/product/equities/FR0006864484-XPAR","https://live.euronext.com/en/product/equities/FR0013204336-XPAR","https://live.euronext.com/en/product/equities/FR0000121295-ALXP","https://live.euronext.com/en/product/equities/FR0000065484-XPAR","https://live.euronext.com/en/product/equities/FR001400MMI2-XPAR","https://live.euronext.com/en/product/equities/FR0010307819-XPAR","https://live.euronext.com/en/product/equities/FR001400F2Z1-ALXP","https://live.euronext.com/en/product/equities/FR0007080254-ALXP","https://live.euronext.com/en/product/equities/FR0000033599-ALXP","https://live.euronext.com/en/product/equities/FR0014009YQ1-XPAR","https://live.euronext.com/en/product/equities/FR0004156297-XPAR","https://live.euronext.com/en/product/equities/FR0000050353-XPAR","https://live.euronext.com/en/product/equities/BE0974334667-ALXP","https://live.euronext.com/en/product/equities/ES0105089009-ALXP","https://live.euronext.com/en/product/equities/FR0004170017-XPAR","https://live.euronext.com/en/product/equities/FR0004155208-XMLI","https://live.euronext.com/en/product/equities/FR0000044943-ALXP","https://live.euronext.com/en/product/equities/FR0006205019-XMLI","https://live.euronext.com/en/product/equities/FR0011884378-ALXP","https://live.euronext.com/en/product/equities/FR0000038242-XPAR","https://live.euronext.com/en/product/equities/FR0000121014-XPAR","https://live.euronext.com/en/product/equities/FR00140085W6-XPAR","https://live.euronext.com/en/product/equities/FR0013270626-ALXP","https://live.euronext.com/en/product/equities/FR0012634822-XPAR","https://live.euronext.com/en/product/equities/FR0010328302-XMLI","https://live.euronext.com/en/product/equities/FR0010827741-XMLI","https://live.euronext.com/en/product/equities/FR0000061657-XMLI","https://live.euronext.com/en/product/equities/FR0011092089-XMLI","https://live.euronext.com/en/product/equities/FR0013153541-XPAR","https://live.euronext.com/en/product/equities/ES0105463006-ALXP","https://live.euronext.com/en/product/equities/FR0000030074-XPAR","https://live.euronext.com/en/product/equities/FR0000038606-XPAR","https://live.euronext.com/en/product/equities/ES0105447009-XMLI","https://live.euronext.com/en/product/equities/FR0013400835-ALXP","https://live.euronext.com/en/product/equities/MA0000011488-XPAR","https://live.euronext.com/en/product/equities/FR0004155687-ALXP","https://live.euronext.com/en/product/equities/FR0013472446-ALXP","https://live.euronext.com/en/product/equities/FR0010609263-ALXP","https://live.euronext.com/en/product/equities/FR0000051070-XPAR","https://live.euronext.com/en/product/equities/FR0000060873-XPAR","https://live.euronext.com/en/product/equities/FR0011742329-XPAR","https://live.euronext.com/en/product/equities/FR0014006PT9-XMLI","https://live.euronext.com/en/product/equities/FR0010844464-ALXP","https://live.euronext.com/en/product/equities/FR0000064404-XPAR","https://live.euronext.com/en/product/equities/IT0005324105-XMLI","https://live.euronext.com/en/product/equities/FR0011049824-ALXP","https://live.euronext.com/en/product/equities/FR0004065605-XPAR","https://live.euronext.com/en/product/equities/IT0004844848-XMLI","https://live.euronext.com/en/product/equities/FR0010298620-XPAR","https://live.euronext.com/en/product/equities/FR0010241638-XPAR","https://live.euronext.com/en/product/equities/ES0105559001-XMLI","https://live.euronext.com/en/product/equities/FR0000039620-XPAR","https://live.euronext.com/en/product/equities/FR0004177046-XPAR","https://live.euronext.com/en/product/equities/FR0010492181-XMLI","https://live.euronext.com/en/product/equities/FR00140066X4-ALXP","https://live.euronext.com/en/product/equities/FR0011217710-ALXP","https://live.euronext.com/en/product/equities/BE0974328602-XMLI","https://live.euronext.com/en/product/equities/FR0000053225-XPAR","https://live.euronext.com/en/product/equities/IT0005450819-ALXP","https://live.euronext.com/en/product/equities/FR0010204453-ALXP","https://live.euronext.com/en/product/equities/FR0010353888-ALXP","https://live.euronext.com/en/product/equities/FR001400AJ45-XPAR","https://live.euronext.com/en/product/equities/FR0000077570-ALXP","https://live.euronext.com/en/product/equities/FR0010500363-XMLI","https://live.euronext.com/en/product/equities/FR0013053535-ALXP","https://live.euronext.com/en/product/equities/FR0004172450-ALXP","https://live.euronext.com/en/product/equities/FR00140050Q2-ALXP","https://live.euronext.com/en/product/equities/FR001400H3A0-ALXP","https://live.euronext.com/en/product/equities/FR0000076986-XPAR","https://live.euronext.com/en/product/equities/BE0003853703-XBRU","https://live.euronext.com/en/product/equities/ES0105549002-XMLI","https://live.euronext.com/en/product/equities/FR0011033083-ALXP","https://live.euronext.com/en/product/equities/FR0004034320-ALXP","https://live.euronext.com/en/product/equities/FR0013462231-ALXP","https://live.euronext.com/en/product/equities/ES0105697009-XMLI","https://live.euronext.com/en/product/equities/FR001400IE67-XPAR","https://live.euronext.com/en/product/equities/FR0013482791-XPAR","https://live.euronext.com/en/product/equities/FR0014003J32-ALXP","https://live.euronext.com/en/product/equities/FR0011341205-XPAR","https://live.euronext.com/en/product/equities/FR0011675362-XPAR","https://live.euronext.com/en/product/equities/FR0011636083-ALXP","https://live.euronext.com/en/product/equities/FR001400MV37-ALXP","https://live.euronext.com/en/product/equities/FR0004154060-ALXP","https://live.euronext.com/en/product/equities/FR0000072993-ALXP","https://live.euronext.com/en/product/equities/FR0004050250-XPAR","https://live.euronext.com/en/product/equities/FR0000044448-XPAR","https://live.euronext.com/en/product/equities/FR0010112524-XPAR","https://live.euronext.com/en/product/equities/FR0004171346-ALXP","https://live.euronext.com/en/product/equities/FR0014003XT0-ALXP","https://live.euronext.com/en/product/equities/FR0012650166-XPAR","https://live.euronext.com/en/product/equities/FR0013018124-ALXP","https://live.euronext.com/en/product/equities/FI0009000681-XPAR","https://live.euronext.com/en/product/equities/ES0105719001-XMLI","https://live.euronext.com/en/product/equities/FR0010397232-ALXP","https://live.euronext.com/en/product/equities/FR0000185464-XMLI","https://live.euronext.com/en/product/equities/FR0014001PV6-XPAR","https://live.euronext.com/en/product/equities/FR0000121691-XPAR","https://live.euronext.com/en/product/equities/FR0000064529-ALXP","https://live.euronext.com/en/product/equities/FR0004065639-ALXP","https://live.euronext.com/en/product/equities/FR0014003711-ALXP","https://live.euronext.com/en/product/equities/FR0013310281-XMLI","https://live.euronext.com/en/product/equities/FR0000052680-XPAR","https://live.euronext.com/en/product/equities/ES0105698007-XMLI","https://live.euronext.com/en/product/equities/FR0010428771-XPAR","https://live.euronext.com/en/product/equities/FR0014003T71-ALXP","https://live.euronext.com/en/product/equities/FR001400CM63-ALXP","https://live.euronext.com/en/product/equities/FR0013266772-ALXP","https://live.euronext.com/en/product/equities/FR0004174712-XMLI","https://live.euronext.com/en/product/equities/FR0000133308-XPAR","https://live.euronext.com/en/product/equities/FR0000075392-XPAR","https://live.euronext.com/en/product/equities/ES0105490009-XMLI","https://live.euronext.com/en/product/equities/FR0013318052-ALXP","https://live.euronext.com/en/product/equities/FR0010609206-XPAR","https://live.euronext.com/en/product/equities/ES0105534004-XMLI","https://live.euronext.com/en/product/equities/FR0000184798-XPAR","https://live.euronext.com/en/product/equities/FR0012127173-XPAR","https://live.euronext.com/en/product/equities/FR001400IUV6-ALXP","https://live.euronext.com/en/product/equities/FR0013231180-ALXP","https://live.euronext.com/en/product/equities/FR0014005HJ9-XPAR","https://live.euronext.com/en/product/equities/FR0000077992-XMLI","https://live.euronext.com/en/product/equities/FR0010263202-XPAR","https://live.euronext.com/en/product/equities/FR0004038263-XPAR","https://live.euronext.com/en/product/equities/FR0006823092-XMLI","https://live.euronext.com/en/product/equities/NL0012650535-XMLI","https://live.euronext.com/en/product/equities/FR0000038465-XPAR","https://live.euronext.com/en/product/equities/FR0011027135-XPAR","https://live.euronext.com/en/product/equities/FR0013479730-ALXP","https://live.euronext.com/en/product/equities/FR0000120693-XPAR","https://live.euronext.com/en/product/equities/FR0000061459-XPAR","https://live.euronext.com/en/product/equities/ES0105612008-XMLI","https://live.euronext.com/en/product/equities/NL0015001HZ9-XMLI","https://live.euronext.com/en/product/equities/FR0000064784-XPAR","https://live.euronext.com/en/product/equities/FR001400JXB0-ALXP","https://live.euronext.com/en/product/equities/FR001400K4B1-XPAR","https://live.euronext.com/en/product/equities/FR0000185480-XMLI","https://live.euronext.com/en/product/equities/BE0948608451-XMLI","https://live.euronext.com/en/product/equities/FR001400B4H9-XPAR","https://live.euronext.com/en/product/equities/FR001400B4G1-XPAR","https://live.euronext.com/en/product/equities/FR0000073041-XPAR","https://live.euronext.com/en/product/equities/FR0000061608-ALXP","https://live.euronext.com/en/product/equities/FR001400JX97-ALXP","https://live.euronext.com/en/product/equities/FR0000030769-XMLI","https://live.euronext.com/en/product/equities/FR0010785790-ALXP","https://live.euronext.com/en/product/equities/FR0011844067-ALXP","https://live.euronext.com/en/product/equities/FR0013252186-XPAR","https://live.euronext.com/en/product/equities/FR0000124570-XPAR","https://live.euronext.com/en/product/equities/NL0015001W49-XPAR","https://live.euronext.com/en/product/equities/FR0000066441-ALXP","https://live.euronext.com/en/product/equities/FR0013015583-ALXP","https://live.euronext.com/en/product/equities/FR0012432516-XPAR","https://live.euronext.com/en/product/equities/FR0014004EC4-ALXP","https://live.euronext.com/en/product/equities/FR0010169920-ALXP","https://live.euronext.com/en/product/equities/FR0004044600-ALXP","https://live.euronext.com/en/product/equities/FR0004052561-XPAR","https://live.euronext.com/en/product/equities/FR0010313486-ALXP","https://live.euronext.com/en/product/equities/FR0012613610-XPAR","https://live.euronext.com/en/product/equities/FR0010380626-ALXP","https://live.euronext.com/en/product/equities/FR0013398617-ALXP","https://live.euronext.com/en/product/equities/FR0000061376-XMLI","https://live.euronext.com/en/product/equities/FR0000130577-XPAR","https://live.euronext.com/en/product/equities/FR0000120560-XPAR","https://live.euronext.com/en/product/equities/ES0105118006-ALXP","https://live.euronext.com/en/product/equities/FR0011648971-ALXP","https://live.euronext.com/en/product/equities/FR0010889386-ALXP","https://live.euronext.com/en/product/equities/IT0005466963-ALXP","https://live.euronext.com/en/product/equities/FR0000060618-XPAR","https://live.euronext.com/en/product/equities/FR0000044471-XPAR","https://live.euronext.com/en/product/equities/GB00BM9PTW47-ALXP","https://live.euronext.com/en/product/equities/FR0011858190-ALXP","https://live.euronext.com/en/product/equities/FR0000130395-XPAR","https://live.euronext.com/en/product/equities/FR0000131906-XPAR","https://live.euronext.com/en/product/equities/ES0105550000-XMLI","https://live.euronext.com/en/product/equities/FR0010820274-ALXP","https://live.euronext.com/en/product/equities/FR0010451203-XPAR","https://live.euronext.com/en/product/equities/FR0000075954-ALXP","https://live.euronext.com/en/product/equities/FR0000039091-XPAR","https://live.euronext.com/en/product/equities/FR0000045619-XPAR","https://live.euronext.com/en/product/equities/FR0000045601-XPAR","https://live.euronext.com/en/product/equities/FR0013344173-XPAR","https://live.euronext.com/en/product/equities/FR0010523167-ALXP","https://live.euronext.com/en/product/equities/FR0013477593-ALXP","https://live.euronext.com/en/product/equities/FR0000037640-ALXP","https://live.euronext.com/en/product/equities/FR0013269123-XPAR","https://live.euronext.com/en/product/equities/FR0000121709-XPAR","https://live.euronext.com/en/product/equities/FR001400F1V2-ALXP","https://live.euronext.com/en/product/equities/FR0000073272-XPAR","https://live.euronext.com/en/product/equities/ES0105651006-XMLI","https://live.euronext.com/en/product/equities/FR0000125007-XPAR","https://live.euronext.com/en/product/equities/FR001400M7D8-XPAR","https://live.euronext.com/en/product/equities/FR0000060121-XPAR","https://live.euronext.com/en/product/equities/FR0000060071-XPAR","https://live.euronext.com/en/product/equities/FR0000120578-XPAR","https://live.euronext.com/en/product/equities/FR001400M6Z3-XPAR","https://live.euronext.com/en/product/equities/FR0010776617-ALXP","https://live.euronext.com/en/product/equities/FR0013154002-XPAR","https://live.euronext.com/en/product/equities/FR0000120107-XPAR","https://live.euronext.com/en/product/equities/FR0013155975-XMLI","https://live.euronext.com/en/product/equities/FR0006239109-XPAR","https://live.euronext.com/en/product/equities/FR0010972091-XMLI","https://live.euronext.com/en/product/equities/AN8068571086-XPAR","https://live.euronext.com/en/product/equities/FR0000121972-XPAR","https://live.euronext.com/en/product/equities/ES0105592002-XMLI","https://live.euronext.com/en/product/equities/FR0010411983-XPAR","https://live.euronext.com/en/product/equities/FR0000039109-XPAR","https://live.euronext.com/en/product/equities/GB00B5ZN1N88-XPAR","https://live.euronext.com/en/product/equities/IT0005353484-ALXP","https://live.euronext.com/en/product/equities/FR0000065492-XPAR","https://live.euronext.com/en/product/equities/FR0004175842-XPAR","https://live.euronext.com/en/product/equities/IT0005072811-XMLI","https://live.euronext.com/en/product/equities/FR0012596468-ALXP","https://live.euronext.com/en/product/equities/NL0010623518-XMLI","https://live.euronext.com/en/product/equities/FR0011950682-XPAR","https://live.euronext.com/en/product/equities/LU0088087324-XPAR","https://live.euronext.com/en/product/equities/FR0013006558-XPAR","https://live.euronext.com/en/product/equities/FR0010202606-ALXP","https://live.euronext.com/en/product/equities/FR0000060790-ALXP","https://live.euronext.com/en/product/equities/FR0000074122-XPAR","https://live.euronext.com/en/product/equities/FR0010679365-XMLI","https://live.euronext.com/en/product/equities/CI0000000832-XMLI","https://live.euronext.com/en/product/equities/FR0010812230-ALXP","https://live.euronext.com/en/product/equities/FR0014005I80-ALXP","https://live.euronext.com/en/product/equities/FR0011131788-XMLI","https://live.euronext.com/en/product/equities/FR0010649228-XMLI","https://live.euronext.com/en/product/equities/FR001400LBS6-XMLI","https://live.euronext.com/en/product/equities/FR0013214145-XPAR","https://live.euronext.com/en/product/equities/FR0004016699-ALXP","https://live.euronext.com/en/product/equities/FR0010209809-XPAR","https://live.euronext.com/en/product/equities/FR0000130809-XPAR","https://live.euronext.com/en/product/equities/FR0000121220-XPAR","https://live.euronext.com/en/product/equities/FR0000078321-XPAR","https://live.euronext.com/en/product/equities/FR0000065864-ALXP","https://live.euronext.com/en/product/equities/FR0013227113-XPAR","https://live.euronext.com/en/product/equities/FR00140006O9-XPAR","https://live.euronext.com/en/product/equities/FR0013379484-XPAR","https://live.euronext.com/en/product/equities/BE0003470755-XBRU","https://live.euronext.com/en/product/equities/FR0000050809-XPAR","https://live.euronext.com/en/product/equities/FR00140043Y1-ALXP","https://live.euronext.com/en/product/equities/FR0000054371-XMLI","https://live.euronext.com/en/product/equities/FR0012757854-XPAR","https://live.euronext.com/en/product/equities/FR0011464452-ALXP","https://live.euronext.com/en/product/equities/FR001400BVK2-ALXP","https://live.euronext.com/en/product/equities/FR0011289040-XPAR","https://live.euronext.com/en/product/equities/FR0000054199-XPAR","https://live.euronext.com/en/product/equities/FR0000064271-XPAR","https://live.euronext.com/en/product/equities/NL00150001Q9-XPAR","https://live.euronext.com/en/product/equities/FR001400MDW2-ALXP","https://live.euronext.com/en/product/equities/NL0000226223-XPAR","https://live.euronext.com/en/product/equities/FR0000074775-ALXP","https://live.euronext.com/en/product/equities/FR0010528059-ALXP","https://live.euronext.com/en/product/equities/FR001400DG11-ALXP","https://live.euronext.com/en/product/equities/FR001400DGA0-ALXP","https://live.euronext.com/en/product/equities/FR0000063976-XMLI","https://live.euronext.com/en/product/equities/GB00B8GJBS16-XMLI","https://live.euronext.com/en/product/equities/FR0004180578-XPAR","https://live.euronext.com/en/product/equities/BE0974464977-XBRU","https://live.euronext.com/en/product/equities/FR0000032658-XPAR","https://live.euronext.com/en/product/equities/FR0004188670-XPAR","https://live.euronext.com/en/product/equities/IT0005507857-ALXP","https://live.euronext.com/en/product/equities/FR0000063307-XPAR","https://live.euronext.com/en/product/equities/FR001400I939-XPAR","https://live.euronext.com/en/product/equities/NL0014559478-XPAR","https://live.euronext.com/en/product/equities/FR0000051807-XPAR","https://live.euronext.com/en/product/equities/CH0008175645-XPAR","https://live.euronext.com/en/product/equities/FR0011076595-XMLI","https://live.euronext.com/en/product/equities/FR001400BMH7-XPAR","https://live.euronext.com/en/product/equities/FR0014000TB2-XPAR","https://live.euronext.com/en/product/equities/FR0000054900-XPAR","https://live.euronext.com/en/product/equities/FR001400M3E5-XPAR","https://live.euronext.com/en/product/equities/FR0013295789-XPAR","https://live.euronext.com/en/product/equities/FR0000121329-XPAR","https://live.euronext.com/en/product/equities/GRS528003007-XMLI","https://live.euronext.com/en/product/equities/FR0011053636-ALXP","https://live.euronext.com/en/product/equities/FR0010120402-ALXP","https://live.euronext.com/en/product/equities/FR0013286259-ALXP","https://live.euronext.com/en/product/equities/BE0974387194-ALXP","https://live.euronext.com/en/product/equities/FR0013333432-XPAR","https://live.euronext.com/en/product/equities/FR0013230612-XPAR","https://live.euronext.com/en/product/equities/FR0000066482-XPAR","https://live.euronext.com/en/product/equities/BE0974338700-XBRU","https://live.euronext.com/en/product/equities/NL0015000YE1-ALXP","https://live.euronext.com/en/product/equities/NL0015001SS1-ALXP","https://live.euronext.com/en/product/equities/NL0015001SR3-ALXP","https://live.euronext.com/en/product/equities/FR001400H2X4-ALXP","https://live.euronext.com/en/product/equities/LU0394945660-ALXP","https://live.euronext.com/en/product/equities/FR00140062B9-ALXP","https://live.euronext.com/en/product/equities/FR0000120271-XPAR","https://live.euronext.com/en/product/equities/GA0000121459-XPAR","https://live.euronext.com/en/product/equities/FR0000033003-XPAR","https://live.euronext.com/en/product/equities/FR0000036816-XPAR","https://live.euronext.com/en/product/equities/FR0000031866-XMLI","https://live.euronext.com/en/product/equities/FR0005175080-XPAR","https://live.euronext.com/en/product/equities/FR0005691656-XPAR","https://live.euronext.com/en/product/equities/FR0010397901-ALXP","https://live.euronext.com/en/product/equities/FR0000031106-XMLI","https://live.euronext.com/en/product/equities/FR0004175099-ALXP","https://live.euronext.com/en/product/equities/FR0010383877-ALXP","https://live.euronext.com/en/product/equities/FR0010654087-ALXP","https://live.euronext.com/en/product/equities/FR0000079147-ALXP","https://live.euronext.com/en/product/equities/FR0000054470-XPAR","https://live.euronext.com/en/product/equities/GB00BJ9M4V82-XMLI","https://live.euronext.com/en/product/equities/FR0011776889-XMLI","https://live.euronext.com/en/product/equities/FR0013326246-XPAR","https://live.euronext.com/en/product/equities/FR0000054215-XPAR","https://live.euronext.com/en/product/equities/FR0000074197-XPAR","https://live.euronext.com/en/product/equities/FR0012709160-ALXP","https://live.euronext.com/en/product/equities/FR0010337865-ALXP","https://live.euronext.com/en/product/equities/FR0011898584-ALXP","https://live.euronext.com/en/product/equities/FR0013254851-ALXP","https://live.euronext.com/en/product/equities/FR0013176526-XPAR","https://live.euronext.com/en/product/equities/FR0010095596-ALXP","https://live.euronext.com/en/product/equities/FR0013506730-XPAR","https://live.euronext.com/en/product/equities/FR00140030K7-XPAR","https://live.euronext.com/en/product/equities/FR0004056851-XPAR","https://live.euronext.com/en/product/equities/ES0105623005-XMLI","https://live.euronext.com/en/product/equities/FR0013505062-XPAR","https://live.euronext.com/en/product/equities/FR0013526225-XPAR","https://live.euronext.com/en/product/equities/FR0014007T10-XMLI","https://live.euronext.com/en/product/equities/FR0010766667-ALXP","https://live.euronext.com/en/product/equities/FR0000124141-XPAR","https://live.euronext.com/en/product/equities/FR0013530102-ALXP","https://live.euronext.com/en/product/equities/FR0013447729-XPAR","https://live.euronext.com/en/product/equities/FR001400JXA2-ALXP","https://live.euronext.com/en/product/equities/FR0010291245-XPAR","https://live.euronext.com/en/product/equities/FR0006174496-XMLI","https://live.euronext.com/en/product/equities/FR0014003I41-XMLI","https://live.euronext.com/en/product/equities/FR0004186856-XPAR","https://live.euronext.com/en/product/equities/FR0010326090-ALXP","https://live.euronext.com/en/product/equities/FR0000031775-XPAR","https://live.euronext.com/en/product/equities/FR0000050049-XPAR","https://live.euronext.com/en/product/equities/FR0000125486-XPAR","https://live.euronext.com/en/product/equities/FR001400AXT1-ALXP","https://live.euronext.com/en/product/equities/FR0000031577-XPAR","https://live.euronext.com/en/product/equities/ES0105704003-XMLI","https://live.euronext.com/en/product/equities/FR0004029478-ALXP","https://live.euronext.com/en/product/equities/FR0014003O76-ALXP","https://live.euronext.com/en/product/equities/FR0013481835-ALXP","https://live.euronext.com/en/product/equities/FR0010309096-XPAR","https://live.euronext.com/en/product/equities/FR0000127771-XPAR","https://live.euronext.com/en/product/equities/FR0011532225-ALXP","https://live.euronext.com/en/product/equities/FR0011995588-XPAR","https://live.euronext.com/en/product/equities/FR0004045847-ALXP","https://live.euronext.com/en/product/equities/FR0000062796-XPAR","https://live.euronext.com/en/product/equities/ES0105492005-XMLI","https://live.euronext.com/en/product/equities/FR0010282822-XPAR","https://live.euronext.com/en/product/equities/FR0012532810-XPAR","https://live.euronext.com/en/product/equities/FR0010131409-ALXP","https://live.euronext.com/en/product/equities/FR0013357621-XPAR","https://live.euronext.com/en/product/equities/FR0013079092-ALXP","https://live.euronext.com/en/product/equities/FR0010688465-XMLI","https://live.euronext.com/en/product/equities/FR0010688440-ALXP","https://live.euronext.com/en/product/equities/FR0004152700-XMLI","https://live.euronext.com/en/product/equities/FR0000121204-XPAR","https://live.euronext.com/en/product/equities/FR0010768770-XMLI","https://live.euronext.com/en/product/equities/ES0105399002-XMLI","https://live.euronext.com/en/product/equities/FR0014000P11-ALXP","https://live.euronext.com/en/product/equities/FR0013143872-ALXP","https://live.euronext.com/en/product/equities/FR00140047H7-XMLI","https://live.euronext.com/en/product/equities/FR0011981968-XPAR","https://live.euronext.com/en/product/equities/BE0974310428-XPAR","https://live.euronext.com/en/product/equities/FR0004034072-XPAR","https://live.euronext.com/en/product/equities/ZM0000000037-XMLI","https://live.euronext.com/en/product/equities/BMG9887P1068-XPAR"],["FR0010285965-ALXP","FR0013341781-ALXP","FR0000076887-ALXP","FR0010557264-XPAR","FR0004040608-XPAR","FR0013185857-XPAR","FR0012616852-XPAR","FR0012333284-XPAR","FR001400AHX6-XPAR","BE0974278104-XBRU","FR0000064602-XPAR","FR0000120404-XPAR","FR001400JAP8-ALXP","FR0000076861-XPAR","FR0000076655-ALXP","FR0014005OJ5-ALXP","FR0010979377-XMLI","BE0974269012-XPAR","FR0013284627-ALXP","FR0011184241-XPAR","FR001400JAL7-ALXP","FR0010340141-XPAR","FR0012821890-XPAR","FR0013296746-ALXP","FR0000053043-ALXP","FR0014007ZB4-XPAR","US00774B2088-XPAR","FR001400FL38-XPAR","FR0013333077-XPAR","FR0014005AC9-ALXP","FR0011908045-XMLI","FR0014005WE9-XMLI","ES0105478004-XMLI","FR0013452281-ALXP","FR0010641449-ALXP","FR001400J770-XPAR","FR0000120073-XPAR","NL0000235190-XPAR","FR0014003V77-ALXP","FR0000053027-XPAR","FR0000062465-XPAR","FR0014000JX7-ALXP","FR0013258662-XPAR","FR001400IV58-ALXP","FR0000053324-XPAR","FR0013421286-ALXP","FR0010220475-XPAR","FR0000053837-XPAR","FR0000033219-XPAR","FR0000039216-XPAR","FR0000071946-XPAR","FR0000061244-ALXP","FR0010395681-XPAR","FR0013253812-XMLI","GB00BNKGZC51-ALXP","NL0010273694-XMLI","FR0011051598-ALXP","FR0012789667-XPAR","FR0004125920-XPAR","ES0105744009-XMLI","FR0014005AL0-XPAR","LU0569974404-XAMS","ES0105658001-XMLI","FR0010340711-ALXP","FR0014003U94-XPAR","LU1598757687-XAMS","FR001400KO61-ALXP","FR0013398997-ALXP","FR0005057635-XMLI","FR0004070795-XMLI","ES0105661005-XMLI","FR0010481960-XPAR","ES0105601001-XMLI","FR0010313833-XPAR","ES0105486007-XMLI","FR0012185536-XPAR","FR0000074783-XPAR","FR0000076952-XPAR","FR001400JWR8-XPAR","FR0014003AC4-XPAR","FR0012968485-XMLI","FR0000074148-XPAR","ES0105708004-XMLI","FR0010478248-ALXP","FR0011992700-XPAR","FR0013455482-XPAR","FR0000051732-XPAR","FR0000063737-XPAR","FR00140059B5-ALXP","FR0000061780-XPAR","FR0013410370-ALXP","FR0000039232-XPAR","FR0013183589-ALXP","FR001400CFI7-XPAR","FR0000120628-XPAR","FR001400M7B2-XPAR","FR0011040500-XPAR","IT0004812258-XMLI","PTAZR0AM0006-XMLI","FR0013384369-ALXP","MC0000031187-XPAR","FR0013258399-XPAR","FR0000062788-XPAR","ES0105362000-XMLI","FR0004023208-XPAR","FR0000035370-XPAR","FR0010436170-XMLI","FR0000035305-ALXP","CH0451123589-XMLI","CH1148983609-XMLI","FR0014003FE9-XPAR","FR0000035164-XPAR","FR0000066961-ALXP","FR0000120966-XPAR","FR0000074072-XPAR","FR0004174233-ALXP","FR0013345493-ALXP","FR0013280286-XPAR","FR0012816825-ALXP","FR0013507290-ALXP","FR001400LN79-ALXP","BE0974280126-XBRU","FR0011005933-ALXP","FR0000062150-XPAR","FR0013340973-XMLI","FR0011041011-ALXP","FR0000131104-XPAR","FR0011365907-ALXP","FR0010106039-XMLI","FR0000061129-XPAR","FR0000039299-XPAR","FR0000063935-XPAR","BE6333353298-XMLI","FR001400IAM7-ALXP","FR0000054421-ALXP","FR0000074254-XPAR","FR0000120503-XPAR","FR001400M3D7-XPAR","FR001400AJZ7-ALXP","FR0006174348-XPAR","FR0000061137-XPAR","FR0000045544-XPAR","FR001400DIY6-ALXP","FR0010151589-XPAR","FR0000079659-XPAR","FR0012969095-ALXP","FR0000125338-XPAR","FR0011648716-ALXP","FR0010907956-ALXP","FR0010828137-XPAR","FR0000064156-XPAR","FR0000120172-XPAR","FR0000125585-XPAR","FR0010193052-XPAR","FR0000064446-ALXP","US1491231015-XPAR","FR0014007LW0-ALXP","FR001400D0X2-ALXP","FR0010193979-XPAR","FR0000053506-XPAR","FR0010425595-ALXP","BE0974260896-XBRU","FR0013178712-ALXP","FR0000037475-XPAR","MC0010000826-XMLI","FR0013181864-XPAR","FR0000037871-XMLI","FR0000051567-XMLI","FR0000130692-XPAR","FR001400AJ60-ALXP","FR0000060907-XPAR","FR0010447086-XMLI","FR0000130403-XPAR","FR0000054322-ALXP","FR0000060428-XMLI","FR0013426004-XPAR","FR0010386334-XPAR","FR0004152882-ALXP","FR0013406881-XMLI","NL0010949392-XPAR","FR0010667147-XPAR","FR0013257409-ALXP","FR0013335742-ALXP","FR0011071570-ALXP","FR0004031763-XPAR","BE0160342011-ALXP","FR0010959684-XMLI","FR0000062234-XPAR","BE6252013725-XMLI","FR0000077828-XMLI","FR00140007I9-XMLI","ES0105660007-XMLI","FR0010035816-XMLI","FR0013371507-XMLI","US2220702037-XPAR","FR0004998318-XMLI","FR0000065393-XPAR","FR0000064578-XPAR","FR0000060303-XPAR","FR0000044323-XPAR","FR0000185506-XPAR","FR0010483768-XPAR","FR0000045213-XPAR","FR0010461053-XPAR","FR0000045239-XPAR","FR0000045551-XPAR","FR0000185514-XPAR","FR0000044364-XPAR","FR0000045528-XPAR","FR0000045346-XPAR","FR0000045304-XPAR","FR0000045072-XPAR","FR0011716265-ALXP","FR0000050395-XPAR","FR0014004QR6-ALXP","FR0013507977-ALXP","FR0013507985-ALXP","FR0013508009-ALXP","FR0010404368-ALXP","FR0000077885-XMLI","FR0000185423-ALXP","FR0000120644-XPAR","FR0014004L86-XPAR","FR0014003TT8-XPAR","FR001400LO86-ALXP","FR0010417345-XPAR","FR001400AYG6-XPAR","FR0014004JF6-XPAR","FR0000062978-XPAR","FR0000054132-ALXP","FR0013283108-ALXP","FR0000053381-XPAR","FR0000060840-ALXP","FR001400IAQ8-ALXP","FR0012202497-ALXP","BE0974289218-ALXB","FR0010436584-ALXP","FR0000065260-XPAR","FR0014004QZ9-ALXP","FR0013331212-ALXP","FR0013088606-ALXP","FR0014007951-ALXP","FR0000052920-XMLI","LU0881232630-XMLI","FR0014004339-ALXP","HK0000038783-XMLI","FR0007200100-XMLI","FR0010536185-XMLI","DE000A0XYM45-XMLI","FR0013534617-ALXP","FR0011490648-ALXP","FR0010908533-XPAR","IT0005351504-ALXP","FR0000052755-XMLI","FR0010882886-XMLI","FR0010439265-XMLI","FR0000072373-ALXP","FR0000130452-XPAR","FR0011466069-XPAR","FR0000031023-XPAR","FR0000035719-XPAR","FR0011950732-XPAR","FR0012435121-XPAR","ES0105726006-XMLI","ES0105639001-XMLI","FR0013356755-ALXP","FR0004030708-ALXP","FR0013330792-ALXP","FR0013399359-ALXP","FR0011915339-ALXP","FR0010208488-XPAR","FR001400C2Z4-ALXP","FR0014004974-ALXP","FR0014004362-ALXP","FR0010424697-ALXP","FR0000045122-ALXP","FR0010465534-ALXP","FR0012882389-XPAR","FR0000131757-XPAR","FR0010211037-ALXP","FR0000035818-ALXP","FR0000121667-XPAR","FR0000120669-XPAR","FR0000061475-XPAR","FR0010844001-ALXP","FR0000121121-XPAR","FR0000054678-XPAR","FR0014008VX5-XPAR","FR0013240934-ALXP","FR0013256518-ALXP","FR001400M7C0-XPAR","FR0014000MR3-XPAR","FR0010157115-XMLI","ES0105586004-XMLI","NL0006294274-XPAR","FR0010490920-ALXP","FR001400CF13-ALXP","FR0010221234-XPAR","FR0000035784-XPAR","FR0000064164-ALXP","FR0000062671-XPAR","FR0014005DA7-XPAR","FR0004527638-XPAR","FR0014003AQ4-XPAR","ES0105029005-ALXP","ES0105553004-XMLI","FR0004034593-ALXP","FR0000031973-XPAR","FR0012300424-XMLI","FR0013451333-XPAR","FR0000062101-XPAR","FR0011271600-XPAR","FR0000061418-XPAR","FR0000060535-XPAR","FR0011665280-XPAR","FR001400AEM6-ALXP","FR0000062341-XPAR","SN0000033192-XPAR","FR0000060824-XPAR","FR0000035123-XPAR","FR0010487272-XMLI","FR0000038184-XPAR","CH0120879058-XMLI","FR0000074759-ALXP","FR001400GO75-ALXP","FR0011476928-XPAR","FR0013230067-XMLI","FR0012419307-ALXP","FR0000065930-XPAR","FR0000038499-XPAR","FR0010341032-XPAR","FR0000033409-XPAR","FR0011605617-XMLI","FR0000053944-XPAR","CI0000053161-XPAR","FR0014005SB3-XPAR","FR0000121147-XPAR","FR0010485268-ALXP","FR0013030152-XPAR","FR0013222346-XMLI","FR0010823724-XMLI","FR0004187367-ALXP","FR0010588079-XPAR","FR0000053415-XMLI","FR0011100759-XMLI","FR0000030611-XPAR","FR0000124414-ALXP","FR0000034894-XPAR","FR0013495298-ALXP","FR0000053035-XPAR","FR001400M1R1-ALXP","FR0010040865-XPAR","US3696043013-XPAR","CH0308403085-XPAR","FR0004163111-XPAR","FR0004053510-ALXP","FR0013183985-XPAR","PTGVE1AE0009-XMLI","FR0010533075-XPAR","FR0000033888-ALXP","FR0000066672-XPAR","IT0005454167-XMLI","IT0005454175-XMLI","IT0005454134-XMLI","FR0011052257-ALXP","ES0105537007-XMLI","FR0011208693-ALXP","FR0010214064-XPAR","FR0013204070-ALXP","FR0000065971-XPAR","FR0014005ZM5-ALXP","FR00140069V2-ALXP","FR0000076960-XMLI","FR0000036675-XPAR","FR0012819381-ALXP","FR0004010338-XPAR","FR0000075442-ALXP","FR0013439627-ALXP","FR0012612646-XPAR","FR0010529719-XMLI","FR0004155000-XPAR","FR0013429404-ALXP","FR0014000RP6-ALXP","US36254L2097-XPAR","FR0011726835-XPAR","LU1840650458-XMLI","FR0000032526-XPAR","FR0000066722-XPAR","FR0014007ND6-ALXP","GB00BMDXQ672-ALXP","FR0000066755-XPAR","FR0014003VY4-XPAR","ES0105498002-XMLI","FR0000066540-ALXP","FR0000052292-XPAR","FR0004159473-ALXP","FR0000038531-ALXP","FR0000054231-XPAR","FR0012821916-ALXP","FR0010396309-ALXP","DE000A11Q133-XMLI","FR0000051302-XMLI","FR0013451044-ALXP","FR0012336691-XMLI","FR0010312181-XMLI","FR0014000U63-ALXP","FR0000065278-ALXP","FR0006226791-XMLI","ES0105664009-XMLI","FR0000053738-XMLI","FR0004165801-XPAR","FR0006563904-XMLI","FR0014007LQ2-ALXP","FR0004153930-ALXP","FR0000064735-XMLI","FR0005843125-XMLI","FR0014001PM5-ALXP","FR0014005IU4-ALXP","FR0005854700-ALXP","ES0105479002-XMLI","FR0000035081-XPAR","FR001400A3Q3-ALXP","FR0010929125-XPAR","FR0000051393-XPAR","FR0000079691-XMLI","FR0000062184-ALXP","ES0105551008-XMLI","FR00140048X2-ALXP","IT0005380602-ALXP","FR0010086371-XMLI","FR0000120859-XPAR","FR0006859039-XMLI","FR0013060100-ALXP","FR0000033243-XPAR","FR0013470168-ALXP","FR0000065773-XMLI","ES0105590006-XMLI","FR0000066219-XPAR","FR0011158823-XMLI","FR0000071797-XPAR","ES0105511002-XMLI","ES0105473005-XMLI","FR0010331421-XPAR","FR0000064297-ALXP","IT0005391161-XMLI","FR0000060451-ALXP","FR0010908723-ALXP","FR0014003FN0-XMLI","FR0004024222-XPAR","FR0000064958-XPAR","FR0011179886-ALXP","FR0013233012-XPAR","BE0974299316-ALXP","ES0105417002-XMLI","FR0010259150-XPAR","FR0000073298-XPAR","ES0109429037-ALXP","FR0000072597-ALXP","IT0005336521-XMLI","FR0004026151-XPAR","FR0012872141-XPAR","FR0000033904-XPAR","FR0000077919-XPAR","FR0010680033-XMLI","ES0105636007-XMLI","FR0010722819-ALXP","FR0004007813-XPAR","FR0000121485-XPAR","FR0013156007-ALXP","FR0004029411-ALXP","FR0013374667-ALXP","FR0011038348-ALXP","FR0000121964-XPAR","ES0105425005-ALXP","FR0013419876-ALXP","FR0000120321-XPAR","NL0012191662-ALXP","FR0000075343-ALXP","FR0000066607-XPAR","FR0000130213-XPAR","FR0004027068-ALXP","FR0013308582-ALXP","FR001400JY13-XPAR","FR0006864484-XPAR","FR0013204336-XPAR","FR0000121295-ALXP","FR0000065484-XPAR","FR001400MMI2-XPAR","FR0010307819-XPAR","FR001400F2Z1-ALXP","FR0007080254-ALXP","FR0000033599-ALXP","FR0014009YQ1-XPAR","FR0004156297-XPAR","FR0000050353-XPAR","BE0974334667-ALXP","ES0105089009-ALXP","FR0004170017-XPAR","FR0004155208-XMLI","FR0000044943-ALXP","FR0006205019-XMLI","FR0011884378-ALXP","FR0000038242-XPAR","FR0000121014-XPAR","FR00140085W6-XPAR","FR0013270626-ALXP","FR0012634822-XPAR","FR0010328302-XMLI","FR0010827741-XMLI","FR0000061657-XMLI","FR0011092089-XMLI","FR0013153541-XPAR","ES0105463006-ALXP","FR0000030074-XPAR","FR0000038606-XPAR","ES0105447009-XMLI","FR0013400835-ALXP","MA0000011488-XPAR","FR0004155687-ALXP","FR0013472446-ALXP","FR0010609263-ALXP","FR0000051070-XPAR","FR0000060873-XPAR","FR0011742329-XPAR","FR0014006PT9-XMLI","FR0010844464-ALXP","FR0000064404-XPAR","IT0005324105-XMLI","FR0011049824-ALXP","FR0004065605-XPAR","IT0004844848-XMLI","FR0010298620-XPAR","FR0010241638-XPAR","ES0105559001-XMLI","FR0000039620-XPAR","FR0004177046-XPAR","FR0010492181-XMLI","FR00140066X4-ALXP","FR0011217710-ALXP","BE0974328602-XMLI","FR0000053225-XPAR","IT0005450819-ALXP","FR0010204453-ALXP","FR0010353888-ALXP","FR001400AJ45-XPAR","FR0000077570-ALXP","FR0010500363-XMLI","FR0013053535-ALXP","FR0004172450-ALXP","FR00140050Q2-ALXP","FR001400H3A0-ALXP","FR0000076986-XPAR","BE0003853703-XBRU","ES0105549002-XMLI","FR0011033083-ALXP","FR0004034320-ALXP","FR0013462231-ALXP","ES0105697009-XMLI","FR001400IE67-XPAR","FR0013482791-XPAR","FR0014003J32-ALXP","FR0011341205-XPAR","FR0011675362-XPAR","FR0011636083-ALXP","FR001400MV37-ALXP","FR0004154060-ALXP","FR0000072993-ALXP","FR0004050250-XPAR","FR0000044448-XPAR","FR0010112524-XPAR","FR0004171346-ALXP","FR0014003XT0-ALXP","FR0012650166-XPAR","FR0013018124-ALXP","FI0009000681-XPAR","ES0105719001-XMLI","FR0010397232-ALXP","FR0000185464-XMLI","FR0014001PV6-XPAR","FR0000121691-XPAR","FR0000064529-ALXP","FR0004065639-ALXP","FR0014003711-ALXP","FR0013310281-XMLI","FR0000052680-XPAR","ES0105698007-XMLI","FR0010428771-XPAR","FR0014003T71-ALXP","FR001400CM63-ALXP","FR0013266772-ALXP","FR0004174712-XMLI","FR0000133308-XPAR","FR0000075392-XPAR","ES0105490009-XMLI","FR0013318052-ALXP","FR0010609206-XPAR","ES0105534004-XMLI","FR0000184798-XPAR","FR0012127173-XPAR","FR001400IUV6-ALXP","FR0013231180-ALXP","FR0014005HJ9-XPAR","FR0000077992-XMLI","FR0010263202-XPAR","FR0004038263-XPAR","FR0006823092-XMLI","NL0012650535-XMLI","FR0000038465-XPAR","FR0011027135-XPAR","FR0013479730-ALXP","FR0000120693-XPAR","FR0000061459-XPAR","ES0105612008-XMLI","NL0015001HZ9-XMLI","FR0000064784-XPAR","FR001400JXB0-ALXP","FR001400K4B1-XPAR","FR0000185480-XMLI","BE0948608451-XMLI","FR001400B4H9-XPAR","FR001400B4G1-XPAR","FR0000073041-XPAR","FR0000061608-ALXP","FR001400JX97-ALXP","FR0000030769-XMLI","FR0010785790-ALXP","FR0011844067-ALXP","FR0013252186-XPAR","FR0000124570-XPAR","NL0015001W49-XPAR","FR0000066441-ALXP","FR0013015583-ALXP","FR0012432516-XPAR","FR0014004EC4-ALXP","FR0010169920-ALXP","FR0004044600-ALXP","FR0004052561-XPAR","FR0010313486-ALXP","FR0012613610-XPAR","FR0010380626-ALXP","FR0013398617-ALXP","FR0000061376-XMLI","FR0000130577-XPAR","FR0000120560-XPAR","ES0105118006-ALXP","FR0011648971-ALXP","FR0010889386-ALXP","IT0005466963-ALXP","FR0000060618-XPAR","FR0000044471-XPAR","GB00BM9PTW47-ALXP","FR0011858190-ALXP","FR0000130395-XPAR","FR0000131906-XPAR","ES0105550000-XMLI","FR0010820274-ALXP","FR0010451203-XPAR","FR0000075954-ALXP","FR0000039091-XPAR","FR0000045619-XPAR","FR0000045601-XPAR","FR0013344173-XPAR","FR0010523167-ALXP","FR0013477593-ALXP","FR0000037640-ALXP","FR0013269123-XPAR","FR0000121709-XPAR","FR001400F1V2-ALXP","FR0000073272-XPAR","ES0105651006-XMLI","FR0000125007-XPAR","FR001400M7D8-XPAR","FR0000060121-XPAR","FR0000060071-XPAR","FR0000120578-XPAR","FR001400M6Z3-XPAR","FR0010776617-ALXP","FR0013154002-XPAR","FR0000120107-XPAR","FR0013155975-XMLI","FR0006239109-XPAR","FR0010972091-XMLI","AN8068571086-XPAR","FR0000121972-XPAR","ES0105592002-XMLI","FR0010411983-XPAR","FR0000039109-XPAR","GB00B5ZN1N88-XPAR","IT0005353484-ALXP","FR0000065492-XPAR","FR0004175842-XPAR","IT0005072811-XMLI","FR0012596468-ALXP","NL0010623518-XMLI","FR0011950682-XPAR","LU0088087324-XPAR","FR0013006558-XPAR","FR0010202606-ALXP","FR0000060790-ALXP","FR0000074122-XPAR","FR0010679365-XMLI","CI0000000832-XMLI","FR0010812230-ALXP","FR0014005I80-ALXP","FR0011131788-XMLI","FR0010649228-XMLI","FR001400LBS6-XMLI","FR0013214145-XPAR","FR0004016699-ALXP","FR0010209809-XPAR","FR0000130809-XPAR","FR0000121220-XPAR","FR0000078321-XPAR","FR0000065864-ALXP","FR0013227113-XPAR","FR00140006O9-XPAR","FR0013379484-XPAR","BE0003470755-XBRU","FR0000050809-XPAR","FR00140043Y1-ALXP","FR0000054371-XMLI","FR0012757854-XPAR","FR0011464452-ALXP","FR001400BVK2-ALXP","FR0011289040-XPAR","FR0000054199-XPAR","FR0000064271-XPAR","NL00150001Q9-XPAR","FR001400MDW2-ALXP","NL0000226223-XPAR","FR0000074775-ALXP","FR0010528059-ALXP","FR001400DG11-ALXP","FR001400DGA0-ALXP","FR0000063976-XMLI","GB00B8GJBS16-XMLI","FR0004180578-XPAR","BE0974464977-XBRU","FR0000032658-XPAR","FR0004188670-XPAR","IT0005507857-ALXP","FR0000063307-XPAR","FR001400I939-XPAR","NL0014559478-XPAR","FR0000051807-XPAR","CH0008175645-XPAR","FR0011076595-XMLI","FR001400BMH7-XPAR","FR0014000TB2-XPAR","FR0000054900-XPAR","FR001400M3E5-XPAR","FR0013295789-XPAR","FR0000121329-XPAR","GRS528003007-XMLI","FR0011053636-ALXP","FR0010120402-ALXP","FR0013286259-ALXP","BE0974387194-ALXP","FR0013333432-XPAR","FR0013230612-XPAR","FR0000066482-XPAR","BE0974338700-XBRU","NL0015000YE1-ALXP","NL0015001SS1-ALXP","NL0015001SR3-ALXP","FR001400H2X4-ALXP","LU0394945660-ALXP","FR00140062B9-ALXP","FR0000120271-XPAR","GA0000121459-XPAR","FR0000033003-XPAR","FR0000036816-XPAR","FR0000031866-XMLI","FR0005175080-XPAR","FR0005691656-XPAR","FR0010397901-ALXP","FR0000031106-XMLI","FR0004175099-ALXP","FR0010383877-ALXP","FR0010654087-ALXP","FR0000079147-ALXP","FR0000054470-XPAR","GB00BJ9M4V82-XMLI","FR0011776889-XMLI","FR0013326246-XPAR","FR0000054215-XPAR","FR0000074197-XPAR","FR0012709160-ALXP","FR0010337865-ALXP","FR0011898584-ALXP","FR0013254851-ALXP","FR0013176526-XPAR","FR0010095596-ALXP","FR0013506730-XPAR","FR00140030K7-XPAR","FR0004056851-XPAR","ES0105623005-XMLI","FR0013505062-XPAR","FR0013526225-XPAR","FR0014007T10-XMLI","FR0010766667-ALXP","FR0000124141-XPAR","FR0013530102-ALXP","FR0013447729-XPAR","FR001400JXA2-ALXP","FR0010291245-XPAR","FR0006174496-XMLI","FR0014003I41-XMLI","FR0004186856-XPAR","FR0010326090-ALXP","FR0000031775-XPAR","FR0000050049-XPAR","FR0000125486-XPAR","FR001400AXT1-ALXP","FR0000031577-XPAR","ES0105704003-XMLI","FR0004029478-ALXP","FR0014003O76-ALXP","FR0013481835-ALXP","FR0010309096-XPAR","FR0000127771-XPAR","FR0011532225-ALXP","FR0011995588-XPAR","FR0004045847-ALXP","FR0000062796-XPAR","ES0105492005-XMLI","FR0010282822-XPAR","FR0012532810-XPAR","FR0010131409-ALXP","FR0013357621-XPAR","FR0013079092-ALXP","FR0010688465-XMLI","FR0010688440-ALXP","FR0004152700-XMLI","FR0000121204-XPAR","FR0010768770-XMLI","ES0105399002-XMLI","FR0014000P11-ALXP","FR0013143872-ALXP","FR00140047H7-XMLI","FR0011981968-XPAR","BE0974310428-XPAR","FR0004034072-XPAR","ZM0000000037-XMLI","BMG9887P1068-XPAR"],["09 Feb 2024 14:25 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:37 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:01 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","13 Oct 2023 11:30 CEST","09 Feb 2024 16:18 CET","09 Feb 2024 16:26 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:25 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:30 CET","09 Feb 2024 11:52 CET","09 Feb 2024 15:13 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:37 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 10:28 CET","09 Feb 2024 09:00 CET","02 Feb 2024 12:14 CET","09 Feb 2024 17:18 CET","09 Feb 2024 16:35 CET","09 Feb 2024 17:35 CET","16 Jun 2023 16:30 CEST","05 Feb 2024 16:42 CET","21 Nov 2023 11:30 CET","09 Feb 2024 17:37 CET","09 Feb 2024 17:09 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:38 CET","09 Feb 2024 17:21 CET","09 Feb 2024 17:35 CET","09 Feb 2024 09:00 CET","09 Feb 2024 16:17 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:36 CET","09 Feb 2024 17:35 CET","08 Feb 2024 15:10 CET","09 Feb 2024 17:35 CET","09 Feb 2024 09:43 CET","09 Feb 2024 17:35 CET","09 Feb 2024 09:38 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","08 Feb 2024 16:06 CET","20 Nov 2023 11:30 CET","09 Feb 2024 15:59 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:29 CET","09 Feb 2024 15:03 CET","09 Feb 2024 17:35 CET"," ","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","07 Nov 2022 01:00 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:38 CET","09 Feb 2024 17:29 CET","09 Feb 2024 17:28 CET","22 Jan 2024 16:39 CET","03 Aug 2020 16:30 CEST","17 Nov 2022 01:00 CET","09 Feb 2024 17:35 CET","17 Sep 2021 02:00 CEST","09 Feb 2024 17:35 CET","16 Aug 2020 02:00 CEST","09 Feb 2024 09:12 CET","09 Feb 2024 17:01 CET","09 Feb 2024 12:30 CET","09 Feb 2024 09:00 CET","17 Jan 2024 10:38 CET","29 Nov 2023 11:30 CET","09 Feb 2024 17:35 CET","20 Jul 2023 02:00 CEST","09 Feb 2024 17:29 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:01 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:08 CET","08 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:36 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","13 Oct 2023 16:30 CEST","05 Feb 2024 11:30 CET","09 Feb 2024 13:39 CET","09 Feb 2024 17:25 CET","09 Feb 2024 17:11 CET","08 Feb 2024 16:30 CET","18 Sep 2018 02:00 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","04 Oct 2023 11:30 CEST","09 Feb 2024 17:35 CET","29 Jun 2023 16:30 CEST","29 Dec 2023 11:30 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:35 CET","07 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:29 CET","09 Feb 2024 17:00 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:19 CET","09 Feb 2024 14:22 CET","09 Feb 2024 17:27 CET","09 Feb 2024 17:23 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:30 CET","09 Feb 2024 16:30 CET","09 Feb 2024 09:00 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:35 CET","07 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","08 Apr 2022 16:30 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","12 Jan 2024 01:00 CET","09 Feb 2024 16:27 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:53 CET","09 Feb 2024 17:13 CET","09 Feb 2024 17:20 CET","09 Feb 2024 17:35 CET","07 Feb 2024 16:30 CET","09 Feb 2024 16:07 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","21 Aug 2023 11:30 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:43 CET","09 Feb 2024 16:11 CET","09 Feb 2024 17:18 CET","09 Feb 2024 09:31 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:27 CET","07 Feb 2024 11:30 CET","09 Feb 2024 11:42 CET","09 Feb 2024 17:39 CET","30 Jan 2024 11:30 CET","30 Nov 2023 11:30 CET","09 Feb 2024 17:37 CET","09 Feb 2024 15:33 CET","08 Jan 2024 11:30 CET","05 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:26 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","06 Dec 2023 11:30 CET","09 Feb 2024 17:15 CET","09 Feb 2024 17:35 CET","07 Feb 2024 17:04 CET","09 Feb 2024 14:59 CET","09 Feb 2024 16:33 CET","09 Feb 2024 16:21 CET","09 Feb 2024 17:25 CET","08 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","05 Feb 2024 16:30 CET","27 Feb 2023 16:30 CET","08 Feb 2024 16:30 CET","17 Nov 2022 01:00 CET","25 Sep 2023 11:30 CEST","09 Feb 2024 11:30 CET","09 Feb 2024 17:29 CET","09 Feb 2024 11:30 CET","07 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:29 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:28 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:16 CET","09 Feb 2024 17:29 CET","09 Feb 2024 16:35 CET","09 Feb 2024 14:39 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","15 Sep 2023 09:00 CEST","07 Feb 2024 10:43 CET","09 Nov 2023 09:00 CET","09 Feb 2024 15:10 CET","05 Feb 2024 11:30 CET","09 Feb 2024 17:10 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:58 CET","12 Dec 2023 10:23 CET","09 Feb 2024 16:37 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:22 CET","09 Feb 2024 17:35 CET","30 Jan 2024 11:30 CET","09 Feb 2024 15:13 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:28 CET","09 Feb 2024 17:24 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","29 Jan 2024 13:32 CET","30 Aug 2023 16:30 CEST","16 Sep 2022 16:30 CEST","09 Feb 2024 14:03 CET","21 Dec 2023 11:30 CET","09 Feb 2024 16:30 CET","28 Sep 2022 11:30 CEST","21 Dec 2016 15:00 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:03 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:24 CET","07 Feb 2024 11:30 CET","08 Feb 2024 16:30 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:25 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:13 CET","09 Feb 2024 16:32 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET"," ","13 Sep 2023 16:30 CEST","09 Feb 2024 09:00 CET","09 Feb 2024 16:27 CET","09 Feb 2024 14:27 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:39 CET","19 Jan 2024 09:00 CET","09 Feb 2024 17:06 CET","09 Feb 2024 17:08 CET","09 Feb 2024 17:14 CET","30 Jan 2024 11:30 CET","09 Feb 2024 09:00 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","28 Sep 2023 17:07 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:38 CET","02 Feb 2024 11:30 CET","14 Dec 2022 09:00 CET","09 Feb 2024 17:35 CET","07 Feb 2024 16:20 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","02 Nov 2023 16:30 CET"," ","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","11 Aug 2021 02:00 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:01 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:00 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:55 CET","09 Feb 2024 17:23 CET","29 Jul 2021 02:00 CEST","08 Feb 2024 17:00 CET","17 Jan 2024 16:35 CET","29 Jan 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:10 CET","18 Sep 2023 16:30 CEST","08 Mar 2023 11:49 CET","07 Feb 2024 11:30 CET","01 Aug 2023 13:59 CEST","16 Jan 2024 16:30 CET","07 Feb 2024 09:45 CET","28 Jun 2023 16:41 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 16:46 CET","09 Feb 2024 17:35 CET","26 Jan 2024 11:30 CET","09 Feb 2024 17:29 CET","17 Oct 2023 11:30 CEST","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 09:03 CET","12 Dec 2023 16:30 CET","09 Feb 2024 11:30 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:37 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","24 May 2022 11:30 CEST","09 Feb 2024 16:30 CET","09 Feb 2024 17:12 CET","09 Feb 2024 16:30 CET","16 Jan 2024 11:30 CET","31 Jan 2024 16:30 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:36 CET","09 Feb 2024 12:10 CET","09 Feb 2024 17:14 CET","09 Feb 2024 09:00 CET","09 Feb 2024 17:28 CET","09 Feb 2024 17:36 CET","09 Feb 2024 16:17 CET","09 Feb 2024 13:10 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:25 CET","09 Feb 2024 17:35 CET","06 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 14:38 CET","09 Feb 2024 17:35 CET"," ","11 Sep 2023 16:30 CEST"," ","09 Feb 2024 17:35 CET","16 Apr 2021 02:00 CEST","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:37 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:25 CET","09 Feb 2024 17:35 CET","17 Jan 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:14 CET","07 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:43 CET","18 Mar 2013 15:00 CET","09 Feb 2024 17:35 CET","09 Feb 2024 12:04 CET","01 Feb 2024 11:30 CET","24 Dec 2020 11:30 CET","09 Feb 2024 17:35 CET","23 May 2022 11:30 CEST","09 Feb 2024 17:36 CET","09 Feb 2024 17:24 CET","09 Feb 2024 17:35 CET","09 Feb 2024 15:00 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","30 Sep 2020 02:00 CEST","09 Feb 2024 17:37 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:29 CET","09 Feb 2024 14:54 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:03 CET","09 Feb 2024 11:30 CET","09 Feb 2024 11:30 CET","25 Jan 2024 16:30 CET","09 Feb 2024 17:25 CET","02 Feb 2024 11:30 CET","23 Jan 2024 16:30 CET","09 Feb 2024 17:27 CET","09 Feb 2024 15:37 CET","17 Oct 2023 16:30 CEST","31 Jan 2024 11:30 CET","13 Dec 2023 16:30 CET","08 Feb 2024 12:27 CET","24 Jan 2024 11:30 CET","09 Feb 2024 16:09 CET","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","08 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:29 CET","06 Feb 2024 16:30 CET","20 May 2022 16:30 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","31 Aug 2021 02:00 CEST","09 Feb 2024 15:38 CET","06 Oct 2023 09:00 CEST","01 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","08 Jun 2021 11:30 CEST","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:25 CET","09 Feb 2024 11:30 CET","04 Jan 2024 11:30 CET","08 Feb 2024 11:44 CET","05 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","08 Apr 2021 02:00 CEST","06 Apr 2020 02:00 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","08 Nov 2023 11:30 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","14 Aug 2023 11:30 CEST","09 Feb 2024 17:35 CET","07 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:29 CET","09 Feb 2024 17:25 CET","05 Aug 2019 02:00 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","25 Oct 2023 16:30 CEST","09 Feb 2024 17:25 CET","09 Feb 2024 17:28 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","23 Jan 2024 11:48 CET","28 Dec 2023 13:14 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:38 CET","09 Feb 2024 17:35 CET","09 Feb 2024 09:00 CET","09 Feb 2024 15:54 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 09:00 CET","09 Feb 2024 16:46 CET","09 Feb 2024 17:36 CET","03 Jul 2023 09:00 CEST","09 Feb 2024 17:16 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:37 CET","09 Feb 2024 16:51 CET","09 Feb 2024 17:26 CET","09 Feb 2024 17:35 CET","09 Feb 2024 14:43 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET"," ","09 Feb 2024 17:35 CET","09 Feb 2024 13:36 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:15 CET","09 Feb 2024 17:25 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","08 Feb 2024 16:30 CET","09 Feb 2024 17:22 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:36 CET","09 Feb 2024 16:30 CET","09 Feb 2024 09:00 CET","09 Feb 2024 17:01 CET","09 Feb 2024 16:30 CET","08 Feb 2024 16:30 CET","08 Feb 2024 11:30 CET","08 Dec 2023 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","27 Jan 2020 11:30 CET","09 Feb 2024 17:16 CET","09 Feb 2024 09:00 CET","09 Feb 2024 16:12 CET"," ","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","31 Jul 2023 11:30 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 16:44 CET","18 Jan 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","28 Nov 2012 10:24 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","02 Jul 2021 02:00 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","15 Jan 2024 11:38 CET","09 Feb 2024 17:29 CET","09 Feb 2024 16:13 CET","30 Jan 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 10:34 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:37 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:19 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:16 CET","09 Feb 2024 16:53 CET","09 Feb 2024 14:48 CET","09 Feb 2024 17:35 CET","15 Jan 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:29 CET","09 Feb 2024 17:35 CET","02 Jan 2024 13:59 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:17 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:19 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 12:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:25 CET","09 Feb 2024 17:26 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","27 Sep 2023 16:30 CEST","09 Feb 2024 17:26 CET","29 Jan 2024 11:30 CET","01 Feb 2024 11:48 CET","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","09 Feb 2024 09:11 CET","09 Feb 2024 17:26 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","29 Mar 2023 02:00 CEST","09 Feb 2024 16:28 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","08 Feb 2024 10:39 CET","08 Feb 2024 11:30 CET","09 Feb 2024 17:39 CET","09 Feb 2024 17:35 CET","30 Jul 2020 02:00 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:17 CET","03 Nov 2023 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 09:00 CET","09 Feb 2024 17:35 CET","04 Dec 2023 11:30 CET","09 Feb 2024 11:58 CET","09 Feb 2024 17:05 CET","22 Jan 2024 11:40 CET","18 Jan 2024 16:30 CET","09 Feb 2024 17:17 CET","09 Feb 2024 11:46 CET","09 Feb 2024 16:59 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Jun 2022 16:30 CEST","07 Feb 2024 16:30 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","17 Jan 2024 16:30 CET","07 Feb 2024 16:30 CET","09 Feb 2024 17:24 CET","08 Feb 2024 10:01 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","30 Jan 2024 17:35 CET","08 Feb 2024 14:55 CET","09 Feb 2024 15:24 CET","14 Nov 2023 15:29 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:38 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:24 CET","09 Feb 2024 16:36 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:20 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","07 Feb 2024 16:48 CET","07 Feb 2024 10:40 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:27 CET","09 Feb 2024 16:33 CET","07 Nov 2023 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 09:00 CET","09 Feb 2024 17:13 CET","09 Feb 2024 17:18 CET","09 Feb 2024 12:00 CET","09 Feb 2024 17:35 CET","09 Feb 2024 15:26 CET","09 Feb 2024 15:26 CET","09 Feb 2024 17:10 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","29 Jun 2021 02:00 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:29 CET","09 Feb 2024 17:36 CET","02 Nov 2022 11:30 CET","09 Feb 2024 16:30 CET","09 Feb 2024 16:56 CET","09 Feb 2024 16:40 CET","18 Apr 2023 16:45 CEST","09 Feb 2024 16:29 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:28 CET","09 Feb 2024 17:35 CET","14 Jun 2022 02:00 CEST","09 Feb 2024 17:35 CET"," ","08 Feb 2024 16:30 CET","09 Feb 2024 16:04 CET","09 Feb 2024 17:37 CET","07 Feb 2024 16:30 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","31 Jan 2024 11:30 CET","08 Feb 2024 14:36 CET","29 Jan 2024 11:30 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:35 CET","24 Mar 2023 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","07 Apr 2021 13:45 CEST","21 Dec 2023 09:29 CET","25 Mar 2009 01:00 CET","09 Feb 2024 16:30 CET","05 Aug 2016 15:00 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:20 CET","09 Feb 2024 17:25 CET","09 Feb 2024 17:36 CET","22 Mar 2021 16:30 CET","13 Nov 2019 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:38 CET","09 Feb 2024 16:30 CET","27 Dec 2016 15:30 CET","02 Jan 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:29 CET","02 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","08 Feb 2024 14:17 CET","09 Feb 2024 15:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:37 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:38 CET","07 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:28 CET","09 Feb 2024 16:03 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:23 CET","09 Feb 2024 17:39 CET","07 Feb 2024 16:30 CET","09 Feb 2024 15:21 CET"," "," ","02 Jan 2024 16:30 CET","06 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:36 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 09:00 CET","05 Jan 2024 12:47 CET","29 Dec 2023 17:29 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:30 CET","29 Dec 2023 13:45 CET","09 Feb 2024 17:35 CET","14 Dec 2023 13:15 CET","09 Feb 2024 17:35 CET"," ","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:37 CET","16 Nov 2023 17:35 CET","09 Feb 2024 17:16 CET","09 Feb 2024 17:20 CET","09 Feb 2024 14:39 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:24 CET","09 Feb 2024 16:56 CET","09 Feb 2024 17:35 CET","29 Aug 2022 16:30 CEST","09 Feb 2024 17:00 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","07 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:30 CET","23 Jan 2024 11:30 CET","07 Feb 2024 16:30 CET","06 Feb 2024 16:30 CET","09 Feb 2024 17:24 CET","09 Feb 2024 15:02 CET","09 Feb 2024 17:35 CET","07 Feb 2024 11:30 CET","02 Feb 2024 16:30 CET","09 Feb 2024 17:35 CET","08 Feb 2024 16:30 CET","09 Feb 2024 16:57 CET","09 Feb 2024 09:00 CET","08 Feb 2024 10:19 CET","09 Feb 2024 14:37 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:28 CET","09 Feb 2024 17:35 CET"," ","09 Feb 2024 17:35 CET","16 Dec 2021 01:00 CET","09 Feb 2024 17:35 CET","09 Feb 2024 14:47 CET","09 Feb 2024 11:30 CET","09 Feb 2024 16:34 CET","09 Feb 2024 17:35 CET","09 Feb 2024 13:51 CET","09 Feb 2024 17:38 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 11:30 CET","12 Sep 2023 16:30 CEST","09 Feb 2024 17:35 CET","31 Jan 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 15:01 CET","09 Feb 2024 17:35 CET","29 Jan 2024 11:30 CET","08 Feb 2024 12:12 CET","28 Jul 2023 12:20 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 16:57 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:56 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","30 Jul 2020 02:00 CEST","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:35 CET","09 Feb 2024 16:19 CET","11 Dec 2023 11:30 CET","09 Feb 2024 17:23 CET","09 Feb 2024 11:30 CET","09 Feb 2024 17:35 CET","30 Jan 2024 16:30 CET","25 Oct 2019 11:30 CEST","09 Feb 2024 17:29 CET","09 Feb 2024 17:24 CET","26 Jan 2024 16:30 CET","09 Feb 2024 17:35 CET","09 Feb 2024 17:39 CET","09 Feb 2024 17:22 CET","09 Feb 2024 16:30 CET","04 Aug 2015 16:20 CEST"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>Name<\/th>\n      <th>Ticker<\/th>\n      <th>Code_ISIN<\/th>\n      <th>Market<\/th>\n      <th>Last_price<\/th>\n      <th>Percentage change (in %)<\/th>\n      <th>URL<\/th>\n      <th>Ticker_adn<\/th>\n      <th>Date<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"BRrltpi","scrollX":true,"scrollY":"350px","lengthMenu":[[10,50,100,-1],["10","50","100","All"]],"ColReorder":true,"rowReorder":false,"buttons":["copy","print",{"extend":"collection","buttons":["csv","excel","pdf"],"columnDefs":[{"targets":[0,2,3,4,5,6,7,8],"className":"dt-center"}],"text":"Download"},["colvis"]],"columnDefs":[{"className":"dt-right","targets":5}],"order":[],"autoWidth":false,"orderClasses":false,"responsive":true},"selection":{"mode":"multiple","selected":null,"target":"row","selectable":null}},"evals":[],"jsHooks":[]}</script>
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
