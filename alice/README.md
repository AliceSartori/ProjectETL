# Project ETL
----------
## Background
----------
Our team was tasked with exploring the web and finding workable datasets we could clean and work on. We ultimately decided to explore the world of US restaurant in relation to +40,000 records of US Gross Rent & Geo Locations, both datasets found on Kaggle.com.
General Info
Are you a gourment consumer? Or are you thinking on savy information to open your restaurant in the right zipcode in the US? We have the database for you! The Restaurant database. Our database compares the Restaurant Ranks of all US states to HouseHold Income and and Gross Rent Statistical information. Yoo won't be able to live without it!

## Tools and Technology Used for Analysis
----------
* CSVs
* Pandas
* VSCode
* Atom
* PGAdmin (PostgreSQL)
* Jupyter Notebook
* Google docs

## Extract
----------  
Our data came from two main sources.
CSV files:
1. Restaurant dataset: set of 3 separate csv files of Restaurant Score with 2020 rating  https://www.kaggle.com/michau96/restaurant-business-rankings-2020?select=Future50.csv
2. Gross Rent dataset:  1 csv file with 2020 data related of US real estate and household data https://www.kaggle.com/goldenoakresearch/acs-gross-rent-us-statistics?select=kaggle_gross_rent.csv

## Trasform
----------


Transform
We imported our data sets into Jupyter Notebook to manipulate and transform our datasets. We had to reformate and clean our CSV files so that they were readable, and the columns were consistent to each other. We did this by renaming columns and comparing state, state abbreviation and city names to ensure all data was callable in our Postgres queries. We also checked for null and duplicate values.

## Schema
To organize our data sets we use an Entity Relationship Diagram (ERD) tool from the Quick Database Diagrams website. We created sample tables and linked them together on their primary keys. We then exported he schema into Postgres to create our tables.

## Load to Postgres
To export the data to Postgres we use the following code including df.to_sql( ) for all notebook dataframes. Also, we used if_exists=”append” to add to the existing database without overriding the schema.
When creating our schema, we assigned data types to all the columns based on their values.

## Queries


## Summary of Findings
----------
Unicode utf-8 Error
1. The first issue encountered was met when trying to read the data into the Jupiter notebook using pandas:
UnicodeDecodeError: ‘utf-8’ codec can’t decode byte 0xf1 in position ...: invalid continuation byte
SOLUTION: Searched on Google and found this article(https://theptrk.com/2019/10/20/unicodedecodeerror-utf-8-codec-cant-decode-byte-0xf1-in-position-4-invalid-continuation-byte/). Opened the file in Atom and saved it adding pd.read_csv("gross_rent.csv", encoding='utf-8') to the string on Jupyter.
Pandas vs PGAdmin
2. When creating the table schema in PGAdmin using Pandas Columns' names, PGAdmin created columns not respecting Camel Casing. It always lower cases all column names by default. This created an issue when uploading data using pandas.to_sql function.
SOLUTION: After some empirical observations, we lower cased all columns in pandas when renaming.
Errors after running pd.to_sql
3. IntegrityError: (psycopg2.errors.UniqueViolation) duplicate key value violates unique constraint "gross_rent_pkey"
DETAIL:  Key (id)=(1021) already exists.
When running jupyter notebook pd.to_sql after the first insertion of the data, Jupyter always errors out as the data has already been entered. 
SOLUTION: Even if it means having that column erroring out, that is a proof the data have been entered.
