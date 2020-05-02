select * from employees;
select * from jobs;

-- ���̺� ����

describe employees; --������ ��Ű�� ����
describe jobs;

-- �ڷ���  ����, ���� ,Date

-- 01.�˻�(����) SELECT��
-- ����) select [�ʵ�/�÷��� �Ǵ� ǥ����]
--      from [���̺�� �Ǵ� ���]
--      where ������
--      group by [�÷���]having ������
--      order by [�÷���]

-- 1. �ܼ��˻� : select [column or expression] from [tablename or viewname]
SELECT first_name FROM employees;

-- ������ ���� ���� ����, ������
SELECT last_name
FROM employees;

--��ҹ��ڸ� �������� �ʴ� ���� ������ �� ��� �빮�ڷ� �ٲ�

SELECT last_name,
        first_name,
        salary,
        email
FROM employees;

-- 2. ��� �ʵ�(��) ��ȸ

SELECT * FROM employees;

SELECT job_id FROM employees;

Select Department_Id -- 107��(���)�� ����
From Employees;

-- 3. �ߺ��� ����

Select Distinct job_Id, Department_Id
From Employees; -- ���̾��� ���� �̻��ϳ�

Select Distinct job_Id
From Employees;

Select Distinct Department_ID
From Employees;

-- 4. ����(�������) +,-,*,/
SELECT EMPLOYEE_ID,
        SALARY,
        SALARY+100 AS "Rised", -- double quotation���� ��ҹ��� ���а���
        SALARY-100  "Lowed",
        SALARY*100  "Multiple",
        SALARY/2 AS "Dived"
        FROM EMPLOYEES;

-- 5.Select (NULL�� ��Ȯ�� �Ǵ� �� �� ���� ���� �ǹ��Ѵ�. �׷��� ����, �Ҵ�, �� �Ұ���
-- ����Ŭ �Ϲ��Լ� NVL(�÷�, ġȯ�� ��)
SELECT employee_id,
       salary,
       commission_pct, -- �μ�Ƽ��
       NVL((commission_pct+1)*salary, salary) as ��� -- commission_pct = null�̸� salary�� ��ȯ�� ��
FROM employees;

select count(*) "Record_Number" from employees;

-- 6. ��Ī(alias) AS ' '
-- ��Ģ : ����, Ư������, �ҹ��� ��½� "�ֵ���ǥ"
--      salary as ���� : AS Ű���带 ������ �� �ִ�.

select employee_id �����ȣ,
        salary + NVL(commission_pct, 0) as ����
from employees;

select employee_id �����ȣ,
        salary + NVL(commission_pct, 0) as "*�����Դϴ�.*"
from employees;

select employee_id �����ȣ,
        salary + NVL(commission_pct, 0) as "sAl"
from employees;
--Model View Controller �� �ܿ��� ������ �����͸� ������ �޾ƾ���

-- 7. concatnation (�ռ�����, ���Ῥ����)
Select first_name,
        last_name
from employees;

-- 7-1) ���δٸ� �÷��� ��ġ �ϳ��� �÷��� �� ó�� �����ؼ� ���
Select first_name || ' ' || last_name As name
from employees;
-- 7-2) ���ڿ��� �÷��� ������ ����
Select first_name || '(' || last_name || ')' As name
from employees;
-- 








