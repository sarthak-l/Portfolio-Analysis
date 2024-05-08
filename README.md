# Portfolio Analysis Project

## Overview
This project involves analyzing a portfolio containing stock prices for Amazon (AMZN), Domino's Pizza (DPZ), Bitcoin (BTC), and Netflix (NFLX) using SQL and Tableau. The analysis includes time series, volatility, and growth anlaysis.

## Data
The dataset `portfolio_data.csv` includes daily prices of AMZN, DPZ, BTC, and NFLX, along with the date for each entry.

## Analysis Performed
1. **Time Series Analysis**: Average price of each asset per year.
2. **Volatility Analysis**: Variance (as a proxy for volatility) of each asset.
3. **Growth Analysis**: Comparison of initial and final prices to determine the growth rate.

## SQL Queries
The SQL queries used in this project are included in the `portfolio_analysis.sql` file.

## Data Visualization with Tableau

In addition to the SQL analysis, this project employs Tableau for creating interactive and visually appealing data visualizations. These visualizations provide deeper insights and a more intuitive understanding of the data.

### Tableau Visualization Process:
1. **Data Export from SQLite**: Data was exported as a CSV file after SQL processing.
2. **Tableau Integration**: The CSV was imported into Tableau for visualization.
3. **Visualizations Created**:
   - **Time Series Analysis**: Line charts for each asset's price trends.
   - **Volatility Analysis**: Bar charts depicting the volatility of each asset.
   - **Growth Analysis**: Bar charts showing the growth of each asset.
4. **Interactive Dashboard**: A comprehensive dashboard was created in Tableau, combining all visualizations for an interactive data exploration experience.

## Setup
To run these queries, import your data into a SQLite database and execute the queries using any SQLite client.
