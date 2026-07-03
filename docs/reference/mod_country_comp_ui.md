# Country comparison module - UI

Renders a multi-country picker, a single-indicator picker, and a line
chart comparing the selected countries over time for one indicator.

## Usage

``` r
mod_country_comp_ui(id)
```

## Arguments

- id:

  Character. Module namespace id.

## Value

A `tagList` of Shiny UI elements.

## Examples

``` r
if (FALSE) { # \dontrun{
shiny::fluidPage(mod_country_comp_ui("country_comp"))
} # }
```
