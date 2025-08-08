CREATE DATABASE HOSPITAL;
USE HOSPITAL;

CREATE TABLE DEPARTMENT(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(100),
DEPT_HEAD INT);

CREATE TABLE DOCTOR(
DOCTOR_ID INT PRIMARY KEY,
DOCTOR_NAME VARCHAR(100),
SPECIALIZATION VARCHAR(100),
SALARY DECIMAL(10,2),
DEPT_ID INT,
FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID));

CREATE table PATIENT(
PATIENT_ID INT PRIMARY KEY,
PATIENT_NAME VARCHAR(100),
ADDRESS VARCHAR(255),
REG_DATE DATE);

CREATE TABLE APPOINTMENT(
APPOINTMENT_ID INT PRIMARY KEY,
PATIENT_ID INT ,
DOCTOR_ID INT,
APPOINTMENT_DATE DATE,
DIAGNOSIS VARCHAR(255),
FOREIGN KEY (PATIENT_ID) references PATIENT(PATIENT_ID),
foreign key (DOCTOR_ID) references DOCTOR(DOCTOR_ID));

CREATE table TREATMENT (
TREATMENT_ID INT PRIMARY KEY,
PATIENT_ID INT ,
TREATMENT_NAME VARCHAR(100),
COST DECIMAL(10,2),
TREATMENT_DATE DATE,
FOREIGN KEY (PATIENT_ID) references PATIENT(PATIENT_ID));

CREATE TABLE BILLING(
BILL_ID INT PRIMARY KEY,
PATIENT_ID INT,
TOTAL_AMOUNT DECIMAL(10,2),
PAYMENT_DATE DATE);


-- 1. Department
INSERT INTO Department (Dept_ID, Dept_Name, Dept_Head) VALUES
(1, 'Cardiology', 1),
(2, 'Neurology', 2),
(3, 'Orthopedics', 3),
(4, 'Pediatrics', 4),
(5, 'Dermatology', 5),
(6, 'Oncology', 6),
(7, 'ENT', 7),
(8, 'General Medicine', 8),
(9, 'Psychiatry', 9),
(10, 'Gastroenterology', 10);

-- 2. Doctor
INSERT INTO Doctor (Doctor_ID, Doctor_Name, Specialization, Salary, Dept_ID) VALUES
(1, 'Dr. Arjun', 'Cardiology', 90000, 1),
(2, 'Dr. Neha', 'Neurology', 85000, 2),
(3, 'Dr. Raj', 'Orthopedics', 78000, 3),
(4, 'Dr. Priya', 'Pediatrics', 82000, 4),
(5, 'Dr. Karan', 'Dermatology', 76000, 5),
(6, 'Dr. Meera', 'Oncology', 95000, 6),
(7, 'Dr. Ravi', 'ENT', 72000, 7),
(8, 'Dr. Sneha', 'General Medicine', 80000, 8),
(9, 'Dr. Anil', 'Psychiatry', 88000, 9),
(10, 'Dr. Shreya', 'Gastroenterology', 93000, 10);

-- 3. Patient
INSERT INTO Patient (Patient_ID, Patient_Name, Address, Reg_Date) VALUES
(1, 'John Mathew', 'Kochi', '2022-12-15'),
(2, 'Anu Varghese', 'Thrissur', '2021-05-20'),
(3, 'Rahul Nair', 'Calicut', '2023-02-11'),
(4, 'Megha Menon', 'Kottayam', '2021-11-03'),
(5, 'Vishal Kumar', 'Ernakulam', '2020-08-17'),
(6, 'Divya S', 'Kollam', '2023-06-10'),
(7, 'Ajay Das', 'Kannur', '2022-07-09'),
(8, 'Sneha Krishnan', 'Alappuzha', '2023-01-22'),
(9, 'Nithin Joseph', 'Pathanamthitta', '2021-03-30'),
(10, 'Lakshmi Menon', 'Palakkad', '2020-12-05');

-- 4. Appointment
INSERT INTO Appointment (Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Diagnosis) VALUES
(1, 1, 1, '2023-06-05', 'Chest Pain'),
(2, 2, 2, '2022-12-10', 'Migraine'),
(3, 3, 3, '2023-03-15', 'Fracture'),
(4, 4, 4, '2022-11-25', 'Fever'),
(5, 5, 5, '2021-07-19', 'Skin Allergy'),
(6, 6, 6, '2023-06-20', 'Cancer Checkup'),
(7, 7, 7, '2023-04-18', 'Hearing Loss'),
(8, 8, 8, '2023-06-12', 'General Checkup'),
(9, 9, 9, '2022-10-02', 'Depression'),
(10, 10, 10, '2023-02-27', 'Stomach Pain');

-- 5. Treatment
INSERT INTO Treatment (Treatment_ID, Patient_ID, Treatment_Name, Cost, Treatment_Date) VALUES
(1, 1, 'Angioplasty', 15000, '2023-06-06'),
(2, 2, 'Brain MRI', 8000, '2022-12-12'),
(3, 3, 'Bone Surgery', 20000, '2023-03-20'),
(4, 4, 'Flu Medication', 1500, '2022-11-26'),
(5, 5, 'Skin Therapy', 3000, '2021-07-20'),
(6, 6, 'Chemotherapy', 25000, '2023-06-21'),
(7, 7, 'Ear Surgery', 12000, '2023-04-20'),
(8, 8, 'Vitamin Drip', 500, '2023-06-13'),
(9, 9, 'Counseling', 2000, '2022-10-05'),
(10, 10, 'Endoscopy', 7000, '2023-02-28');

-- 6. Billing
INSERT INTO Billing (Bill_ID, Patient_ID, Total_Amount, Payment_Date) VALUES
(1, 1, 15000, '2023-06-06'),
(2, 2, 8000, '2022-12-12'),
(3, 3, 20000, '2023-03-20'),
(4, 4, 1500, '2022-11-26'),
(5, 5, 3000, '2021-07-20'),
(6, 6, 25000, '2023-06-21'),
(7, 7, 12000, '2023-04-20'),
(8, 8, 500, '2023-06-13'),
(9, 9, 2000, '2022-10-05'),
(10, 10, 7000, '2023-02-28');

SELECT *FROM PATIENT;

SELECT *FROM BILLING;

#1. Retrieve all patient names
# who have appointments with a doctor specialized in "Cardiology"
select distinct p.patient_name 
from appointment a 
join patient p on a.patient_id=p.patient_id
join doctor d on a.doctor_id=d.doctor_id
where d.specialization='cardiology';

select *from doctor;

#2. List all doctors with their department names
select d.doctor_name,dept.dept_name
from doctor d
join department dept on d.dept_id=dept.dept_id;


#3.Get the total number of patients treated by each doctor
SELECT D.Doctor_Name, COUNT(DISTINCT A.Patient_ID) AS Total_Patients
FROM Appointment A
JOIN Doctor D ON A.Doctor_ID = D.Doctor_ID
GROUP BY D.Doctor_Name;


#4. Retrieve names of patients who had appointments before ‘2023-01-01’
select *from appointment;

#4. Retrieve names of patients who had appointments before ‘2023-01-01’
select distinct p.patient_name 
from appointment a 
join patient p on a.patient_id=p.patient_id
where appointment_date<'2023-01-01';

#5. List doctors earning a salary more than ₹80,000.
select doctor_name,salary from doctor where salary>80000;

#6. Show department names and the number of doctors in each department.
select d.dept_name,count(doctor.doctor_id)  as numberofdoctors
from department d
left join doctor on d.dept_id=doctor.dept_id
group by dept_name;


#7. Display patients who haven’t had any treatment yet.
SELECT P.Patient_Name
FROM Patient P
LEFT JOIN Treatment T ON P.Patient_ID = T.Patient_ID
WHERE T.Patient_ID IS NULL;


#8. Find the average treatment cost per patient.
SELECT P.Patient_Name, AVG(T.Cost) AS Avg_Treatment_Cost
FROM Patient P
JOIN Treatment T ON P.Patient_ID = T.Patient_ID
GROUP BY P.Patient_Name;

#9. Retrieve names of patients who made payments in June 2023
SELECT DISTINCT P.Patient_Name
FROM Billing B
JOIN Patient P ON B.Patient_ID = P.Patient_ID
WHERE MONTH(B.Payment_Date) = 6 AND YEAR(B.Payment_Date) = 2023;


#10. List patients who have received treatments costing more than ₹10,000

SELECT DISTINCT P.Patient_Name
FROM Treatment T
JOIN Patient P ON T.Patient_ID = P.Patient_ID
WHERE T.Cost > 10000;



#11. Retrieve the names of department heads and their respective departments.
SELECT Doc.Doctor_Name AS Dept_Head_Name, Dept.Dept_Name
FROM Department Dept
JOIN Doctor Doc ON Dept.Dept_Head = Doc.Doctor_ID;

#12. Show the patients who have had appointments but no billing recorded.
SELECT DISTINCT P.Patient_Name
FROM Appointment A
JOIN Patient P ON A.Patient_ID = P.Patient_ID
LEFT JOIN Billing B ON P.Patient_ID = B.Patient_ID
WHERE B.Patient_ID IS NULL;


