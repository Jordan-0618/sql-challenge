-- 1. List the following details: Employee #, Last Name, 
-- First Name, Sex, Salary.

SELECT employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		employees.sex, 
		salaries.salary
FROM employees 
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- 2. List: First Name, Last Name, hire date for employees hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'; 

-- 3. List Manager for each dept with Dept #, Dept Name, Manager Employee #,
-- Last Name, First Name.
SELECT departments.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- 4. List Dept of each employee w/ employee #, Last Name, First Name, 
-- dept. Name.

SELECT departments.dept_no,
		departments.dept_name,
		employees.emp_no,
		employees.last_name,
		employees.first_name
FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no;

-- 5. List first name, last name, sex, for employees with first name 
-- "Hercules", last name starting with "B".

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- 6. List employees in Sales Dept. including: employee #, last name, 
-- first name, department name.

SELECT departments.dept_no,
		departments.dept_name,
		dept_emp.emp_no,
		employees.last_name,
		employees.first_name
FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

-- 7. List employees in Sales and Development Depts including: employee #,
-- last name, first name, dept name.

SELECT departments.dept_no,
		departments.dept_name,
		dept_emp.emp_no,
		employees.last_name,
		employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- 8. In descending order list frequency count of employee last names.

SELECT last_name, 
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY 
COUNT(last_name)DESC;


