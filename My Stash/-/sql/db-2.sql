show databases;
use db1;
show tables;
select * from employees;
desc employees;
truncate employees;
insert into employees values(68319,"KAYLING","PRESIDENT",NULL,"1991-11-18",6000.00,null,1001);
insert into employees values(66928,"BLAZE","MANAGER",68319,"1991-05-01",2750.00,null,3001);
insert into employees values(67832,"CLARE","MANAGER",68319,"1991-06-09",2550.00,null,1001);
insert into employees values(65646,"JONAS","MANAGER",68319,"1991-04-02",2957.00,null,2001);
insert into employees values(67858,"SCARLET","ANALYST",65646,"1991-04-19",3100.00,null,2001);
insert into employees values(69062,"FRANK","ANALYST",65646,"1991-12-03",3100.00,null,2001);
insert into employees values(63679,"SANDRINE","CLERK",69062,"1990-12-18",900.00,null,2001);
insert into employees values(64989,"ADELYN","SALESMAN",66928,"1991-02-20",1700.00,400.00,3001);
insert into employees values(65271,"WADE","SALESMAN",66928,"1991-02-22",1350.00,600.00,3001);
insert into employees values(66564,"MADDEN","SALESMAN",66928,"1991-09-20",1350.00,1500.00,3001);
insert into employees values(68454,"TUCKER","SALESMAN",66928,"1991-09-08",1600.00,0.00,3001);
insert into employees values(68736,"ADNRES","CLERK",67858,"1991-05-23",1200.00,null,2001);
insert into employees values(69000,"JULIUS","CLERK",66928,"1991-12-03",1050.00,null,3001);
insert into employees values(69324,"MARKER","CLERK",67832,"1991-01-23",1400.00,null,1001);

-- Question 1
select * from employees;

-- Question 2 
select salary from employees;

-- Question 3
select distinct job_name from employees;

-- Question 4
select emp_name, 
	   concat('$',ROUND(salary+salary*15/100)) 
as Salary from employees;

-- Question 5
select concat(emp_name,'   ',job_name) 
as "Employee & Job" from employees;

-- Question 6
select emp_id,emp_name,
	    salary,
        ate_format(hire_date,"%M %e %Y") 
from employees;

-- Question 7
SELECT length(trim(emp_name)) 
as "LENGTH" 
FROM employees;

-- Question 8
SELECT emp_id,
	   salary,
       commission 
from employees;

-- Question 9
select distinct dep_id,
	    job_name 
from employees;

-- Question 10
select * from employees 
where dep_id 
NOT IN(2001);

-- Question 11
select * from 
	employees 
where 
	date_format(hire_date, "%Y") < 1991;

-- Question 12
select avg(salary) from 
	employees 
where job_name="analyst";

-- Question 13
SELECT * from 
	employees 
where emp_name = "BLAZE";

-- Question 14
select * from 
	employees 
where 
	salary+salary*25/100 > 3000;

-- Question 15
select * from 
	employees 
where 
	date_format(hire_date, "%m") = 01;

-- Question 16
select emp_id,
	emp_name,
    hire_date,
    salary 
from employees 
where hire_date < "1991-04-01";

-- Question 17
insert into salary_grade values(1,800,1300);
insert into salary_grade values(2,1301,1500);
insert into salary_grade values(3,1501,2100);
insert into salary_grade values(4,2101,3100);
insert into salary_grade values(5,3101,9999);
select * from salary_grade;
SELECT employees.emp_name,
       employees.salary
FROM employees,
     salary_grade
WHERE employees.emp_name = 'frank'
  AND employees.salary BETWEEN salary_grade.min_salary AND salary_grade.max_salary
  AND employees.salary = salary_grade.max_salary;

-- Question 18
select * from 
	employees 
where job_name 
	NOT IN ('manager','president') 
	order by salary ASC;

-- Question 19
select max(salary) 
as 
	MAX 
from 
	employees;

-- Question 20
select job_name, 
	avg(salary),
    avg(salary+commission) 
from employees 
group by job_name;

-- Question 21
insert into departments 
	values(1001,'FINANCE','SYDNEY');
insert into departments 
	values(2001,'AUDIT','MELBOURNE');
insert into departments 
	values(3001,'MARKETING','PERTH');
insert into departments 
	values(4001,'PRODUCTION','BRISBANE');
ALTER table 
	employees 
add foreign key (dep_id) 
references 
	departments(dep_id);
select * from departments;
SELECT employees.emp_id,
	   employees.emp_name,
       departments.dep_id,
       departments.dep_location,
       departments.dep_name 
from employees,
       departments 
where employees.dep_id=departments.dep_id 
AND employees.dep_id 
IN (1001,2001);

-- Question 22
select manager_id,
	    count(manager_id) 
as count from employees 
group by manager_id 
order by manager_id;

-- Question 23
select dep_id,
	count(dep_id) 
from employees 
group by dep_id 
having 
	count(dep_id) > 2;

-- Question 24
select * from 
	employees 
where emp_name 
like '%ar%';

-- Question 25
alter table employees add gender varchar(10);
update employees set gender="male" where emp_id>0;
