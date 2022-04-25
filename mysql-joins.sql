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

mysql> create table students(student_id int,stud_fname varchar(50),stud_lname varchar(50),city varchar(50));
Query OK, 0 rows affected (0.72 sec)
mysql> insert into students(student_id,stud_fname,stud_lname,city) values(1,'devine','putin','france'),(2,'michael','clark','australia'),(3,'ethon','miller','england'),(4,'mark','strauss','america');
Query OK, 4 rows affected (0.15 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> create table technologies(student_id int,tech_id int,inst_name varchar(20),technology varchar(30));
Query OK, 0 rows affected (1.51 sec)

mysql> insert into technologies(student_id,tech_id,inst_name,technology) values(1,1,'java training institute','java'),(2,2,'chroma campus','angular'),(3,3,'cetpa infotech','big data'),(4,4,'aptron','ios');
ERROR 1406 (22001): Data too long for column 'inst_name' at row 1
mysql> insert into technologies(student_id,tech_id,inst_name,technology) values(1,1,'java institute','java'),(2,2,'chroma campus','angular'),(3,3,'cetpa infotech','big data'),(4,4,'aptron','ios');
Query OK, 4 rows affected (0.13 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from students;
+------------+------------+------------+-----------+
| student_id | stud_fname | stud_lname | city      |
+------------+------------+------------+-----------+
|          1 | devine     | putin      | france    |
|          2 | michael    | clark      | australia |
|          3 | ethon      | miller     | england   |
|          4 | mark       | strauss    | america   |
+------------+------------+------------+-----------+
4 rows in set (0.00 sec)

mysql> select * from technologies;
+------------+---------+----------------+------------+
| student_id | tech_id | inst_name      | technology |
+------------+---------+----------------+------------+
|          1 |       1 | java institute | java       |
|          2 |       2 | chroma campus  | angular    |
|          3 |       3 | cetpa infotech | big data   |
|          4 |       4 | aptron         | ios        |
+------------+---------+----------------+------------+
4 rows in set (0.01 sec)

mysql> SELECT students.stud_fname, students.stud_lname, students.city, technologies.technology    
    -> FROM students   
    -> INNER JOIN technologies    
    -> ON students.student_id = technologies.tech_id; 
+------------+------------+-----------+------------+
| stud_fname | stud_lname | city      | technology |
+------------+------------+-----------+------------+
| devine     | putin      | france    | java       |
| michael    | clark      | australia | angular    |
| ethon      | miller     | england   | big data   |
| mark       | strauss    | america   | ios        |
+------------+------------+-----------+------------+
4 rows in set (0.00 sec)

mysql> create table emp(emp_id int,emp_age int,emp_name varchar(30));
Query OK, 0 rows affected (0.70 sec)

mysql> insert into emp values(1,25,'rahul'),(2,30,'ganesh'),(3,32,'john'),(4,36,'adam'),(5,25,'danny');
Query OK, 5 rows affected (0.14 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+--------+---------+----------+
| emp_id | emp_age | emp_name |
+--------+---------+----------+
|      1 |      25 | rahul    |
|      2 |      30 | ganesh   |
|      3 |      32 | john     |
|      4 |      36 | adam     |
|      5 |      25 | danny    |
+--------+---------+----------+
5 rows in set (0.00 sec)

mysql> select * from students;
+------------+------------+------------+-----------+
| student_id | stud_fname | stud_lname | city      |
+------------+------------+------------+-----------+
|          1 | devine     | putin      | france    |
|          2 | michael    | clark      | australia |
|          3 | ethon      | miller     | england   |
|          4 | mark       | strauss    | america   |
+------------+------------+------------+-----------+
4 rows in set (0.00 sec)

mysql> select * from technologies;
+------------+---------+----------------+------------+
| student_id | tech_id | inst_name      | technology |
+------------+---------+----------------+------------+
|          1 |       1 | java institute | java       |
|          2 |       2 | chroma campus  | angular    |
|          3 |       3 | cetpa infotech | big data   |
|          4 |       4 | aptron         | ios        |
+------------+---------+----------------+------------+
4 rows in set (0.00 sec)

mysql> select students.stud_fname,students.city,technologies.inst_name,emp.emp_age,emp.emp_name from emp inner join students on emp.emp_id=students.student_id inner join technologies on emp.emp_id=technologies.tech_id;
+------------+-----------+----------------+---------+----------+
| stud_fname | city      | inst_name      | emp_age | emp_name |
+------------+-----------+----------------+---------+----------+
| devine     | france    | java institute |      25 | rahul    |
| michael    | australia | chroma campus  |      30 | ganesh   |
| ethon      | england   | cetpa infotech |      32 | john     |
| mark       | america   | aptron         |      36 | adam     |
+------------+-----------+----------------+---------+----------+
4 rows in set (0.00 sec)

mysql> SELECT student_id, inst_name, city, technology    
    -> FROM students   
    -> INNER JOIN technologies    
    -> USING (student_id);  
+------------+----------------+-----------+------------+
| student_id | inst_name      | city      | technology |
+------------+----------------+-----------+------------+
|          1 | java institute | france    | java       |
|          2 | chroma campus  | australia | angular    |
|          3 | cetpa infotech | england   | big data   |
|          4 | aptron         | america   | ios        |
+------------+----------------+-----------+------------+
4 rows in set (0.00 sec)

mysql> SELECT tech_id, inst_name, city, technology    
    -> FROM students   
    -> INNER JOIN technologies    
    -> USING (student_id) WHERE technology = "Java";  
+---------+----------------+--------+------------+
| tech_id | inst_name      | city   | technology |
+---------+----------------+--------+------------+
|       1 | java institute | france | java       |
+---------+----------------+--------+------------+
1 row in set (0.00 sec)

mysql> create table contact(college_id int,cellphone int, homephone int);
Query OK, 0 rows affected (1.29 sec)

mysql> insert into contact values(1,111111,222222),(2,1212121,33333),(3,123123,321256),(4,324586,456321);
Query OK, 4 rows affected (0.14 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from contact;
+------------+-----------+-----------+
| college_id | cellphone | homephone |
+------------+-----------+-----------+
|          1 |    111111 |    222222 |
|          2 |   1212121 |     33333 |
|          3 |    123123 |    321256 |
|          4 |    324586 |    456321 |
+------------+-----------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT student_id, inst_name, city, technology, cellphone  
    -> FROM students   
    -> INNER JOIN technologies USING (student_id)  
    -> INNER JOIN contact ORDER BY student_id;  
+------------+----------------+-----------+------------+-----------+
| student_id | inst_name      | city      | technology | cellphone |
+------------+----------------+-----------+------------+-----------+
|          1 | java institute | france    | java       |    111111 |
|          1 | java institute | france    | java       |   1212121 |
|          1 | java institute | france    | java       |    123123 |
|          1 | java institute | france    | java       |    324586 |
|          2 | chroma campus  | australia | angular    |    111111 |
|          2 | chroma campus  | australia | angular    |   1212121 |
|          2 | chroma campus  | australia | angular    |    123123 |
|          2 | chroma campus  | australia | angular    |    324586 |
|          3 | cetpa infotech | england   | big data   |    111111 |
|          3 | cetpa infotech | england   | big data   |   1212121 |
|          3 | cetpa infotech | england   | big data   |    123123 |
|          3 | cetpa infotech | england   | big data   |    324586 |
|          4 | aptron         | america   | ios        |    111111 |
|          4 | aptron         | america   | ios        |   1212121 |
|          4 | aptron         | america   | ios        |    123123 |
|          4 | aptron         | america   | ios        |    324586 |
+------------+----------------+-----------+------------+-----------+
16 rows in set (0.00 sec)

mysql> show tables;
+-----------------+
| Tables_in_joins |
+-----------------+
| contact         |
| emp             |
| officers        |
| students        |
| technologies    |
+-----------------+
5 rows in set (0.01 sec)





mysql> create table joins(id int,age int);
Query OK, 0 rows affected (1.34 sec)

mysql> create table join1(id int,fname varchar(20),lname varchar(20));
Query OK, 0 rows affected (1.64 sec)

mysql> insert into joins(id,age) values(1,10),(2,12),(3,15),(4,20),(5,23);
Query OK, 5 rows affected (0.12 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into join1(fname,lname) values('datta','bhure'),('ganesh','wade'); 
Query OK, 2 rows affected (0.15 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from joins;
+------+------+
| id   | age  |
+------+------+
|    1 |   10 |
|    2 |   12 |
|    3 |   15 |
|    4 |   20 |
|    5 |   23 |
+------+------+
5 rows in set (0.00 sec)

mysql> select * from join1;
+------+--------+-------+
| id   | fname  | lname |
+------+--------+-------+
| NULL | datta  | bhure |
| NULL | ganesh | wade  |
+------+--------+-------+
2 rows in set (0.00 sec)

mysql> show tables;
+-----------------+
| Tables_in_joins |
+-----------------+
| contact         |
| emp             |
| join1           |
| joins           |
| officers        |
| students        |
| technologies    |
+-----------------+
7 rows in set (0.00 sec)

mysql> select * from contact;
+------------+-----------+-----------+
| college_id | cellphone | homephone |
+------------+-----------+-----------+
|          1 |    111111 |    222222 |
|          2 |   1212121 |     33333 |
|          3 |    123123 |    321256 |
|          4 |    324586 |    456321 |
+------------+-----------+-----------+
4 rows in set (0.00 sec)

mysql> select * from students;
+------------+------------+------------+-----------+
| student_id | stud_fname | stud_lname | city      |
+------------+------------+------------+-----------+
|          1 | devine     | putin      | france    |
|          2 | michael    | clark      | australia |
|          3 | ethon      | miller     | england   |
|          4 | mark       | strauss    | america   |
+------------+------------+------------+-----------+
4 rows in set (0.00 sec)

mysql> select * from contact cross join students;
+------------+-----------+-----------+------------+------------+------------+-----------+
| college_id | cellphone | homephone | student_id | stud_fname | stud_lname | city      |
+------------+-----------+-----------+------------+------------+------------+-----------+
|          4 |    324586 |    456321 |          1 | devine     | putin      | france    |
|          3 |    123123 |    321256 |          1 | devine     | putin      | france    |
|          2 |   1212121 |     33333 |          1 | devine     | putin      | france    |
|          1 |    111111 |    222222 |          1 | devine     | putin      | france    |
|          4 |    324586 |    456321 |          2 | michael    | clark      | australia |
|          3 |    123123 |    321256 |          2 | michael    | clark      | australia |
|          2 |   1212121 |     33333 |          2 | michael    | clark      | australia |
|          1 |    111111 |    222222 |          2 | michael    | clark      | australia |
|          4 |    324586 |    456321 |          3 | ethon      | miller     | england   |
|          3 |    123123 |    321256 |          3 | ethon      | miller     | england   |
|          2 |   1212121 |     33333 |          3 | ethon      | miller     | england   |
|          1 |    111111 |    222222 |          3 | ethon      | miller     | england   |
|          4 |    324586 |    456321 |          4 | mark       | strauss    | america   |
|          3 |    123123 |    321256 |          4 | mark       | strauss    | america   |
|          2 |   1212121 |     33333 |          4 | mark       | strauss    | america   |
|          1 |    111111 |    222222 |          4 | mark       | strauss    | america   |
+------------+-----------+-----------+------------+------------+------------+-----------+
16 rows in set (0.00 sec)

mysql> select * from students cross join contact;
+------------+------------+------------+-----------+------------+-----------+-----------+
| student_id | stud_fname | stud_lname | city      | college_id | cellphone | homephone |
+------------+------------+------------+-----------+------------+-----------+-----------+
|          4 | mark       | strauss    | america   |          1 |    111111 |    222222 |
|          3 | ethon      | miller     | england   |          1 |    111111 |    222222 |
|          2 | michael    | clark      | australia |          1 |    111111 |    222222 |
|          1 | devine     | putin      | france    |          1 |    111111 |    222222 |
|          4 | mark       | strauss    | america   |          2 |   1212121 |     33333 |
|          3 | ethon      | miller     | england   |          2 |   1212121 |     33333 |
|          2 | michael    | clark      | australia |          2 |   1212121 |     33333 |
|          1 | devine     | putin      | france    |          2 |   1212121 |     33333 |
|          4 | mark       | strauss    | america   |          3 |    123123 |    321256 |
|          3 | ethon      | miller     | england   |          3 |    123123 |    321256 |
|          2 | michael    | clark      | australia |          3 |    123123 |    321256 |
|          1 | devine     | putin      | france    |          3 |    123123 |    321256 |
|          4 | mark       | strauss    | america   |          4 |    324586 |    456321 |
|          3 | ethon      | miller     | england   |          4 |    324586 |    456321 |
|          2 | michael    | clark      | australia |          4 |    324586 |    456321 |
|          1 | devine     | putin      | france    |          4 |    324586 |    456321 |
+------------+------------+------------+-----------+------------+-----------+-----------+
16 rows in set (0.00 sec)

mysql> select stud_id,stud_fname from students cross join contact;
ERROR 1054 (42S22): Unknown column 'stud_id' in 'field list'
mysql> select student_id,stud_fname from students cross join contact;
+------------+------------+
| student_id | stud_fname |
+------------+------------+
|          4 | mark       |
|          3 | ethon      |
|          2 | michael    |
|          1 | devine     |
|          4 | mark       |
|          3 | ethon      |
|          2 | michael    |
|          1 | devine     |
|          4 | mark       |
|          3 | ethon      |
|          2 | michael    |
|          1 | devine     |
|          4 | mark       |
|          3 | ethon      |
|          2 | michael    |
|          1 | devine     |
+------------+------------+
16 rows in set (0.01 sec)

mysql> select stud_id,city,cellphone from students cross join contact;
ERROR 1054 (42S22): Unknown column 'stud_id' in 'field list'
mysql> select student_id,city,cellphone from students cross join contact;
+------------+-----------+-----------+
| student_id | city      | cellphone |
+------------+-----------+-----------+
|          4 | america   |    111111 |
|          3 | england   |    111111 |
|          2 | australia |    111111 |
|          1 | france    |    111111 |
|          4 | america   |   1212121 |
|          3 | england   |   1212121 |
|          2 | australia |   1212121 |
|          1 | france    |   1212121 |
|          4 | america   |    123123 |
|          3 | england   |    123123 |
|          2 | australia |    123123 |
|          1 | france    |    123123 |
|          4 | america   |    324586 |
|          3 | england   |    324586 |
|          2 | australia |    324586 |
|          1 | france    |    324586 |
+------------+-----------+-----------+
16 rows in set (0.00 sec)

mysql> 
mysql> 
mysql> 
mysql> 
mysql> select * from students;
+------------+------------+------------+-----------+
| student_id | stud_fname | stud_lname | city      |
+------------+------------+------------+-----------+
|          1 | devine     | putin      | france    |
|          2 | michael    | clark      | australia |
|          3 | ethon      | miller     | england   |
|          4 | mark       | strauss    | america   |
+------------+------------+------------+-----------+
4 rows in set (0.03 sec)

mysql> select * from customers;
+-------------+---------------+------------------+
| customer_id | customer_name | customer_address |
+-------------+---------------+------------------+
|         101 | rahul         | delhi            |
|         102 | rohini        | mumbai           |
|         102 | rohit         | chennai          |
+-------------+---------------+------------------+
3 rows in set (0.00 sec)

mysql> select * from employees;
+--------+----------+-----------+
| emp_id | emp_name | city      |
+--------+----------+-----------+
|      1 | virat    | bangalore |
|      2 | sawle    | pune      |
|      1 | virat    | bangalore |
|      2 | sawle    | pune      |
+--------+----------+-----------+
4 rows in set (0.00 sec)

mysql> select * from customers INNER JOIN employees ON customers.customer_id=employees.emp_id;
Empty set (0.00 sec)

mysql> select customer_id,customer_address,emp_name from customers INNER JOIN employees ON customers.customer_id=employees.emp_id;
Empty set (0.00 sec)

mysql> select customers.customer_id,customers.customer_address,employees.emp_name from customers INNER JOIN employees ON customers.customer_id=employees.emp_id;
Empty set (0.00 sec)

mysql> select employees.emp_name,customers.customer_name
    -> from employees 
    -> INNER JOIN customers 
    -> ON customers.customer_id=employees.emp_id;
Empty set (0.00 sec)

mysql> update employees set emp_id=101 where city='bangalore';
Query OK, 2 rows affected (0.12 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> update employees set emp_id=102 where city='pune';
Query OK, 2 rows affected (0.20 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from employees;
+--------+----------+-----------+
| emp_id | emp_name | city      |
+--------+----------+-----------+
|    101 | virat    | bangalore |
|    102 | sawle    | pune      |
|    101 | virat    | bangalore |
|    102 | sawle    | pune      |
|      2 | mayank   | punjab    |
|      4 | ganesh   | bidar     |
+--------+----------+-----------+
6 rows in set (0.00 sec)

mysql> update employees set emp_id=103 where city='punjab';
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id=104 where city='bidar';
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employees;
+--------+----------+-----------+
| emp_id | emp_name | city      |
+--------+----------+-----------+
|    101 | virat    | bangalore |
|    102 | sawle    | pune      |
|    101 | virat    | bangalore |
|    102 | sawle    | pune      |
|    103 | mayank   | punjab    |
|    104 | ganesh   | bidar     |
+--------+----------+-----------+
6 rows in set (0.00 sec)
 
mysql> select employees.emp_name,customers.customer_name
    -> from employees 
    -> INNER JOIN customers 
    -> ON employees.emp_id=customers.customer_id;
+----------+---------------+
| emp_name | customer_name |
+----------+---------------+
| virat    | rahul         |
| sawle    | rohit         |
| sawle    | rohini        |
| virat    | rahul         |
| sawle    | rohit         |
| sawle    | rohini        |
+----------+---------------+
6 rows in set (0.00 sec)

mysql> select employees.emp_name,customers.customer_name
    -> from employees 
    -> INNER JOIN customers 
    -> ON employees.emp_id=customers.customer_id;
+----------+---------------+
| emp_name | customer_name |
+----------+---------------+
| virat    | rahul         |
| sawle    | rohit         |
| sawle    | rohini        |
| virat    | rahul         |
| sawle    | rohit         |
| sawle    | rohini        |
+----------+---------------+
6 rows in set (0.00 sec)

mysql> from employees 
    -> INNER JOIN customers 
    -> INNER JOIN customers
    -> ;

mysql> select *
    -> from employees 
    -> INNER JOIN customers 
    -> ON employees.emp_id=customers.customer_id;
+--------+----------+-----------+-------------+---------------+------------------+
| emp_id | emp_name | city      | customer_id | customer_name | customer_address |
+--------+----------+-----------+-------------+---------------+------------------+
|    101 | virat    | bangalore |         101 | rahul         | delhi            |
|    102 | sawle    | pune      |         102 | rohit         | chennai          |
|    102 | sawle    | pune      |         102 | rohini        | mumbai           |
|    101 | virat    | bangalore |         101 | rahul         | delhi            |
|    102 | sawle    | pune      |         102 | rohit         | chennai          |
|    102 | sawle    | pune      |         102 | rohini        | mumbai           |
+--------+----------+-----------+-------------+---------------+------------------+
6 rows in set (0.00 sec)

mysql> update  employees set emp_id=2;
Query OK, 6 rows affected (0.18 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from employees;
+--------+----------+-----------+
| emp_id | emp_name | city      |
+--------+----------+-----------+
|      2 | virat    | bangalore |
|      2 | sawle    | pune      |
|      2 | virat    | bangalore |
|      2 | sawle    | pune      |
|      2 | mayank   | punjab    |
|      2 | ganesh   | bidar     |
+--------+----------+-----------+
6 rows in set (0.00 sec)

mysql> select * from customers;
+-------------+---------------+------------------+
| customer_id | customer_name | customer_address |
+-------------+---------------+------------------+
|         101 | rahul         | delhi            |
|         102 | rohini        | mumbai           |
|         102 | rohit         | chennai          |
+-------------+---------------+------------------+
3 rows in set (0.00 sec)

mysql> select * from employees inner join customers on employees.emp_id=customers.customer_id;
Empty set (0.00 sec)

mysql> select customers.customer_name,employees.emp_name from employees inner join customers on employees.emp_id=customers.customer_id;
Empty set (0.00 sec)

mysql> select customers.customer_name,employees.emp_name from employees inner join customers on customers.customer_id=employees.emp_id;
Empty set (0.00 sec)

mysql> 
