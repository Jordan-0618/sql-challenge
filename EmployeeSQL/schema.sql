DROP TABLE departments;
DROP TABLE employees;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE departments(
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	CONSTRAINT pk_departments PRIMARY KEY(dept_no)
);

SELECT * FROM departments;

CREATE TABLE employees(
	emp_no INT,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date VARCHAR(30) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(10) NOT NULL,
	CONSTRAINT pk_employees PRIMARY KEY(emp_no)
);

SELECT * FROM employees

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL
);

SELECT * FROM dept_emp

CREATE TABLE dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL
);

SELECT * FROM dept_manager

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL
);

SELECT * FROM salaries

CREATE TABLE titles(
	title_id VARCHAR(10) NOT NULL,
	title VARCHAR(30) NOT NULL,
	CONSTRAINT pk_titles PRIMARY KEY(title_id)
);

SELECT * FROM titles

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no 
FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no
FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no 
FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no
FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no
FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employee_title_id
FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);