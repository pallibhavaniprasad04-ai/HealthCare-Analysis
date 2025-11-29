create database Healthcare;
use Healthcare;
show tables;

#1.	Display the Name, Age, and Medical Condition of all patients admitted in 2024.
SELECT name, age, medical_condition
FROM hackthon_healthcare_cleaned
WHERE YEAR(date_of_admission) = 2024;

#2.Find all patients who have "Diabetes" as their medical condition and are older than 50 years.
SELECT name, age, medical_condition
FROM hackthon_healthcare_cleaned
WHERE medical_condition = 'Diabetes'
AND age > 50;

#3.	Find the average billing amount for each Medical Condition.
SELECT medical_condition, avg(billing_amount) as Avg_Billing_Amount
FROM hackthon_healthcare_cleaned
GROUP BY medical_condition
ORDER BY avg_billing_amount DESC;

#4.Find the patient with the maximum billing amount and the one with the minimum billing amount.
SELECT name, billing_amount
FROM hackthon_healthcare_cleaned
ORDER BY billing_amount DESC
LIMIT 1;
SELECT name, billing_amount
FROM hackthon_healthcare_cleaned
ORDER BY billing_amount asc
LIMIT 1;

#5.Count how many patients were admitted under each Admission Type.
SELECT admission_type,COUNT(*) AS total_patients
FROM hackthon_healthcare_cleaned
GROUP BY admission_type
ORDER BY total_patients DESC;

#6.Show the top 5 doctors who handled the highest number of patients, along with their hospital.
SELECT doctor,hospital,COUNT(*) AS total_patients
FROM hackthon_healthcare_cleaned
GROUP BY doctor, hospital
ORDER BY total_patients DESC;

#7.	Find patients whose hospital stay was more than 10 days.
SELECT name,hospital,date_of_admission,discharge_date,
    DATEDIFF(discharge_date, date_of_admission) AS stay_days
FROM hackthon_healthcare_cleaned
WHERE DATEDIFF(discharge_date, date_of_admission) > 10
ORDER BY stay_days DESC;

#8.	Find pairs of patients admitted to the same hospital on the same date.
SELECT a.name AS patient1,b.name AS patient2,
a.hospital,a.date_of_admission
FROM hackthon_healthcare_cleaned a
JOIN hackthon_healthcare_cleaned b 
ON a.hospital = b.hospital
AND a.date_of_admission = b.date_of_admission
AND a.name < b.name
ORDER BY a.hospital, a.date_of_admission;



