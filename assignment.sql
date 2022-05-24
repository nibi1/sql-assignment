show databases;
use assignment;
CREATE TABLE SALESPEOPLE (
    SNUM INT PRIMARY KEY,
    SNAME VARCHAR(100),
    UNIQUE (SNAME),
    CITY VARCHAR(50),
    COMM FLOAT
);
ALTER TABLE SALESPEOPLE MODIFY COLUMN comm int;
DESC SALESPEOPLE;
SELECT 
    *
FROM
    SALESPEOPLE;
INSERT INTO SALESPEOPLE values (1001 ,'Peel','London' ,12);
INSERT INTO SALESPEOPLE values (1002,'Serres', 'Sanjose', 13), (1004 ,'Motika','London', 11), (1007, 'Rifkin', 'Barcelona', 15), (1003, 'Axelrod', 'Newyork', 10);
CREATE TABLE Customers (
    CNUM INT PRIMARY KEY,
    CNAME VARCHAR(100),
    CITY VARCHAR(50) NOT NULL,
    SNUM INT,
    FOREIGN KEY (SNUM)
        REFERENCES SALESPEOPLE (SNUM)
);
#describe the data structure of customer table
DESC Customers;
#insert value into customers table
insert into Customers  values
(2001, 'Hoffman', 'London', 1001),
(2002, 'Giovanni','Rome',1003),
(2003, 'Liu','Sanjose', 1002),
(2004, 'Grass','Berlin', 1002),
(2006, 'Clemens','London', '1001'),
(2008, 'Cisneros',  'Sanjose', 1007),
(2007, 'Pereira', 'Rome' ,1004);
SELECT 
    *
FROM
    Customers;
CREATE TABLE Orders (
    ONUM INT PRIMARY KEY,
    AMT FLOAT,
    ODATE DATE,
    CNUM INT,
    SNUM INT,
    FOREIGN KEY (CNUM)
        REFERENCES CUSTOMERS (CNUM),
    FOREIGN KEY (SNUM)
        REFERENCES SALESPEOPLE (SNUM)
);
#describe the data structure of orders table
DESC Orders;

# insert into orders table
INSERT INTO ORDERS values
(3001, 18.69,STR_TO_DATE("03-10-1990","%d-%m-%Y"), 2008, 1007),
(3003,767.19, STR_TO_DATE("03-10-1990","%d-%m-%Y"),2001,1001),
(3002,1900.10, STR_TO_DATE("03-10-1990","%d-%m-%Y"),2007,1004),
(3005,5160.45, STR_TO_DATE("03-10-1990","%d-%m-%Y"),2003,1002),
(3006,1098.16, STR_TO_DATE("03-10-1990","%d-%m-%Y"),2008,1007),
(3009,1713.23, STR_TO_DATE("04-10-1990","%d-%m-%Y"),2002,1003),
(3007,75.75, STR_TO_DATE("04-10-1990","%d-%m-%Y"),2004,1002),
(3008,4273.00, STR_TO_DATE("05-10-1990","%d-%m-%Y"),2006,1001),
(3010,1309.95, STR_TO_DATE("06-10-1990","%d-%m-%Y"),2004,1002),
(3011,9891.88, STR_TO_DATE("06-10-1990","%d-%m-%Y"),2006,1001);
SELECT 
    *
FROM
    orders;
SELECT 
    COUNT(*)
FROM
    salespeople
WHERE
    Sname LIKE 'a%';
SELECT 
    COUNT(*)
FROM
    salespeople
WHERE
    city = 'Newyork';
SELECT 
    COUNT(*)
FROM
    salespeople
WHERE
    city IN ('London' , 'Paris');
SELECT 
    t1.snum,
    t.sname AS 'seller name',
    t1.amt AS 'order_amount',
    t1.odate AS 'ordered date'
FROM
    salespeople AS t,
    Orders AS t1
WHERE
    t.snum = t1.snum AND t1.amt > 2000;
    
SELECT 
    COUNT(*) AS 'NO OF ORDER TAKEN',
    t1.snum,
    t.sname AS 'seller name',
    t1.odate AS 'ordered date'
FROM
    salespeople AS t,
    Orders AS t1
WHERE
    t.snum = t1.snum
GROUP BY T1.SNUM , ODATE;
