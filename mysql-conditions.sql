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
9 rows in set (0.06 sec)

mysql> use newDB;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-----------------+
| Tables_in_newDB |
+-----------------+
| DEMO            |
| demo1           |
| new_table       |
| practice        |
| table1          |
| table5          |
+-----------------+
6 rows in set (0.01 sec)

mysql> create table teachers(teachear_id int primary key auto_increment, teacher_name varchar(50), age int, salary int, gender char(1));
Query OK, 0 rows affected (0.74 sec)

mysql> insert into teachers values(1,'subhash',32,20000,'m'),(2,'nilima',35,25000,'f');
Query OK, 2 rows affected (0.20 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into teachers values(3,'rakesh',32,20000,'m'),(4,'nila',35,30000,'f');
Query OK, 2 rows affected (0.15 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from teachers;
+-------------+--------------+------+--------+--------+
| teachear_id | teacher_name | age  | salary | gender |
+-------------+--------------+------+--------+--------+
|           1 | subhash      |   32 |  20000 | m      |
|           2 | nilima       |   35 |  25000 | f      |
|           3 | rakesh       |   32 |  20000 | m      |
|           4 | nila         |   35 |  30000 | f      |
+-------------+--------------+------+--------+--------+
4 rows in set (0.00 sec)

mysql> alter table teachers add city varchar(20);
Query OK, 0 rows affected (0.55 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from teachers;
+-------------+--------------+------+--------+--------+------+
| teachear_id | teacher_name | age  | salary | gender | city |
+-------------+--------------+------+--------+--------+------+
|           1 | subhash      |   32 |  20000 | m      | NULL |
|           2 | nilima       |   35 |  25000 | f      | NULL |
|           3 | rakesh       |   32 |  20000 | m      | NULL |
|           4 | nila         |   35 |  30000 | f      | NULL |
+-------------+--------------+------+--------+--------+------+
4 rows in set (0.00 sec)

mysql> alter table teachers rename column teachear to teacher;
ERROR 1054 (42S22): Unknown column 'teachear' in 'teachers'
mysql> alter table teachers rename column teachear_id to teacher_id;
Query OK, 0 rows affected (0.70 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update teachers set city='pune' where teacher_id=1;
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update teachers set city='pune';
Query OK, 3 rows affected (0.12 sec)
Rows matched: 4  Changed: 3  Warnings: 0

mysql> update teachers set city='mumbai' where teacher_id=2;
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update teachers set salary=50000 where teacher_id>3;
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update teachers set salary=20000 where teacher_id=2 and teacher_name='nila';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from teachers;
+------------+--------------+------+--------+--------+--------+
| teacher_id | teacher_name | age  | salary | gender | city   |
+------------+--------------+------+--------+--------+--------+
|          1 | subhash      |   32 |  20000 | m      | pune   |
|          2 | nilima       |   35 |  25000 | f      | mumbai |
|          3 | rakesh       |   32 |  20000 | m      | pune   |
|          4 | nila         |   35 |  50000 | f      | pune   |
+------------+--------------+------+--------+--------+--------+
4 rows in set (0.00 sec)

mysql> update teachers set city='chennai' where teacher_id=3 or teacher_name='nila';
Query OK, 2 rows affected (0.11 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from teachers;
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          1 | subhash      |   32 |  20000 | m      | pune    |
|          2 | nilima       |   35 |  25000 | f      | mumbai  |
|          3 | rakesh       |   32 |  20000 | m      | chennai |
|          4 | nila         |   35 |  50000 | f      | chennai |
+------------+--------------+------+--------+--------+---------+
4 rows in set (0.00 sec)

mysql> select * from teachers where (teacher_id=3 and age=32) or salary>25000;
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          3 | rakesh       |   32 |  20000 | m      | chennai |
|          4 | nila         |   35 |  50000 | f      | chennai |
+------------+--------------+------+--------+--------+---------+
2 rows in set (0.00 sec)

mysql> select teacher_name from teachers where city like 'mum%';
+--------------+
| teacher_name |
+--------------+
| nilima       |
+--------------+
1 row in set (0.00 sec)

mysql> select teacher_name from teachers where city like '%ai';
+--------------+
| teacher_name |
+--------------+
| nilima       |
| rakesh       |
| nila         |
+--------------+
3 rows in set (0.00 sec)

mysql> select teacher_name from teachers where city like '%bai';
+--------------+
| teacher_name |
+--------------+
| nilima       |
+--------------+
1 row in set (0.00 sec)

mysql> select teacher_id from teachers where teacher_name not like 'rak%';
+------------+
| teacher_id |
+------------+
|          1 |
|          2 |
|          4 |
+------------+
3 rows in set (0.00 sec)

mysql> select teacher_id from teachers where teacher_name not like '%n';
+------------+
| teacher_id |
+------------+
|          1 |
|          2 |
|          3 |
|          4 |
+------------+
4 rows in set (0.00 sec)

mysql> select salary from teachers where teacher_name like 'su_h';
Empty set (0.00 sec)

mysql> select salary from teachers where city like 'mu_ai';
Empty set (0.00 sec)

mysql> select salary from teachers where city like 'p_e';
Empty set (0.00 sec)

mysql> select * from teachers;
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          1 | subhash      |   32 |  20000 | m      | pune    |
|          2 | nilima       |   35 |  25000 | f      | mumbai  |
|          3 | rakesh       |   32 |  20000 | m      | chennai |
|          4 | nila         |   35 |  50000 | f      | chennai |
+------------+--------------+------+--------+--------+---------+
4 rows in set (0.00 sec)

mysql> select * from teachers where teacher_name in('nilima','rakesh');
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          2 | nilima       |   35 |  25000 | f      | mumbai  |
|          3 | rakesh       |   32 |  20000 | m      | chennai |
+------------+--------------+------+--------+--------+---------+
2 rows in set (0.00 sec)

mysql> select * from teachers where teacher_name not in('nilima','rakesh');
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          1 | subhash      |   32 |  20000 | m      | pune    |
|          4 | nila         |   35 |  50000 | f      | chennai |
+------------+--------------+------+--------+--------+---------+
2 rows in set (0.00 sec)

mysql> select * from teachers where salary between 20000 and 25000;
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          1 | subhash      |   32 |  20000 | m      | pune    |
|          2 | nilima       |   35 |  25000 | f      | mumbai  |
|          3 | rakesh       |   32 |  20000 | m      | chennai |
+------------+--------------+------+--------+--------+---------+
3 rows in set (0.00 sec)

mysql> select * from teachers where city<>'pune';
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          2 | nilima       |   35 |  25000 | f      | mumbai  |
|          3 | rakesh       |   32 |  20000 | m      | chennai |
|          4 | nila         |   35 |  50000 | f      | chennai |
+------------+--------------+------+--------+--------+---------+
3 rows in set (0.00 sec)

mysql> select * from teachers where salary != 25000;
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          1 | subhash      |   32 |  20000 | m      | pune    |
|          3 | rakesh       |   32 |  20000 | m      | chennai |
|          4 | nila         |   35 |  50000 | f      | chennai |
+------------+--------------+------+--------+--------+---------+
3 rows in set (0.00 sec)

mysql> select * from teachers where age is null;
Empty set (0.00 sec)

mysql> select * from teachers where age is not null;
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          1 | subhash      |   32 |  20000 | m      | pune    |
|          2 | nilima       |   35 |  25000 | f      | mumbai  |
|          3 | rakesh       |   32 |  20000 | m      | chennai |
|          4 | nila         |   35 |  50000 | f      | chennai |
+------------+--------------+------+--------+--------+---------+
4 rows in set (0.00 sec)

mysql> select * from teachers where age is not null and city<>'pune';
+------------+--------------+------+--------+--------+---------+
| teacher_id | teacher_name | age  | salary | gender | city    |
+------------+--------------+------+--------+--------+---------+
|          2 | nilima       |   35 |  25000 | f      | mumbai  |
|          3 | rakesh       |   32 |  20000 | m      | chennai |
|          4 | nila         |   35 |  50000 | f      | chennai |
+------------+--------------+------+--------+--------+---------+
3 rows in set (0.00 sec)

mysql> 

