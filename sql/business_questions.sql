--Customer Churn Analysis

--What percentage of Customers have churned
SELECT * FROM telco_churn
LIMIT 5;


WITH telco_churn_extend AS (SELECT 
	COUNT(customerID) AS total_customer
FROM telco_churn
WHERE Churn = 'Yes')

SELECT 
	ROUND((total_customer  / (SELECT COUNT(customerID) :: NUMERIC FROM telco_churn)) * 100,2 ) AS churn_rate
FROM telco_churn_extend

--Which contract type has the highest churn rate?
WITH telco_churn_extend AS (SELECT 
	COUNT(customerID) AS total_customer,
	COUNT(CASE WHEN Churn ='Yes' THEN customerID END) AS churn_customer,
	contract 
FROM telco_churn
GROUP BY contract
)
SELECT *,
	ROUND((churn_customer::NUMERIC /total_customer) * 100, 2) AS churn_rate
FROM telco_churn_extend
ORDER BY churn_rate DESC;
--Does customer tenure affect the churn rate?

SELECT * FROM telco_churn
LIMIT 5;
--We want tenure columns, churn column
SELECT DISTINCT tenure from telco_churn
order by tenure;

SELECT tenure,
	CASE 
		WHEN tenure BETWEEN 1 AND 12 THEN '1-12 MONTHS'
	 	WHEN tenure BETWEEN 13 AND 24 THEN '13-24 MONTHS'
		WHEN tenure BETWEEN 25 AND 36 THEN '13-24 MONTHS'
	 	WHEN tenure BETWEEN 37 AND 48 THEN '13-24 MONTHS'
 		WHEN tenure BETWEEN 49 AND 60 THEN '13-24 MONTHS'
	 	WHEN tenure BETWEEN 61 AND 72 THEN '13-24 MONTHS'
	END AS tenure_time
FROM telco_churn

