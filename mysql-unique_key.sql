ubuntu@datta-bhure ~ $ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
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
9 rows in set (0.00 sec)

mysql> use demodb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------+
| Tables_in_demodb |
+------------------+
| Persons          |
| ShirtBrands      |
| Student2         |
| Student3         |
| Student4         |
| abc              |
| def              |
| demo             |
| dress            |
| emp_detail       |
| goods            |
| pants            |
| primary_key1     |
| primary_key2     |
| primary_key3     |
| primary_key4     |
| stud_detail      |
| student          |
| student_details  |
| student_info     |
| table1           |
| table_1          |
+------------------+
22 rows in set (0.01 sec)

mysql> create table foreign_key1(id int,name varchar(50),age int,salary int, address varchar(50));
Query OK, 0 rows affected (1.66 sec)

mysql> create table unique_key1(id int,name varchar(50),age int,salary int, address varchar(50));
Query OK, 0 rows affected (0.80 sec)

mysql> create table unique_key2(id int,name varchar(50),age int,salary int, address varchar(50) unique);
Query OK, 0 rows affected (1.55 sec)

mysql> create table unique_key3(id int,name varchar(50),age int,salary int, address varchar(50), unique(id,address));
Query OK, 0 rows affected (2.07 sec)

mysql> desc unique_key1;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | int         | YES  |     | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| age     | int         | YES  |     | NULL    |       |
| salary  | int         | YES  |     | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc unique_key2;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | int         | YES  |     | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| age     | int         | YES  |     | NULL    |       |
| salary  | int         | YES  |     | NULL    |       |
| address | varchar(50) | YES  | UNI | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> desc unique_key3;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | int         | YES  | MUL | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| age     | int         | YES  |     | NULL    |       |
| salary  | int         | YES  |     | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> create table unique_key4(id int,name varchar(50),age int,salary int, address varchar(50), unique(id,address));
Query OK, 0 rows affected (1.34 sec)

mysql> desc unique_key4;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | int         | YES  | MUL | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| age     | int         | YES  |     | NULL    |       |
| salary  | int         | YES  |     | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into unique_key3 values(1,'datta',30,1000,'pune');
Query OK, 1 row affected (0.17 sec)

mysql> insert into unique_key3 values(2,'datta',30,1000,'pune');
Query OK, 1 row affected (0.14 sec)

mysql> insert into unique_key3 values(1,'datta',30,1000,'mumbai');
Query OK, 1 row affected (0.12 sec)

mysql> select * from unique_key3;
+------+-------+------+--------+---------+
| id   | name  | age  | salary | address |
+------+-------+------+--------+---------+
|    1 | datta |   30 |   1000 | pune    |
|    2 | datta |   30 |   1000 | pune    |
|    1 | datta |   30 |   1000 | mumbai  |
+------+-------+------+--------+---------+
3 rows in set (0.00 sec)

mysql> create table unique_key5(Stud_ID int NOT NULL UNIQUE,
    ->     Name varchar(45),   
    ->     Email varchar(45),  
    ->     Age int,   
    ->     City varchar(25)  
    -> );  
Query OK, 0 rows affected (1.46 sec)

mysql> INSERT INTO unique_key5(Stud_ID, Name, Email, Age, City)  VALUES (1, 'Peter', 'peter@javatpoint.com', 22, 'Texas'),  
    -> (2, 'Suzi', 'suzi@javatpoint.com', 24, 'California'),  
    -> (3, 'Joseph', 'joseph@javatpoint.com', 23, 'Alaska');  
Query OK, 3 rows affected (0.25 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO unique_key5(Stud_ID, Name, Email, Age, City)  VALUES (1, 'Stephen', 'stephen@javatpoint.com', 22, 'Texas'); 
ERROR 1062 (23000): Duplicate entry '1' for key 'unique_key5.Stud_ID'
mysql> select * from unique_key5;
+---------+--------+-----------------------+------+------------+
| Stud_ID | Name   | Email                 | Age  | City       |
+---------+--------+-----------------------+------+------------+
|       1 | Peter  | peter@javatpoint.com  |   22 | Texas      |
|       2 | Suzi   | suzi@javatpoint.com   |   24 | California |
|       3 | Joseph | joseph@javatpoint.com |   23 | Alaska     |
+---------+--------+-----------------------+------+------------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE unique_key6(Stud_ID int,   
    ->     Roll_No int,  
    ->     Name varchar(45) NOT NULL,   
    ->     Email varchar(45),  
    ->     Age int,   
    ->     City varchar(25),  
    ->     CONSTRAINT uc_rollno_email Unique(Roll_No, Email)  
    -> );  
Query OK, 0 rows affected (0.87 sec)

mysql> SHOW INDEX FROM unique_key6;
+-------------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table       | Non_unique | Key_name        | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| unique_key6 |          0 | uc_rollno_email |            1 | Roll_No     | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| unique_key6 |          0 | uc_rollno_email |            2 | Email       | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-------------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.18 sec)
