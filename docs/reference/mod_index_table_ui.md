# Indicator index table module - UI

Renders a DataTable output listing all available indicators.

## Usage

``` r
mod_index_table_ui(id)
```

## Arguments

- id:

  Character. Module namespace id.

## Value

A
[`DT::dataTableOutput`](https://rdrr.io/pkg/DT/man/dataTableOutput.html)
Shiny UI element.

## Examples

``` r
if (FALSE) { # \dontrun{
shiny::fluidPage(mod_index_table_ui("index_table"))
} # }
```
