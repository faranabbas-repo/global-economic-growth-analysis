# Global Economic Growth Analysis

[![Live Site](https://img.shields.io/badge/Live%20Site-GitHub%20Pages-blue?style=flat&logo=github)](https://faranabbas-repo.github.io/global-economic-growth-analysis/)
[![Data Source](https://img.shields.io/badge/Data-World%20Bank%20WDI-orange?style=flat)](https://datacatalog.worldbank.org/search/dataset/0037712)

Panel-data analysis of the drivers of GDP growth across 180+ countries from 2000 to 2023 using World Bank World Development Indicators.

This project is built as an economics portfolio piece: it frames a real macroeconomic question, works with a global cross-country dataset, applies econometric models in R, and translates the results into policy-relevant insights.

## Project Snapshot

- Question: Which factors are most strongly associated with GDP growth across countries and over time?
- Data: World Bank World Development Indicators, 2000-2023
- Unit of analysis: Country-year observations plus a 2023 cross-section
- Methods: Multiple regression and two-way fixed effects panel estimation
- Main result: Investment, measured by gross capital formation as a share of GDP, is the strongest and most consistent positive predictor of growth in this project

## Why This Project Matters

Economic growth is one of the core outcomes studied in development economics, international economics, and public policy. This repository moves beyond theory by using real-world macroeconomic data to test how investment, trade openness, labor market conditions, inflation, and income levels relate to growth performance.

For a recruiter, professor, or collaborator, this repo shows the ability to:

- define an economics question clearly
- work with a multi-country panel dataset
- clean and transform raw data in R
- estimate and interpret regression models
- communicate findings through a reproducible website

## Research Question

The analysis focuses on three linked questions:

1. Which macroeconomic indicators are most strongly associated with GDP growth across countries?
2. Does investment remain important after controlling for country and year effects?
3. How do growth patterns and key indicators vary across world regions?

## Data

Source: World Bank World Development Indicators (WDI)

Coverage:

- 180+ countries
- 2000-2023
- Cross-sectional analysis for 2023
- Panel analysis for 2000-2023

Core variables:

- GDP growth
- GNI per capita
- exports as a share of GDP
- gross capital formation as a share of GDP
- unemployment rate
- inflation rate derived from CPI

## Methodology

The project uses two complementary empirical strategies.

### 1. Cross-Sectional Regression

A multiple linear regression estimates how GDP growth in 2023 is related to income, trade openness, investment, unemployment, and inflation across countries.

### 2. Two-Way Fixed Effects Panel Model

A panel model uses country and year fixed effects to control for time-invariant country characteristics and global shocks across 2000-2023.

This allows the project to move from simple correlation toward a more credible comparison of within-country changes over time.

## Key Findings

- Investment stands out as the strongest positive predictor of GDP growth across model specifications.
- Trade openness is positively associated with growth, though effects vary across countries and regions.
- Higher unemployment is linked to weaker growth outcomes.
- Regional patterns matter: countries with stronger investment performance tend to show stronger growth distributions.

The central interpretation is that capital formation plays a major role in growth performance, but macroeconomic outcomes still depend on labor market conditions, external integration, and regional context.

## Economics Skills Demonstrated

- Macroeconomic and development-data analysis
- Cross-country panel data work
- Econometric modeling in R
- Variable construction and cleaning
- Policy-oriented interpretation
- Reproducible reporting with Quarto
- Public presentation through GitHub Pages

## Live Output

- Live site: [global-economic-growth-analysis](https://faranabbas-repo.github.io/global-economic-growth-analysis/)
- Repository: [faranabbas-repo/global-economic-growth-analysis](https://github.com/faranabbas-repo/global-economic-growth-analysis)

## Repository Structure

```text
global-economic-growth-analysis/
|-- index.qmd               Main analysis and summary
|-- model.qmd               Econometric model detail
|-- trends.qmd              Regional and time-trend analysis
|-- sources.qmd             Data documentation
|-- about.qmd               Project and author overview
|-- analyze_script.R        Data download, cleaning, and model code
|-- analysis_results.RData  Saved model outputs for rendering
|-- fit_stats.html          Rendered model statistics output
|-- _quarto.yml             Website configuration
|-- styles.css              Site styling
|-- _site/                  Rendered website
|-- data/                   Raw downloaded WDI data
`-- README.md               Project overview
```

## How To Reproduce

1. Clone the repository.
2. Install the required R packages.
3. Run the analysis script to download or load the data and save model outputs.
4. Render the Quarto site.

Example workflow:

```r
install.packages(c(
  "tidyverse", "WDI", "plm", "broom", "knitr", "kableExtra",
  "ggplot2", "corrplot", "stargazer", "plotly", "viridis",
  "patchwork", "modelsummary", "gt", "DT"
))

source("analyze_script.R")
```

```bash
quarto render
```

## Portfolio Value

This is the kind of project that strengthens an economics CV because it does not stop at listing tools. It demonstrates the ability to frame a question, use real international data, apply econometric methods, and explain why the findings matter.

A concise CV description for this repo could be:

> Built a cross-country panel-data project using World Bank WDI data for 180+ countries (2000-2023), applying regression and two-way fixed effects models in R to identify investment as a key driver of GDP growth.

## Author

Faran Abbas
Graduate Student, World Economy, Shandong University

- Email: [faranabbas@hotmail.com](mailto:faranabbas@hotmail.com)
- GitHub: [faranabbas-repo](https://github.com/faranabbas-repo)

## Acknowledgment

This project was developed as part of [Kane's Data Science Bootcamp](https://bootcamp.davidkane.info/).
