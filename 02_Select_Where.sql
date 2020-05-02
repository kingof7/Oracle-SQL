--4/8

-- ����) select [�ʵ�/�÷��� �Ǵ� ǥ����]
--      from [���̺�� �Ǵ� ���]
--      where ������
-- 8. where�� : where ������ ������ �÷�, ������, �񱳴�� ��
-- 8-1) �񱳿����� : =(����), >, >=, <, <=, <>(���� �ʴ�)


SELECT * FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 90;
--from >> where >> select (�켱����)

SELECT EMPLOYEE_ID,
        SALARY,
        DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID <> 90;

SELECT EMPLOYEE_ID,
        FIRST_NAME,
        SALARY
FROM EMPLOYEES
WHERE SALARY >= 3500;

-- ����Ŭ���� ��ɾ�� ��ҹ��ڸ� �������� ������, �����ʹ� �ݵ�� ��ҹ��� �����Ѵ� ex) 'Smith' <> 'smith'
SELECT EMPLOYEE_ID,
        LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME='Smith';

SELECT EMPLOYEE_ID,
        HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >='01/01/01'
-- where hire_date >='2001-01-01' �� ����
ORDER BY HIRE_DATE;

-- 8-2) �������� : AND, OR, NOT
-- 1) AND :
-- ������ IT_PROG �̸鼭 �μ��ڵ尡 60�� ����� �����ȣ, �μ��ڵ带 ����ϼ���
SELECT JOB_ID, DEPARTMENT_ID FROM EMPLOYEES;

SELECT EMPLOYEE_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID='IT_PROG' AND DEPARTMENT_ID = 60;

SELECT SALARY FROM EMPLOYEES
ORDER BY SALARY;

-- ������ 3000�̻��̸鼭 �μ��ڵ尡 100�� ����� �����ȣ, ����, �μ��ڵ� ���

SELECT EMPLOYEE_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >= 3000 AND DEPARTMENT_ID = 100
ORDER BY SALARY;

-- ������ 3000�̻��̸鼭 2003-01-01 ���Ŀ� �Ի��� �����ȣ, ����, �Ի��� ���
SELECT EMPLOYEE_ID, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE SALARY >= 3000 AND HIRE_DATE > '03/01/01'
ORDER BY HIRE_DATE;

-- 2) OR
-- ������ IT_PROG �̰ų� 2005-01-01 ���� �Ի��� ����� �����ȣ, ����, �Ի�⵵ ���

SELECT EMPLOYEE_ID, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' OR HIRE_DATE >= '05/01/01'
ORDER BY HIRE_DATE;

-- 3) NOT / <> �����ʴ�

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID <> 90;

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
WHERE NOT DEPARTMENT_ID = 90;

-- <> ��� NOT�� �ݵ�� ����ϴ� ��� : NULL���� ������
SELECT EMPLOYEE_ID, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL; -- ~~ = NULL�� �ùٸ� ������ �ƴϴ�

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL;

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES 
WHERE NOT DEPARTMENT_ID IS NULL;

SELECT EMPLOYEE_ID,
        COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 8-3) IN(��,��..) ������ / BETWEEN VALUE1 AND VALUE2 / LIKE ������ %
-- IN(val1, val2, val3 ...)������ : va1l �̰ų� va12 �̰ų� va13�� --> OR�� �����
--                                 ������ �ʵ尡 ���� ���� �� �߿� �ϳ��� ���
--                                 ������ ������ ���� Ȱ���ϸ� �����ϰ� ǥ���� �� �ִ�.
--                                 ���� any, some, all, exit �����ڿ� �Բ� �������� () ���� ���ȴ�.

SELECT EMPLOYEE_ID,
       COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT=0.2 OR COMMISSION_PCT=0.1 OR COMMISSION_PCT=0.25; -- �ʵ�1�����Ÿ� OR�� �������� ������ ��

SELECT EMPLOYEE_ID,
       COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IN(0.2, 0.1, 0.25); --�ʵ尡 1�� ���϶� OR���ٴ� IN�����ڰ� �������� ���� // OR �����ڴ� �ʵ尡 ������ ����

--������ IT_PROG, HR_REP, SH_CLERK, MKREP�� ����� �����ȣ�� ������ ���

SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN('IT_PROG', 'HR_REP', 'SH_CLERK', 'MKREP');

-- �μ��ڵ尡 10, 90�� �ƴ� �μ��ڵ带 ���
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_ID NOT IN(10, 90);

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_ID <> 10 AND DEPARTMENT_ID <> 90;

-- between a AND b : a�� b���̿� �ִ� ���� ���� ��� �˻�
-- ������ 2000~6000�� ����� �̸��� ���� ���
SELECT FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, SALARY 
FROM EMPLOYEES
WHERE SALARY BETWEEN 2000 AND 6000
ORDER BY SALARY;

--�Ի�⵵�� 2003-01-01 ~ 2005.12-31�� ����� �̸�, �Ի�⵵ ���
SELECT FIRST_NAME NAME,
       HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '03/01/01' AND '05/12/31'
ORDER BY HIRE_DATE;

--������ 1000~4000 �ƴ� ������� �����ȣ, ���� ���

SELECT EMPLOYEE_ID,
       SALARY
FROM EMPLOYEES
WHERE NOT SALARY BETWEEN 1000 AND 4000
ORDER BY SALARY;

-- ȥ���ؼ� ���
SELECT EMPLOYEE_ID,
       HIRE_DATE
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN(100,110)
AND (HIRE_DATE >= '05/01/01' AND HIRE_DATE <= '10/01/01');
-- AND HIRE_DATE BETWEEN '05/01/01' AND '10/01/01';

-- LIKE ������
-- PATTERN: %, _(�����)
-- ����̸� K�� �����ϴ� ����� �̸� ���
SELECT LAST_NAME NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE 'K%';

-- ����̸� N���� ������ ����� �̸� ���

SELECT LAST_NAME NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%n';

-- ����̸� ��򰡿� h ���ڿ��� ������ ���

SELECT FIRST_NAME || ' '||LAST_NAME NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%h%';

-- ����̸� �� �� ��° ���ڰ� a�� ����� �̸�
SELECT LAST_NAME NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '_a%';

-- ����̸� �� �� ��° ���ڰ� a�� ����� �̸�
SELECT LAST_NAME NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '__a%';

-- ����̸� �߿��� A, a��� ���ڸ� �������� �ʴ� ����� �̸� ���

SELECT LAST_NAME NAME
FROM EMPLOYEES
WHERE LAST_NAME NOT LIKE '%a%' AND LAST_NAME NOT LIKE '%A%';

-- ����̸� �߿��� a�� �������� �ʴ� ����� �̸� ���

SELECT LAST_NAME NAME
FROM EMPLOYEES
WHERE LAST_NAME NOT LIKE 'a%';

-- GROUP BY[COLUMN]�� WHERE�� ���� �� �� ���� (��, HAVING���� ��ü) 
-- ORDER BY[COLUMN]�� �ƹ������� ������ �ٿ� ��� ����

-- 9.ORDER BY [COLUMN]
SELECT FIRST_NAME
FROM EMPLOYEES
ORDER BY FIRST_NAME ASC; -- ASCENDING // DESC : DESCENDING

SELECT FIRST_NAME
FROM EMPLOYEES
ORDER BY FIRST_NAME; -- DEFAULT�� ���������̴�

SELECT FIRST_NAME
FROM EMPLOYEES
ORDER BY FIRST_NAME DESC;

SELECT EMPLOYEE_ID,
       HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE ASC;

SELECT EMPLOYEE_ID,
       SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

SELECT EMPLOYEE_ID,
       FIRST_NAME,
       SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC, FIRST_NAME ASC; -- SALARY �������� �����ϰ�, ���� ������ ������ �� �ȿ��� �̸��� �������� ����

SELECT EMPLOYEE_ID,
       SALARY
FROM EMPLOYEES
WHERE SALARY > 5000
ORDER BY SALARY;

SELECT EMPLOYEE_ID,
       FIRST_NAME,
       SALARY
FROM EMPLOYEES
WHERE SALARY >=3000 AND SALARY <= 4000
ORDER BY SALARY DESC, FIRST_NAME ASC;

SELECT EMPLOYEE_ID,
       FIRST_NAME,
       SALARY
FROM EMPLOYEES 
WHERE SALARY >=3000 AND SALARY <= 4000
ORDER BY 3 DESC, 2 ASC; --�ڹٷ� �����͸� �Ѱ��� ��, SYNTAX ����(�ʵ���� �� ���)�� �����ϱ� ���ؼ� �̷��� �� ���� ����

--���ν���:����� ���� �Լ�
--\\192.168.0.133 ����IP
--OPEN API ����Ʈ ����











