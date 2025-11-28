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
│   └── Mammals_Plants_Dataset.csv          # Final unified dataset (cleaned and merged)
├── .gitignore                             # Specifies files to ignore in Git
├── PR 1 & 2 VD.Rproj                      # RStudio project file
├── README.md                              # Main project documentation (This file)
└── pr1.Rmd                                # R Markdown file containing code for cleaning, standardization, and initial analysis
