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
| teachers        |
+-----------------+
7 rows in set (0.01 sec)

mysql> create table officers(off_id int primary key auto_increment, officer_name varchar(50), salary int);
Query OK, 0 rows affected (1.03 sec)

mysql> insert into officers values(1,'baban',20000),(2,'raghu',25000),(3,'rakesh',30000),(4,'akash',35000);
Query OK, 4 rows affected (0.14 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into officers values(5,'baban',25000),(6,'raju',25000),(7,'guru',36000),(8,'prakash',22000);
Query OK, 4 rows affected (0.13 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from officers;
+--------+--------------+--------+
| off_id | officer_name | salary |
+--------+--------------+--------+
|      1 | baban        |  20000 |
|      2 | raghu        |  25000 |
|      3 | rakesh       |  30000 |
|      4 | akash        |  35000 |
|      5 | baban        |  25000 |
|      6 | raju         |  25000 |
|      7 | guru         |  36000 |
|      8 | prakash      |  22000 |
+--------+--------------+--------+
8 rows in set (0.00 sec)

mysql> select count(officer_name) from officers;
+---------------------+
| count(officer_name) |
+---------------------+
|                   8 |
+---------------------+
1 row in set (0.00 sec)

mysql> select count(salary) as "Total Number Of Officers" from officers;
+-------------------------+
| Total Number Of Officers |
+-------------------------+
|                       8 |
+-------------------------+
1 row in set (0.00 sec)

mysql> select count(officer_name) as "Total Number of Officers" from officers;
+--------------------------+
| Total Number of Officers |
+--------------------------+
|                        8 |
+--------------------------+
1 row in set (0.01 sec)

mysql> select count(*) from officers where salary=25000;
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

mysql> select sum(salary) from officers;
+-------------+
| sum(salary) |
+-------------+
|      218000 |
+-------------+
1 row in set (0.01 sec)

mysql> select sum(salary) as "Total Sum Of salary" from officers;
+---------------------+
| Total Sum Of salary |
+---------------------+
|              218000 |
+---------------------+
1 row in set (0.00 sec)

mysql> select avg(salary) as "Average Salary" from officers;
+----------------+
| Average Salary |
+----------------+
|     27250.0000 |
+----------------+
1 row in set (0.00 sec)

mysql> select avg(salary) as "Minimum Salary" from officers;
+----------------+
| Minimum Salary |
+----------------+
|     27250.0000 |
+----------------+
1 row in set (0.00 sec)

mysql> select avg(salary) as "Maximum Salary" from officers;
+----------------+
| Maximum Salary |
+----------------+
|     27250.0000 |
+----------------+
1 row in set (0.00 sec)

mysql> select * from officers;
+--------+--------------+--------+
| off_id | officer_name | salary |
+--------+--------------+--------+
|      1 | baban        |  20000 |
|      2 | raghu        |  25000 |
|      3 | rakesh       |  30000 |
|      4 | akash        |  35000 |
|      5 | baban        |  25000 |
|      6 | raju         |  25000 |
|      7 | guru         |  36000 |
|      8 | prakash      |  22000 |
+--------+--------------+--------+
8 rows in set (0.00 sec)

mysql> select officer_name from officers limit 1;
+--------------+
| officer_name |
+--------------+
| baban        |
+--------------+
1 row in set (0.00 sec)

mysql> select salary from officers limit 4;
+--------+
| salary |
+--------+
|  20000 |
|  25000 |
|  30000 |
|  35000 |
+--------+
4 rows in set (0.00 sec)

mysql> select salary from officers order by officer_name limit 3;
+--------+
| salary |
+--------+
|  35000 |
|  20000 |
|  25000 |
+--------+
3 rows in set (0.00 sec)

mysql> select salary from officers order by officer_name desc limit 2;
+--------+
| salary |
+--------+
|  30000 |
|  25000 |
+--------+
2 rows in set (0.00 sec)

mysql> select off_id from officers order by salary asc limit 3;
+--------+
| off_id |
+--------+
|      1 |
|      8 |
|      6 |
+--------+
3 rows in set (0.00 sec)

mysql> 


