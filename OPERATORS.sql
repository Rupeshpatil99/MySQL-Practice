-- OPERATOR
USE B042;


select* from cost;

select program from cost;
SELECT PROGRAM,CITY FROM COST;

SELECT TUITION_USD+RENT_USD+VISA_FEE_USD+INSURANCE_USD FROM COST;

-- USE AS TO TEMPORY PRINT THE COLUMN NAME
SELECT TUITION_USD+RENT_USD+VISA_FEE_USD+INSURANCE_USD AS TOTAL_COST FROM COST;

#----------------------------------------------->

-- LIMIT CLAUSE
SELECT * FROM COST LIMIT 5;

-- ORDER BY  CLAUSE

SELECT * FROM COST ORDER BY TUITION_USD;
SELECT * FROM COST ORDER BY TUITION_USD DESC;

#LIMIT WITH AN OFFSET
#FIND OUT SECOND HIGHEST LIVING COST INDEX DATA
#OFFSET ---->  SKIP THE ROW

SELECT * FROM COST ORDER BY LIVING_COST_INDEX DESC LIMIT 3 OFFSET 1;
SELECT * FROM COST ORDER BY LIVING_COST_INDEX DESC LIMIT 1 OFFSET 2;

#distinct  ------>  for print  unique data in columns   REMOVE DUPLICATE  NAME

SELECT DISTINCT(PROGRAM) FROM COST;
SELECT DISTINCT(UNIVERSITY) FROM COST;


-- WHERE  CLAUSE-----
#select students who taken computer sciences
SELECT * FROM COST  WHERE PROGRAM = 'COMPUTER SCIENCE';
SELECT * FROM COST  WHERE TUITION_USD >= 30000;
SELECT *FROM COST WHERE PROGRAM = 'DATA SCIENCE' AND TUITION_USD>= 30000;

#task
#find students who is from paris and thier living cost is more that 70
SELECT * FROM COST WHERE CITY = 'PARIS' AND  LIVING_COST_INDEX>=70;

# GROUPBY   AND AGGRGATE FUNCTION

SELECT DISTINCT(LEVEL) FROM COST;
SELECT AVG(TUITION_USD) FROM COST;
SELECT MIN(TUITION_USD), MAX(TUITION_USD),SUM(TUITION_USD) FROM COST;

-- GROUPBY
SELECT LEVEL,AVG(TUITION_USD) FROM COST GROUP BY LEVEL;

#muiltple columns using group by
# fro each program and for each level calculate average duration
select program,level,avg(duration_years) from cost group by program,level;

SELECT country,avg(living_cost_index) from cost group by country 
                                     having country = 'Australia';

select *from cost;
#  where clause  ----   used  before the groupby function in query
#  having clause ----   used after and only with group by function

SELECT country,avg(living_cost_index) from cost where country = 'Australia'group by country ;

#find out average tuition fee from usa but only for master level
select* from cost where country ='usa';
SELECT level,avg(tuition_usd) from cost where country = 'usa'group by level having level= 'master' ;

#find max duration from atlanta city for computer science program

select program,max(duration_years) from cost where city ='atlanta' 
                                             group by program 
                                             having program = 'Computer Science';
                                             
#---------------------------------------------------------------------------------------------------------

#pattern/special operators
#(between,in,like)
select*from cost;
select * from cost where  country ='usa' or country = 'uk'or country = 'australia';
select* from cost where country in('usa','uk','australia');

select* from cost where country not in('usa','uk','australia');

select *from cost where Duration_Years>2  ;

#-------------------------------------------------------------------------------------------------------------
#BETWEEN
#filter the data where tuition usd is between 30k to 50k
SELECT* FROM COST WHERE TUITION_USD BETWEEN 30000 AND 50000;
SELECT* FROM COST WHERE TUITION_USD NOT BETWEEN 30000 AND 50000;

#------------------------------------------------------------------------------------------------------------

#LIKE/NOT LIKE(PATTERN MATCHING)

#FILTER ALL UNIVERSITY NAMES WHERE IT START WITH WORD UNIVERSITY
#WILDCARD OPERATOR(%,_)
SELECT *FROM COST                                         ;
SELECT *FROM COST WHERE UNIVERSITY LIKE "UNIVERSITY%"     ;
SELECT *FROM COST WHERE UNIVERSITY LIKE "%UNIVERSITY"     ;
SELECT *FROM COST WHERE UNIVERSITY LIKE "%UNIVERSITY%"    ;
SELECT *FROM COST WHERE UNIVERSITY NOT LIKE "%UNIVERSITY%";

SELECT *FROM COST WHERE COUNTRY    LIKE  'U%'  ;
SELECT *FROM COST WHERE COUNTRY    LIKE  'U_'  ;
SELECT *FROM COST WHERE COUNTRY    LIKE  'U__' ;





#QUSTION TO SOLVE
#get the data only for data science
select * from cost where program = 'data science';

# filter the data where level is master and fee are more than 50k
select * from cost where tuition_usd> 50000 and level = 'master';

# usa university name where exchange rate is more than 50
select * from cost 
where Exchange_Rate>50 AND UNIVERSITY= 'USA';

# FIND AVERAGE VISA_ FESS AS PER EACH COUNTRY
SELECT COUNTRY,AVG(VISA_FEE_USD) FROM COST GROUP BY COUNTRY;

SELECT LEVEL,UNIVERSITY,MIN(TUITION_USD),MAX(TUITION_USD),AVG(TUITION_USD) 
FROM COST WHERE LEVEL= 'PHD' GROUP BY UNIVERSITY HAVING UNIVERSITY= ' HARVARD UNIVERSITY';

#FILTER DATA  WHERE RENT IS BETWEEN 1000 TO 2000.
SELECT * FROM COST WHERE  RENT_USD BETWEEN 1000 AND 2000;
# FILTER DATA FOR ONLY COMPUTER SCIENCE AND DATA SCINECE
SELECT * FROM COST 
WHERE PROGRAM LIKE '%SCIENCE';
# FILTER DATA WHERE PROGRAM NAME START WITH  A 
SELECT* FROM COST WHERE PROGRAM LIKE '%A';