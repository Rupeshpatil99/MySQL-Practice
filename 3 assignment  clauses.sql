CREATE DATABASE  COMPANY_DB;
use company_db;
CREATE TABLE EMPLOYEES(emp_id int primary key,emp_name varchar(89),
                       department varchar(78), job_title varchar(78),
                       salary int, hire_date date , city varchar(89),
                       commission int  null );
                       
show tables ;


INSERT INTO employees VALUES
(1,  'Aarav Sharma',     'IT',        'Developer',           65000, '2019-03-15', 'Pune',      NULL),
(2,  'Priya Patil',      'HR',        'HR Executive',        42000, '2020-07-01', 'Pune',      NULL),
(3,  'Rohan Mehta',      'Sales',     'Sales Executive',     38000, '2021-01-10', 'Mumbai',    4000),
(4,  'Sneha Kulkarni',   'Finance',   'Accountant',          52000, '2018-11-20', 'Pune',      NULL),
(5,  'Vikram Singh',     'Sales',     'Sales Manager',       85000, '2016-05-05', 'Delhi',     9000),
(6,  'Ananya Iyer',      'IT',        'Data Analyst',        58000, '2021-09-12', 'Bengaluru', NULL),
(7,  'Karan Joshi',      'Marketing', 'Marketing Executive', 40000, '2022-02-14', 'Mumbai',    NULL),
(8,  'Neha Deshmukh',    'IT',        'Team Lead',           95000, '2015-08-30', 'Pune',      NULL),
(9,  'Rahul Verma',      'Sales',     'Sales Executive',     36000, '2023-04-03', 'Delhi',     NULL),
(10, 'Pooja Nair',       'Finance',   'Finance Manager',     90000, '2014-12-01', 'Mumbai',    NULL),
(11, 'Amit Shah',        'IT',        'Developer',           61000, '2020-10-19', 'Hyderabad', NULL),
(12, 'Divya Reddy',      'HR',        'HR Manager',          78000, '2017-06-25', 'Hyderabad', NULL),
(13, 'Sanjay Gupta',     'Marketing', 'Marketing Manager',   82000, '2016-09-09', 'Delhi',     NULL),
(14, 'Meera Joshi',      'Sales',     'Sales Executive',     39000, '2022-11-28', 'Pune',      3500),
(15, 'Arjun Rao',        'IT',        'Data Scientist',      88000, '2019-01-07', 'Bengaluru', NULL),
(16, 'Kavita Pawar',     'Finance',   'Accountant',          48000, '2021-03-22', 'Pune',      NULL),
(17, 'Nikhil Kale',      'Marketing', 'Content Writer',      35000, '2023-08-14', 'Pune',      NULL),
(18, 'Ritu Malhotra',    'HR',        'Recruiter',           37000, '2023-01-16', 'Mumbai',    NULL),
(19, 'Siddharth Jain',   'Sales',     'Sales Executive',     41000, '2020-05-18', 'Bengaluru', 5000),
(20, 'Isha Bhatt',       'IT',        'Developer',           55000, '2022-06-06', 'Hyderabad', NULL);

SELECT * FROM employees;


## Section A: SELECT, Alias and DISTINCT

#1. Display all records from the `employees` table.
 SELECT * FROM EMPLOYEES;
 
#2. Display `emp_name`, `job_title` and `salary`. Rename `salary` as `monthly_salary` in the output.
SELECT EMP_NAME, JOB_TITLE, SALARY AS MONTHLY_SALARY FROM EMPLOYEES;

#3. List all unique departments. 
SELECT DISTINCT(DEPARTMENT) FROM EMPLOYEES  ;

#4. List all unique cities where employees work.
SELECT DISTINCT(CITY) FROM EMPLOYEES;

 
 #Section B: WHERE with Comparison and Logical Operators

#5. Display all employees who work in the IT department.
SELECT * FROM EMPLOYEES WHERE DEPARTMENT ='IT';

#6. Display employees whose salary is greater than 60000.
SELECT * FROM EMPLOYEES WHERE SALARY>60000;


#. Display employees who work in the Finance department **and** are based in Pune.
SELECT * FROM EMPLOYEES WHERE DEPARTMENT= 'FINANCE' AND CITY ='PUNE';

#8. Display employees who work in the HR department **or** the Marketing department.
 SELECT * FROM EMPLOYEES WHERE DEPARTMENT = 'HR' OR  DEPARTMENT ='MARKETING';

#9. Display employees who are **not** based in Mumbai (solve using `NOT`, then again using `<>`).
SELECT * FROM EMPLOYEES WHERE CITY !='MUMBAI';

#10. Display employees based in Pune, Delhi or Hyderabad using the `IN` operator.
SELECT *FROM EMPLOYEES WHERE CITY IN ('PUNE','DELHI','HYDRABAD');

#11. Display employees whose salary is between 40000 and 60000 (inclusive) using `BETWEEN`.
SELECT* FROM EMPLOYEES WHERE SALARY BETWEEN 40000 AND 60000;

#12. Display employees who joined between 1 Jan 2020 and 31 Dec 2021.
 SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN 2020-01-01 AND 2021-12-31;
 
 ## Section C: LIKE and NULL

#13. Display employees whose name starts with the letter `A`.
select * from employees where emp_name like 'a%';

#14. Display employees whose `job_title` contains the word `Manager`.
select * from employees where job_title like '%manager%';

#15. Display employees whose name has `a` as the second letter.
 select * from   employees where  emp_name like '_a%';

#16. Display employees who do not receive any commission. Then display those who do.
 select * from  employees where  commission not like 'null';
 
 
 ## Section D: Arithmetic, ORDER BY and LIMIT

#17. Display `emp_name`, `salary` and annual salary (salary x 12) as `annual_salary`.
select emp_name, salary*12 as annual_salary from employees;

#18. For employees in the Sales department, display `emp_name` and total monthly earning 
#(salary + commission) as `total_earning`. Treat missing commission as 0 (hint: `IFNULL`).


#19. Display all employees sorted by salary from highest to lowest.
 select * from employees order by salary desc;
 
#20. Display all employees sorted by `department` (A to Z) and, within each department, by `salary` (highest first).
select * from employees  order by department, salary desc;

#21. Display the 5 highest-paid employees.
select * from employees order by salary desc limit 5;

#22. Skip the first 2 highest-paid employees and display the next 3 (hint: `LIMIT offset, count`).
 select * from employees order by salary  desc limit 3  offset 2;
 
 ## Section E: Aggregate Functions, GROUP BY and HAVING

#23. Find the total number of employees.
select count(emp_name) from employees;

#24. Find the number of employees in each department.
select department,count(emp_name) from employees group by department;

#25. Find the average salary of each department, rounded to 2 decimal places.
SELECT department, ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department;

#26. Display departments that have **more than 3** employees.
select  department,count(emp_name) from employees    group by department  having department ;

#27. Display departments whose average salary is greater than 55000, sorted by average salary (highest first).
select department,avg(salary) as salary_a from employees   group by department   having salary_a>55000 order by salary_a;

#28. Considering only employees who joined **after 31 Dec 2019**, display departments where the maximum salary is greater than 60000, along with that maximum salary.
select  department,max(salary) as salary_m 
from employees where hire_date>'2019-12-31'
group by department having  salary_m >60000; 

#Section F: Challenge Questions

#29. Display employees who are based in Pune or Mumbai, earn more than 40000, and are **not** in the HR department. Sort by salary (highest first).
select * from employees where city in ('pune','mumbai') and salary >40000  and department !='hr' order by salary desc;

#30. Display `emp_name`, `salary` and a new column `salary_band` using `CASE`:
 #   - salary below 40000: `Low`
  #  - salary from 40000 to 70000: `Medium`
   # - salary above 70000: `High`
