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
| foreign_key             |
| information_schema      |
| joins                   |
| mysql                   |
| mysql_clauses           |
| newDB                   |
| payroll_service_db      |
| performance_schema      |
+-------------------------+
11 rows in set (0.01 sec)

mysql> create database transactions;
Query OK, 1 row affected (0.22 sec)

mysql> use transactions;
Database changed

mysql> create table employees(emp_id int primary key auto_increment,emp_name varchar(50),emp_age int,city varchar(20),income int);
Query OK, 0 rows affected (0.76 sec)

mysql> insert into employees(emp_id,emp_name,emp_age,city,income) values(101,'peter',322,'new york',200000),(102,'mark',32,'california',300000);
Query OK, 2 rows affected (0.13 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into employees values(103,'donald',40,'arizona',1000000),(104,'obama',35,'florida',5000000);
Query OK, 2 rows affected (0.13 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into employees values(105,'linkon',32,'georgia',250000),(106,'kane',45,'alaska',450000);
Query OK, 2 rows affected (0.11 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into employees(emp_id,emp_name,emp_age,city,income) values(107,'adam',35,'california',5000000),(108,'macculum',40,'florida',350000);
Query OK, 2 rows affected (0.16 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into employees(emp_id,emp_name,emp_age,city,income) values(109,'bryan',32,'alaska',400000),(110,'stephen',40,'arizona',600000);
Query OK, 2 rows affected (0.15 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from employees;
+--------+----------+---------+------------+---------+
| emp_id | emp_name | emp_age | city       | income  |
+--------+----------+---------+------------+---------+
|    101 | peter    |     322 | new york   |  200000 |
|    102 | mark     |      32 | california |  300000 |
|    103 | donald   |      40 | arizona    | 1000000 |
|    104 | obama    |      35 | florida    | 5000000 |
|    105 | linkon   |      32 | georgia    |  250000 |
|    106 | kane     |      45 | alaska     |  450000 |
|    107 | adam     |      35 | california | 5000000 |
|    108 | macculum |      40 | florida    |  350000 |
|    109 | bryan    |      32 | alaska     |  400000 |
|    110 | stephen  |      40 | arizona    |  600000 |
+--------+----------+---------+------------+---------+
10 rows in set (0.01 sec)

mysql> create table orders(order_id int,product_name varchar(50),order_num int,order_date date);
Query OK, 0 rows affected (0.95 sec)

mysql> insert into orders values(1,'laptop',5544,'2020-02-01');
Query OK, 1 row affected (0.11 sec)

mysql> insert into orders values(2,'mouse',3322,'2020-02-11'),(3,'desktop',2135,'2020-01-05'),(4,'mobile',3432,'2020-02-22'),(5,'anti virus',5648,'2020-03-10');
Query OK, 4 rows affected (0.13 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
+----------+--------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> START TRANSACTION;  
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT @income:= MAX(income) FROM employees;  
+-----------------------+
| @income:= MAX(income) |
+-----------------------+
|               5000000 |
+-----------------------+
1 row in set, 1 warning (0.02 sec)

mysql> INSERT INTO employees(emp_id, emp_name, emp_age, city, income)   
    -> VALUES (111, 'Alexander', 45, 'California', 70000);  
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO orders(order_id, prod_name, order_num, order_date)   
    -> VALUES (6, 'Printer', 5654, '2020-01-10'); 
Query OK, 1 row affected (0.00 sec)

mysql> COMMIT; 
Query OK, 0 rows affected (0.11 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
+----------+--------------+-----------+------------+
6 rows in set (0.00 sec)

mysql> START TRANSACTION;  
Query OK, 0 rows affected (0.00 sec)

mysql> DELETE FROM orders;
Query OK, 6 rows affected (0.00 sec)

mysql> select * from orders;
Empty set (0.00 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.13 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
+----------+--------------+-----------+------------+
6 rows in set (0.00 sec)

mysql> DELETE FROM orders;
Query OK, 6 rows affected (0.20 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
Empty set (0.00 sec)

mysql> insert into orders values(1,'laptop',5544,'2020-02-01'),(2,'mouse',3322,'2020-02-11'),(3,'desktop',2135,'2020-01-05'),(4,'mobile',3432,'2020-02-22'),(5,'anti virus',5648,'2020-03-10');
Query OK, 5 rows affected (0.14 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
+----------+--------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
+----------+--------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> INSERT INTO orders(order_id, product_name, order_num, order_date)   
    -> VALUES (6, 'Printer', 5654, '2020-01-10');   
Query OK, 1 row affected (0.00 sec)

mysql> SAVEPOINT savepoint1; 
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO orders(order_id, product_name, order_num, order_date)   
    -> VALUES (7, 'Ink', 5894, '2020-03-10');  
Query OK, 1 row affected (0.00 sec)

mysql> ROLLBACK TO SAVEPOINT savepoint1;
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO orders(order_id, product_name, order_num, order_date)   
    -> VALUES (8, 'Speaker', 6065, '2020-02-18');  
Query OK, 1 row affected (0.01 sec)

mysql> COMMIT;  
Query OK, 0 rows affected (0.09 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
|        8 | Speaker      |      6065 | 2020-02-18 |
+----------+--------------+-----------+------------+
7 rows in set (0.00 sec)

mysql> START TRANSACTION;  
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO orders(order_id, product_name, order_num, order_date)   
    -> VALUES (7, 'Ink', 5894, '2020-03-10'); 
Query OK, 1 row affected (0.01 sec)

mysql> SAVEPOINT savepoint1;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
|        8 | Speaker      |      6065 | 2020-02-18 |
|        7 | Ink          |      5894 | 2020-03-10 |
+----------+--------------+-----------+------------+
8 rows in set (0.00 sec)

mysql> UPDATE orders SET product_name='Scanner' WHERE order_id=8; 
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> RELEASE SAVEPOINT savepoint1; 
Query OK, 0 rows affected (0.00 sec)

mysql> COMMIT;  
Query OK, 0 rows affected (0.10 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
|        8 | Scanner      |      6065 | 2020-02-18 |
|        7 | Ink          |      5894 | 2020-03-10 |
+----------+--------------+-----------+------------+
8 rows in set (0.00 sec)

mysql> start transaction; 
Query OK, 0 rows affected (0.00 sec)

mysql> delete from orders where product_name='mobile ; 
    '> '
    -> ;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
|        8 | Scanner      |      6065 | 2020-02-18 |
|        7 | Ink          |      5894 | 2020-03-10 |
+----------+--------------+-----------+------------+
8 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        4 | mobile       |      3432 | 2020-02-22 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
|        8 | Scanner      |      6065 | 2020-02-18 |
|        7 | Ink          |      5894 | 2020-03-10 |
+----------+--------------+-----------+------------+
8 rows in set (0.00 sec)

mysql> delete from orders where product_name='mobile'; 
Query OK, 1 row affected (0.10 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
|        8 | Scanner      |      6065 | 2020-02-18 |
|        7 | Ink          |      5894 | 2020-03-10 |
+----------+--------------+-----------+------------+
7 rows in set (0.00 sec)

mysql> delete from orders where order_num=6065;
Query OK, 1 row affected (0.18 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
|        7 | Ink          |      5894 | 2020-03-10 |
+----------+--------------+-----------+------------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
|        7 | Ink          |      5894 | 2020-03-10 |
+----------+--------------+-----------+------------+
6 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> delete from orders where order_date='2020-03-10';
Query OK, 2 rows affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        6 | Printer      |      5654 | 2020-01-10 |
+----------+--------------+-----------+------------+
4 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.04 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
|        7 | Ink          |      5894 | 2020-03-10 |
+----------+--------------+-----------+------------+
6 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> delete from orders where order_id=7;
Query OK, 1 row affected (0.00 sec)

mysql> savepoint sp1;
Query OK, 0 rows affected (0.00 sec)

mysql> delete from orders where order_id=6;
Query OK, 1 row affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        5 | anti virus   |      5648 | 2020-03-10 |
+----------+--------------+-----------+------------+
4 rows in set (0.00 sec)

mysql> savepoint sp2;
Query OK, 0 rows affected (0.00 sec)

mysql> rollback to sp1;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
+----------+--------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> rollback to sp1;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders;
+----------+--------------+-----------+------------+
| order_id | product_name | order_num | order_date |
+----------+--------------+-----------+------------+
|        1 | laptop       |      5544 | 2020-02-01 |
|        2 | mouse        |      3322 | 2020-02-11 |
|        3 | desktop      |      2135 | 2020-01-05 |
|        5 | anti virus   |      5648 | 2020-03-10 |
|        6 | Printer      |      5654 | 2020-01-10 |
+----------+--------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> create table customers(id int primary key auto_increment,name varchar(30),age int,address varchar(20),salary int);
Query OK, 0 rows affected (1.40 sec)

mysql> insert into customers(id,name,age,address,salary) values(1,'ramesh',32,'ahmedabad',3000),(2,'khilan',25,'delhi',2000);
Query OK, 2 rows affected (0.13 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into customers(id,name,age,address,salary) values(3,'kaushik',23,'kota',3000),(4,'chaitali',25,'mumbai',3000),(5,'hardik',27,'bhopal',7500);
Query OK, 3 rows affected (0.15 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into customers(name,age,address,salary) values('komal',22,'bhopal',3500),('muktar',24,'pune',5000);
Query OK, 2 rows affected (0.18 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+----+----------+------+-----------+--------+
| id | name     | age  | address   | salary |
+----+----------+------+-----------+--------+
|  1 | ramesh   |   32 | ahmedabad |   3000 |
|  2 | khilan   |   25 | delhi     |   2000 |
|  3 | kaushik  |   23 | kota      |   3000 |
|  4 | chaitali |   25 | mumbai    |   3000 |
|  5 | hardik   |   27 | bhopal    |   7500 |
|  6 | komal    |   22 | bhopal    |   3500 |
|  7 | muktar   |   24 | pune      |   5000 |
+----+----------+------+-----------+--------+
7 rows in set (0.00 sec)

mysql> SAVEPOINT SP1;
Query OK, 0 rows affected (0.00 sec)

mysql> DELETE FROM customers WHERE id=1;
Query OK, 1 row affected (0.22 sec)

mysql> select * from customers;
+----+----------+------+---------+--------+
| id | name     | age  | address | salary |
+----+----------+------+---------+--------+
|  2 | khilan   |   25 | delhi   |   2000 |
|  3 | kaushik  |   23 | kota    |   3000 |
|  4 | chaitali |   25 | mumbai  |   3000 |
|  5 | hardik   |   27 | bhopal  |   7500 |
|  6 | komal    |   22 | bhopal  |   3500 |
|  7 | muktar   |   24 | pune    |   5000 |
+----+----------+------+---------+--------+
6 rows in set (0.00 sec)

mysql> SAVEPOINT SP1;
Query OK, 0 rows affected (0.00 sec)

mysql> SAVEPOINT SP2;
Query OK, 0 rows affected (0.01 sec)

mysql> DELETE FROM customers WHERE id=2;
Query OK, 1 row affected (0.28 sec)

mysql> SAVEPOINT SP3;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from customers;
+----+----------+------+---------+--------+
| id | name     | age  | address | salary |
+----+----------+------+---------+--------+
|  3 | kaushik  |   23 | kota    |   3000 |
|  4 | chaitali |   25 | mumbai  |   3000 |
|  5 | hardik   |   27 | bhopal  |   7500 |
|  6 | komal    |   22 | bhopal  |   3500 |
|  7 | muktar   |   24 | pune    |   5000 |
+----+----------+------+---------+--------+
5 rows in set (0.00 sec)

mysql> DELETE FROM customers WHERE id=3;
Query OK, 1 row affected (0.12 sec)

mysql> select * from customers;
+----+----------+------+---------+--------+
| id | name     | age  | address | salary |
+----+----------+------+---------+--------+
|  4 | chaitali |   25 | mumbai  |   3000 |
|  5 | hardik   |   27 | bhopal  |   7500 |
|  6 | komal    |   22 | bhopal  |   3500 |
|  7 | muktar   |   24 | pune    |   5000 |
+----+----------+------+---------+--------+
4 rows in set (0.00 sec)

mysql> 
