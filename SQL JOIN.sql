use books;


# inner join

 SELECT * FROM movies
 INNER JOIN members 
 ON movies.id = members.movieid;
 
 
 
 # LEFT JOIN
 SELECT * FROM movies
 LEFT JOIN members 
 ON movies.id = members.movieid;
  
  # RIGHT JOIN  
 SELECT * FROM movies
 RIGHT JOIN members
 ON movies.id = members.movieid;
 
 
# NULL VALUES OF MOVIES
 SELECT * FROM movies 
 LEFT  JOIN members 
 ON movies.id = members.movieid 
 WHERE MOVIES.ID IS NULL;

# only show  movies rented
CREATE TABLE inner_join AS
SELECT * FROM movies 
INNER JOIN members 
ON movies.id = members.movieid;

SELECT * FROM inner_join;


#FULL OUTER JOIN
  SELECT * FROM movies LEFT  JOIN members ON movies.id = members.movieid
  UNION
  SELECT * FROM movies RIGHT JOIN members ON movies.id = members.movieid;
  
 #EXAMPLE
SELECT * FROM authors inner join  books ON authors.authorid = books.authorid;
SELECT * FROM authors left join   books ON authors.authorid = books.authorid;
SELECT * FROM authors right  join  books ON authors.authorid = books.authorid;

SELECT * FROM authors left join   books ON authors.authorid = books.authorid
union
SELECT * FROM authors right  join  books ON authors.authorid = books.authorid;


# cross join 
use books;

select * from meals;
select * from drinks;

select * from drinks cross join meals;

select drinkname,mealname,drinks.rate+meals.rate  as total from drinks cross join meals;


# self join
select * from myemp;
SELECT emp.first_name AS EMPLOYEE,mgr.first_name AS MANAGER
FROM myemp AS emp JOIN myemp as mgr
ON  EMP.MGR_ID = MGR.EMP_ID;
# DISPLAY  SAME TABLES WITH TWO TABLE DIFFERENT NAME
# FROM OUR ORIGNAL TABLE  
# THEN JOIN TEMPORY TABLE USING INNER JOIN
# FIRST TEMP TABLE ON OTHER FORGIEN KEY = SECOND TABLE  PRIMARY KEY

#COUNT OF EMPLOYEES UNDER EACH MANAGER
 SELECT MGR.FIRST_NAME AS MANAGERS ,COUNT(EMP.FIRST_NAME) AS COUNT_EMP
 FROM MYEMP AS EMP JOIN MYEMP AS MGR
 ON MGR.EMP_ID=EMP.MGR_ID GROUP BY MANAGERS;



#EXAMPLE
CREATE TABLE p (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    Related_Product_ID INT
);

INSERT INTO p VALUES
(101, 'Laptop Bag',       'Accessories', 1200, 102),
(102, 'Wireless Mouse',   'Accessories', 800, 103),
(103, 'Keyboard',         'Accessories', 1500, 104),
(104, 'Laptop Stand',     'Accessories', 1800, 101),
(105, 'iPhone 15',        'Mobile',      65000, 106),
(106, 'AirPods',          'Mobile',      18000, 107),
(107, 'Phone Cover',      'Mobile',      800, 105),
(108, 'Samsung Galaxy',   'Mobile',      55000, 109),
(109, 'Smart Watch',      'Wearables',   12000, 110),
(110, 'Fitness Band',     'Wearables',   5000, 109);



SELECT * FROM P;

SELECT PRO.PRODUCT_NAME ,RELATED.PRODUCT_NAME 
AS RELATED_PRPDUCT FROM P AS PRO JOIN P AS RELATED
ON PRO.RELATED_PRODUCT_ID = RELATED.PRODUCT_ID;


