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
9 rows in set (0.04 sec)

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
| pants            |
| student          |
| table1           |
| table_1          |
+------------------+
12 rows in set (0.00 sec)

mysql> create table student_details(id int, name varchar(50),fees int NOT NULL, age int);
Query OK, 0 rows affected (1.50 sec)

mysql> desc student_details;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
| fees  | int         | NO   |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into student_details values(1,'bharat',5000,15),(2,'rohit',NULL,12),(3,'ram',18);
ERROR 1136 (21S01): Column count doesn't match value count at row 3
mysql> insert into student_details values(1,'bharat',5000,15),(2,'rohit',NULL,12),(3,'ram',2000,18);
ERROR 1048 (23000): Column 'fees' cannot be null
mysql> insert into student_details values(1,'bharat',5000,15),(2,'rohit',6000,12);
Query OK, 2 rows affected (0.14 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from student_details;
+------+--------+------+------+
| id   | name   | fees | age  |
+------+--------+------+------+
|    1 | bharat | 5000 |   15 |
|    2 | rohit  | 6000 |   12 |
+------+--------+------+------+
2 rows in set (0.00 sec)

mysql> alter table student_details add column salary int,add column sur_name varchar(25);
Query OK, 0 rows affected (0.94 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into student_details(salary,sur_name) values(1000,'sharma','kohli');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> desc student_details;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int         | YES  |     | NULL    |       |
| name     | varchar(50) | YES  |     | NULL    |       |
| fees     | int         | NO   |     | NULL    |       |
| age      | int         | YES  |     | NULL    |       |
| salary   | int         | YES  |     | NULL    |       |
| sur_name | varchar(25) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> insert into student_details values(1,'krishna',2000,21,15000,'patel');
Query OK, 1 row affected (0.10 sec)

mysql> create table stud_detail(id int primary key,age int UNIQUE,salary int,city varchar(50) UNIQUE);
Query OK, 0 rows affected (1.35 sec)

mysql> desc stud_detail;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | NO   | PRI | NULL    |       |
| age    | int         | YES  | UNI | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
| city   | varchar(50) | YES  | UNI | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into stud_detail(id,age,salary,city) values(1,20,7500,'pune');
Query OK, 1 row affected (0.08 sec)

mysql> insert into stud_detail(id,age,salary,city) values(2,20,7500,'pune'),(3,22,8000,'mumbai');
ERROR 1062 (23000): Duplicate entry '20' for key 'stud_detail.age'
mysql> select * from stud_detail;
+----+------+--------+------+
| id | age  | salary | city |
+----+------+--------+------+
|  1 |   20 |   7500 | pune |
+----+------+--------+------+
1 row in set (0.00 sec)

mysql> insert into stud_detail(id,age,salary,city) values(2,20,7500,'pune');
ERROR 1062 (23000): Duplicate entry '20' for key 'stud_detail.age'
mysql> insert into stud_detail(id,age,salary,city) values(2,18,7500,'mumbai');
Query OK, 1 row affected (0.13 sec)

mysql> select * from stud_detail;
+----+------+--------+--------+
| id | age  | salary | city   |
+----+------+--------+--------+
|  1 |   20 |   7500 | pune   |
|  2 |   18 |   7500 | mumbai |
+----+------+--------+--------+
2 rows in set (0.00 sec)

mysql> create table emp_detail(id int primary key, name varchar(50) not null,age int check(age>20));
Query OK, 0 rows affected (1.23 sec)

mysql> desc emp_detail;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | NO   | PRI | NULL    |       |
| name  | varchar(50) | NO   |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into emp_detail values(1,'shaalu',40);
Query OK, 1 row affected (0.13 sec)

mysql> insert into emp_detail values(2,'kanta',28),(3,'reshma',21);
Query OK, 2 rows affected (0.10 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into emp_detail values(4,'prakash',18);
ERROR 3819 (HY000): Check constraint 'emp_detail_chk_1' is violated.
mysql> insert into emp_detail values(4,'prakash',20);
ERROR 3819 (HY000): Check constraint 'emp_detail_chk_1' is violated.
mysql> insert into emp_detail values(4,'prakash',21);
Query OK, 1 row affected (0.12 sec)

mysql> select * from emp_details;
ERROR 1146 (42S02): Table 'demodb.emp_details' doesn't exist
mysql> select * from emp_detail;
+----+---------+------+
| id | name    | age  |
+----+---------+------+
|  1 | shaalu  |   40 |
|  2 | kanta   |   28 |
|  3 | reshma  |   21 |
|  4 | prakash |   21 |
+----+---------+------+
4 rows in set (0.00 sec)

mysql> create table goods(id int primary key auto_increment, name varchar(30),rate int);
Query OK, 0 rows affected (1.23 sec)

mysql> insert into goods values(1,'joggery',200),(2,'mirchi',500);
Query OK, 2 rows affected (0.15 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into goods values(1,'masala',200);
ERROR 1062 (23000): Duplicate entry '1' for key 'goods.PRIMARY'
mysql> create table student_info(id int auto_increment, name varchar(50),address varchar(50) default 'pune');
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> create table student_info(id int auto_increment, name varchar(50),address varchar(50) default 'pune',primary key(id));
Query OK, 0 rows affected (0.76 sec)

mysql> insert into student_info(id,name,address) values(1,'bharat','mumbai'),(2,'arjun','pune');
Query OK, 2 rows affected (0.14 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> create table dress(id int primary key auto_increment,name varchar(50), size enum('small','medium','large'));
Query OK, 0 rows affected (1.51 sec)

mysql> insert into dress values(1,'kurta','medium');
Query OK, 1 row affected (0.10 sec)

mysql> insert into dress values(2,'kurta','small');
Query OK, 1 row affected (0.11 sec)

mysql> insert into dress values(3,'shirt','xxx');
ERROR 1265 (01000): Data truncated for column 'size' at row 1
mysql> insert into dress values(3,'shirt','large');
Query OK, 1 row affected (0.10 sec)

mysql> select * from dress;
+----+-------+--------+
| id | name  | size   |
+----+-------+--------+
|  1 | kurta | medium |
|  2 | kurta | small  |
|  3 | shirt | large  |
+----+-------+--------+
3 rows in set (0.00 sec)
