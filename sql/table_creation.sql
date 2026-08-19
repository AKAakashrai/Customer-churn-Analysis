--Customer Churn Analysis
--Create a Table
CREATE TABLE telco_churn (
	customerID VARCHAR,
	gender	VARCHAR,
	SeniorCitizen INTEGER,
	Partner	VARCHAR,
	Dependents	VARCHAR,
	tenure	INTEGER,	
	PhoneService	VARCHAR,
	MultipleLines	VARCHAR,
	InternetService	VARCHAR,
	OnlineSecurity	VARCHAR,
	OnlineBackup	VARCHAR,
	DeviceProtection	VARCHAR,	
	TechSupport	VARCHAR,
	StreamingTV VARCHAR,
	StreamingMovies	VARCHAR,
	Contract	VARCHAR,
	PaperlessBilling	VARCHAR,
	PaymentMethod	VARCHAR,
	MonthlyCharges	NUMERIC,
	TotalCharges	NUMERIC,
	Churn	VARCHAR
)
SELECT *  FROM telco_churn;

SELECT COUNT(DISTINCT customerID)
FROM telco_churn;

SELECT DISTINCT Churn
FROM telco_churn;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'telco_churn';



