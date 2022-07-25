Departments
-
dept_no varchar pk fk -< Dept_Emp.dept_no
dept_name varchar


Dept_Manager
-
dept_no varchar pk fk - Departments.dept_no
emp_no varchar fk fk >- Dept_Emp.emp_no
from_date date
to_date date


Dept_Emp
-
emp_no varchar pk fk - Employees.emp_no
dept_no varchar fk
from_date date
to_date date


Employees
-
emp_no varchar pk 
birth_date date
first_name varchar
last_name varchar
gender varchar
hire_date date


Salaries
-
emp_no varchar pk fk - Employees.emp_no
salary
from_date date
to_date date


Titles
-
emp_no varchar pk fk - Employees.emp_no
title varchar
from_date date
to_date date