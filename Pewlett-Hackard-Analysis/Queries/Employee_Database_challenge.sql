--Deliverable 1

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees e
LEFT JOIN titles t ON e.emp_no=t.emp_no
WHERE e.birth_date BETWEEN '19520101' AND '19551231'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;
--order of the csv is not the same as my query

--Retrieve number of employees by most recent job title about to retire

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title;
--count number and title diff than what is shown in Canvas but still in the correct order

--Deliverable 2

--Create mentorship eligibility table

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title
INTO mentorship_eligibility
FROM employees e
LEFT JOIN titles t ON e.emp_no=t.emp_no
LEFT JOIN dept_emp d ON e.emp_no=d.emp_no
WHERE d.to_date='9999-01-01' AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

--title diff than Canvas, everything else is the same
