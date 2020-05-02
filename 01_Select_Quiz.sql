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

select first_name, salary*6 as �޿����� from employees;

select first_name, commission_pct*6 Ŀ�̼����� from employees;

select first_name as "Name", salary as "Salary" from employees;

select employee_id �����ȣ, first_name ����̸�, hire_date �Ի���, department_id �μ���ȣ from employees;

select department_id �μ���ȣ, department_name �μ��̸�, location_id ������ȣ from departments;

select job_id || first_name from employees;

select hire_date||'���Ի���'||first_name||'�Դϴ�' from employees;

select first_name || '�� �޿���' || salary || '�Դϴ�.' "����� �޿�" from employees;

-------------------å���� p.92~------------

select employee_id, first_name || last_name as emp_name
from employees
where salary > 5000
order by employee_id; -- ��������

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

--EXIST = IN = SOME = ANY (�ش��ϴ� ��)
--employees���̺�� dempartments���̺��� department_id�� ���εǾ� ����

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







