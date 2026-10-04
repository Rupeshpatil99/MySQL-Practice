CREATE DATABASE sql_mock;
USE sql_mock;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) CHECK (salary > 0),
    city VARCHAR(30) DEFAULT 'Pune',
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Department VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');

INSERT INTO Employee
(emp_id, emp_name, email, salary, city, dept_id)
VALUES
(101, 'Amit', 'amit@gmail.com', 45000, 'Pune', 1),
(102, 'Riya', 'riya@gmail.com', 55000, 'Mumbai', 1),
(103, 'Rahul', 'rahul@gmail.com', 35000, 'Pune', 2),
(104, 'Sneha', 'sneha@gmail.com', 60000, 'Nashik', 3),
(105, 'Karan', 'karan@gmail.com', 25000, 'Mumbai', 4),
(106, 'Priya', 'priya@gmail.com', 70000, 'Pune', 3),
(107, 'Neha', 'neha@gmail.com', 40000, 'Nagpur', 2),
(108, 'Arjun', 'arjun@gmail.com', 50000, 'Pune', 1);

SELECT * FROM EMPLOYEE;

#A. Constraints

# 5 questions · Basic

#1. Create a table called Student with student_id as PRIMARY KEY, name as NOT NULL, email as UNIQUE, and age as CHECK (age >= 18).

     CREATE TABLE ST( ST_ID INT PRIMARY KEY, NAME VARCHAR(89) NOT NULL, EMAIL VARCHAR(89) UNIQUE,AGE INT,
      CHECK (AGE>=18)) ;


#2. Insert 3 valid records into Student.
 INSERT INTO ST VALUES(1,'KARTIK','MEMANE@123' ,23),(2,'AMIT','PATIL@1234',45);
 SELECT  * FROM ST;
#3. Try inserting a duplicate email. What error do you expect?

INSERT INTO ST VALUES(3,'RR','PATIL@1234',34);
#  -----ANWER--->0	10	15:41:56	INSERT INTO ST VALUES(3,'RR','PATIL@1234',34)	Error Code: 1062. Duplicate entry 'PATIL@1234' for key 'st.EMAIL'	0.000 sec

#4. Try inserting a student with age 15. What should happen?
INSERT INTO ST VALUE(4,'EE','JDHH@334',12);
SET SQL_SAFE_UPDATES = 0;
#5. Create a table with a DEFAULT city value of 'Pune'. Insert a record without specifying the citY
UPDATE   EMPLOYEE SET CITY=DEFAULT WHERE CITY= 'PUNE';
SELECT * FROM EMPLOYEE;


#B. Keys

#5 questions · Basic

#1. Identify the primary key and foreign key in the Employee and Department tables.
DESC EMPLOYEE;

#. Create a Course table with course_id as the primary key and course_name as UNIQUE.
      CREATE TABLE COURSE( C_ID INT PRIMARY KEY, C_NAME VARCHAR(89) UNIQUE KEY);
      
      
### Write a query to display employee names with their department names using a JOIN.
        SELECT E.EMP_NAME,D.DEPT_ID  FROM EMPLOYEE  AS E INNER JOIN DEPARTMENT AS D ON E.DEPT_ID = D.DEPT_ID;    
        
        
        
#Display employees whose salary is greater than 40000.
SELECT * FROM EMPLOYEE WHERE SALARY>40000;

#. Display employees whose salary is between 30000 and 60000
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 30000 AND 60000;

#3. Display employees who work in Pune or Mumbai using IN.
SELECT* FROM EMPLOYEE WHERE CITY IN ('PUNE','MUMBAI');

###. Display employees whose salary is less than 30000 or greater than 60000.
SELECT * FROM EMPLOYEE WHERE SALARY<30000 OR SALARY>60000;

#7. Display employees whose dept_id is not 1 using NOT.

SELECT * FROM EMPLOYEE WHERE DEPT_ID!=1;


# Display all employees in descending order of salary.
SELECT * FROM EMPLOYEE ORDER BY  SALARY DESC;

#2. Display the top 3 highest-paid employees.
SELECT * FROM  EMPLOYEE ORDER BY SALARY DESC LIMIT 3;

#3. Count the number of employees in each department.
SELECT D.DEPT_NAME,COUNT(E.EMP_ID) AS TOTAL_EMPOYEE  FROM DEPARTMENT AS D LEFT JOIN EMPLOYEE
 AS E ON E.DEPT_ID = D.DEPT_ID   GROUP BY D.DEPT_ID, D.DEPT_NAME;

#4. Find the average salary of employees in each department.
SELECT D.DEPT_NAME,AVG(E.SALARY) AS TOTAL_SALARY  FROM DEPARTMENT AS D LEFT JOIN EMPLOYEE AS E ON E.DEPT_ID = D.DEPT_ID   GROUP BY D.DEPT_ID, D.DEPT_NAME;

#5. Display departments whose average salary is greater than 45000 using HAVING.
 SELECT D.DEPT_NAME, AVG(E.SALARY)  AS TOTAL FROM DEPARTMENT AS D 
 LEFT JOIN EMPLOYEE AS E ON E.DEPT_ID = D.DEPT_ID GROUP BY D.DEPT_ID, D.DEPT_NAME  HAVING TOTAL >45000;
 
#6. Find the total salary paid to employees in each city.
SELECT CITY,SUM(SALARY) FROM EMPLOYEE group by CITY;

#7. Display the department-wise employee count, sorted from highest to lowest count.
SELECT D.DEPT_NAME,COUNT(E.EMP_NAME) AS COUNT_EMP  FROM DEPARTMENT AS D LEFT JOIN EMPLOYEE AS E 
 ON E.DEPT_ID = D.DEPT_ID  
   GROUP BY D.DEPT_ID,D.DEPT_NAME   
   ORDER BY COUNT_EMP DESC;
   
   
   
   #F. LIKE and NOT LIKE

#7 questions · Basic

#1. Find employees whose names start with A.
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE 'A%';

#2. Find employees whose names end with a.
SELECT * FROM EMPLOYEE WHERE EMP_NAME  LIKE '%A' ;

#3. Find employees whose names contain 'ri'.
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '%RI%';

##5. Find employees whose names do not start with A.
SELECT * FROM  EMPLOYEE WHERE  EMP_NAME NOT LIKE 'A%';

#6. Find employees whose names do not contain 'ha'.
SELECT * FROM EMPLOYEE WHERE EMP_NAME NOT LIKE '%HA%';

#7. Find cities that start with P and end with e.
SELECT *FROM  EMPLOYEE WHERE EMP_NAME  LIKE 'P%' AND '%E' ;


#G. DDL commands

#7 questions · Basic

#1. Create a table called Projects with project_id and project_name.
create table project( project_id int primary key, project_name varchar(89) not null);

#2. Add a budget column to Projects
alter table project add column budget int;

#3. Change the project_name column size to VARCHAR(100 
alter table project modify column project_name varchar(100);

#4. Rename Projects to CompanyProjects.
rename table project to companyproject;

#5. Remove the budget column from CompanyProjects.
alter table companyproject  drop column budget;

#6. Create a backup table structure using CREATE TABLE ... LIKE.

#7. Explain the difference between DROP, TRUNCATE, and DELETE.


#H. DML commands

##1. Insert a new employee with emp_id 109 and valid details.
insert into employee (emp_id, emp_name, email, salary, city, dept_id)
 values(109,'kartik','memane@123',45000,'buldhana', 2);

#2. Update Amit's salary to 50000.
update employee  set salary = 50000 where emp_name = 'amit';

#3. Change Neha's city to Pune.
update employee set city= 'pune' where emp_name = 'neha';

#4. Delete employee 105.
delete from employee  where emp_id = 105;

#5. Increase the salary of all IT employees by 10%.
update employee as e  inner join department as d   on 
 e.dept_id = d.dept_id set salary = e.salary * 0.10   where Dept_name= 'it';
 
#6. Delete employees whose salary is below 30000.
delete from employee  where salary<30000;

#7. Insert a new department and then insert an employee referencing it.








