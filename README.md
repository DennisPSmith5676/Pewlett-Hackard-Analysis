# Pewlett-Hackard-Analysis
## Overview of Project
Bobby’s manager has given both of you two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, you’ll write a report that summarizes your analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.
1.	Deliverable 1: The Number of Retiring Employees by Title
2.	Deliverable 2: The Employees Eligible for the Mentorship Program
3.	Deliverable 3: A written report on the employee database analysis README.md.

Resources and Before Start Notes:
- Data Source: Employee_Database_challenge.sql
- Data Tools: PostgreSQL, pgAdmin

For more information, read the Documentation on PostgreSQL and other data types.
## Database Keys
Database keys identify records from tables and establish relationships between tables. There are numerous types of keys. For our purposes, we will focus on primary keys and foreign keys.
## Primary Keys
The departments.csv file has a dept_no column with unique identifiers for each row (one department number per department). For example, d001 will always reference the Marketing department, across other worksheets. This unique identifier is known as a primary key. Primary keys are an important part of database design. When a database is being created, each table added must include a primary key in the architecture. Primary keys serve as a link between these tables.

In the CSV file, dept_emp.csv, the "emp_no" column contains the primary key. We know this is the primary key because each number is unique. For example, the emp_no column holds employee numbers. Each employee will have only one number, and that number won't be used for any other employee.
Open that file and take an initial look at the data.
## Foreign Keys
Foreign keys are just as important as primary keys. While primary keys contain unique identifiers for their dataset, a foreign key references another dataset's primary key.
Think about it like a phone number. You have your own number. It's your number, assigned to your phone, and unique to you. This is your primary key. Your friend also has a primary key: his or her own phone number.
When you save your friend's number in your phone, you're creating a reference to that person, also known as a foreign key. Your phone has lots of foreign keys (such as parents, doctors offices, friends, and other family), but only one primary key.
Likewise, when your friend saves your number in their phone, your number is now a foreign key in their phone. Saving these keys connects the devices. They show the relationship between your phone and your friend's phone.

 ![Table2](/Analysis_Projects_Folder/Pewlett-Hackard-Analysis_Folder/Images/erd.png)

In this example, dept_no shows up in both datasets; as an identifier (or primary key) in one and as a reference (or foreign key) in the other. This demonstrates the link between employees and which department they work in. We could continue to look for connections between the datasets, or we could create a roadmap of the content. Our roadmap would serve as a quick reference diagramming the different datasets and their interconnections. Additionally, it could be used as a reference guide later, when we begin to create queries to access all of the data.
## Table Structure
When working in Excel and Visual Basic for Applications (VBA), we're working directly with worksheets with data. In SQL, the same worksheets we have been exploring are organized into tables instead. They are similar to DataFrames in that they have headers and indexes, with data in columns and rows. Take a look at the following images.
 
Next we'll cover how table structure comes into play when creating an entity relationship diagram.
Entity Relationship Diagrams (ERDs)
An entity relationship diagram (ERD) is a type of flowchart that highlights different tables and their relationships to each other. The ERD does not include any actual data, but it does capture the following pertinent information from each CSV file:
- Primary keys
- Foreign keys
- Data types for each column

The ERD also shows the flow of information from one table to another, as captured in the image above:
 
In addition to creating new databases, ERDs are used to document existing databases. The visual representation of the tables gives a deeper understanding of the data and the database as a whole.
When creating a diagram, we need to fully understand all of the data being inserted. Database components include tables, known as entities, with data, known as attributes.

Data types include Booleans, integers, and varying characters (i.e., within a string).

There are three types of ERDs: conceptual, logical, and physical. Each one builds upon the other—you need the conceptual ERD to build a logical ERD to build a physical ERD. We'll learn how to create ERDs later in this module.
IMPORTANT TO KNOW
## Conceptual Diagrams
A conceptual diagram is an ERD in its simplest form. To create one, we only need two things: a table name and column headers.
It's simple because we're creating just the concept of the diagram. By covering only the basics, it's easier to capture the main points. If we tried to capture everything at once (data types, location of the primary and foreign keys, etc.), we're more likely to overlook a crucial item.

## Logical Diagrams
Logical diagrams contain all of the same information that a conceptual diagram does, but the table is updated to include data types and primary keys.
Returning to the Quick DBD webpage, let's update our schema. Because we already took an initial look at the worksheet, we have already identified the primary key and know what type of data we're working with. Using the following syntax, update our Departments schema:
Add "varchar pk" to dept_no. Add "varchar" to dept_name. We use varchar (Links to an external site.) in these columns because the fields contain characters of varying length. Adding "pk" in the schema next to column indicates that column as a primary key. The table updated to reflect the changes in the text editor. A key symbol appears next to the dept_no line, indicating that it is the table's primary key, and varchar is added to indicate its type.

## Physical Diagrams
Physical diagrams portray the physical relationship, or how the data is connected, between each table. There are several different relationships available to keep in mind when making these connections, as shown below:

# Deliverable 1: The Number of Retiring Employees by Title
Deliverable Requirements:
Using the ERD you created as a reference and your knowledge of SQL queries, create a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions—you’ll need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, use the COUNT() function to create a final table that has the number of retirement-age employees by most recent job title.
1.	A query is written and executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955
2.	The Retirement Titles table is exported as retirement_titles.csv
3.	A query is written and executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title.
4.	The Unique Titles table is exported as unique_titles.csv
5.	A query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring.
6.	The Retiring Titles table is exported as retiring_titles.csv
Results with detail analysis:
1.	A query is written and executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955.

![Table1](/Analysis_Projects_Folder/Pewlett-Hackard-Analysis_Folder/Images/retirement_titles.png)

-- Follow the instructions below to complete Deliverable 1.
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;
 
2.	The Retirement Titles table is exported as retirement_titles.csv
Exported retirement_titles.csv Image below.


![Table3](/Analysis_Projects_Folder/Pewlett-Hackard-Analysis_Folder/Images/retirement_titles.png)
 
3.	*A query is written and executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title.

![Table4](/Analysis_Projects_Folder/Pewlett-Hackard-Analysis_Folder/Images/unique_titles.png)

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;
 
4.	The Unique Titles table is exported as unique_titles.csv
Exported unique_titles.csv Image below.

![Table5](/Analysis_Projects_Folder/Pewlett-Hackard-Analysis_Folder/Images/unique_titles.png)
 
5.	A query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring.

![Table6](/Analysis_Projects_Folder/Pewlett-Hackard-Analysis_Folder/Images/retiring_titles.png)

-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;
 
6.	The Retiring Titles table is exported as retiring_titles.csv
Exported retiring_titles.csv Image below.
![Table7](Analysis_Projects_Folder\Pewlett-Hackard-Analysis_Folder\Images\retiring_titles.png)
 
# Deliverable 2: The Employees Eligible for the Mentorship Program
Deliverable Requirements:
Using the ERD you created in this module as a reference and your knowledge of SQL queries, create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

![Table2](/Analysis_Projects_Folder/Pewlett-Hackard-Analysis_Folder/Images/erd.png)

- A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.
- The Mentorship Eligibility table is exported and saved as mentorship_eligibilty.csv
## Results with detail analysis:
- A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.
- Write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
 
- The Mentorship Eligibility table is exported and saved as 
- mentorship_eligibilty.csv"

![Table8](/Analysis_Projects_Folder/Pewlett-Hackard-Analysis_Folder/Images/mentorship_eligibility.png)

# Deliverable 3: A written report on the employee database analysis
The analysis should contain the following:
1.	Overview of the analysis: Explain the purpose of this analysis.
- In this deliverable, Bobby was tasked to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, you’ll write a report that summarizes your analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.
2. Results: Provide a bulleted list with four major points from the two analysis deliverables. 

- 1. From the finding of the eligible retirees, High Percentage of the workforce could retire at any given time.
- 2. From the job titles of the eligible retirees, the breakdown is below.
        - 13,608 Staff
        - 32,470 Senior Engineer
        - 15,722 Engineer
        - 31,282 Senior Staff
        - 4,876 Technique Leader
        - 1,931 Assistant Engineer
        - 2 Manager

- 3. The develpoment, Production and Sales departments will be hit hardest. See the table below:

![Table8](/Analysis_Projects_Folder/Pewlett-Hackard-Analysis_Folder/Images/dept_titles.png)

- 4. The Manager and assitant engineer roles will have the least impact overall based on title. See the table above


3. Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami.":
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?.
90,991 roles are in urgent need to be filled out as soon as the workforce starts retiring at any given time.
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
No, we have 1,549 employees who are eligible to participate in a mentorship program.
