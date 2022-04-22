ubuntu@datta-bhure ~ $ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
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

mysql> create table student_details(stud_id int primary key auto_increment,stud_name varchar(255));
Query OK, 0 rows affected (1.65 sec)

mysql> create table demo_table(id int, name varchar(255), age int);
showQuery OK, 0 rows affected (1.75 sec)

mysql> show tables;
+-----------------+
| Tables_in_newDB |
+-----------------+
| DEMO            |
| demo1           |
| demo_table      |
| employees       |
| new_table       |
| officers        |
| practice        |
| student_details |
| table1          |
| table5          |
| teachers        |
+-----------------+
11 rows in set (0.00 sec)

mysql> drop table demo_table;
Query OK, 0 rows affected (0.42 sec)

mysql> drop table table1,table5;
Query OK, 0 rows affected (1.17 sec)

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
| student_details |
| teachers        |
+-----------------+
8 rows in set (0.01 sec)

mysql> alter table student_details add gender char(1) after stud_name;
Query OK, 0 rows affected (0.54 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table student_details add column stud_age int, add column subject varchar(20);
Query OK, 0 rows affected (0.47 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student_details;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| stud_id   | int          | NO   | PRI | NULL    | auto_increment |
| stud_name | varchar(255) | YES  |     | NULL    |                |
| gender    | char(1)      | YES  |     | NULL    |                |
| stud_age  | int          | YES  |     | NULL    |                |
| subject   | varchar(20)  | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> insert into student_details values(1,'akash','m',12,'physics');
Query OK, 1 row affected (0.10 sec)

mysql> insert into student_details values(2,'prakash','m',12,'chemistry');
Query OK, 1 row affected (0.12 sec)

mysql> insert into student_details values(3,'raghu','m',13,'chemistry'),(4,'deepa','f',14,'biology);
    '> 
    '> ^X

^C
mysql> insert into student_details values(3,'raghu','m',13,'chemistry'),(4,'deepa','f',14,'biology');
Query OK, 2 rows affected (0.14 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from student_details;
+---------+-----------+--------+----------+-----------+
| stud_id | stud_name | gender | stud_age | subject   |
+---------+-----------+--------+----------+-----------+
|       1 | akash     | m      |       12 | physics   |
|       2 | prakash   | m      |       12 | chemistry |
|       3 | raghu     | m      |       13 | chemistry |
|       4 | deepa     | f      |       14 | biology   |
+---------+-----------+--------+----------+-----------+
4 rows in set (0.00 sec)

mysql> delete from student_details where stud_age=14;
Query OK, 1 row affected (0.11 sec)

mysql> select * from student_details;
+---------+-----------+--------+----------+-----------+
| stud_id | stud_name | gender | stud_age | subject   |
+---------+-----------+--------+----------+-----------+
|       1 | akash     | m      |       12 | physics   |
|       2 | prakash   | m      |       12 | chemistry |
|       3 | raghu     | m      |       13 | chemistry |
+---------+-----------+--------+----------+-----------+
3 rows in set (0.00 sec)

mysql> alter table student_details rename to stud_detail;
Query OK, 0 rows affected (0.60 sec)

mysql> select * from stud_detail;
+---------+-----------+--------+----------+-----------+
| stud_id | stud_name | gender | stud_age | subject   |
+---------+-----------+--------+----------+-----------+
|       1 | akash     | m      |       12 | physics   |
|       2 | prakash   | m      |       12 | chemistry |
|       3 | raghu     | m      |       13 | chemistry |
+---------+-----------+--------+----------+-----------+
3 rows in set (0.01 sec)

mysql> alter table stud_detail rename column subject to stream;
Query OK, 0 rows affected (0.66 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from stud_detail;
+---------+-----------+--------+----------+-----------+
| stud_id | stud_name | gender | stud_age | stream    |
+---------+-----------+--------+----------+-----------+
|       1 | akash     | m      |       12 | physics   |
|       2 | prakash   | m      |       12 | chemistry |
|       3 | raghu     | m      |       13 | chemistry |
+---------+-----------+--------+----------+-----------+
3 rows in set (0.01 sec)

