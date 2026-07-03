# Indicator comparison module - UI

Renders a multi-indicator picker, a single-country picker, and a line
chart comparing the selected indicators over time for one country.

## Usage

``` r
mod_indicator_comp_ui(id)
```

## Arguments

- id:

  Character. Module namespace id.

## Value

A `tagList` of Shiny UI elements.

## Examples

``` r
if (FALSE) { # \dontrun{
shiny::fluidPage(mod_indicator_comp_ui("indicator_comp"))
} # }
```
