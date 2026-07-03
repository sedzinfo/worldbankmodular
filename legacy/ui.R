ui <- navbarPage(
  title = "Data: World Bank",
  collapsible = TRUE,
  fluid = TRUE,
  windowTitle = "Worldbank",
  tags$head(
    tags$style(HTML('.navbar-nav > li > a, .navbar-brand {
      padding-top:4px;
      padding-bottom:4px;
      height: 25px;
      }
      .navbar {min-height:20px;}'))
  ),
  tabPanel(title = "Country Comparison", mod_country_comp_ui("country_comp")),
  tabPanel(title = "Indicator Comparison", mod_indicator_comp_ui("indicator_comp")),
  tabPanel(title = "Pyramid", mod_pyramid_ui("pyramid")),
  tabPanel(title = "Barplot", mod_bar_ui("bar")),
  tabPanel(title = "Scatterplot", mod_scatter_ui("scatter")),
  tabPanel(title = "Map", mod_map_ui("map")),
  tabPanel(title = "Index", mod_index_table_ui("index_table"))
)
