SELECT * FROM employees;
SELECT * FROM departments;

describe employees;
describe departments;
describe locations;

select employee_id, first_name, job_id from employees;

select department_id, department_name from departments;

select department_name, location_id from departments;

select employee_id, first_name, job_id from employees;

select salary, commission_pct from employees;

select distinct hire_date from employees;

select distinct manager_id from employees;

select distinct department_id from departments;

select first_name, salary*6 as 급여의합 from employees;

select first_name, commission_pct*6 커미션의합 from employees;

select first_name as "Name", salary as "Salary" from employees;

select employee_id 사원번호, first_name 사원이름, hire_date 입사일, department_id 부서번호 from employees;

select department_id 부서번호, department_name 부서이름, location_id 지역번호 from departments;

select job_id || first_name from employees;

select hire_date||'에입사한'||first_name||'입니다' from employees;

select first_name || '의 급여는' || salary || '입니다.' "사원의 급여" from employees;

-------------------책내용 p.92~------------

select employee_id, first_name || last_name as emp_name
from employees
where salary > 5000
order by employee_id; -- 오름차순

select employee_id, salary
from employees
where salary = any(3000,7000,10000)
order by salary;

select employee_id, salary
from employees
where NOT(salary >=10000)
order by salary;

select employee_id, salary
from employees
where salary between 3000 and 14000
order by salary;

select employee_id, salary
from employees
where salary NOT IN (10000,11000,12000,13000,20000,21000,22000,23000,24000)
order by salary;

--EXIST = IN = SOME = ANY (해당하는 값)
--employees테이블과 dempartments테이블이 department_id로 조인되어 있음

select department_id, department_name
from departments a
where exists (select *
              from employees b
              where a.department_id = b.department_id
              and b.salary > 3000)
order by department_id;

select first_name || ' ' || last_name AS emp_name
from employees
where first_name like 'A%'
order by employee_id;







