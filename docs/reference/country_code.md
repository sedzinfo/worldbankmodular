# Country and region reference table

Reference metadata mapping each country to its region, income group, and
other World Bank classification metadata.

## Usage

``` r
country_code
```

## Format

A data frame with 265 rows and 31 columns, including `Country Code`,
`Short Name`, `Table Name`, `Long Name`, `Region`, and `Income Group`.

## Source

World Bank Open Data (<https://data.worldbank.org>).

## Examples

``` r
head(country_code[, c("Country Code", "Short Name", "Region", "Income Group")])
#>   Country Code                  Short Name                                            Region        Income Group
#> 1          ABW                       Aruba                         Latin America & Caribbean         High income
#> 2          AFE Africa Eastern and Southern                                              <NA>                <NA>
#> 3          AFG                 Afghanistan Middle East, North Africa, Afghanistan & Pakistan          Low income
#> 4          AFW  Africa Western and Central                                              <NA>                <NA>
#> 5          AGO                      Angola                                Sub-Saharan Africa Lower middle income
#> 6          ALB                     Albania                             Europe & Central Asia Upper middle income
unique(country_code$Region)
#> [1] "Latin America & Caribbean"                         NA                                                  "Middle East, North Africa, Afghanistan & Pakistan"
#> [4] "Sub-Saharan Africa"                                "Europe & Central Asia"                             "East Asia & Pacific"                              
#> [7] "South Asia"                                        "North America"                                    
```
