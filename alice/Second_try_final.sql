-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/?error=redirect_uri_mismatch&error_description=The+redirect_uri+MUST+match+the+registered+callback+URL+for+this+application.&error_uri=https%3A%2F%2Fdocs.github.com%2Fapps%2Fmanaging-oauth-apps%2Ftroubleshooting-authorization-request-errors%2F%23redirect-uri-mismatch#/d/aGbDR5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "state" (
    "state_id" INTEGER   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "city_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_state" PRIMARY KEY (
        "state_id","city_id"
     )
);

CREATE TABLE "city" (
    "city_id" INTEGER   NOT NULL,
    "city" VARCHAR   NOT NULL,
    "zip_code_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_city" PRIMARY KEY (
        "city_id"
     )
);

CREATE TABLE "zip_code" (
    "zip_code_id" INTEGER   NOT NULL,
    "zip_code" INTEGER   NOT NULL,
    CONSTRAINT "pk_zip_code" PRIMARY KEY (
        "zip_code_id"
     )
);

CREATE TABLE "household_table" (
    "household_id" INTEGER   NOT NULL,
    "mean_household_income" FLOAT   NOT NULL,
    "std_household_income" FLOAT   NOT NULL,
    "zip_code_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_household_table" PRIMARY KEY (
        "household_id"
     )
);

CREATE TABLE "gross_rent_table" (
    "gross_rent_id" INTEGER   NOT NULL,
    "median_gross_rent" INTEGER   NOT NULL,
    "std_gross_rent" INTEGER   NOT NULL,
    "mean_gross_rent" INTEGER   NOT NULL,
    "zip_code_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_gross_rent_table" PRIMARY KEY (
        "gross_rent_id"
     )
);

ALTER TABLE "state" ADD CONSTRAINT "fk_state_city_id" FOREIGN KEY("city_id")
REFERENCES "city" ("city_id");

ALTER TABLE "city" ADD CONSTRAINT "fk_city_zip_code_id" FOREIGN KEY("zip_code_id")
REFERENCES "zip_code" ("zip_code_id");

ALTER TABLE "household_table" ADD CONSTRAINT "fk_household_table_zip_code_id" FOREIGN KEY("zip_code_id")
REFERENCES "zip_code" ("zip_code_id");

ALTER TABLE "gross_rent_table" ADD CONSTRAINT "fk_gross_rent_table_zip_code_id" FOREIGN KEY("zip_code_id")
REFERENCES "zip_code" ("zip_code_id");
