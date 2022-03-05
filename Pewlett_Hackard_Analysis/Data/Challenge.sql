-- Create a Retirement Titles table
DROP TABLE retirement_titles CASCADE;

SELECT em.emp_no,
	   em.first_name,
	   em.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no ASC;

SELECT * FROM retirement_titles;

SELECT COUNT (emp_no)
FROM retirement_titles;

SELECT emp_no, first_name, last_name, title
FROM retirement_titles;

SELECT DISTINCT title
FROM retirement_titles;

SELECT DISTINCT emp_no
FROM retirement_titles as rt
ORDER BY rt.emp_no ASC;

SELECT DISTINCT ON (emp_no)emp_no,first_name,last_name,title
INTO Unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no ASC;

SELECT COUNT (emp_no)
FROM Unique_titles;

SELECT * FROM Unique_titles;

DROP TABLE Unique_titles;

SELECT COUNT (title)
FROM Unique_titles;

DROP TABLE Retiring_titles;
SELECT COUNT(title) AS count_title, title
INTO Retiring_titles
FROM Unique_titles
GROUP BY title ORDER BY count_title DESC;
SELECT * FROM Retiring_titles;


-- Create Unique Titles table

DROP TABLE Mentorship_Eligibility CASCADE;
SELECT em.emp_no,
	   em.first_name,
	   em.last_name,
	   em.birth_date,
	   dpe.from_date,
	   dpe.to_date,
	   ti.title
INTO indistict_Mentorship_Eligibility
FROM employees as em
INNER JOIN dept_emp as dpe
ON em.emp_no = dpe.emp_no
INNER JOIN titles as ti
on em.emp_no = ti.emp_no
WHERE dpe.to_date = ('9999-01-01')
AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no ASC;

SELECT * FROM indistict_Mentorship_Eligibility;

SELECT COUNT (emp_no)
FROM indistict_Mentorship_Eligibility;

SELECT DISTINCT emp_no
FROM indistict_Mentorship_Eligibility;

SELECT DISTINCT ON (emp_no)emp_no,first_name,last_name,birth_date,from_date,to_date,title
INTO Mentorship_Eligibility
FROM indistict_Mentorship_Eligibility as ime
WHERE ime.to_date = ('9999-01-01')
ORDER BY ime.emp_no ASC;

SELECT * FROM Mentorship_Eligibility;

SELECT COUNT (emp_no)
FROM Mentorship_Eligibility;