# Bitcoin-History
end to end project with MySQL Workbench,Advanced Excel,Power BI,Tableau
# 🪙 Bitcoin Historical Data Analysis: A Risk & Volatility Study

## 📌 Project Overview
This project involves an end-to-end data analysis of Bitcoin (BTC) historical data spanning over 10 years. The goal was to perform **Financial Risk Analysis** and identify market cycles using SQL and Power BI.

## 🚀 Key Technical Challenges & Solutions
- **The "Out of Range" Bug:** Encountered significant data-type issues while importing high-volume transaction data (Volume column) into SQL.
- **Solution:** Optimized the database schema by migrating from standard `INT` to `BIGINT` and `DECIMAL(25, 5)` to ensure data integrity and precision.
- **Date Standardization:** Transformed non-standard date formats (DD-MM-YYYY) to SQL-compatible `YYYY-MM-DD` using Excel and Power Query.

## 📊 Financial Analysis Metrics
1. **Yearly Performance:** Analyzed Year-wise High, Low, and High/Low Ratios to track volatility.
2. **Moving Averages:** Implemented **50-day and 200-day Moving Averages** using SQL Window Functions to identify "Golden Cross" and "Death Cross" signals.
3. **Volatility & Risk:** Measured daily price fluctuations and maximum drawdowns to assess market risk.
4. **Volume vs. Price Correlation:** Investigated panic-selling patterns during major market crashes (e.g., 2020 COVID crash, 2022 FTX collapse).

## 🛠️ Tech Stack
- **SQL (MySQL):** Advanced Querying, Window Functions (LAG, LEAD, AVG OVER), CTEs.
- **Power BI:** Dynamic Dark-Themed Dashboards, DAX Measures, Time-Intelligence Functions.
- **Excel:** Initial ETL (Extract, Transform, Load) and Data Cleaning.

## 📈 Key Insights
- Bitcoin shows a strong cyclical pattern influenced by "Halving" events.
- Periods of high volatility are often correlated with massive spikes in trading volume.
- Risk-adjusted returns tend to outperform traditional assets in a long-term 4-year cycle.

## 📂 Repository Structure
- `/Data`: Raw and Cleaned CSV files.
- `/SQL_Queries`: Scripts for data transformation and analysis.
- `/Dashboard`: Power BI (.pbix) file and screenshots.
-
