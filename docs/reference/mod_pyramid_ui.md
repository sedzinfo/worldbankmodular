# Population pyramid module - UI

Renders a country picker and an animated population pyramid (male vs.
female counts by age group, one animation frame per year).

## Usage

``` r
mod_pyramid_ui(id)
```

## Arguments

- id:

  Character. Module namespace id.

## Value

A `tagList` of Shiny UI elements.

## Examples

``` r
if (FALSE) { # \dontrun{
shiny::fluidPage(mod_pyramid_ui("pyramid"))
} # }
```
