-- Challenge Module 7
-- Laurina LaStella, July 2022


------ TABLE = retirement_titles
-- For the alias for table "titles"
-- I tried "t" but it lit up like it's a
-- reserved word. Switched to "ti."
SELECT e.emp_no,
    e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no
;

------ TABLE = unique_titles
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
    rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC
;

------ TABLE = retiring_titles
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC
;

------ TABLE = mentorship_eligibilty
------------ Why is dept_emp table involved in this query?
------------ Doesn't seem to add any value.
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees AS e
LEFT JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
LEFT JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE 
	(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
	AND
	(de.to_date = '9999-01-01')
	AND 
	------ Adding Title date parameter to 
	------ retrieve current title.
	------------ Mod 7 Challenge, Deliverable 2
	------------ control image includes some previous titles,
	------------ not always current titles. Fixing.
	(ti.to_date = '9999-01-01')
ORDER BY e.emp_no
;

------ Count of mentorship_eligibilty x title
SELECT COUNT(me.title), me.title
FROM mentorship_eligibilty AS me
GROUP BY me.title
ORDER BY count DESC
;


