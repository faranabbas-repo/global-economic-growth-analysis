# Global Economic Growth Analysis (2000–2023)

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live%20Site-blue?style=flat&logo=github)](https://faranabbas-repo.github.io/global-economic-growth-analysis/)
[![Data Source](https://img.shields.io/badge/Data%20Source-World%20Bank%20WDI-orange?style=flat)](https://datacatalog.worldbank.org/search/dataset/0037712)


> **Key Finding**: Investment is the single most powerful driver of economic growth across countries and time periods, with each percentage point increase in ***gross capital formation*** associated with ***0.2-0.3*** percentage points ***higher GDP growth***.

## 📊 Project Overview

This comprehensive analysis examines the drivers of economic growth across **180+ countries** from 2000 to 2023, using data from the World Bank's World Development Indicators. Through both cross-sectional and panel data methodologies, the study identifies key factors that promote sustainable economic development worldwide.

**🔗 [View Live Analysis](https://faranabbas-repo.github.io/global-economic-growth-analysis/)**

## 🎯 Key Research Questions

- What are the primary drivers of GDP growth across countries?
- How do investment, trade openness, and labor market conditions affect economic growth?
- Do growth patterns vary significantly across world regions?

## 📈 Main Findings

### 🏗️ Investment is Paramount
- **Strongest predictor** of GDP growth across all models
- 1% increase in investment → 0.2-0.3% higher GDP growth
- Critical for both developing and developed economies

### 🌍 Trade Openness Helps
- Export-oriented economies show higher growth rates
- Particularly beneficial when combined with high investment
- Regional variations in trade-growth relationships

### 💼 Unemployment Hurts Growth  
- Clear negative relationship across all specifications
- Highlights importance of labor market policies
- Regional differences in unemployment impacts

### 🔄 Convergence Evidence
- Poorer countries tend to grow faster (conditional convergence)
- But significant variation within income groups
- Investment quality matters more than quantity

## 🗺️ Regional Insights

| Region | Key Characteristics |
|--------|-------------------|
| **East Asia & Pacific** | 🏆 Highest investment rates, strong growth |
| **Sub-Saharan Africa** | 📈 High growth potential, investment challenges |
| **Europe & Central Asia** | ⚖️ Stable growth, unemployment concerns |
| **Latin America & Caribbean** | 🔄 Moderate performance, trade opportunities |

## 🛠️ Methodology

### Data
- **Source**: World Bank World Development Indicators (WDI)
- **Coverage**: 180+ countries, 2000-2023
- **Variables**: GDP growth, investment, trade, unemployment, inflation, income

### Models
1. **Cross-Sectional Regression (2023)**: Current relationships
2. **Panel Fixed Effects (2000-2023)**: Controls for country and time effects

### Tools
- **R** for statistical analysis
- **Quarto** for reproducible reporting
- **GitHub Pages** for publication

## 📁 Repository Structure

```
global-economic-growth-analysis/
├── 📊 index.qmd           # Main analysis and results
├── 🔬 model.qmd           # Detailed econometric models  
├── 📈 trends.qmd          # Regional trends and patterns
├── 📋 sources.qmd         # Data sources and methodology
├── 👤 about.qmd           # Author and project info
├── ⚙️ _quarto.yml         # Site configuration
├── 📜 scripts/
│   └── analyze.R          # Main analysis script
├── 💾 data/               # Data files (auto-generated)
└── 📖 README.md           # This file
```

## 🚀 Quick Start

### Prerequisites
```r
install.packages(c("WDI", "plm", "broom", "tidyverse", 
                   "kableExtra", "ggplot2", "quarto"))
```

### Run Analysis
```r
# Clone repository
git clone https://github.com/faranabbas-repo/global-economic-growth-analysis.git

# Navigate to project
setwd("global-economic-growth-analysis")

# Run analysis
source("scripts/analyze.R")

# Render site
quarto::quarto_render()
```

### Publish to GitHub Pages
```bash
quarto publish gh-pages
```

## 📊 Sample Visualizations

The analysis includes:

- 📈 **Coefficient plots** showing factor importance,
- 🗺️ **Regional comparisons** with box plots and trends,  
- 💹 **Investment-growth scatter plots** with country labels,
- 📉 **Time series** showing evolution of key indicators,
- 🔗 **Correlation matrices** revealing variable relationships,

## 💡 Policy Implications

1. **Prioritize Investment**: Infrastructure, education, and business-friendly policies
2. **Enhance Trade**: Export promotion and trade facilitation
3. **Address Unemployment**: Active labor market policies


## 👨‍🎓 About me

**Faran Abbas**  
Graduate Student, World Economy  
Shandong University  

- 📧 Email: [faranabbas@hotmail.com](mailto:faranabbas@hotmail.com)
- 🐙 GitHub: [@faranabbas-repo](https://github.com/faranabbas-repo)
- 🎓 Focus: International trade, fiscal policy, economic development

## 🎯 Course Context

This project was developed as part of [Kane's Data Science Bootcamp](https://bootcamp.davidkane.info/).
