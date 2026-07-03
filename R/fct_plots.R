##########################################################################################
# 
##########################################################################################
#' Build a country comparison line chart
#'
#' Plots one indicator's value over time as one line per selected country.
#' Rows with missing values for the given filters are dropped before
#' plotting.
#'
#' @param mfi Data frame of World Bank indicator values (long format, with
#'   `Country Name`, `Indicator Name`, `Year`, `value` columns).
#' @param countries Character vector of country names to plot.
#' @param indicator Character. Indicator name to plot.
#' @param font_style A `plotly` font list (e.g. `list(size = 20, color =
#'   "gray25")`) applied to the chart's layout.
#'
#' @return A `plotly` htmlwidget.
#' @export
#' @examples
#' plot_country_comp(
#'   mfi,
#'   countries = c("Greece", "Bulgaria"),
#'   indicator = "Population, total",
#'   font_style = font_style
#' )
plot_country_comp <- function(mfi, countries, indicator, font_style) {
  temp <- mfi[mfi$`Country Name` %in% countries & mfi$`Indicator Name` %in% indicator, ]
  temp <- temp[complete.cases(temp), ]
  temp$Year <- droplevels(temp$Year)
  plotly::plot_ly(temp,
    x = ~ temp$Year,
    y = ~ temp$value,
    text = ~ paste0(
      "\nCountry=", temp$`Country Name`,
      "\nIndicator=", temp$`Indicator Name`,
      "\nYear=", temp$Year,
      "\nValue=", temp$value
    ),
    color = ~ temp$`Country Name`,
    mode = "lines+markers",
    type = "scatter",
    showlegend = TRUE
  ) %>%
    plotly::layout(
      autosize = TRUE,
      margin = list(l = 50, r = 50, b = 250, t = 100, pad = 0),
      legend = list(orientation = "h", xanchor = "center", x = .5, y = 1),
      title = paste("Indicator:", indicator),
      xaxis = list(title = "Year", tickangle = -90),
      yaxis = list(title = indicator),
      showlegend = TRUE,
      font = font_style
    ) %>%
    plotly::config(responsive = TRUE)
}
##########################################################################################
# 
##########################################################################################
#' Build an indicator comparison line chart
#'
#' Plots several indicators' values over time, for a single country, as one
#' line per indicator. Rows with missing values for the given filters are
#' dropped before plotting.
#'
#' @param mfi Data frame of World Bank indicator values (long format, with
#'   `Country Name`, `Indicator Name`, `Year`, `value` columns).
#' @param country Character. Country name to plot.
#' @param indicators Character vector of indicator names to plot.
#' @param font_style A `plotly` font list (e.g. `list(size = 20, color =
#'   "gray25")`) applied to the chart's layout.
#'
#' @return A `plotly` htmlwidget.
#' @export
#' @examples
#' plot_indicator_comp(
#'   mfi,
#'   country = "Greece",
#'   indicators = c("Population, female", "Population, male"),
#'   font_style = font_style
#' )
plot_indicator_comp <- function(mfi, country, indicators, font_style) {
  temp <- mfi[mfi$`Country Name` %in% country & mfi$`Indicator Name` %in% indicators, ]
  temp <- temp[complete.cases(temp), ]
  temp$Year <- droplevels(temp$Year)
  plotly::plot_ly(temp,
    x = ~ temp$Year,
    y = ~ temp$value,
    color = ~ temp$`Indicator Name`,
    mode = "lines+markers",
    type = "scatter",
    showlegend = TRUE
  ) %>%
    plotly::layout(
      autosize = TRUE,
      margin = list(l = 50, r = 50, b = 250, t = 100, pad = 0),
      legend = list(orientation = "h", xanchor = "center", x = .5, y = 1),
      title = paste("Country:", country),
      xaxis = list(title = "Year", tickangle = -90),
      yaxis = list(title = ""),
      showlegend = TRUE,
      font = font_style
    ) %>%
    plotly::config(responsive = TRUE)
}
##########################################################################################
# 
##########################################################################################
#' Build an animated population pyramid
#'
#' Plots male (negative, left) and female (positive, right) population
#' counts by age group as horizontal bars, animated over `Year`. Male values
#' are negated internally so the two sexes render back-to-back, while
#' `display_value` keeps the original (positive) counts for hover/axis text.
#'
#' @param mfi_population Data frame of population-by-age/sex values (long
#'   format, with `Country Name`, `sex`, `age`, `Year`, `value` columns).
#' @param country Character. Country name to plot.
#' @param font_style A `plotly` font list (e.g. `list(size = 20, color =
#'   "gray25")`) applied to the chart's layout.
#'
#' @return A `plotly` htmlwidget.
#' @export
#' @examples
#' plot_pyramid(mfi_population, country = "Greece", font_style = font_style)
plot_pyramid <- function(mfi_population, country, font_style) {
  temp <- mfi_population[mfi_population$`Country Name` %in% country, ]
  temp <- temp[complete.cases(temp), ]
  temp[temp$sex %in% "Male", "value"] <- temp[temp$sex %in% "Male", "value"] * -1
  temp$value <- round(temp$value, 2)
  temp$Year <- droplevels(temp$Year)
  temp$display_value <- NA
  temp[temp$sex %in% "Male", "display_value"] <- temp[temp$sex %in% "Male", "value"] * -1
  temp[temp$sex %in% "Female", "display_value"] <- temp[temp$sex %in% "Female", "value"]
  plotly::plot_ly(temp,
    x = ~ temp$value,
    y = ~ temp$age,
    color = ~ temp$sex,
    ids = ~ temp$age,
    type = "bar",
    frame = ~Year,
    orientation = "h",
    hoverinfo = "text",
    textposition = "outside",
    text = ~ temp$display_value
  ) %>%
    plotly::layout(
      autosize = TRUE,
      bargap = .1,
      barmode = "overlay",
      title = paste("Country:", country),
      margin = list(l = 50, r = 50, b = 250, t = 100, pad = 0),
      yaxis = list(title = "Age Group"),
      xaxis = list(
        title = list(text = "Population", standoff = 3),
        tickmode = "array",
        tickvals = -100:100,
        ticktext = paste0(c(100:0, 1:100), "%")
      ),
      font = font_style
    ) %>%
    plotly::animation_opts(frame = 500, easing = "linear", redraw = TRUE, mode = "immediate") %>%
    plotly::config(responsive = TRUE)
}
##########################################################################################
# 
##########################################################################################
#' Build an animated ranked bar chart
#'
#' Plots one indicator's value per country as a horizontal bar chart,
#' animated over `Year`, with countries ranked and ordered by their value in
#' the most recent year. Only positive, complete-case rows are kept. Returns
#' `NULL` when fewer than two rows remain after filtering (nothing
#' meaningful to plot/rank).
#'
#' @param mfi Data frame of World Bank indicator values (long format, with
#'   `Country Name`, `Indicator Name`, `Year`, `value` columns).
#' @param indicator Character. Indicator name to plot.
#' @param font_style A `plotly` font list (e.g. `list(size = 20, color =
#'   "gray25")`) applied to the chart's layout.
#'
#' @return A `plotly` htmlwidget, or `NULL` if there is not enough data to
#'   plot.
#' @export
#' @examples
#' plot_bar(mfi, indicator = "GDP (current US$)", font_style = font_style)
plot_bar <- function(mfi, indicator, font_style) {
  temp <- mfi[mfi$`Indicator Name` %in% indicator, ]
  temp <- temp[complete.cases(temp), ]
  temp <- temp[temp$value > 0, ]
  temp$Year <- droplevels(temp$Year)
  temp <- dplyr::mutate(dplyr::group_by(temp, Year),
    rank = order(order(value, Year, decreasing = TRUE))
  )
  temp_factor <- data.frame(temp[temp$Year %in% max(as.character(temp$Year), na.rm = TRUE), ], check.names = FALSE)

  temp$`Country Name` <- factor(temp$`Country Name`,
    levels = temp_factor[order(temp_factor$value), "Country Name"]
  )
  if (nrow(temp) <= 1) {
    return(NULL)
  }
  plotly::plot_ly(temp,
    x = ~ temp$value,
    y = ~ temp$`Country Name`,
    hovertext = ~ paste0(
      "\nRank=", temp$rank,
      "\nCountry=", temp$`Country Name`,
      "\nValue=", format_bignum(temp$value)
    ),
    frame = ~Year,
    ids = ~ temp$`Country Name`,
    hoverinfo = "text",
    type = "bar"
  ) %>%
    plotly::layout(
      autosize = TRUE,
      title = paste0(unique(temp$`Indicator Name`)),
      margin = list(l = 50, r = 50, b = 250, t = 100, pad = 0),
      xaxis = list(title = ""),
      yaxis = list(title = ""),
      font = font_style,
      showlegend = FALSE
    ) %>%
    plotly::add_text(text = paste("Rank:", format_bignum(temp$rank)), textposition = "right") %>%
    plotly::animation_opts(frame = 1000, easing = "linear", redraw = TRUE, mode = "immediate") %>%
    plotly::config(responsive = TRUE)
}
##########################################################################################
# 
##########################################################################################
#' Build an animated choropleth map
#'
#' Plots one indicator's value per country as a world choropleth, animated
#' over `Year`. Rows with missing values are dropped before plotting.
#'
#' @param mfi Data frame of World Bank indicator values (long format, with
#'   `Country Name`, `Country Code`, `Indicator Name`, `Year`, `value`
#'   columns).
#' @param indicator Character. Indicator name to plot.
#' @param font_style A `plotly` font list (e.g. `list(size = 20, color =
#'   "gray25")`) applied to the chart's layout.
#'
#' @return A `plotly` htmlwidget.
#' @export
#' @examples
#' plot_map(mfi, indicator = "Population, total", font_style = font_style)
plot_map <- function(mfi, indicator, font_style) {
  g <- list(showframe = FALSE, showcoastlines = TRUE, projection = list(type = "Mercator"))
  temp <- mfi[mfi$`Indicator Name` %in% indicator, ]
  temp <- temp[complete.cases(temp), ]
  temp$Year <- droplevels(temp$Year)
  plotly::plot_ly(temp,
    z = ~value,
    frame = ~Year,
    text = ~ temp$`Country Name`,
    locations = ~ temp$`Country Code`,
    color = ~ temp$value,
    type = "choropleth",
    colorbar = list(tickprefix = "", title = ""),
    colors = "Blues"
  ) %>%
    plotly::layout(
      autosize = TRUE,
      showlegend = TRUE,
      margin = list(l = 50, r = 50, b = 250, t = 100, pad = 0),
      legend = list(orientation = "h", xanchor = "center", x = .5, y = 1),
      title = paste("Indicator:", indicator),
      xaxis = list(title = ""),
      yaxis = list(title = ""),
      geo = g,
      font = font_style
    ) %>%
    plotly::animation_opts(frame = 1000, easing = "linear", redraw = TRUE, mode = "immediate") %>%
    plotly::config(responsive = TRUE)
}
##########################################################################################
# 
##########################################################################################
#' Build an animated correlation bubble scatter plot
#'
#' Reshapes `mfi` from long to wide so `indicator1` and `indicator2` become
#' plottable x/y columns, joins in `Region` from `country_code`, and plots a
#' bubble scatter (bubble size = population, color = region), animated over
#' `Year`, with play/pause controls. Rows with missing values or no region
#' are dropped before plotting.
#'
#' @param mfi Data frame of World Bank indicator values (long format, with
#'   `Country Name`, `Indicator Name`, `Year`, `value` columns). Must also
#'   contain a `"Population, total"` indicator, used for bubble sizing.
#' @param country_code Data frame mapping countries to region, with columns
#'   `Country Code`, `Short Name`, `Region`.
#' @param indicator1 Character. Indicator name plotted on the x-axis.
#' @param indicator2 Character. Indicator name plotted on the y-axis.
#' @param font_style A `plotly` font list (e.g. `list(size = 20, color =
#'   "gray25")`) applied to the chart's layout.
#'
#' @return A `plotly` htmlwidget.
#' @export
#' @examples
#' plot_cor(
#'   mfi,
#'   country_code,
#'   indicator1 = "Mortality rate, adult, male (per 1,000 male adults)",
#'   indicator2 = "Mortality rate, infant (per 1,000 live births)",
#'   font_style = font_style
#' )
plot_cor <- function(mfi, country_code, indicator1, indicator2, font_style) {
  mfi_temp <- mfi[mfi$`Indicator Name` %in% c(indicator1, indicator2, "Population, total"), ]
  mfi_cor <- reshape(mfi_temp[, c("Country Name", "Indicator Name", "Year", "value")],
    timevar = "Indicator Name",
    idvar = c("Country Name", "Year"),
    direction = "wide"
  )
  names(mfi_cor) <- gsub("value.", "", names(mfi_cor), fixed = TRUE)
  row.names(mfi_cor) <- NULL

  mfi_cor <- merge(country_code[, c("Country Code", "Short Name", "Region")], mfi_cor, by.x = c("Short Name"), by.y = c("Country Name"), all.y = TRUE)

  factorlist <- c("Year", "Short Name", "Region", "Population, total")
  temp <- mfi_cor[, c(indicator1, indicator2, factorlist)]
  temp <- temp[complete.cases(temp), ]
  temp$Region[temp$Region == ""] <- NA
  temp <- temp[!is.na(temp$Region), ]
  temp$Year <- droplevels(temp$Year)
  plotly::plot_ly(temp,
    x = temp[, 1],
    y = temp[, 2],
    color = ~ temp$Region,
    size = ~ temp$`Population, total`,
    frame = ~Year,
    ids = ~ temp$`Short Name`,
    text = ~ paste(
      "\nRegion=", temp$Region,
      "\nCountry=", temp$`Short Name`
    ),
    type = "scatter",
    mode = "markers",
    fill = ~"",
    marker = list(sizemode = "diameter")
  ) %>%
    plotly::layout(
      autosize = TRUE,
      showlegend = TRUE,
      margin = list(l = 50, r = 50, b = 250, t = 100, pad = 0),
      title = "",
      xaxis = list(title = list(text = unique(indicator1), standoff = 3)),
      yaxis = list(title = unique(indicator2)),
      font = font_style
    ) %>%
    plotly::animation_opts(frame = 500, easing = "linear", redraw = TRUE, mode = "afterall") %>%
    plotly::layout(
      updatemenus = list(
        list(
          type = "buttons",
          direction = "right",
          x = 0,
          y = 0,
          showactive = FALSE,
          buttons = list(
            list(
              label = "Pause",
              method = "animate",
              args = list(NULL, list(mode = "none"))
            ),
            list(
              label = "Stop",
              method = "animate",
              args = list(NULL, list(mode = "immediate"))
            )
          )
        )
      )
    ) %>%
    plotly::config(responsive = TRUE)
}
##########################################################################################
# 
##########################################################################################
#' Build the indicator index DataTable
#'
#' Builds a single-column, non-paginated `DT::datatable` listing every
#' distinct indicator name present in `mfi`.
#'
#' @param mfi Data frame of World Bank indicator values, with an
#'   `Indicator Name` column.
#'
#' @return A `DT::datatable` htmlwidget.
#' @export
#' @examples
#' render_index_table(mfi)
render_index_table <- function(mfi) {
  data <- data.frame(Indicator = unique(mfi$`Indicator Name`))
  result <- DT::datatable(data, options = list(paging = FALSE))
  DT::formatStyle(result, names(result), 0, target = "row", lineHeight = "80%")
}
