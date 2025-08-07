# Global Economic Growth Analysis
# Author: Faran Abbas
# Date: 2025-08-06

# Load required libraries
library(tidyverse)
library(WDI)
library(plm)
library(broom)
library(knitr)
library(kableExtra)
library(ggplot2)
library(dplyr)
library(corrplot)
library(stargazer)

# Set theme for all plots
theme_set(theme_minimal() + 
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    axis.text = element_text(size = 10),
    axis.title = element_text(size = 11),
    legend.position = "bottom"
  ))

# Data Loading and Preparation
# Panel data (2000-2023)
if (!file.exists("data/wdi_data_panel_2000_2023_raw.csv")) {
  # Download panel data
  indicators <- c(
    "NY.GDP.MKTP.KD.ZG",    # GDP growth (annual %)
    "NY.GNP.PCAP.CD",       # GNI per capita (current US$)
    "NE.EXP.GNFS.ZS",       # Exports of goods and services (% of GDP)
    "NE.GDI.TOTL.ZS",       # Gross capital formation (% of GDP)
    "FP.CPI.TOTL",          # Consumer prices (index)
    "SL.UEM.TOTL.ZS"        # Unemployment (% of labor force)
  )
  
  panel_data <- WDI(
    indicator = indicators,
    start = 2000,
    end = 2023,
    extra = TRUE
  )
  
  write_csv(panel_data, "data/wdi_data_panel_2000_2023_raw.csv")
} else {
  panel_data <- read_csv("data/wdi_data_panel_2000_2023_raw.csv")
}

# Cross-sectional data (2023)
if (!file.exists("data/wdi_data_2023_raw.csv")) {
  cross_data <- panel_data %>% filter(year == 2023)
  write_csv(cross_data, "data/wdi_data_2023_raw.csv")
} else {
  cross_data <- read_csv("data/wdi_data_2023_raw.csv")
}

# Data Cleaning and Preparation
clean_panel_data <- panel_data %>%
  select(
    country, year, region, income,
    gdp_growth = NY.GDP.MKTP.KD.ZG,
    gni_per_capita = NY.GNP.PCAP.CD,
    exports_gdp = NE.EXP.GNFS.ZS,
    capital_formation = NE.GDI.TOTL.ZS,
    cpi = FP.CPI.TOTL,
    unemployment = SL.UEM.TOTL.ZS
  ) %>%
  filter(!is.na(region), !is.na(income)) %>%
  mutate(
    log_gni_per_capita = log(gni_per_capita + 1),
    inflation_rate = (cpi / lag(cpi, order_by = year) - 1) * 100
  ) %>%
  na.omit()

# Cross-sectional data for 2023
model_data <- clean_panel_data %>% 
  filter(year == 2023) %>%
  na.omit()

# Panel data for fixed effects
panel_model_data <- clean_panel_data %>%
  filter(year >= 2000, year <= 2023) %>%
  na.omit()

# Convert to panel data format
pdata <- pdata.frame(panel_model_data, index = c("country", "year"))

# MODEL 1: Cross-sectional regression (2023)
cross_model <- lm(
  gdp_growth ~ log_gni_per_capita + exports_gdp + capital_formation + 
  unemployment + inflation_rate,
  data = model_data
)

tidy_model <- tidy(cross_model) %>%
  mutate(
    term = case_when(
      term == "(Intercept)" ~ "Intercept",
      term == "log_gni_per_capita" ~ "Log GNI per capita",
      term == "exports_gdp" ~ "Trade openness (% GDP)",
      term == "capital_formation" ~ "Investment (% GDP)",
      term == "unemployment" ~ "Unemployment rate (%)",
      term == "inflation_rate" ~ "Inflation rate (%)",
      TRUE ~ term
    ),
    significance = case_when(
      p.value < 0.001 ~ "***",
      p.value < 0.01 ~ "**",
      p.value < 0.05 ~ "*",
      p.value < 0.1 ~ ".",
      TRUE ~ ""
    )
  )

# MODEL 2: Fixed effects panel model (2000-2023)
fe_model <- plm(
  gdp_growth ~ log_gni_per_capita + exports_gdp + capital_formation + 
  unemployment + inflation_rate,
  data = pdata,
  model = "within",
  effect = "twoways"
)

tidy_fe <- tidy(fe_model) %>%
  mutate(
    term = case_when(
      term == "log_gni_per_capita" ~ "Log GNI per capita",
      term == "exports_gdp" ~ "Trade openness (% GDP)",
      term == "capital_formation" ~ "Investment (% GDP)",
      term == "unemployment" ~ "Unemployment rate (%)",
      term == "inflation_rate" ~ "Inflation rate (%)",
      TRUE ~ term
    ),
    significance = case_when(
      p.value < 0.001 ~ "***",
      p.value < 0.01 ~ "**",
      p.value < 0.05 ~ "*",
      p.value < 0.1 ~ ".",
      TRUE ~ ""
    )
  )

# Model summaries
cross_summary <- glance(cross_model)
fe_summary <- glance(fe_model)

# Additional analysis: Correlation matrix
correlation_data <- model_data %>%
  select(gdp_growth, log_gni_per_capita, exports_gdp, capital_formation, 
         unemployment, inflation_rate) %>%
  na.omit()

correlation_matrix <- cor(correlation_data)

# Regional analysis
regional_summary <- model_data %>%
  group_by(region) %>%
  summarise(
    countries = n(),
    avg_gdp_growth = mean(gdp_growth, na.rm = TRUE),
    avg_gni_per_capita = mean(gni_per_capita, na.rm = TRUE),
    avg_exports = mean(exports_gdp, na.rm = TRUE),
    avg_investment = mean(capital_formation, na.rm = TRUE),
    avg_unemployment = mean(unemployment, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(desc(avg_gdp_growth))

# Time trends for key variables
time_trends <- clean_panel_data %>%
  group_by(year) %>%
  summarise(
    avg_gdp_growth = mean(gdp_growth, na.rm = TRUE),
    avg_investment = mean(capital_formation, na.rm = TRUE),
    avg_trade_openness = mean(exports_gdp, na.rm = TRUE),
    countries = n(),
    .groups = "drop"
  )

# Top and bottom performers in 2023
top_performers <- model_data %>%
  arrange(desc(gdp_growth)) %>%
  slice_head(n = 10) %>%
  select(country, region, gdp_growth, capital_formation, exports_gdp)

bottom_performers <- model_data %>%
  arrange(gdp_growth) %>%
  slice_head(n = 10) %>%
  select(country, region, gdp_growth, capital_formation, exports_gdp)

# Save results for use in Quarto documents
save(
  tidy_model, tidy_fe, cross_summary, fe_summary,
  correlation_matrix, regional_summary, time_trends,
  top_performers, bottom_performers, model_data, 
  clean_panel_data, panel_model_data,
  file = "analysis_results.RData"
)

print("Analysis complete. Results saved to analysis_results.RData")
