library(shiny)
library(dplyr)
library(ggplot2)
library(readr)
library(stringr)

boston_cocktails <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-26/boston_cocktails.csv') %>% 
  filter(str_detect(measure, "oz")) %>% 
  mutate(measure = parse_number(measure),
         ingredient_color = case_when(
           str_detect(tolower(ingredient), "lemon") ~ "#f5e342",
           str_detect(tolower(ingredient), "chartreuse") ~ "#d9ff52",
           str_detect(tolower(ingredient), "orange") ~ "#eb9317",
           str_detect(tolower(ingredient), "(cilantro|cucumber|basil|rosemary)") ~ "#219133",
           str_detect(tolower(ingredient), "grenadine") ~ "#f5163f",
           str_detect(tolower(ingredient), "lime") ~ "#81cf4a",
           str_detect(tolower(ingredient), "lavender") ~ "#f0acfa",
           str_detect(tolower(ingredient), "rose") ~ "#ffd4e6",
           str_detect(tolower(ingredient), "mint") ~ "#d4ffe6",
           str_detect(tolower(ingredient), "ginger") ~ "#f0da81",
           str_detect(tolower(ingredient), "pomegranate") ~ "#bd0256",
           str_detect(tolower(ingredient), "(milk|cream|half|creme fraiche)") ~ "#fffdf5",
           str_detect(tolower(ingredient), "maple") ~ "#9e6900",
           str_detect(tolower(ingredient), "vanilla") ~ "#f2e7d3",
           str_detect(tolower(ingredient), "pineapple") ~ "#ffef94",
           str_detect(tolower(ingredient), "cranberr") ~ "#ab0030",
           str_detect(tolower(ingredient), "(honey|agave|mandarine napoleon|chile syrup|de peche)") ~ "#edc511",
           str_detect(tolower(ingredient), "apricot") ~ "#ffd166",
           str_detect(tolower(ingredient), "passion fruit") ~ "#ffdc2b",
           str_detect(tolower(ingredient), "strawberr") ~ "#fc5863",
           str_detect(tolower(ingredient), "peach") ~ "#ffaa80",
           str_detect(tolower(ingredient), "banana") ~ "#fff2ab",
           str_detect(tolower(ingredient), "blueberr") ~ "#7885de",
           str_detect(tolower(ingredient), "pear") ~ "#bfeb6e",
           str_detect(tolower(ingredient), "balsamic") ~ "#5e1111",
           str_detect(tolower(ingredient), "cinnamon") ~ "#c9833c",
           str_detect(tolower(ingredient), "carrot") ~ "#e39402",
           str_detect(tolower(ingredient), "cherr") ~ "#d10221",
           str_detect(tolower(ingredient), "(grapefruit|guava)") ~ "#ff7354",
           str_detect(tolower(ingredient), "grape") ~ "#b85be3",
           str_detect(tolower(ingredient), "egg") ~ "#ffe98a",
           str_detect(tolower(ingredient), "(raspberr|rhubarb)") ~ "#de0055",
           str_detect(tolower(ingredient), "(coffee|brown|cacao|stout|worcestershire|bouillon|yvette)") ~ "#471500",
           str_detect(tolower(ingredient), "port") ~ "#6b0000",
           str_detect(tolower(ingredient), "mango") ~ "#ffd21c",
           str_detect(tolower(ingredient), "blackberr") ~ "#590031",
           str_detect(tolower(ingredient), "olive") ~ "#355e2a",
           str_detect(tolower(ingredient), "(tomato|catsup|v8)") ~ "#d40202",
           str_detect(tolower(ingredient), "almond") ~ "#dec787",
           str_detect(tolower(ingredient), "butterscotch") ~ "#e0b63f",
           str_detect(tolower(ingredient), "jalapeno") ~ "#007512",
           str_detect(tolower(ingredient), "celery") ~ "#7acc88",
           str_detect(tolower(ingredient), "clam") ~ "#ebdda2",
           str_detect(tolower(ingredient), "(light rum|cachaca)") ~ "#ebfffe",
           str_detect(tolower(ingredient), "dark rum") ~ "#8f6111",
           str_detect(tolower(ingredient), "vermouth") ~ "#edfeff",
           str_detect(tolower(ingredient), "sugar") ~ "#fffef7",
           str_detect(tolower(ingredient), "sour mix") ~ "#e2f576",
           str_detect(tolower(ingredient), "simple syrup") ~ "#f5edcb",
           str_detect(tolower(ingredient), "cola") ~ "#572009",
           str_detect(tolower(ingredient), "salt") ~ "#fffdfc",
           str_detect(tolower(ingredient), "margarita") ~ "#ccf58e",
           str_detect(tolower(ingredient), "(lemoncello|limoncello|strega|galliano)") ~ "#fffd8f",
           str_detect(tolower(ingredient), "curacao") ~ "#0f33ff",
           str_detect(tolower(ingredient), "vinegar") ~ "#f5f6ff",
           str_detect(tolower(ingredient), "red pepper") ~ "#db1c02",
           str_detect(tolower(ingredient), "pepper") ~ "#706b68",
           str_detect(tolower(ingredient), "apple") ~ "#bf782c",
           str_detect(tolower(ingredient), "cider") ~ "#bf782c",
           str_detect(tolower(ingredient), "thyme") ~ "#107a37",
           str_detect(tolower(ingredient), "root beer") ~ "#6b3604",
           str_detect(tolower(ingredient), "(wine|pimm)") ~ "#6b0404",
           str_detect(tolower(ingredient), "(anisette|kirschwasser|pisco|sambuca|maraschino|white|blanco|hot shot)") ~ "#ffffff",
           str_detect(tolower(ingredient), "(whiskey|whisky|bourbon|cynar|scotch|pastis)") ~ "#b67721",
           str_detect(tolower(ingredient), "amaretto") ~ "#bf2600",
           str_detect(tolower(ingredient), "(brandy|demerara|calvados|rock and rye|rhum|drambuie)") ~ "#eb882d",
           str_detect(tolower(ingredient), "(green|menthe|melon)") ~ "#24c200",
           str_detect(tolower(ingredient), "(gin|sake)") ~ "#e9f0f0",
           str_detect(tolower(ingredient), "pickle") ~ "#b7edaf",
           str_detect(tolower(ingredient), "coconut") ~ "#faf4e3",
           str_detect(tolower(ingredient), "rum") ~ "#c79140",
           str_detect(tolower(ingredient), "horseradish") ~ "#faf3e8",
           str_detect(tolower(ingredient), "(tequila|anis)") ~ "#fcfaf0",
           str_detect(tolower(ingredient), "sloe gin") ~ "#ad130e",
           str_detect(tolower(ingredient), "benedictine") ~ "#c26523",
           str_detect(tolower(ingredient), "absinthe") ~ "#bff79c",
           str_detect(tolower(ingredient), "kummel") ~ "#fffbed",
           str_detect(tolower(ingredient), "sherry") ~ "#d68631",
           str_detect(tolower(ingredient), "(madeira|fernet-branca)") ~ "#bf2908",
           str_detect(tolower(ingredient), "marnier") ~ "#ebae34",
           str_detect(tolower(ingredient), "(forbidden fruit|cognac)") ~ "#c24023",
           str_detect(tolower(ingredient), "bitter") ~ "#d4942c",
           str_detect(tolower(ingredient), "(dubonnet|rouge|noyaux)") ~ "#d12b06",
           str_detect(tolower(ingredient), "(lillet|elderflower|mezcal|7-up)") ~ "#fffbbf",
           str_detect(tolower(ingredient), "(amaro|armagnac)") ~ "#f27d0f",
           str_detect(tolower(ingredient), "(punt e mes|amer)") ~ "#ff5029",
           str_detect(tolower(ingredient), "(aperol|campari|tropical fruit schnapps)") ~ "#ff5029",
           str_detect(tolower(ingredient), "b & b") ~ "#cf721d",
           str_detect(tolower(ingredient), "chai") ~ "#f0c897",
           str_detect(tolower(ingredient), "cassis") ~ "#59002a",
           str_detect(tolower(ingredient), "orgeat") ~ "#f2f0e1",
           str_detect(tolower(ingredient), "(aquavit|champagne|becherovka)") ~ "#fce8c2",
           str_detect(tolower(ingredient), "swedish punch") ~ "#ffdc69",
           str_detect(tolower(ingredient), "tea") ~ "#c95e00",
           str_detect(tolower(ingredient), "lychee") ~ "#ffe8ed",
           str_detect(tolower(ingredient), "sage") ~ "#61ad64",
           str_detect(tolower(ingredient), "falernum") ~ "#fffde6",
           str_detect(tolower(ingredient), "claret") ~ "#7a001d",
           str_detect(tolower(ingredient), "violette") ~ "#570052",
           str_detect(tolower(ingredient), "(water|ice|club soda|triple sec|vodka)") ~ "#d4eaff"),
         ingredient = case_when(nchar(ingredient) > 35 ~ str_c(substr(ingredient, 1, 35), "\n", 
                                                                substr(ingredient, 36, nchar(ingredient))),
                                TRUE ~ ingredient))


ui <- fluidPage(
  titlePanel("Randomly Generated Cocktail"),
  sidebarLayout(
    sidebarPanel(sliderInput("num",
                             "Number of ingredients",
                             min = 2,
                             max = 6,
                             value = 1),
                 actionButton("go", "Make cocktail")),
    mainPanel(plotOutput("plot1"),
              br(),
              p("Tidy tuesday illustration for 5/27/2020"),
              p("Disclaimer: These cocktail recipes are randomly generated and are not advised for consumption. Drink at your own risk."))
  )
)


server <- function(input, output) {
  v <- reactiveValues(doPlot = FALSE)
  observeEvent(input$go, {
    # 0 will be coerced to FALSE
    # 1+ will be coerced to TRUE
    v$doPlot <- input$go
  })
  output$plot1 <- renderPlot({
    if (v$doPlot == FALSE) return()
    for_plot <- boston_cocktails[sample(1:nrow(boston_cocktails), input$num, replace=F),]
    
    for_plot <- for_plot %>% 
      arrange(ingredient)
    
    ggplot(for_plot, aes(x=1, y= measure, fill= ingredient)) + geom_col(color = "white")+
      geom_text(aes(x=1.55, y = measure, label= str_c(measure, " oz ", ingredient), group = ingredient), size = 5,
                color = "black", hjust=0, position = position_stack(vjust = .5))+
      scale_fill_manual(values = for_plot$ingredient_color)+
      xlim(0.25, 3) +
      theme_void()+
      theme(legend.position = "none",
            panel.background = element_rect(fill = "#bdbdbd"))
  })} 

shinyApp(ui = ui, server = server)