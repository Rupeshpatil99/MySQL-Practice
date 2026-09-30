-- DML DATA MANIPULATION LANGAUGE

SELECT * FROM  student_42;

# UPDATE---  replace name to other
 UPDATE student_42 SET FirstName = 'RAJ' WHERE ID = 1;
 
 
 SET SQL_SAFE_UPDATES = 0;

 UPDATE student_42 SET FirstName = 'RAJ' WHERE ID = 1;
SELECT * FROM student_42;

DELETE  FROM student_42 WHERE ID =1;