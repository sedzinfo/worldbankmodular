# World Bank indicator values

Long-format World Bank development indicator values, one row per
country/indicator/year.

## Usage

``` r
mfi
```

## Format

A data frame with 7,478,197 rows and 5 columns:

- Country Code:

  ISO country code.

- Country Name:

  Country name.

- Indicator Name:

  World Bank indicator name.

- Year:

  Year of observation (factor).

- value:

  Indicator value for that country/year.

## Source

World Bank Open Data (<https://data.worldbank.org>).

## Examples

``` r
# \donttest{
head(mfi)
#>   Country Code Country Name                                                Indicator Name Year     value
#> 1          ABW        Aruba Adolescent fertility rate (births per 1,000 women ages 15-19) 1960 44.732000
#> 2          ABW        Aruba            Age dependency ratio (% of working-age population) 1960 83.046159
#> 3          ABW        Aruba       Age dependency ratio, old (% of working-age population) 1960  5.229128
#> 4          ABW        Aruba     Age dependency ratio, young (% of working-age population) 1960 77.817030
#> 5          ABW        Aruba                          Aquaculture production (metric tons) 1960  0.000000
#> 6          ABW        Aruba                          Birth rate, crude (per 1,000 people) 1960 32.043000
sort(unique(mfi$`Indicator Name`))[1:10]
#>  [1] "ARI treatment (% of children under 5 taken to a health provider)"                                                       
#>  [2] "Access to clean fuels and technologies for cooking (% of population)"                                                   
#>  [3] "Access to clean fuels and technologies for cooking, rural (% of rural population)"                                      
#>  [4] "Access to clean fuels and technologies for cooking, urban (% of urban population)"                                      
#>  [5] "Access to electricity (% of population)"                                                                                
#>  [6] "Access to electricity, rural (% of rural population)"                                                                   
#>  [7] "Access to electricity, urban (% of urban population)"                                                                   
#>  [8] "Account ownership at a financial institution or with a mobile-money-service provider (% of population ages 15+)"        
#>  [9] "Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)"
#> [10] "Account ownership at a financial institution or with a mobile-money-service provider, male (% of population ages 15+)"  
mfi[mfi$`Country Name` == "Greece" & mfi$`Indicator Name` == "Population, total", ]
#>         Country Code Country Name    Indicator Name Year    value
#> 10923            GRC       Greece Population, total 1960  8331725
#> 42800            GRC       Greece Population, total 1961  8398050
#> 77912            GRC       Greece Population, total 1962  8448233
#> 114259           GRC       Greece Population, total 1963  8479625
#> 151066           GRC       Greece Population, total 1964  8510429
#> 188643           GRC       Greece Population, total 1965  8550333
#> 227801           GRC       Greece Population, total 1966  8613651
#> 267060           GRC       Greece Population, total 1967  8684088
#> 306821           GRC       Greece Population, total 1968  8740765
#> 347156           GRC       Greece Population, total 1969  8772764
#> 394158           GRC       Greece Population, total 1970  8792806
#> 454140           GRC       Greece Population, total 1971  8831036
#> 516801           GRC       Greece Population, total 1972  8888628
#> 580747           GRC       Greece Population, total 1973  8929086
#> 645201           GRC       Greece Population, total 1974  8962022
#> 711948           GRC       Greece Population, total 1975  9046541
#> 780574           GRC       Greece Population, total 1976  9188150
#> 851644           GRC       Greece Population, total 1977  9308479
#> 924674           GRC       Greece Population, total 1978  9429959
#> 997742           GRC       Greece Population, total 1979  9548258
#> 1073253          GRC       Greece Population, total 1980  9642505
#> 1151188          GRC       Greece Population, total 1981  9729350
#> 1230153          GRC       Greece Population, total 1982  9789513
#> 1309623          GRC       Greece Population, total 1983  9846627
#> 1389493          GRC       Greece Population, total 1984  9895801
#> 1470762          GRC       Greece Population, total 1985  9934300
#> 1553296          GRC       Greece Population, total 1986  9967213
#> 1636101          GRC       Greece Population, total 1987 10000595
#> 1718775          GRC       Greece Population, total 1988 10036983
#> 1802259          GRC       Greece Population, total 1989 10089498
#> 1894058          GRC       Greece Population, total 1990 10196792
#> 2002936          GRC       Greece Population, total 1991 10319927
#> 2116253          GRC       Greece Population, total 1992 10399061
#> 2232108          GRC       Greece Population, total 1993 10460415
#> 2349866          GRC       Greece Population, total 1994 10512922
#> 2471224          GRC       Greece Population, total 1995 10562153
#> 2597689          GRC       Greece Population, total 1996 10608800
#> 2723996          GRC       Greece Population, total 1997 10661259
#> 2851742          GRC       Greece Population, total 1998 10720509
#> 2983792          GRC       Greece Population, total 1999 10761698
#> 3127341          GRC       Greece Population, total 2000 10805808
#> 3285758          GRC       Greece Population, total 2001 10862132
#> 3442090          GRC       Greece Population, total 2002 10902022
#> 3601744          GRC       Greece Population, total 2003 10928070
#> 3763190          GRC       Greece Population, total 2004 10955141
#> 3929312          GRC       Greece Population, total 2005 10987314
#> 4101979          GRC       Greece Population, total 2006 11020362
#> 4275405          GRC       Greece Population, total 2007 11048473
#> 4450690          GRC       Greece Population, total 2008 11077841
#> 4627388          GRC       Greece Population, total 2009 11107017
#> 4807955          GRC       Greece Population, total 2010 11121341
#> 4994182          GRC       Greece Population, total 2011 11104899
#> 5178961          GRC       Greece Population, total 2012 11045011
#> 5363772          GRC       Greece Population, total 2013 10965211
#> 5548627          GRC       Greece Population, total 2014 10892413
#> 5738809          GRC       Greece Population, total 2015 10820883
#> 5929797          GRC       Greece Population, total 2016 10775971
#> 6117265          GRC       Greece Population, total 2017 10754679
#> 6304763          GRC       Greece Population, total 2018 10732882
#> 6489181          GRC       Greece Population, total 2019 10721582
#> 6672712          GRC       Greece Population, total 2020 10698599
#> 6853398          GRC       Greece Population, total 2021 10570130
#> 7025347          GRC       Greece Population, total 2022 10437805
#> 7187091          GRC       Greece Population, total 2023 10407351
#> 7332241          GRC       Greece Population, total 2024 10405134
#> 7436690          GRC       Greece Population, total 2025 10413962
# }
```
