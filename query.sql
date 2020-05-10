create table departments(
	dept_no varchar(50) not null,
	dept_name varchar(50) not null,
	primary key (dept_no)
);
--select * from departments;

CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(30) NOT NULL
);

-- Create a Dept_Manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(30) NOT NULL,
  emp_no INT NOT NULL
);

-- Create a Employees table
CREATE TABLE employees (
  emp_no INT NOT NULL,
  emp_title VARCHAR(30) NOT NULL,
  birth_date VARCHAR(30) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date VARCHAR(30) NOT NULL
);

-- Create a Salaries table
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL
);

-- Create a Titles table
CREATE TABLE titles (
  title_id VARCHAR(30) NOT NULL,
  title VARCHAR(30) NOT NULL
);
--select * from titles;

--1, List the following details of each employee: 
----employee number, last name, first name, sex, and salary.
select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees e
join salaries s
on e.emp_no=s.emp_no;

--2. List first name, last name, and hire date for 
-----employees who were hired in 1986.
--select * from employees;
select first_name, last_name,hire_date from employees
where hire_date like '%86%';

--3. List the manager of each department with the following 
----information: department number, department name, 
-----the manager's employee number, last name, first name.
SELECT i.dept_no, i.dept_name, f.emp_no, n.first_name, n.last_name
FROM departments i
JOIN dept_manager f
ON (i.dept_no = f.dept_no)
JOIN employees n
ON (f.emp_no = n.emp_no);

--4. List the department of each employee with the following information:
----employee number, last name, first name, and department name.
select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees e
join dept_emp de
on(e.emp_no=de.emp_no)
join departments d
on(d.dept_no=de.dept_no);

--5. List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
select first_name, last_name,sex from employees
where first_name='Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de
on(de.emp_no=e.emp_no)
join departments d
on(de.dept_no=d.dept_no)
where d.dept_name='Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, 
---and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de
on(de.emp_no=e.emp_no)
join departments d
on(de.dept_no=d.dept_no)
where d.dept_name='Sales' or d.dept_name='Development';

--8. In descending order, list the frequency count of employee 
---last names,i.e., how many employees share each last name.
select last_name, count(last_name) as "frequency"
from employees
group by last_name
order by last_name desc;
