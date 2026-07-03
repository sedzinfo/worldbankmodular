# Scatter correlation module - UI

Renders two indicator pickers and an animated bubble scatter plot
correlating the two chosen indicators across countries (bubble size is
population, color is region, one animation frame per year).

## Usage

``` r
mod_scatter_ui(id)
```

## Arguments

- id:

  Character. Module namespace id.

## Value

A `tagList` of Shiny UI elements.

## Examples

``` r
if (FALSE) { # \dontrun{
shiny::fluidPage(mod_scatter_ui("scatter"))
} # }
```
