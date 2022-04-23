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
9 rows in set (0.05 sec)

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
| stud_detail      |
| student          |
| student_details  |
| student_info     |
| table1           |
| table_1          |
+------------------+
18 rows in set (0.01 sec)

mysql> create table primary_key1(id int auto_increment, name varchar(50), age int,address varchar(30),salary int);
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> create table primary_key1(id int, name varchar(50), age int,address varchar(30),salary int);
Query OK, 0 rows affected (0.67 sec)

mysql> create table primary_key2(id int primary key auto_increment,age int,address varchar(30),salary int);
Query OK, 0 rows affected (1.37 sec)

mysql> create table primary_key3(id int primary key,age int,address varchar(30),salary int,primary key(id,address));
ERROR 1068 (42000): Multiple primary key defined

mysql> create table primary_key3(id int primary key auto_increment,age int,address varchar(30),salary int,primary key(salary,address));
ERROR 1068 (42000): Multiple primary key defined
mysql> create table primary_key3(id int auto_increment,age int,address varchar(30),salary int,primary key(salary,address));
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> create table primary_key3(id int auto_increment,age int,address varchar(30),salary int,primary key(id,address));
Query OK, 0 rows affected (0.69 sec)

mysql> alter table primary_key3 drop primary key;
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> alter table primary_key2 drop primary key;
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> create table primary_key4(id int primary key ,age int,address varchar(30),salary int);
Query OK, 0 rows affected (1.07 sec)

mysql> alter table primary_key4 drop primary key;
Query OK, 0 rows affected (2.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table primary_key4 add primary key(age,salary);
Query OK, 0 rows affected (1.88 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc primary_key2;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| age     | int         | YES  |     | NULL    |                |
| address | varchar(30) | YES  |     | NULL    |                |
| salary  | int         | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> desc primary_key1;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | int         | YES  |     | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| age     | int         | YES  |     | NULL    |       |
| address | varchar(30) | YES  |     | NULL    |       |
| salary  | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc primary_key2;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| age     | int         | YES  |     | NULL    |                |
| address | varchar(30) | YES  |     | NULL    |                |
| salary  | int         | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> desc primary_key3;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| age     | int         | YES  |     | NULL    |                |
| address | varchar(30) | NO   | PRI | NULL    |                |
| salary  | int         | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> insert into primary_key2 values(1,30,'pune',10000);
Query OK, 1 row affected (0.14 sec)

mysql> insert into primary_key2 values(2,30,'pune',10000);
Query OK, 1 row affected (0.15 sec)

mysql> insert into primary_key2 values(3,40,'mumbai',12000);
Query OK, 1 row affected (0.15 sec)

mysql> insert into primary_key2 values(2,50,'chennai',11000);
ERROR 1062 (23000): Duplicate entry '2' for key 'primary_key2.PRIMARY'
 
mysql> select * from primary_key2;
+----+------+---------+--------+
| id | age  | address | salary |
+----+------+---------+--------+
|  1 |   30 | pune    |  10000 |
|  2 |   30 | pune    |  10000 |
|  3 |   40 | mumbai  |  12000 |
+----+------+---------+--------+
3 rows in set (0.00 sec)
 

