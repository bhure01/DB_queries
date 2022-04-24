ubuntu@datta-bhure ~ $ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28-0ubuntu0.21.10.3 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+-------------------------+
| Database                |
+-------------------------+
| Address_Book_Service_DB |
| demo2                   |
| demodb                  |
| information_schema      |
| mysql                   |
| mysql_clauses           |
| newDB                   |
| payroll_service_db      |
| performance_schema      |
+-------------------------+
9 rows in set (0.03 sec)

mysql> create database foreign_key;
Query OK, 1 row affected (0.28 sec)

mysql> use foreign_key;
Database changed
mysql> CREATE TABLE customer (  
    ->   ID INT NOT NULL AUTO_INCREMENT,  
    ->   Name varchar(50) NOT NULL,  
    ->   City varchar(50) NOT NULL,  
    ->   PRIMARY KEY (ID)  
    -> );  
Query OK, 0 rows affected (1.34 sec)

mysql> CREATE TABLE contact (  
    ->   ID INT,  
    ->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,  
    ->   Type varchar(50) NOT NULL,  
    -> FOREIGN KEY (Customer_Id)  
    ->   REFERENCES customer(ID));
Query OK, 0 rows affected (1.14 sec)

mysql> CREATE TABLE contact1 ( ID INT,
    ->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,  
    ->   Type varchar(50) NOT NULL,  
    ->   INDEX par_ind (Customer_Id),  FOREIGN KEY (Customer_Id)  
    ->   REFERENCES customer(ID)  );
Query OK, 0 rows affected (1.67 sec)

mysql> CREATE TABLE contact2 (ID INT,
    ->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,  
    ->   Type varchar(50) NOT NULL,  
    ->   INDEX par_ind (Customer_Id),  
    ->   CONSTRAINT fk_customer FOREIGN KEY (Customer_Id)  
    ->   REFERENCES customer(ID)  );
Query OK, 0 rows affected (1.06 sec)

mysql> CREATE TABLE contact3 (ID INT,
    ->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,  
    ->   Type varchar(50) NOT NULL,  CONSTRAINT fk_customer FOREIGN KEY (Customer_Id)  
    ->   REFERENCES customer(ID)  );
ERROR 1826 (HY000): Duplicate foreign key constraint name 'fk_customer'
mysql> CREATE TABLE contact3 (ID INT,
    ->     ->   Customer_Id INT,  
    ->     ->   Customer_Info varchar(50) NOT NULL,
    -> Type varchar(50) NOT NULL,  CONSTRAINT fK_Customer FOREIGN KEY (Customer_Id)
    -> REFERENCES customer(ID)  );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,
Type varcha' at line 2
mysql> CREATE TABLE contact3 ( ID INT,
    ->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,  
    ->   Type varchar(50) NOT NULL,  
    -> CONSTRAINT fk_customerS FOREIGN KEY (Customer_Id)  REFERENCES customer(ID)  );
Query OK, 0 rows affected (2.78 sec)

mysql> CREATE TABLE contact4 (ID INT,
    ->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,  
    ->   Type varchar(50) NOT NULL,  
    ->   INDEX par_ind (Customer_Id),  
    ->   CONSTRAINT fk_customer FOREIGN KEY (Customer_Id)  
    ->   REFERENCES customer(ID)  
    ->   ON DELETE CASCADE  
    ->   ON UPDATE CASCADE  
    -> );  
ERROR 1826 (HY000): Duplicate foreign key constraint name 'fk_customer'
mysql> CREATE TABLE contact4 (ID INT,
    -> Customer_Id INT,  
    ->     ->   Customer_Info varchar(50) NOT NULL,  
    ->     ->   Type varchar(50) NOT NULL,  
    ->     ->   INDEX par_ind (Customer_Id),  
    ->     ->   CONSTRAINT fk_customer FOREIGN KEY (Customer_Id)  
    -> ^X

^C
mysql> CREATE TABLE contact4 (ID INT,
    ->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,  
    ->   Type varchar(50) NOT NULL,  
    ->   INDEX par_ind (Customer_Id),  CONSTRAINT fk_customerSS FOREIGN KEY (Customer_Id),
    ->  REFERENCES customer(ID)  
    ->   ON DELETE CASCADE  
    ->   ON UPDATE CASCADE  
    -> );  
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', 
 REFERENCES customer(ID)  
  ON DELETE CASCADE  
  ON UPDATE CASCADE  
)' at line 5
mysql> alter table contact rename to contact1;
ERROR 1050 (42S01): Table 'contact1' already exists
mysql> desc contact;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| ID            | int         | YES  |     | NULL    |       |
| Customer_Id   | int         | YES  | MUL | NULL    |       |
| Customer_Info | varchar(50) | NO   |     | NULL    |       |
| Type          | varchar(50) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc contact1;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| ID            | int         | YES  |     | NULL    |       |
| Customer_Id   | int         | YES  | MUL | NULL    |       |
| Customer_Info | varchar(50) | NO   |     | NULL    |       |
| Type          | varchar(50) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc contact2;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| ID            | int         | YES  |     | NULL    |       |
| Customer_Id   | int         | YES  | MUL | NULL    |       |
| Customer_Info | varchar(50) | NO   |     | NULL    |       |
| Type          | varchar(50) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> desc contact3;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| ID            | int         | YES  |     | NULL    |       |
| Customer_Id   | int         | YES  | MUL | NULL    |       |
| Customer_Info | varchar(50) | NO   |     | NULL    |       |
| Type          | varchar(50) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> desc contact4;
ERROR 1146 (42S02): Table 'foreign_key.contact4' doesn't exist
mysql> CREATE TABLE contact (  
    -> 

^C
mysql> CREATE TABLE contact4 (  
    ->   ID INT,  
    ->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,  
    ->   Type varchar(50) NOT NULL,  
    ->   INDEX par_ind (Customer_Id),  
    ->   CONSTRAINT fk_customer FOREIGN KEY (Customer_Id)  
    ->   REFERENCES customer(ID)  
    ->   ON DELETE CASCADE  
    ->   ON UPDATE CASCADE  
    -> ); 
ERROR 1826 (HY000): Duplicate foreign key constraint name 'fk_customer'
mysql> CREATE TABLE contact4 (  
    ->   ID INT,  
    ->   Customer_Id INT,  
    ->   Customer_Info varchar(50) NOT NULL,  
    ->   Type varchar(50) NOT NULL,  
    ->   INDEX par_ind (Customer_Id),  
    ->   CONSTRAINT fks_customer FOREIGN KEY (Customer_Id)  
    ->   REFERENCES customer(ID)  
    ->   ON DELETE CASCADE  
    ->   ON UPDATE CASCADE  
    -> );
Query OK, 0 rows affected (1.52 sec)

mysql> desc contact4;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| ID            | int         | YES  |     | NULL    |       |
| Customer_Id   | int         | YES  | MUL | NULL    |       |
| Customer_Info | varchar(50) | NO   |     | NULL    |       |
| Type          | varchar(50) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> INSERT INTO customer(Name, City) VALUES  
    -> ('Joseph', 'California'),  
    -> ('Mary', 'NewYork'),  
    -> ('John', 'Alaska');  
Query OK, 3 rows affected (0.13 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+----+--------+------------+
| ID | Name   | City       |
+----+--------+------------+
|  1 | Joseph | California |
|  2 | Mary   | NewYork    |
|  3 | John   | Alaska     |
+----+--------+------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO contact (Customer_Id, Customer_Info, Type) VALUES  
    -> (1, 'Joseph@javatpoint.com', 'email'),  
    -> (1, '121-121-121', 'work' ),  
    -> (1, '123-123-123', 'home'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, '212-212-212', 'work'),  
    -> (3, 'John@javatpoint.com', 'email'),  
    -> (3, '313-313-313', 'home');  
Query OK, 8 rows affected (0.16 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+----+--------+------------+
| ID | Name   | City       |
+----+--------+------------+
|  1 | Joseph | California |
|  2 | Mary   | NewYork    |
|  3 | John   | Alaska     |
+----+--------+------------+
3 rows in set (0.00 sec)

mysql> select * from contact;
+------+-------------+-----------------------+-------+
| ID   | Customer_Id | Customer_Info         | Type  |
+------+-------------+-----------------------+-------+
| NULL |           1 | Joseph@javatpoint.com | email |
| NULL |           1 | 121-121-121           | work  |
| NULL |           1 | 123-123-123           | home  |
| NULL |           2 | Mary@javatpoint.com   | email |
| NULL |           2 | Mary@javatpoint.com   | email |
| NULL |           2 | 212-212-212           | work  |
| NULL |           3 | John@javatpoint.com   | email |
| NULL |           3 | 313-313-313           | home  |
+------+-------------+-----------------------+-------+
8 rows in set (0.00 sec)

mysql> INSERT INTO contact1 (Customer_Id, Customer_Info, Type) VALUES  
    -> (1, 'Joseph@javatpoint.com', 'email'),  
    -> (1, '121-121-121', 'work' ),  
    -> (1, '123-123-123', 'home'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, '212-212-212', 'work'),  
    -> (3, 'John@javatpoint.com', 'email'),  
    -> (3, '313-313-313', 'home');  
Query OK, 8 rows affected (0.27 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO contact2 (Customer_Id, Customer_Info, Type) VALUES  
    -> (1, 'Joseph@javatpoint.com', 'email'),  
    -> (1, '121-121-121', 'work' ),  
    -> (1, '123-123-123', 'home'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, '212-212-212', 'work'),  
    -> (3, 'John@javatpoint.com', 'email'),  
    -> (3, '313-313-313', 'home');
Query OK, 8 rows affected (0.16 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO contact3 (Customer_Id, Customer_Info, Type) VALUES  
    -> (1, 'Joseph@javatpoint.com', 'email'),  
    -> (1, '121-121-121', 'work' ),  
    -> (1, '123-123-123', 'home'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, '212-212-212', 'work'),  
    -> (3, 'John@javatpoint.com', 'email'),  
    -> (3, '313-313-313', 'home');  
Query OK, 8 rows affected (0.11 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO contact4 (Customer_Id, Customer_Info, Type) VALUES  
    -> (1, 'Joseph@javatpoint.com', 'email'),  
    -> (1, '121-121-121', 'work' ),  
    -> (1, '123-123-123', 'home'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, 'Mary@javatpoint.com', 'email'),  
    -> (2, '212-212-212', 'work'),  
    -> (3, 'John@javatpoint.com', 'email'),  
    -> (3, '313-313-313', 'home'); 
Query OK, 8 rows affected (0.19 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from contact;
+------+-------------+-----------------------+-------+
| ID   | Customer_Id | Customer_Info         | Type  |
+------+-------------+-----------------------+-------+
| NULL |           1 | Joseph@javatpoint.com | email |
| NULL |           1 | 121-121-121           | work  |
| NULL |           1 | 123-123-123           | home  |
| NULL |           2 | Mary@javatpoint.com   | email |
| NULL |           2 | Mary@javatpoint.com   | email |
| NULL |           2 | 212-212-212           | work  |
| NULL |           3 | John@javatpoint.com   | email |
| NULL |           3 | 313-313-313           | home  |
+------+-------------+-----------------------+-------+
8 rows in set (0.00 sec)

mysql> DELETE FROM customer WHERE Name='John';  
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`foreign_key`.`contact1`, CONSTRAINT `contact1_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`ID`))
mysql> select * from customer;
+----+--------+------------+
| ID | Name   | City       |
+----+--------+------------+
|  1 | Joseph | California |
|  2 | Mary   | NewYork    |
|  3 | John   | Alaska     |
+----+--------+------------+
3 rows in set (0.00 sec)

mysql> select * from contact4;
+------+-------------+-----------------------+-------+
| ID   | Customer_Id | Customer_Info         | Type  |
+------+-------------+-----------------------+-------+
| NULL |           1 | Joseph@javatpoint.com | email |
| NULL |           1 | 121-121-121           | work  |
| NULL |           1 | 123-123-123           | home  |
| NULL |           2 | Mary@javatpoint.com   | email |
| NULL |           2 | Mary@javatpoint.com   | email |
| NULL |           2 | 212-212-212           | work  |
| NULL |           3 | John@javatpoint.com   | email |
| NULL |           3 | 313-313-313           | home  |
+------+-------------+-----------------------+-------+
8 rows in set (0.00 sec)

mysql> DELETE FROM customer WHERE Name='John'; 
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`foreign_key`.`contact1`, CONSTRAINT `contact1_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`ID`))
mysql> alter table contact drop foreign key;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SHOW CREATE TABLE contact;  
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table                                                                                                                                                                                                                                                                                                                                              |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| contact | CREATE TABLE `contact` (
  `ID` int DEFAULT NULL,
  `Customer_Id` int DEFAULT NULL,
  `Customer_Info` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)
 
