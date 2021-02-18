# Project ETL
----------

## General Info
----------
Our team was tasked with exploring the web and finding workable datasets we could clean and work on. We ultimately decided to explore the world of US restaurant in relation to +40,000 records of US Gross Rent & Geo Locations, both datasets found on Kaggle.com.

## Background
----------
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
Our data came from two main sources (CSVs files):
1. [Restaurant Dataset](https://https://www.kaggle.com/michau96/restaurant-business-rankings-2020?select=Future50.csv): set of 3 separate csv files of Restaurant Score with 2020 rating 
2. [Gross Rent and Houshold income dataset](https://https://www.kaggle.com/michau96/restaurant-business-rankings-2020?select=Future50.csv):  1 csv file with 2020 data related of US real estate and household data

## Trasform
----------
We imported our data sets into Jupyter Notebook to manipulate and transform our datasets. We had to reformate and clean our CSV files so that they were readable, and the columns were consistent to each other. We did this by renaming columns and comparing state, state abbreviation and city names to ensure all data was callable in our Postgres queries. We also checked for null and duplicate values.



## Load to Postgres
----------
To organize our data sets we use an Entity Relationship Diagram (ERD) tool from the Quick Database Diagrams website. We created tables respecting the 3 NFs linking them together on their primary and foreign keys. We then exported the schema into Postgres to create our tables.
To export the data to Postgres we use the following code including df.to_sql( ) for all notebook dataframes. Also, we used if_exists=”append” to add to the existing database without overriding the schema.
When creating our schema, we assigned data types to all the columns based on their values.

## Queries
----------
We wanted to explore how the ranking of the restaurants was related to gross rent in cities and states, as well as how it was related to household income. Is the ranking influenced by higher income cities? Is there a a relationship between restaurant and gross rent?

## Summary of Findings
----------
Unicode utf-8 Error:
The first issue encountered was met when trying to read the data into the Jupiter notebook using pandas:
UnicodeDecodeError: ‘utf-8’ codec can’t decode byte 0xf1 in position ...: invalid continuation byte
SOLUTION: Searched on Google and found this article(https://theptrk.com/2019/10/20/unicodedecodeerror-utf-8-codec-cant-decode-byte-0xf1-in-position-4-invalid-continuation-byte/). Opened the file in Atom and saved it adding pd.read_csv("gross_rent.csv", encoding='utf-8') to the string on Jupyter.

Pandas vs PGAdmin:
When creating the table schema in PGAdmin using Pandas Columns' names, PGAdmin created columns not respecting Camel Casing. It always lower cases all column names by default. This created an issue when uploading data using pandas.to_sql function.
SOLUTION: After some empirical observations, we lowercased all columns in pandas when renaming.

Conceptual Error:
After creating a schema with tables respecting the 3 NFs, we realized that the dataframes initially created were not updated with the columns we added to connect the tables in ERD. We had to work backwards by re-subsetting the dataframe we created at the beginning and adding the columns we needed to correspond to our ERD. The Zip Code table ended up being our junction table.

Errors after running pd.to_sql:
IntegrityError: (psycopg2.errors.UniqueViolation) duplicate key value violates unique constraint "gross_rent_pkey"
DETAIL:  Key (id)=(1021) already exists.
When running jupyter notebook pd.to_sql after the first insertion of the data, Jupyter always errors out as the data has already been entered. 
SOLUTION: Even if it means having that column erroring out, that is proof the data have been entered.
