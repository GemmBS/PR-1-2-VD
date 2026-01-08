# Spatial and temporal biodiversity analysis in Ireland: mammals and plants
This repository contains the code and the unified dataset created for the Data visualisation course PR1 and PR2 project. The focus is on the analysis and visualization of the distribution of mammal and plant species in Ireland over time using open data and the R language.

# 1. Repository structure
```text
.
├── data/
│   ├── DiscreteVascularPlantSurveys.txt    # Raw plant surveys data (POI)
│   └── MammalsOfIreland2016-2025.txt       # Raw mammals data (MOI)
├── docs/
│   └── PR1_VD.pdf                          # Project documentation (Variable dictionary, justification)
├── output/
│   ├── Mammals_Plants_Dataset.csv          # Final unified dataset (cleaned and merged)
│   └── biodiversity_race_ireland.csv       # Dataset created for bar chart race
│   └── Storytelling_pr2.html               # Final product: Two centuries of Irish Biodiversity (1837-2024)
├── .gitignore                              # Specifies files to ignore in Git
├── PR 1 & 2 VD.Rproj                       # RStudio project file
├── README.md                               # Main project documentation (This file)
├── pr1.Rmd                                 # R Markdown file containing code for cleaning, standardization, and initial analysis
├── Storytelling_pr2.Rmd                    # Final product in Rmd
├── R_code.R                                # R code
└── Images/                                 # Images inserted into output (Storytelling_pr2.html)
```
# 2. Project summary: Mapping Irish Biodiversity (1837-2024)
## Overview
This project explores the spatio-temporal dynamics of biodiversity in Ireland through a unified dataset of 44,976 occurrence records. By integrating heterogeneous data from both Plants and Mammals, the visualization reveals nearly two centuries of ecological history and human sampling effort.

## Research focus & data complexity
The analysis is structured around a Variable Dictionary of 17 dimensions, allowing for a multi-faceted exploration of nature:
- **Spatial distribution**: Utilizing numerical coordinates (East/North) to identify biodiversity hotspots and regional richness across 39 Irish counties.
- **Temporal evolution**: Tracking species presence from the early 19th-century records (1837) to the modern digital era (2024), highlighting the shift from sporadic sampling to intensive monitoring.
- **Cross-taxa tnteraction**: Investigating the spatial co-occurrence between producers (Plants) and consumers (Mammals) to uncover potential habitat dependencies.

## Technological Approach
To address these complex ecological questions, this project leverages:
- **Interactive mapping** (Leaflet & Crosstalk): Enabling users to filter data by year, county, and species group without requiring a back-end server.
- **Dynamic visualizations**: Utilizing Bar Chart Races and Temporal Heatmaps to visualize sampling intensity and the "Unknown" data challenge.

## Significance
Beyond academic interest, this visualization serves as a tool for nature conservation and ecological monitoring. It transforms raw occurrence data into an impactful story about the "Great Acceleration" of biological recording and the democratization of science through citizen participation.

# 3. Author
- **Gemma Bargalló Solé**
