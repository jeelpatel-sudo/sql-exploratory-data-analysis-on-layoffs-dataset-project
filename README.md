# sql-exploratory-data-analysis-on-layoffs-dataset-project

This project performs exploratory data analysis on the cleaned Global Layoffs dataset using MySQL. The analysis focuses on identifying layoff trends by company, year, and month, along with generating ranking and rolling totals.

**Key Analyses Performed**

**Top 5 companies with the highest layoffs per year**

1. Aggregated total layoffs by company and year

2. Used CTEs and DENSE_RANK() to rank companies within each year

3. Extracted the top 5 companies annually

**Monthly layoffs with rolling totals**

1. Aggregated layoffs by month

2. Calculated a rolling cumulative total using window functions

3. Identified month-to-month layoff patterns and overall trend progression


This project demonstrates the use of SQL functions such as CTEs, window functions, DENSE_RANK(), string manipulation (SUBSTRING()), and rolling aggregations for performing structured EDA directly inside a database.
