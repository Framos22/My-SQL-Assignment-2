-- I want to know how many employees with each title were born after 1965-01-01.

SELECT t.title, COUNT(*) AS "Number of Employees Per Title" FROM titles AS T
INNER JOIN employees AS e ON e.emp_no = t.emp_no 
WHERE e.birth_date > '1965-01-01'
GROUP BY t.title;

-- I want to know the average salary per title.

SELECT t.Title, AVG(salary) 
FROM titles as T
INNER JOIN salaries as S
ON t.emp_no=s.emp_no
GROUP BY t.title;

-- How much money was spent on salary for the marketing department between the years 1990 and 1992?

SELECT d.dept_name AS "Department",  SUM(s.salary) AS "Total $ Amount of Salaries Paid Between 1990 - 1992"
FROM departments d
INNER JOIN dept_emp de ON de.dept_no = d.dept_no
INNER JOIN salaries s ON s.emp_no = de.emp_no
WHERE  de.from_date >= '1990-01-01' AND de.to_date <= '1992-12-31' AND d.dept_name = 'Marketing' 
GROUP BY d.dept_name; 
