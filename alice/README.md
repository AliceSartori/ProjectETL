# ProjectETL
----------
## Background
----------
Our team was tasked with exploring the web and finding workable datasets we could clean and work on. We ultimately decided to explore the world of US restaurant in relation to +40,000 records of US Gross Rent & Geo Locations, both datasets found on Kaggle.com.

## Tools and Technology Used for Analysis
----------
* CSVs
* Pandas
* VSCode
* Atom
* PGAdmin (PostgreSQL)
* Jupyter Notebook
* Google docs

## Data Sources
----------  
1. Restaurant dataset: https://www.kaggle.com/michau96/restaurant-business-rankings-2020?select=Future50.csv
2. Gross Rent dataset: https://www.kaggle.com/goldenoakresearch/acs-gross-rent-us-statistics?select=kaggle_gross_rent.csv

## How to Ingest the Completed Project
----------
1. Created a cleaned notebook file complete_code.ipynb and saved as .ipynb
2. Created a SQL schema with joined tables
3. Create a blank folder output images with png of errors
4. Created a README.md


## Summary of Findings
----------
Unicode utf-8 Error
1. The first issue encountered was met when trying to read the data into the Jupiter notebook using pandas:
UnicodeDecodeError: ‘utf-8’ codec can’t decode byte 0xf1 in position ...: invalid continuation byte
SOLUTION: Searched on Google and found this article(https://theptrk.com/2019/10/20/unicodedecodeerror-utf-8-codec-cant-decode-byte-0xf1-in-position-4-invalid-continuation-byte/). Opened the file in Atom and saved it adding pd.read_csv("gross_rent.csv", encoding='utf-8') to the string on Jupyter.
Pandas vs PGAdmin
2. When creating the table schema in PGAdmin using Pandas Columns' names, PGAdmin created columns not respecting camel
Casing. It always lower cases all column names by default. This created an issue when uploading data using pandas.to_sql function.
SOLUTION: After some empirical observations, we lower cased all columns in pandas when renaming.
Errors after running pd.to_sql
3. IntegrityError: (psycopg2.errors.UniqueViolation) duplicate key value violates unique constraint "gross_rent_pkey"
DETAIL:  Key (id)=(1021) already exists.
When running jupyter notebook pd.to_sql after the first insertion of the data, Jupyter always errors out as the data has already been entered. 
SOLUTION: Even if it means having that column erroring out, that is a proof the data have been entered.
