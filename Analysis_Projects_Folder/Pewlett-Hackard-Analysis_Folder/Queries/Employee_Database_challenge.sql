-- Deliverable 1 queries
-- Joining employee and titles tables
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    tl.title,
	tl.from_date,
	tl.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS tl
ON e.emp_no = tl.emp_no
WHERE (e.birth_date BETWEEN '1951-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Joining emp_info and titles tables
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
	rt.last_name,
    rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Unique Title count from Retirement Titles
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY Count DESC;



	
-- Deliverable 2 queries
-- Create Mentorship Eligibility table	
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    e.birth_date,
	de.from_date,
    de.to_date	
	INTO mentorship_eligibilty
	FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND (de.to_date = '9999-01-01')
	ORDER BY e.emp_no;	
