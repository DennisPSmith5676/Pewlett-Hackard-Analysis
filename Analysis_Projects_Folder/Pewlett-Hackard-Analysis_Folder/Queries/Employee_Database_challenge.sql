-- Joining retirement_info and titles tables
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    tl.title
INTO retirement_titles
FROM retirement_info as ri
LEFT JOIN titles as tl
ON ri.emp_no = tl.emp_no
WHERE tl.to_date = ('9999-01-01')
GROUP BY ri.emp_no, ri.first_name, ri.last_name, tl.title
ORDER BY ri.emp_no;

-- Joining emp_info and titles tables
SELECT ei.emp_no,
    ei.first_name,
	ei.last_name,
    tl.title
INTO unique_titles
FROM emp_info as ei
LEFT JOIN titles as tl
ON ei.emp_no = tl.emp_no
WHERE tl.to_date = ('9999-01-01')
GROUP BY ei.emp_no, ei.first_name, ei.last_name, tl.title
ORDER BY ei.emp_no;

-- Unique Title count from Retirement Titles
SELECT COUNT(rt.emp_no)
	FROM retirement_titles as rt;

-- Create Mentorship Eligibility table	
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date	
	INTO mentorship_eligibilty
	FROM employees as e
	INNER JOIN salaries as s
	ON (e.emp_no = s.emp_no)
	INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
      AND (de.to_date = '9999-01-01');	
	
