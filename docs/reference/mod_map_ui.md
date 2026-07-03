# Choropleth map module - UI

Renders an indicator picker and an animated world choropleth map (one
animation frame per year).

## Usage

``` r
mod_map_ui(id)
```

## Arguments

- id:

  Character. Module namespace id.

## Value

A `tagList` of Shiny UI elements.

## Examples

``` r
if (FALSE) { # \dontrun{
shiny::fluidPage(mod_map_ui("map"))
} # }
```
