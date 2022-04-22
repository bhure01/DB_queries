ubuntu@datta-bhure ~ $ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
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
| payroll_service_db      |
| performance_schema      |
+-------------------------+
8 rows in set (0.00 sec)

mysql> create database newdb;
Query OK, 1 row affected (0.21 sec)

mysql> drop database newdb;
Query OK, 0 rows affected (0.20 sec)

mysql> create database newDB;
Query OK, 1 row affected (0.19 sec)

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

mysql> use newDB;
Database changed
mysql> show tables;
Empty set (0.01 sec)

mysql> create table practice(id int primary key auto_increment, name varchar(50),occupation varchar(50),city varchar(10),salary int,joining_date date);
Query OK, 0 rows affected (0.88 sec)

mysql> desc practice;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| id           | int         | NO   | PRI | NULL    | auto_increment |
| name         | varchar(50) | YES  |     | NULL    |                |
| occupation   | varchar(50) | YES  |     | NULL    |                |
| city         | varchar(10) | YES  |     | NULL    |                |
| salary       | int         | YES  |     | NULL    |                |
| joining_date | date        | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
6 rows in set (0.01 sec)

mysql> create table demo(id int auto_increment, age int, address varchar(20), primary key(id,age));
Query OK, 0 rows affected (0.65 sec)

mysql> show tables;
+-----------------+
| Tables_in_newDB |
+-----------------+
| demo            |
| practice        |
+-----------------+
2 rows in set (0.01 sec)

mysql> drop table demo;
Query OK, 0 rows affected (0.55 sec)

mysql> insert into practice(id,name,occupation,city,salary,joining_date) values(1,'subbu','bussiness','pune',2000,'2018-05-12')
    -> ;
Query OK, 1 row affected (0.15 sec)

mysql> insert into practice(id,name,occupation,city,salary,joining_date) values(2,'ganesh','lawyer','pune',4000,'2017-7-12'),(3,'sawle','student','chennai',5000,'2020-03-25');
Query OK, 2 rows affected (0.15 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> desc practice;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| id           | int         | NO   | PRI | NULL    | auto_increment |
| name         | varchar(50) | YES  |     | NULL    |                |
| occupation   | varchar(50) | YES  |     | NULL    |                |
| city         | varchar(10) | YES  |     | NULL    |                |
| salary       | int         | YES  |     | NULL    |                |
| joining_date | date        | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> insert into practice values(4,'akash','lawyer','pune',5000,'2021-07-12');
Query OK, 1 row affected (0.10 sec)

mysql> insert into practice values(5,'rohit','teacher','chennai',8000,'2022-08-24'),(6,'sharma','player','mumbai',7500,'2020-7-12');
Query OK, 2 rows affected (0.16 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from practice;
+----+--------+------------+---------+--------+--------------+
| id | name   | occupation | city    | salary | joining_date |
+----+--------+------------+---------+--------+--------------+
|  1 | subbu  | bussiness  | pune    |   2000 | 2018-05-12   |
|  2 | ganesh | lawyer     | pune    |   4000 | 2017-07-12   |
|  3 | sawle  | student    | chennai |   5000 | 2020-03-25   |
|  4 | akash  | lawyer     | pune    |   5000 | 2021-07-12   |
|  5 | rohit  | teacher    | chennai |   8000 | 2022-08-24   |
|  6 | sharma | player     | mumbai  |   7500 | 2020-07-12   |
+----+--------+------------+---------+--------+--------------+
6 rows in set (0.00 sec)

mysql> select id,name from practice;
+----+--------+
| id | name   |
+----+--------+
|  1 | subbu  |
|  2 | ganesh |
|  3 | sawle  |
|  4 | akash  |
|  5 | rohit  |
|  6 | sharma |
+----+--------+
6 rows in set (0.00 sec)

mysql> select salary from practice where id=5;
+--------+
| salary |
+--------+
|   8000 |
+--------+
1 row in set (0.00 sec)

mysql> select city from practice where city='pune' and name='rohit';
Empty set (0.00 sec)

mysql> select city from practice where city='pune' and name='subbu';
+------+
| city |
+------+
| pune |
+------+
1 row in set (0.00 sec)

mysql> select city from practice where occupation='lawyer' or salary>5000;
+---------+
| city    |
+---------+
| pune    |
| pune    |
| chennai |
| mumbai  |
+---------+
4 rows in set (0.00 sec)

mysql> select salary from practice where joining_date between cast('2020-03-25' as date) and date (now());
+--------+
| salary |
+--------+
|   5000 |
|   5000 |
|   7500 |
+--------+
3 rows in set (0.01 sec)

mysql> select salary from practice where joining_date between cast('2020-03-25' as date) and cast('2018-05-12' as date);
Empty set (0.00 sec)

mysql> alter table practice add gender char(1) after salary;
Query OK, 0 rows affected (1.86 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table practice add mstatus varchar(20), add relationship varchar(50);
Query OK, 0 rows affected (0.49 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc practice;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| id           | int         | NO   | PRI | NULL    | auto_increment |
| name         | varchar(50) | YES  |     | NULL    |                |
| occupation   | varchar(50) | YES  |     | NULL    |                |
| city         | varchar(10) | YES  |     | NULL    |                |
| salary       | int         | YES  |     | NULL    |                |
| gender       | char(1)     | YES  |     | NULL    |                |
| joining_date | date        | YES  |     | NULL    |                |
| mstatus      | varchar(20) | YES  |     | NULL    |                |
| relationship | varchar(50) | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
9 rows in set (0.01 sec)

mysql> alter table practice drop relationship;
Query OK, 0 rows affected (1.94 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update practice set gender='m';
Query OK, 6 rows affected (0.16 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from practice;
+----+--------+------------+---------+--------+--------+--------------+---------+
| id | name   | occupation | city    | salary | gender | joining_date | mstatus |
+----+--------+------------+---------+--------+--------+--------------+---------+
|  1 | subbu  | bussiness  | pune    |   2000 | m      | 2018-05-12   | NULL    |
|  2 | ganesh | lawyer     | pune    |   4000 | m      | 2017-07-12   | NULL    |
|  3 | sawle  | student    | chennai |   5000 | m      | 2020-03-25   | NULL    |
|  4 | akash  | lawyer     | pune    |   5000 | m      | 2021-07-12   | NULL    |
|  5 | rohit  | teacher    | chennai |   8000 | m      | 2022-08-24   | NULL    |
|  6 | sharma | player     | mumbai  |   7500 | m      | 2020-07-12   | NULL    |
+----+--------+------------+---------+--------+--------+--------------+---------+
6 rows in set (0.00 sec)

mysql> update practice set gender='f' where id=4;
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update practice set gender='f' where city='pune' or salary=7500;
Query OK, 3 rows affected (0.16 sec)
Rows matched: 4  Changed: 3  Warnings: 0

mysql> select * from practice;
+----+--------+------------+---------+--------+--------+--------------+---------+
| id | name   | occupation | city    | salary | gender | joining_date | mstatus |
+----+--------+------------+---------+--------+--------+--------------+---------+
|  1 | subbu  | bussiness  | pune    |   2000 | f      | 2018-05-12   | NULL    |
|  2 | ganesh | lawyer     | pune    |   4000 | f      | 2017-07-12   | NULL    |
|  3 | sawle  | student    | chennai |   5000 | m      | 2020-03-25   | NULL    |
|  4 | akash  | lawyer     | pune    |   5000 | f      | 2021-07-12   | NULL    |
|  5 | rohit  | teacher    | chennai |   8000 | m      | 2022-08-24   | NULL    |
|  6 | sharma | player     | mumbai  |   7500 | f      | 2020-07-12   | NULL    |
+----+--------+------------+---------+--------+--------+--------------+---------+
6 rows in set (0.00 sec)

mysql> delete from practice where id=6 or occupation='lawyer';
Query OK, 3 rows affected (0.13 sec)

mysql> select * from practice;
+----+-------+------------+---------+--------+--------+--------------+---------+
| id | name  | occupation | city    | salary | gender | joining_date | mstatus |
+----+-------+------------+---------+--------+--------+--------------+---------+
|  1 | subbu | bussiness  | pune    |   2000 | f      | 2018-05-12   | NULL    |
|  3 | sawle | student    | chennai |   5000 | m      | 2020-03-25   | NULL    |
|  5 | rohit | teacher    | chennai |   8000 | m      | 2022-08-24   | NULL    |
+----+-------+------------+---------+--------+--------+--------------+---------+
3 rows in set (0.00 sec)

mysql> insert into practice values(6,'rohit','teacher','mysore',8500,'m','2022-08-24','yes'),(7,'pandey','player','mumbai',7500,'m','2020-7-12
','no');
Query OK, 2 rows affected (0.14 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from practice;
+----+--------+------------+---------+--------+--------+--------------+---------+
| id | name   | occupation | city    | salary | gender | joining_date | mstatus |
+----+--------+------------+---------+--------+--------+--------------+---------+
|  1 | subbu  | bussiness  | pune    |   2000 | f      | 2018-05-12   | NULL    |
|  3 | sawle  | student    | chennai |   5000 | m      | 2020-03-25   | NULL    |
|  5 | rohit  | teacher    | chennai |   8000 | m      | 2022-08-24   | NULL    |
|  6 | rohit  | teacher    | mysore  |   8500 | m      | 2022-08-24   | yes     |
|  7 | pandey | player     | mumbai  |   7500 | m      | 2020-07-12   | no      |
+----+--------+------------+---------+--------+--------+--------------+---------+
5 rows in set (0.00 sec)

mysql> select count(name) from practice;
+-------------+
| count(name) |
+-------------+
|           5 |
+-------------+
1 row in set (0.00 sec)

mysql> select count(*) from practice where salary>5000;
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

mysql> select count(distinct name) from practice;
+----------------------+
| count(distinct name) |
+----------------------+
|                    4 |
+----------------------+
1 row in set (0.00 sec)

mysql> select sum(salary) from practice;
+-------------+
| sum(salary) |
+-------------+
|       31000 |
+-------------+
1 row in set (0.00 sec)

mysql> select avg(salary) as "Average Salary"  from practice;
+----------------+
| Average Salary |
+----------------+
|      6200.0000 |
+----------------+
1 row in set (0.00 sec)

mysql> select min(salary) as "minimum Salary"  from practice;
+----------------+
| minimum Salary |
+----------------+
|           2000 |
+----------------+
1 row in set (0.00 sec)

mysql> select max(salary) as "minimum Salary"  from practice;
+----------------+
| minimum Salary |
+----------------+
|           8500 |
+----------------+
1 row in set (0.00 sec)

mysql> select name from practice order by id desc limit 1;
+--------+
| name   |
+--------+
| pandey |
+--------+
1 row in set (0.00 sec)

mysql> select joining_date from practice order by id asc limit 2;
+--------------+
| joining_date |
+--------------+
| 2018-05-12   |
| 2020-03-25   |
+--------------+
2 rows in set (0.00 sec)

mysql> select city from practice limit 3;
+---------+
| city    |
+---------+
| pune    |
| chennai |
| chennai |
+---------+
3 rows in set (0.00 sec)

mysql> select * from practice;
+----+--------+------------+---------+--------+--------+--------------+---------+
| id | name   | occupation | city    | salary | gender | joining_date | mstatus |
+----+--------+------------+---------+--------+--------+--------------+---------+
|  1 | subbu  | bussiness  | pune    |   2000 | f      | 2018-05-12   | NULL    |
|  3 | sawle  | student    | chennai |   5000 | m      | 2020-03-25   | NULL    |
|  5 | rohit  | teacher    | chennai |   8000 | m      | 2022-08-24   | NULL    |
|  6 | rohit  | teacher    | mysore  |   8500 | m      | 2022-08-24   | yes     |
|  7 | pandey | player     | mumbai  |   7500 | m      | 2020-07-12   | no      |
+----+--------+------------+---------+--------+--------+--------------+---------+
5 rows in set (0.01 sec)

mysql> create table new_table(id int auto_increment, name varchar(50),age int, result boolean, primary key(id));
Query OK, 0 rows affected (0.64 sec)

mysql> insert into new_table values(1,'datta',30,true),(2,'sawle',32,false);
Query OK, 2 rows affected (0.12 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into new_table(name,result) values('rudra',false);
Query OK, 1 row affected (0.12 sec)

mysql> select * from new_table;
+----+-------+------+--------+
| id | name  | age  | result |
+----+-------+------+--------+
|  1 | datta |   30 |      1 |
|  2 | sawle |   32 |      0 |
|  3 | rudra | NULL |      0 |
+----+-------+------+--------+
3 rows in set (0.00 sec)

mysql> select id,name,age from new_table;
+----+-------+------+
| id | name  | age  |
+----+-------+------+
|  1 | datta |   30 |
|  2 | sawle |   32 |
|  3 | rudra | NULL |
+----+-------+------+
3 rows in set (0.00 sec)

mysql> show tables;
+-----------------+
| Tables_in_newDB |
+-----------------+
| new_table       |
| practice        |
+-----------------+
2 rows in set (0.01 sec)

mysql> select salary from practice where name like 'mum%';
Empty set (0.00 sec)

mysql> select * from practice;
+----+--------+------------+---------+--------+--------+--------------+---------+
| id | name   | occupation | city    | salary | gender | joining_date | mstatus |
+----+--------+------------+---------+--------+--------+--------------+---------+
|  1 | subbu  | bussiness  | pune    |   2000 | f      | 2018-05-12   | NULL    |
|  3 | sawle  | student    | chennai |   5000 | m      | 2020-03-25   | NULL    |
|  5 | rohit  | teacher    | chennai |   8000 | m      | 2022-08-24   | NULL    |
|  6 | rohit  | teacher    | mysore  |   8500 | m      | 2022-08-24   | yes     |
|  7 | pandey | player     | mumbai  |   7500 | m      | 2020-07-12   | no      |
+----+--------+------------+---------+--------+--------+--------------+---------+
5 rows in set (0.00 sec)

mysql> select city from practice where name like 'mum%';
Empty set (0.00 sec)

mysql> select name from practice where city like 'mum%';
+--------+
| name   |
+--------+
| pandey |
+--------+
1 row in set (0.00 sec)

mysql> select city from practice where name like 's%';
+---------+
| city    |
+---------+
| pune    |
| chennai |
+---------+
2 rows in set (0.00 sec)

mysql> select name from practice where city not like 'mum%';
+-------+
| name  |
+-------+
| subbu |
| sawle |
| rohit |
| rohit |
+-------+
4 rows in set (0.00 sec)

mysql> select distinct(city) from practice;
+---------+
| city    |
+---------+
| pune    |
| chennai |
| mysore  |
| mumbai  |
+---------+
4 rows in set (0.00 sec)

mysql>
