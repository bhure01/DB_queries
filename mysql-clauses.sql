 ubuntu@datta-bhure ~ $ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
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

mysql> use newDB;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> create table employees(emp_id int primary key auto_increment, emp_name varchar(20), emp_address varchar(30),emp_age int,emp_salary int);
Query OK, 0 rows affected (0.69 sec)

mysql> show tables;
+-----------------+
| Tables_in_newDB |
+-----------------+
| DEMO            |
| demo1           |
| employees       |
| new_table       |
| officers        |
| practice        |
| table1          |
| table5          |
| teachers        |
+-----------------+
9 rows in set (0.00 sec)

mysql> insert into employees values(1,'bhakti','mumbai',22,25000);
Query OK, 1 row affected (0.12 sec)

mysql> insert into employees values(2,'guru','mumbai',25,26000);
Query OK, 1 row affected (0.10 sec)

mysql> insert into employees values(3,'ram','pune',25,26000);
Query OK, 1 row affected (0.12 sec)

mysql> insert into employees values(4,'ram','chennai',25,30000);
Query OK, 1 row affected (0.10 sec)

mysql> select * from employees;
+--------+----------+-------------+---------+------------+
| emp_id | emp_name | emp_address | emp_age | emp_salary |
+--------+----------+-------------+---------+------------+
|      1 | bhakti   | mumbai      |      22 |      25000 |
|      2 | guru     | mumbai      |      25 |      26000 |
|      3 | ram      | pune        |      25 |      26000 |
|      4 | ram      | chennai     |      25 |      30000 |
+--------+----------+-------------+---------+------------+
4 rows in set (0.00 sec)

mysql> select distinct emp_name from employees;
+----------+
| emp_name |
+----------+
| bhakti   |
| guru     |
| ram      |
+----------+
3 rows in set (0.02 sec)

mysql> select distinct emp_salary,emp_address from employees;
+------------+-------------+
| emp_salary | emp_address |
+------------+-------------+
|      25000 | mumbai      |
|      26000 | mumbai      |
|      26000 | pune        |
|      30000 | chennai     |
+------------+-------------+
4 rows in set (0.01 sec)

mysql> select distinct emp_salary from employees;
+------------+
| emp_salary |
+------------+
|      25000 |
|      26000 |
|      30000 |
+------------+
3 rows in set (0.00 sec)

mysql> select * from employees where emp_address='pune' order by emp_name;
+--------+----------+-------------+---------+------------+
| emp_id | emp_name | emp_address | emp_age | emp_salary |
+--------+----------+-------------+---------+------------+
|      3 | ram      | pune        |      25 |      26000 |
+--------+----------+-------------+---------+------------+
1 row in set (0.00 sec)

mysql> select * from employees where emp_salary>='mumbai' order by emp_name;
+--------+----------+-------------+---------+------------+
| emp_id | emp_name | emp_address | emp_age | emp_salary |
+--------+----------+-------------+---------+------------+
|      1 | bhakti   | mumbai      |      22 |      25000 |
|      2 | guru     | mumbai      |      25 |      26000 |
|      3 | ram      | pune        |      25 |      26000 |
|      4 | ram      | chennai     |      25 |      30000 |
+--------+----------+-------------+---------+------------+
4 rows in set, 1 warning (0.00 sec)

mysql> select * from employees where emp_salary>='25000' order by emp_id;
+--------+----------+-------------+---------+------------+
| emp_id | emp_name | emp_address | emp_age | emp_salary |
+--------+----------+-------------+---------+------------+
|      1 | bhakti   | mumbai      |      22 |      25000 |
|      2 | guru     | mumbai      |      25 |      26000 |
|      3 | ram      | pune        |      25 |      26000 |
|      4 | ram      | chennai     |      25 |      30000 |
+--------+----------+-------------+---------+------------+
4 rows in set (0.00 sec)

mysql> select * from employees where emp_salary>='28000' order by emp_id;
+--------+----------+-------------+---------+------------+
| emp_id | emp_name | emp_address | emp_age | emp_salary |
+--------+----------+-------------+---------+------------+
|      4 | ram      | chennai     |      25 |      30000 |
+--------+----------+-------------+---------+------------+
1 row in set (0.00 sec)

mysql> select * from employees where emp_salary=26000 order by emp_id asc;
+--------+----------+-------------+---------+------------+
| emp_id | emp_name | emp_address | emp_age | emp_salary |
+--------+----------+-------------+---------+------------+
|      2 | guru     | mumbai      |      25 |      26000 |
|      3 | ram      | pune        |      25 |      26000 |
+--------+----------+-------------+---------+------------+
2 rows in set (0.00 sec)

mysql> select * from employees where emp_salary=26000 order by emp_id desc;
+--------+----------+-------------+---------+------------+
| emp_id | emp_name | emp_address | emp_age | emp_salary |
+--------+----------+-------------+---------+------------+
|      3 | ram      | pune        |      25 |      26000 |
|      2 | guru     | mumbai      |      25 |      26000 |
+--------+----------+-------------+---------+------------+
2 rows in set (0.00 sec)

mysql> select emp_address from employees group by emp_name;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'newDB.employees.emp_address' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select emp_address from employees group by emp_id;
+-------------+
| emp_address |
+-------------+
| mumbai      |
| mumbai      |
| pune        |
| chennai     |
+-------------+
4 rows in set (0.00 sec)

mysql> select emp_id,sum(emp_salary) as "Sum of Salary" from employees group by emp_id;
+--------+---------------+
| emp_id | Sum of Salary |
+--------+---------------+
|      1 |         25000 |
|      2 |         26000 |
|      3 |         26000 |
|      4 |         30000 |
+--------+---------------+
4 rows in set (0.00 sec)

mysql> select emp_address,sum(emp_salary) as "Sum of Salary" from employees group by emp_address;
+-------------+---------------+
| emp_address | Sum of Salary |
+-------------+---------------+
| mumbai      |         51000 |
| pune        |         26000 |
| chennai     |         30000 |
+-------------+---------------+
3 rows in set (0.00 sec)

mysql> select avg(emp_salary) as "Average salary" from employees group by emp_id;
+----------------+
| Average salary |
+----------------+
|     25000.0000 |
|     26000.0000 |
|     26000.0000 |
|     30000.0000 |
+----------------+
4 rows in set (0.00 sec)

mysql> select avg(emp_salary) as "Average salary" from employees group by emp_address;
+----------------+
| Average salary |
+----------------+
|     25500.0000 |
|     26000.0000 |
|     30000.0000 |
+----------------+
3 rows in set (0.00 sec)

mysql> select avg(emp_salary) as "Average salary" from employees group by emp_age;
+----------------+
| Average salary |
+----------------+
|     25000.0000 |
|     27333.3333 |
+----------------+
2 rows in set (0.00 sec)

