ubuntu@datta-bhure ~/DB_queries (MySQL_Foreign_Key) $ cd 
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
| foreign_key             |
| information_schema      |
| mysql                   |
| mysql_clauses           |
| newDB                   |
| payroll_service_db      |
| performance_schema      |
+-------------------------+
10 rows in set (0.00 sec)

mysql> create database joins;
Query OK, 1 row affected (0.23 sec)

mysql> use joins;
Database changed
mysql> create table officers(officer_id int primary key auto_increment,officer_name varchar (30),address varchar(20));
Query OK, 0 rows affected (1.34 sec)

mysql> create table students(student_id int primary key auto_increment,student_name varchar(20),course_name varchar(25));
Query OK, 0 rows affected (1.40 sec)

mysql> select * from officers;
Empty set (0.00 sec)

mysql> insert into officers values(1,'ajeet','manali'),(2,'dipika','lucknow');
Query OK, 2 rows affected (0.14 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into officers values('vimal','faizabad'),('rahul','lucknow');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into officers(officer_name,address)  values('vimal','faizabad'),('rahul','lucknow');
Query OK, 2 rows affected (0.21 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from officers;
+------------+--------------+----------+
| officer_id | officer_name | address  |
+------------+--------------+----------+
|          1 | ajeet        | manali   |
|          2 | dipika       | lucknow  |
|          3 | vimal        | faizabad |
|          4 | rahul        | lucknow  |
+------------+--------------+----------+
4 rows in set (0.00 sec)

mysql> insert into students values(1,'aryan','java'),(2,'rohini','hadoop');
Query OK, 2 rows affected (0.13 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into students(student_name,course_name)  values('aryan','java');
Query OK, 1 row affected (0.11 sec)

mysql> select * from students;
+------------+--------------+-------------+
| student_id | student_name | course_name |
+------------+--------------+-------------+
|          1 | aryan        | java        |
|          2 | rohini       | hadoop      |
|          3 | aryan        | java        |
+------------+--------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT officers.officer_name, officers.address, students.course_name  
    -> FROM officers   
    -> INNER JOIN students  
    -> ON officers.officer_id = students.student_id;  
+--------------+----------+-------------+
| officer_name | address  | course_name |
+--------------+----------+-------------+
| ajeet        | manali   | java        |
| dipika       | lucknow  | hadoop      |
| vimal        | faizabad | java        |
+--------------+----------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT officers.address, students.course_name  
    -> FROM officers   
    -> INNER JOIN students  
    -> ON officers.officer_name = students.student_id;  
Empty set, 4 warnings (0.00 sec)

mysql> SELECT officers.officer_id, officers.address, students.course_name,students.student_name 
    -> FROM officers   
    -> INNER JOIN students  
    -> ON officers.officer_name = students.student_id; 
Empty set, 4 warnings (0.00 sec)

mysql> SELECT  officers.officer_name, officers.address, students.course_name  
    -> FROM officers  
    -> LEFT JOIN students  
    -> ON officers.officer_id = students.student_id;  
+--------------+----------+-------------+
| officer_name | address  | course_name |
+--------------+----------+-------------+
| ajeet        | manali   | java        |
| dipika       | lucknow  | hadoop      |
| vimal        | faizabad | java        |
| rahul        | lucknow  | NULL        |
+--------------+----------+-------------+
4 rows in set (0.00 sec)

mysql> SELECT officers.officer_name, officers.address, students.course_name, students.student_name  
    -> FROM officers  
    -> RIGHT JOIN students  
    -> ON officers.officer_id = students.student_id;  
+--------------+----------+-------------+--------------+
| officer_name | address  | course_name | student_name |
+--------------+----------+-------------+--------------+
| ajeet        | manali   | java        | aryan        |
| dipika       | lucknow  | hadoop      | rohini       |
| vimal        | faizabad | java        | aryan        |
+--------------+----------+-------------+--------------+
3 rows in set (0.00 sec)

mysql> SELECT officers.officer_name, officers.address, students.course_name
    -> FROM officers  
    -> RIGHT JOIN students  
    -> ON officers.officer_id = students.student_id; 
+--------------+----------+-------------+
| officer_name | address  | course_name |
+--------------+----------+-------------+
| ajeet        | manali   | java        |
| dipika       | lucknow  | hadoop      |
| vimal        | faizabad | java        |
+--------------+----------+-------------+
3 rows in set (0.00 sec)

mysql> 

