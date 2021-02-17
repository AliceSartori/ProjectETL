# ProjectETL

# **Technical Report**

For this project, our team focused on analyzing restaurant data (three separate data files). and merging this with data on a restaurant's city and state (separate data file). We used Postgres for the database and Python to Transform the data.

## **Extract**

**Data Sources**

Kaggle Restaurant Business Ranking 2020 - https://www.kaggle.com/michau96/restaurant-business-rankings-2020?select=Top250.csv
Kaggle US Gross Rent ACS Statistics - https://www.kaggle.com/goldenoakresearch/acs-gross-rent-us-statistics?select=kaggle_gross_rent.csv

## **Transform**

Our team split up the project work to transform the data.

For the restaurant data we did the following:
1. Imported the three datasets (Future50.csv, Independence.csv, Top250.csv)
2. We realized that data for States was inconsistent across the four CSVs we obtained and some of the rows in the state column was abbreviated in certain CSVs and other was complete state info (N.Y, New York, NY).
3. This required us do a bit of manual labor to update the state names to be consistent across data sources. The inconsistencies in data was in the three restaurant files, which had 50-250 rows. After this manual transformation, we updated the CSVs and began to clean them in Pandas.
4. Once the new CSVs were in Pandas, we dropped any NAN values across the data sources and coverted to dtypes
5. 
