# Data Cleaning

## Initial Data Inspection

- Dataset contains 7,043 customer records.
- Checked the dataset structure, data types, missing values, and duplicates.
- No duplicate rows were found.
- No duplicate customer IDs were found.

## TotalCharges Cleaning

- TotalCharges was initially stored as an object data type.
- 11 customers had blank values in TotalCharges.
- All 11 customers had a tenure of 0 months.
- These customers were retained because they represent valid new customers.
- Blank TotalCharges values were replaced with 0.
- TotalCharges was converted to a numeric data type.

## Data Quality

- No missing values were identified in the other key columns.
- Categorical values such as Churn, Contract, and InternetService
  were checked for consistency.
