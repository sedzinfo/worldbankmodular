# Run the Shiny Application

Launches the World Bank indicators explorer app.

## Usage

``` r
run_app(
  onStart = NULL,
  options = list(),
  enableBookmarking = NULL,
  uiPattern = "/",
  ...
)
```

## Arguments

- onStart:

  See
  [`shiny::shinyApp()`](https://rdrr.io/pkg/shiny/man/shinyApp.html).

- options:

  See
  [`shiny::shinyApp()`](https://rdrr.io/pkg/shiny/man/shinyApp.html).

- enableBookmarking:

  See
  [`shiny::shinyApp()`](https://rdrr.io/pkg/shiny/man/shinyApp.html).

- uiPattern:

  See
  [`shiny::shinyApp()`](https://rdrr.io/pkg/shiny/man/shinyApp.html).

- ...:

  Arguments passed to
  [`golem::with_golem_options()`](https://thinkr-open.github.io/golem/reference/with_golem_options.html).

## Examples

``` r
if (FALSE) { # \dontrun{
run_app()

# override any shiny::shinyApp() option, e.g. to pick a fixed port:
run_app(options = list(port = 8080))
} # }
```
