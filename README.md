
---
title: "Library Euronext"
date: "03 février,2024"
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




<img src="man/figures/EN_good_Logo.png" width="147" height="170" align="right"/>


## Overview {.tabset}
### Description {.tabset}
#### English
The Euronext R Package is a powerful tool for accessing and retrieving financial information from the Euronext stock exchange. Whether you are interested in stocks, indexes, funds, ETFs, or bonds, this package provides a convenient interface to gather essential data for analysis and decision-making in the financial domain. With user-friendly functionalities, it simplifies the process of collecting historical data on share prices, trading volumes, and other financial indicators. Researchers, investors, and other users can extract valuable insights and make informed decisions based on the comprehensive information available. In essence, the 'Euronext' library is a valuable asset for those seeking a deeper understanding of Euronext and the financial markets in Europe.

#### Français
Le package R Euronext est un outil puissant pour accéder et récupérer des informations financières de la bourse Euronext. Que vous soyez intéressé par les actions, les indices, les fonds, les ETF ou les obligations, ce package offre une interface pratique pour collecter des données essentielles pour l'analyse et la prise de décision dans le domaine financier. Avec des fonctionnalités conviviales, il simplifie le processus de collecte de données historiques sur les prix des actions, les volumes de transactions et d'autres indicateurs financiers. Les chercheurs, les investisseurs et d'autres utilisateurs peuvent extraire des informations précieuses et prendre des décisions éclairées en se basant sur les informations complètes disponibles. En somme, la bibliothèque 'Euronext' est un atout précieux pour ceux qui cherchent à approfondir leur compréhension d'Euronext et des marchés financiers en Europe.

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

## Example 1: Get ISIN of a company listed on Euronext


```r
library(Euronext)
library(httr)

# Get ISIN for the ticker "4DDD"
EN_GetISIN("4DDD")
#> [1] "US88554D2053-ETLX"

# Get ISIN for the ticker "ADS MARITIME HOLD"
EN_GetISIN("ADS MARITIME HOLD")
#> [1] "CY0108052115-MERK"

# Get ISIN for ATENOR company
EN_GetISIN("BE0003837540")
#> [1] "BE0003837540-XBRU"
```

## Example 2: Euronext Paris ticker ISIN

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


## Example 3: Euronext Stocks List

```r
library(Euronext)
library(httr)
library(httr2)
library(rvest)
library(jsonlite)
library(stringr)
# Example usage:
a_result_df <- EN_Stocks_List("A")  # For Amsterdam Stock
head(a_result_df)
#>                    Date               Name Ticker    Code_ISIN     Market
#> 1 02 Feb 2024 17:35 CET        AALBERTS NV   AALB NL0000852564       XAMS
#> 2 02 Feb 2024 17:37 CET ABN AMRO BANK N.V.    ABN NL0011540547       XAMS
#> 3 02 Feb 2024 17:35 CET             ACCSYS    AXS GB00BQQFX454       XAMS
#> 4 02 Feb 2024 17:35 CET              ACOMO  ACOMO NL0000313286       XAMS
#> 5 02 Feb 2024 17:23 CET               ADUX   ADUX FR0012821890 XPAR, XAMS
#> 6 02 Feb 2024 17:35 CET              ADYEN  ADYEN NL0012969182       XAMS
#>   Last_price Percentage change (in %)
#> 1     €36.40                    -0.90
#> 2    €13.315                     1.22
#> 3     €0.695                    -1.42
#> 4     €17.42                     1.40
#> 5      €1.20                       NA
#> 6         €1                     0.48
#>                                                               URL
#> 1 https://live.euronext.com/en/product/equities/NL0000852564-XAMS
#> 2 https://live.euronext.com/en/product/equities/NL0011540547-XAMS
#> 3 https://live.euronext.com/en/product/equities/GB00BQQFX454-XAMS
#> 4 https://live.euronext.com/en/product/equities/NL0000313286-XAMS
#> 5 https://live.euronext.com/en/product/equities/FR0012821890-XPAR
#> 6 https://live.euronext.com/en/product/equities/NL0012969182-XAMS
#>          Ticker_adn
#> 1 NL0000852564-XAMS
#> 2 NL0011540547-XAMS
#> 3 GB00BQQFX454-XAMS
#> 4 NL0000313286-XAMS
#> 5 FR0012821890-XPAR
#> 6 NL0012969182-XAMS

b_result_df <- EN_Stocks_List("B")  # For Brussels Stock
tail(b_result_df)
#>                      Date               Name Ticker    Code_ISIN     Market
#> 138 02 Feb 2024 17:35 CET                WDP    WDP BE0974349814 XBRU, XAMS
#> 139 02 Feb 2024 17:35 CET WERELDHAVE BELGIUM   WEHB BE0003724383       XBRU
#> 140 02 Feb 2024 16:56 CET               WHAT  WHATS BE0003573814       XBRU
#> 141 31 Jan 2024 11:30 CET   WHITESTONE GROUP   ROCK BE0974401334       ALXB
#> 142 02 Feb 2024 17:35 CET               XIOR   XIOR BE0974288202       XBRU
#> 143 30 Jan 2024 11:30 CET ZENOBE GRAMME CERT    ZEN BE0003809267       XBRU
#>     Last_price Percentage change (in %)
#> 138     €26.24                    -0.53
#> 139     €47.60                     0.21
#> 140     €60.60                    -0.33
#> 141     €10.40                     2.97
#> 142     €26.85                    -1.10
#> 143    €180.00                    -2.70
#>                                                                 URL
#> 138 https://live.euronext.com/en/product/equities/BE0974349814-XBRU
#> 139 https://live.euronext.com/en/product/equities/BE0003724383-XBRU
#> 140 https://live.euronext.com/en/product/equities/BE0003573814-XBRU
#> 141 https://live.euronext.com/en/product/equities/BE0974401334-ALXB
#> 142 https://live.euronext.com/en/product/equities/BE0974288202-XBRU
#> 143 https://live.euronext.com/en/product/equities/BE0003809267-XBRU
#>            Ticker_adn
#> 138 BE0974349814-XBRU
#> 139 BE0003724383-XBRU
#> 140 BE0003573814-XBRU
#> 141 BE0974401334-ALXB
#> 142 BE0974288202-XBRU
#> 143 BE0003809267-XBRU

p_result_df <- EN_Stocks_List("P")  # For Paris Stock
head(p_result_df)
#>                    Date          Name Ticker    Code_ISIN Market Last_price
#> 1 02 Feb 2024 16:04 CET    1000MERCIS  ALMIL FR0010285965   ALXP     €26.40
#> 2 02 Feb 2024 17:35 CET         2CRSI  AL2SI FR0013341781   ALXP      €3.94
#> 3 02 Feb 2024 16:00 CET A.S.T. GROUPE  ALAST FR0000076887   ALXP      €1.20
#> 4 02 Feb 2024 17:35 CET    AB SCIENCE     AB FR0010557264   XPAR     €3.125
#> 5 02 Feb 2024 17:35 CET ABC ARBITRAGE   ABCA FR0004040608   XPAR      €4.22
#> 6 02 Feb 2024 16:10 CET          ABEO   ABEO FR0013185857   XPAR     €14.60
#>   Percentage change (in %)
#> 1                       NA
#> 2                     3.68
#> 3                     0.84
#> 4                    -3.25
#> 5                    -2.09
#> 6                    -0.68
#>                                                               URL
#> 1 https://live.euronext.com/en/product/equities/FR0010285965-ALXP
#> 2 https://live.euronext.com/en/product/equities/FR0013341781-ALXP
#> 3 https://live.euronext.com/en/product/equities/FR0000076887-ALXP
#> 4 https://live.euronext.com/en/product/equities/FR0010557264-XPAR
#> 5 https://live.euronext.com/en/product/equities/FR0004040608-XPAR
#> 6 https://live.euronext.com/en/product/equities/FR0013185857-XPAR
#>          Ticker_adn
#> 1 FR0010285965-ALXP
#> 2 FR0013341781-ALXP
#> 3 FR0000076887-ALXP
#> 4 FR0010557264-XPAR
#> 5 FR0004040608-XPAR
#> 6 FR0013185857-XPAR

l_result_df <- EN_Stocks_List("L")  # For Lisbon Stock
head(l_result_df)
#>                     Date             Name Ticker    Code_ISIN Market Last_price
#> 1 06 Sep 2017 16:30 CEST   AGUAS DA CURIA    CUR PTCUR0AP0000   ENXL      €1.17
#> 2  02 Feb 2024 16:35 WET       ALTRI SGPS   ALTR PTALT0AE0002   XLIS      €4.46
#> 3                        ATRIUM BIRE SIGI  MLATR PTTBI0AM0006   ENXL       NANA
#> 4  02 Feb 2024 16:35 WET  B.COM.PORTUGUES    BCP PTBCP0AM0015   XLIS    €0.2651
#> 5  02 Feb 2024 16:14 WET          BENFICA  SLBEN PTSLB0AM0010   XLIS      €2.97
#> 6  02 Feb 2024 14:58 WET      COFINA,SGPS    CFN PTCFN0AE0003   XLIS     €0.394
#>   Percentage change (in %)
#> 1                     0.86
#> 2                    -0.67
#> 3                       NA
#> 4                     0.11
#> 5                     1.37
#> 6                     0.51
#>                                                               URL
#> 1 https://live.euronext.com/en/product/equities/PTCUR0AP0000-ENXL
#> 2 https://live.euronext.com/en/product/equities/PTALT0AE0002-XLIS
#> 3 https://live.euronext.com/en/product/equities/PTTBI0AM0006-ENXL
#> 4 https://live.euronext.com/en/product/equities/PTBCP0AM0015-XLIS
#> 5 https://live.euronext.com/en/product/equities/PTSLB0AM0010-XLIS
#> 6 https://live.euronext.com/en/product/equities/PTCFN0AE0003-XLIS
#>          Ticker_adn
#> 1 PTCUR0AP0000-ENXL
#> 2 PTALT0AE0002-XLIS
#> 3 PTTBI0AM0006-ENXL
#> 4 PTBCP0AM0015-XLIS
#> 5 PTSLB0AM0010-XLIS
#> 6 PTCFN0AE0003-XLIS

m_result_df <- EN_Stocks_List("M")  # For Milan Stock
head(m_result_df)
#>                    Date            Name Ticker    Code_ISIN Market Last_price
#> 1 26 Jan 2024 13:46 CET 3D SYSTEMS CORP   4DDD US88554D2053   ETLX     €4.728
#> 2 02 Feb 2024 11:27 CET 3D SYSTEMS CORP   1DDD US88554D2053   BGEM      €4.65
#> 3 30 Jan 2024 18:13 CET 3D SYSTEMS CORP   2DDD US88554D2053   MTAH     €4.542
#> 4 02 Feb 2024 10:33 CET              3M   4MMM US88579Y1010   ETLX     €88.05
#> 5 01 Feb 2024 10:20 CET              3M   1MMM US88579Y1010   BGEM     €88.06
#> 6 23 Jan 2024 19:40 CET              3M   2MMM US88579Y1010   MTAH     €88.04
#>   Percentage change (in %)
#> 1                     2.74
#> 2                     4.92
#> 3                     0.31
#> 4                     0.78
#> 5                     0.15
#> 6                     0.54
#>                                                               URL
#> 1 https://live.euronext.com/en/product/equities/US88554D2053-ETLX
#> 2 https://live.euronext.com/en/product/equities/US88554D2053-BGEM
#> 3 https://live.euronext.com/en/product/equities/US88554D2053-MTAH
#> 4 https://live.euronext.com/en/product/equities/US88579Y1010-ETLX
#> 5 https://live.euronext.com/en/product/equities/US88579Y1010-BGEM
#> 6 https://live.euronext.com/en/product/equities/US88579Y1010-MTAH
#>          Ticker_adn
#> 1 US88554D2053-ETLX
#> 2 US88554D2053-BGEM
#> 3 US88554D2053-MTAH
#> 4 US88579Y1010-ETLX
#> 5 US88579Y1010-BGEM
#> 6 US88579Y1010-MTAH

d_result_df <- EN_Stocks_List("D")  # For Dublin Stock
head(d_result_df)
#>                    Date               Name Ticker    Code_ISIN Market
#> 1 02 Feb 2024 16:32 GMT      AIB GROUP PLC    A5G IE00BF0L3536   XMSM
#> 2 02 Feb 2024 15:17 GMT             AQUILA   AERI GB00BK6RLF66   XESM
#> 3 02 Feb 2024 16:32 GMT BANK OF IRELAND GP   BIRG IE00BD1RP616   XMSM
#> 4 02 Feb 2024 16:30 GMT    CAIRN HOMES PLC    C5H IE00BWY4ZF18   XMSM
#> 5 02 Feb 2024 16:04 GMT  CORRE ENERGY B.V.  CORRE NL0015000DY3   XESM
#> 6 09 Oct 2014 01:00 IST CRH PLC 5PCCumPref   DD8A IE0001827264   XMSM
#>   Last_price Percentage change (in %)
#> 1     €3.992                     0.20
#> 2    €0.7938                    -4.67
#> 3     €8.246                    -0.89
#> 4     €1.408                       NA
#> 5      €1.05                   -13.22
#> 6      €1.00                       NA
#>                                                               URL
#> 1 https://live.euronext.com/en/product/equities/IE00BF0L3536-XMSM
#> 2 https://live.euronext.com/en/product/equities/GB00BK6RLF66-XESM
#> 3 https://live.euronext.com/en/product/equities/IE00BD1RP616-XMSM
#> 4 https://live.euronext.com/en/product/equities/IE00BWY4ZF18-XMSM
#> 5 https://live.euronext.com/en/product/equities/NL0015000DY3-XESM
#> 6 https://live.euronext.com/en/product/equities/IE0001827264-XMSM
#>          Ticker_adn
#> 1 IE00BF0L3536-XMSM
#> 2 GB00BK6RLF66-XESM
#> 3 IE00BD1RP616-XMSM
#> 4 IE00BWY4ZF18-XMSM
#> 5 NL0015000DY3-XESM
#> 6 IE0001827264-XMSM

o_result_df <- EN_Stocks_List("O")  # For Oslo Stock
head(o_result_df, 10)
#>                     Date               Name Ticker    Code_ISIN Market
#> 1  02 Feb 2024 16:25 CET       2020 BULKERS   2020 BMG9156K1018   XOSL
#> 2  02 Feb 2024 16:25 CET   5TH PLANET GAMES    5PG DK0060945467   XOAS
#> 3  02 Feb 2024 09:01 CET    AASEN SPAREBANK   AASB NO0010672181   MERK
#> 4  02 Feb 2024 16:25 CET ABG SUNDAL COLLIER    ABG NO0003021909   XOSL
#> 5  02 Feb 2024 16:25 CET          ABL GROUP    ABL NO0010715394   XOSL
#> 6  02 Feb 2024 16:25 CET           ADEVINTA    ADE NO0010844038   XOSL
#> 7  02 Feb 2024 14:57 CET  ADS MARITIME HOLD    ADS CY0108052115   MERK
#> 8  02 Feb 2024 16:18 CET               AEGA   AEGA NO0012958539   XOAS
#> 9  02 Feb 2024 16:25 CET         AF GRUPPEN    AFG NO0003078107   XOSL
#> 10 02 Feb 2024 16:25 CET             AGILYX   AGLX NO0010872468   XOSL
#>    Last_price Percentage change (in %)
#> 1    NA138.40                    -1.84
#> 2     NA1.818                     1.56
#> 3    NA128.00                     0.79
#> 4      NA6.30                     0.80
#> 5     NA12.35                    -1.59
#> 6    NA112.80                    -0.44
#> 7      NA2.20                       NA
#> 8    NA2.3105                     0.46
#> 9    NA116.80                    -0.68
#> 10    NA25.65                       NA
#>                                                                URL
#> 1  https://live.euronext.com/en/product/equities/BMG9156K1018-XOSL
#> 2  https://live.euronext.com/en/product/equities/DK0060945467-XOAS
#> 3  https://live.euronext.com/en/product/equities/NO0010672181-MERK
#> 4  https://live.euronext.com/en/product/equities/NO0003021909-XOSL
#> 5  https://live.euronext.com/en/product/equities/NO0010715394-XOSL
#> 6  https://live.euronext.com/en/product/equities/NO0010844038-XOSL
#> 7  https://live.euronext.com/en/product/equities/CY0108052115-MERK
#> 8  https://live.euronext.com/en/product/equities/NO0012958539-XOAS
#> 9  https://live.euronext.com/en/product/equities/NO0003078107-XOSL
#> 10 https://live.euronext.com/en/product/equities/NO0010872468-XOSL
#>           Ticker_adn
#> 1  BMG9156K1018-XOSL
#> 2  DK0060945467-XOAS
#> 3  NO0010672181-MERK
#> 4  NO0003021909-XOSL
#> 5  NO0010715394-XOSL
#> 6  NO0010844038-XOSL
#> 7  CY0108052115-MERK
#> 8  NO0012958539-XOAS
#> 9  NO0003078107-XOSL
#> 10 NO0010872468-XOSL
```


## Example 4: Get the list of ETFs quoted on Euronext markets

```r
library(Euronext)
library(httr)
library(jsonlite)
library(dplyr)
library(rvest)
library(stringr)

# Example usage:
dt_ <- EN_Etfs_List()
head(dt_)
#>                    Date               Name Ticker    Code_ISIN Market Bid Ask
#> 1 02 Feb 2024 17:35 CET $Asia IG Corp US A   ASIG IE0007G78AC4   XAMS   -   -
#> 2 02 Feb 2024 09:04 CET      -1X SHORT DIS   SDIS XS2337085422   XAMS   -   -
#> 3 02 Feb 2024 09:04 CET     -1X SHORT PLTR   SPLR XS2337086669   XAMS   -   -
#> 4 31 Jan 2024 09:04 CET     -1X SHORT PLUG   SPLU XS2336362079   XAMS   -   -
#> 5 02 Feb 2024 17:35 CET -3X ARK INNOVATION  SARKK XS2399368906   XAMS   -   -
#> 6 02 Feb 2024 09:04 CET     -3x China Tech   SKWE XS2399370126   XAMS   -   -
#>   Last_price Percentage_change
#> 1    $4.8431             -0.49
#> 2    €6.7719             -1.67
#> 3    €2.0785             -3.83
#> 4    €4.9586              2.18
#> 5    €0.6833             -5.18
#> 6    €0.3382              0.45
#>                                                           URL        Ticker_adn
#> 1 https://live.euronext.com/en/product/etfs/IE0007G78AC4-XAMS IE0007G78AC4-XAMS
#> 2 https://live.euronext.com/en/product/etfs/XS2337085422-XAMS XS2337085422-XAMS
#> 3 https://live.euronext.com/en/product/etfs/XS2337086669-XAMS XS2337086669-XAMS
#> 4 https://live.euronext.com/en/product/etfs/XS2336362079-XAMS XS2336362079-XAMS
#> 5 https://live.euronext.com/en/product/etfs/XS2399368906-XAMS XS2399368906-XAMS
#> 6 https://live.euronext.com/en/product/etfs/XS2399370126-XAMS XS2399370126-XAMS
```
