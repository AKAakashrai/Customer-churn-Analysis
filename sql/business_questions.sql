--Customer Churn Analysis

--1. What percentage of Customers have churned
SELECT * FROM telco_churn
LIMIT 5;


WITH telco_churn_extend AS (SELECT 
	COUNT(customerID) AS total_customer
FROM telco_churn
WHERE Churn = 'Yes')

SELECT 
	ROUND((total_customer  / (SELECT COUNT(customerID) :: NUMERIC FROM telco_churn)) * 100,2 ) AS churn_rate
FROM telco_churn_extend

-----------------------------------------------------------------------------------------------------------------------

--2. Which contract type has the highest churn rate?
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

-----------------------------------------------------------------------------------------------------------------------

--3. Does customer tenure affect the churn rate?
--We want tenure columns, churn column
WITH telco_churn_ext AS 
(SELECT COUNT(tenure) AS tenure_count,
	CASE 
		WHEN tenure = 0 THEN '0 MONTHS'
		WHEN tenure BETWEEN 1 AND 12 THEN '1-12 MONTHS'
	 	WHEN tenure BETWEEN 13 AND 24 THEN '13-24 MONTHS'
		WHEN tenure BETWEEN 25 AND 36 THEN '25-36 MONTHS'
	 	WHEN tenure BETWEEN 37 AND 48 THEN '37-48 MONTHS'
 		WHEN tenure BETWEEN 49 AND 60 THEN '49-60 MONTHS'
	 	WHEN tenure BETWEEN 61 AND 72 THEN '61-72 MONTHS'
	END AS tenure_time,
	COUNT(CASE WHEN churn = 'Yes' THEN customerID END) AS churn_customer,
	COUNT(customerID) AS total_customer
FROM telco_churn
GROUP BY tenure_time
ORDER BY churn_customer DESC)
SELECT tenure_time,
	ROUND((churn_customer * 100  / total_customer :: NUMERIC), 2)  AS churn_rate
FROM telco_churn_ext;

----------------------------------------------------------------------------------------------------------------------

--4. Which payment method has the highest customer churn rate?
SELECT * FROM telco_churn limit 5;
SELECT paymentmethod,
	ROUND(((COUNT(CASE WHEN churn = 'Yes' THEN customerID END))* 100  / COUNT(customerID) :: NUMERIC),2) AS churn_rate
FROM telco_churn
GROUP BY paymentmethod
ORDER BY churn_rate DESC;

----------------------------------------------------------------------------------------------------------------------

--5. Which internet service type has the highest customer churn rate?































