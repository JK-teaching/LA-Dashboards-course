#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    dashboardPage(
      title = "Etherpad Dashboard",
      skin = "black",
      dashboardHeader(title = "OULAD dashboard"),
      dashboardSidebar(
        sidebarMenu(
          menuItem("Overview", tabName = "overview", icon = icon("table"))
        )
      ),
      dashboardBody(
        tabItems(
          tabItem(tabName = "overview",
                  fluidRow(
                    mod_module_presentation_switch_ui("module_presentation_switch_ui_1")
                  ),
                  fluidRow(
                    mod_activity_graph_ui("activity_graph_ui_1")
                  ),
                  fluidRow(
                    mod_general_stats_ui("general_stats_ui_1")
                  ),
                  fluidRow(
                    mod_student_overview_ui("student_overview_ui_1")
                  )
          ),
          tabItem(tabName = "groups")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'oulad.dashboard'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

