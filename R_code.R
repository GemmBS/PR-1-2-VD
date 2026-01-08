
# 1. Introduction: Ireland's Biological Heritage

library(readr)
library(here)
library(dplyr)
library(forcats)
library(leaflet)
library(crosstalk)
library(tidyr)
library(ggplot2)
library(plotly)

DB <- read.csv(here("Mammals_Plants_Dataset.csv"))

# 2. Spatio-temporal distribution: The core analysis
# 1. Ensure Year is a clean integer and Date is correctly formatted
DB_map <- DB %>%
  filter(!is.na(lon), !is.na(lat), !is.na(Date)) %>%
  filter(Type %in% c("Plant", "Mammal")) %>%
  mutate(Year = as.integer(format(as.Date(Date), "%Y")))

# 2. Create a single SharedData object for all interactive elements
shared_data <- SharedData$new(DB_map)

# Define colors for the biological groups
pal_species <- colorFactor(
  palette = c("#2C3E50","#2E8B57"), 
  domain = DB_map$Type
)

# Create the interactive dashboard
bscols(
  widths = c(12),
  # 1. Time Slider (linked to shared_data)
  filter_slider("year_selector", "Select Observation Year", shared_data, ~Year, width = "100%"),
  
  # 2. Species Selector (replaces the Leaflet layer control for better compatibility)
  filter_checkbox("type_selector", "Select Species Group", shared_data, ~Type, inline = TRUE),
  
  # 3. The Map
  leaflet(shared_data) %>%
    addProviderTiles(providers$CartoDB.Positron) %>%
    setView(lng = -8, lat = 53.3, zoom = 7) %>%
    addCircleMarkers(
      lng = ~lon, lat = ~lat,
      radius = 4,
      color = ~pal_species(Type),
      fillOpacity = 0.65,
      stroke = FALSE,
      popup = ~paste0(
        "<b>Species:</b> ", TaxonName, "<br>",
        "<b>Group:</b> ", Type, "<br>",
        "<b>Year:</b> ", Year
      )
    ) %>%
    addLegend(
      position = "bottomright",
      pal = pal_species,
      values = ~Type,
      title = "Species Group"
    )
)

## 2.2 Key ecological insights


# 1. Prepare data: Count unique species per county and year
race_data <- DB_map %>%
  group_by(County, Year) %>%
  summarise(n_species = n_distinct(TaxonName), .groups = 'drop') %>%
  filter(!is.na(County))

# 2. Create a complete grid of years and counties so there are no gaps
all_years <- min(race_data$Year):max(race_data$Year)
all_counties <- unique(race_data$County)
full_grid <- expand.grid(Year = all_years, County = all_counties)

# 3. Merge, fill zeros, and calculate the CUMULATIVE sum
race_final <- full_grid %>%
  left_join(race_data, by = c("Year", "County")) %>%
  mutate(n_species = replace_na(n_species, 0)) %>%
  group_by(County) %>%
  mutate(cumulative_species = cumsum(n_species)) %>%
  ungroup()

# 4. Reshape to WIDE format (Flourish needs years as columns)
flourish_csv <- race_final %>%
  pivot_wider(id_cols = County, names_from = Year, values_from = cumulative_species)

# 5. Export to CSV
write.csv(flourish_csv, "biodiversity_race_ireland.csv", row.names = FALSE)


## 3.2 A county-by-county perspective
[Biodiversity race Ireland](https://public.flourish.studio/visualisation/27112446/)


# 4. Observation density (Heatmap)
# 1. Prepare data for the heatmap: observations per decade
heatmap_data <- DB_map %>%
  mutate(Decade = (Year %/% 10) * 10) %>%
  group_by(Decade, Type) %>%
  summarise(Observations = n(), .groups = 'drop')

# 2. Create the Heatmap
p_heatmap <- ggplot(heatmap_data, aes(x = Decade, y = Type, fill = Observations)) +
  geom_tile() +
  scale_fill_gradient(low = "#e5f5f9", high = "#2ca25f") + # Green tones for biodiversity
  labs(title = "Temporal heatmap: Observation density by decade",
       x = "Decade",
       y = "Species Group",
       fill = "Records") +
  theme_minimal()

# Make it interactive
ggplotly(p_heatmap)
