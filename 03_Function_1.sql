-- ����Ŭ �Լ�:https://docs.oracle.com/cd/E11882_01/server.112/e41084/functions155.htm#SQLRF00698\
/*
4/9
�Լ�(Function)
    - �μ��� ���޹޾� ó���� ����� ��ȯ���ִ� ���α׷� ���
    *****�����Լ�, �����Լ�, ��¥�Լ�, �Ϲ��Լ�nvl, ��ȯ�Լ�******
*/

-- 1. �����Լ� Numeric Functions
SELECT 10*20 FROM DUAL; -- DUAL: DEFAULT TABLE
SELECT SYSDATE FROM DUAL; -- ����Ŭ ������ ����ð�
SELECT SYSDATE "TODAY", SYSDATE+1, SYSDATE-5, SYSDATE+10 FROM DUAL;

SELECT ROUND(123.567, 0) "ROUND" -- �Ҽ� 0�� °�ڸ�(����ù��°�ڸ�)
FROM DUAL;

SELECT ROUND(1234.567, 1)
FROM DUAL;

-- 1-1) ROUND(��, �ڸ���) �Լ� : �ݿø� �Լ�
SELECT ROUND (15.2547, 3) "Round" FROM DUAL;
SELECT ROUND (15.2547, -1) "Round" FROM DUAL;

-- ������ �Ҽ��� ������������ �ݿø� ->1230
SELECT ROUND(1234.567, 1), --����� �Ҽ��� �ش��ڸ�����~�ݿø�
       ROUND(1234.567, 2), 
       ROUND(1234.567, -1), --������ ���� �ش��ڸ�����~�ݿø�
       ROUND(1234.567, -2),
       ROUND(1234.567, -3), 
       ROUND(1234.567, -4)
FROM DUAL;

-- 1-2) TRUNC(��, �ڸ���) �Լ�: ���� �Լ�

SELECT TRUNC(3456.789, 1) "Truncate", --3456.7 // ����� ��� �Ҽ� �ش��ڸ� �ڷ� ����
       TRUNC(3456.789, 2) "Truncate", --3456.78
       TRUNC(3456.789, -1) "Truncate", --3450 // ������ ��� ���� �ش��ڸ����� ����
       TRUNC(3456.789, -2) "Truncate", --3400
       TRUNC(3456.789, -3) "Truncate", --3000
       TRUNC(3456.789, -4) "Truncate" -- 0
FROM DUAL;

-- 1-3) CEIL(��) / FLOOR(��) : �Ҽ����� ������ �ø�, ����
SELECT CEIL(2.123), --�ø��� ����
       FLOOR(2.567), --�׳� �� ����
       CEIL(4.054)
FROM DUAL;

--FLOOR �Ҽ�ù°�ڸ� ����

-- 1-4) MOD(����1, ����2):�־��� ���ڸ� ������ ���ڷ� ���� �������� ��ȯ
SELECT MOD(10,3) AS "������" FROM DUAL;
SELECT MOD(10,3)
FROM DUAL;

-- 1-5) POWER(����, ����) : �־��� ������ ������ �� ��ŭ ������ �� ���� ��ȯ
SELECT POWER(2,10) "POWER" FROM DUAL;

SELECT SIGN(-15) "Sign" FROM DUAL;

--������ ��κ� �������̸� ���� (EX) VARCHAR(10) �ִ� 10����Ʈ)
--������ ���� �������̸� ���°� ���� (��/�� == 2����Ʈ) EX CHAR(2)
--oracle 10version �̻��� VARCHAR2�� ���� ���� ����
--nvarchar�� varchar���� ���� ������ ����� ������ 2�� ����ϸ�, �ٱ��� ������ �ʿ��� DB �۾��� ��쿡 ������ ��������

--2. �����Լ�
--2-1) UPPER(���� �Ǵ� ���ڿ�) �빮�ڷ� ��ȯ
SELECT UPPER('Welcome to Oracle 11g')
FROM DUAL;

SELECT FIRST_NAME,
       UPPER(FIRST_NAME),
       LOWER(FIRST_NAME)
FROM EMPLOYEES;

--2-2) LOWER(���� �Ǵ� ���ڿ�) �ҹ��ڷ� ��ȯ
SELECT LOWER('Welcome to Oracle 11g')
FROM DUAL;
--2-3) INITCAP(���� �Ǵ� ���ڿ�) ù ���ڸ� �빮�ڷ� ��ȯ
SELECT INITCAP('Welcome to Oracle 11g')
FROM DUAL;

--2-4) ASCII
SELECT ASCII('A'),
       ASCII('a')
FROM DUAL;

--2-5) LENGTH(���� �Ǵ� ���ڿ�): ���ڿ��� ����(����) + ���� ����
SELECT LENGTH('ORA C L E')
FROM DUAL;

SELECT FIRST_NAME, 
        LENGTH(FIRST_NAME) AS ���ڱ���
FROM EMPLOYEES;

--2-6) CONCAT (����, ����): ���ڸ� ����
SELECT FIRST_NAME,
       LAST_NAME,
       FIRST_NAME || LAST_NAME AS NAME1,
       FIRST_NAME || '(' || LAST_NAME || '�Դϴ�.)',
       CONCAT(FIRST_NAME, LAST_NAME) AS NAME2,
       CONCAT(CONCAT(FIRST_NAME, '('), CONCAT(LAST_NAME, '�Դϴ�.)'))
FROM EMPLOYEES;

--***********���ڿ��� ����, Ư������, Ư�����ڿ��� ��ġ, ���ڸ� ���ڷκ�ȯ************

--2-7) INSTR(): Ư�� ���ڿ��� ��ġ -> ��ȯ���� ����


--2-8) SUBSTR(): Ư�� ����(���ڿ�) ����

--   ��¥�Լ�
--   �Ϲ��Լ�
--   ��ȯ�Լ�

--2-9) INSTR(���ڿ�, ã�¹���, ������ġ, ���°): Ư�� ���� ��ġ
SELECT INSTR('Welcome to oracle 11g','o')
FROM DUAL; -- 5��° / 1���� ã�Ƽ� ù��° o�� ��ġ�� ���
--2-10) SUBSTR(): Ư�� ����(���ڿ�) ����
SELECT INSTR('Welcome to oracle 11g','o',1,2)
FROM DUAL; --ù��°���� ã�Ƽ� 2��° O�� ��ġ�� ���

SELECT INSTR('CORPORATE FLOOR', 'OR', 5, 2)
FROM DUAL;

SELECT INSTR('Welcome to oracle 11g','o',11,1) -- *** 11��°���� �����ؼ� ù��° O�� ��ġ�� ���
FROM DUAL;

Select First_Name,
        Instr(First_Name, 'a')
From Employees
Where First_Name Like '%a%';

--2-11) SUBSTR(���ڿ�,������ġ,���ڰ���): Ư�� ����(���ڿ�) ����
SELECT SUBSTR('Welcome to oracle 11g', 4, 4) -- �տ��� 4��°���� 4���� ���ڸ� ���
FROM DUAL;

SELECT SUBSTR('Welcome to oracle 11g', -3, 3) -- �ڿ��� 3��°���� 3���� ���ڸ� ���
FROM DUAL;

--19801225-1234567 -���� 1�̾Ƴ���
SELECT INSTR('19801225-1234567', '-')
FROM DUAL;
SELECT SUBSTR('19801225-1234567', INSTR('19801225-1234567', '-')+1, 1) --�ٵ��ְ��̾�?
FROM DUAL;
--02-070-8000 // 070�̾Ƴ���

SELECT INSTR('02-070-8000','-')
FROM DUAL;

SELECT SUBSTR('02-070-8000', INSTR('02-070-8000','-')+1,3)
FROM DUAL;

-- 2-12) LPAD(���ڿ�, �ڸ���, ä�﹮�ڿ�):������ ���� �� ���ʿ� ���� �� ���鿡 Ư�����ڸ� ä���.
SELECT LPAD('Oracle 11g', 20, '#')
FROM DUAL;
-- 2-12) RPAD(���ڿ�, �ڸ���, ä�﹮�ڿ�):���� ���� �� ���ʿ� ���� �� ���鿡 Ư�����ڸ� ä���.
SELECT RPAD('Oracle 11g', 20, '#')
FROM DUAL;

--����ã�Ⱑ ����
--2-10) LTRIM(���ڿ�, ������ ����) / ���ʿ� Ư������ ����
SELECT LTRIM('<=====>BROWNING<=====>', '><=') "LTRIM Example" --������ ���� ������� x
FROM DUAL;

SELECT LTRIM('aaaa Oracle 11g aaaa', 'a')
FROM DUAL;

SELECT LTRIM('   Oracle 11g ', ' ')
FROM DUAL;
--2-11) RTRIM(���ڿ�, ������ ����) / �����ʿ� Ư������ ����
SELECT RTRIM('aaaa Oracle 11g aaaa', 'a')
FROM DUAL;

SELECT RTRIM('   Oracle 11g ', ' ')
FROM DUAL;
--2-12) TRIM(������ ����, FROM ���ڿ�) / Ư������ ����
SELECT TRIM('a' FROM 'aaaa Oracle 11g aaaa')
FROM DUAL;
SELECT TRIM('a' FROM 'aaaa Oracle 11g aaaa')
FROM DUAL;
SELECT TRIM(' ' FROM ' Oracle 11g  ')
FROM DUAL;

--2-13) REPLACE(���ڿ�, ��������, ��ü����) / ���ڿ����� Ư�����ڸ� Ư�����ڷ� ġȯ
SELECT PHONE_NUMBER,
REPLACE (PHONE_NUMBER,'.','-')
FROM EMPLOYEES;

SELECT FIRST_NAME,
        REPLACE(FIRST_NAME, SUBSTR(FIRST_NAME,2,1), '#') -- �� 2�����ٲ����? SUBSTR�κ��� l�ιٲ�Ƿ� ��� #���� �ٲ���
FROM EMPLOYEES;

--3. ��¥�Լ�
--3-1)SYSDATE:�ý��ۿ� ������ ���� ��¥/�ð�
SELECT SYSDATE,
        SYSTIMESTAMP
FROM DUAL;

--3-2)��¥ ����: ��Ģ���갡��
SELECT SYSDATE,
        SYSDATE + 1,
        SYSDATE - 1
FROM DUAL;

SELECT EMPLOYEE_ID,
       HIRE_DATE,
       TRUNC(SYSDATE - HIRE_DATE) AS �ٹ��ϼ�
FROM EMPLOYEES;

-- 3-3)MONTHS_BETWEEN(��¥, ��¥) / ��¥�� ��¥ ������ ���� �� �� ���
SELECT EMPLOYEE_ID,
       HIRE_DATE,
       TRUNC(SYSDATE - HIRE_DATE) AS �ٹ��ϼ�,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) �ٹ�������,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) �ټӳ��
FROM EMPLOYEES;

-- 3-4) ADD_MONTHS(��¥,����) / �־��� ��¥�� ���ڸ�ŭ ���� ��
SELECT SYSDATE,
        ADD_MONTHS(SYSDATE, 7)
FROM DUAL;

-- 3-4)ADD_MONTHS(��¥,�ڷ���)
SELECT FIRST_NAME,
        DEPARTMENT_ID,
        HIRE_DATE,
        ADD_MONTHS(HIRE_DATE, 24) "24���� �� ���޽���"
FROM EMPLOYEES;

-- 3-5) LAST_DAY(��¥) / �־��� ��¥�� ���� ���� ���� ������ �� �ǻ�
SELECT SYSDATE,
        LAST_DAY(SYSDATE)
FROM DUAL;

SELECT FIRST_NAME,
        DEPARTMENT_ID,
        HIRE_DATE,
        LAST_DAY(HIRE_DATE) "��������¥"
FROM EMPLOYEES;

--3-6) NEXT_DAY() / �־��� ��¥�� �������� ���ƿ��� ���� �ֱ� ������ ��¥
--�ѱ�(��,��~~)/����(SUN, MON ~~)/����(�Ͽ��� 1, ������ 2 ~~~)

SELECT SYSDATE,
        NEXT_DAY(SYSDATE, '��') --����ð����κ��� �������̴ϱ� ������(15��)
FROM DUAL;

SELECT SYSDATE,
        NEXT_DAY(ADD_MONTHS(SYSDATE,6),'��')
FROM DUAL;

--***��ȯ�Լ�***
--����
--����(1byte ���ڿ�, Ư������) ex:)!dekf2kfkE -> ����,�������������� ���ڿ��̴�
--��¥
--
--����-->����
--��¥
--
--���� --> ����/��¥
--1)TO_CHAR(��¥, ��¥����)
SELECT SYSDATE, 
    TO_CHAR(SYSDATE,'YYYY') �⵵,
    TO_CHAR(SYSDATE,'MM') ��,
    TO_CHAR(SYSDATE,'MM') ��
FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE, 'YY/MM/DD'),
TO_CHAR(SYSDATE, 'YYYY.MM.DD'),
TO_CHAR(SYSDATE, 'MONTH DD.YYYY'),
TO_CHAR(SYSDATE, 'DY DD MON YY'),
TO_CHAR(SYSDATE, 'DAY MON DD'),
TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��" day')
FROM DUAL;


SELECT HIRE_DATE,
        FIRST_NAME
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'MM')=03;

SELECT HIRE_DATE,
        FIRST_NAME
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YY') > 00;

--2)TO_CHAR(����, ��������): �������� ���������� ��ȯ
--9�� �� ���ڰ� ������ ��ä��������, 0�� �� ���ڰ� ������ 0�� ä����
--
SELECT TO_CHAR(1234, '9999'), --�������� ����
        TO_CHAR(1234, '9,9999'), --�����ʺ��� ä����
        TO_CHAR(12345, '9,9999'),
        TO_CHAR(12345, '0,9999'),
        TO_CHAR(1234.56, '9999.99'),
        TO_CHAR(1234.56, '9999.9999'),
        TO_CHAR(1234.56, '9999.9900'),
        TO_CHAR(1234, '$9,999'),
        TO_CHAR(1234, 'L9,999'),
        TO_CHAR(1234, '9999EEEE')
FROM DUAL;

--4-3) TO_NUMBER(���ڿ�): ���ڸ� ���ڷ� ��ȯ
SELECT '11,000' - '10,000'
FROM DUAL;      --ERROR

SELECT TO_NUMBER('11,000', '99,999') - TO_NUMBER('10,000', '99,999')
FROM DUAL;

SELECT TO_NUMBER('1')
FROM DUAL;
--4-4) TO_DATA(���ڿ�): ���ڿ� ��¥�� ��ȯ

SELECT SYSDATE - '2020/12/25'
FROM DUAL;      --ERROR

SELECT TRUNC(SYSDATE,'DD') - TRUNC(TO_DATE('2019/12/25','YYYY/MM/DD'),'DD')
FROM DUAL;

SELECT TO_DATE('2020/12/25','YYYY/MM/DD')
FROM DUAL;

--5. �׷��Լ� : ��(�÷�)�� �������� ���� �׷�ȭ���� �׷��Լ��� �����ϸ� �� �׷쿡
--              �ϳ��� ����� ��ȯ�Ѵ�. (���Ž� NULL���� �����Ѵ�. �׷��Ƿ� count�Լ� ��� ���)

--5-1) SUM �Լ�
SELECT SUM(SALARY) "�ΰǺ�(����)"
FROM EMPLOYEES;

SELECT SUM(COMMISSION_PCT) "Ŀ�̼��հ�"
FROM EMPLOYEES;

SELECT SUM(SALARY) "100�μ��� �ΰǺ�(����)"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

SELECT TO_CHAR(SUM(SALARY), 'L999,999')
FROM EMPLOYEES
WHERE DEPARTMENT_ID=100;

--5-2) AVG �Լ�
SELECT ROUND(AVG(SALARY)) ��տ���
FROM EMPLOYEES;

SELECT ROUND(AVG(COMMISSION_PCT),2) ���Ŀ�̼�
FROM EMPLOYEES;

SELECT ROUND(AVG(SALARY)) "IT���� ��տ���"
FROM EMPLOYEES
WHERE JOB_ID='IT_PROG' AND DEPARTMENT_ID=60;




--5-3) MAX, MIN �Լ�
SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES;

SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
WHERE JOB_ID='IT_PROG';

--5-4) COUNT �Լ�

SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES;

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

-- DINSTINCT�� �� COUNT�ȿ� ��ߵǴ���?
SELECT COUNT(DISTINCT DEPARTMENT_ID) --NULL���� �ٰ����� 
FROM EMPLOYEES;

--NULL���� ����, DISTINCT�� �� �� ����
SELECT COUNT(*)
FROM EMPLOYEES;

--5-5) GROUP BY : Ư�� ������ �ְ� �� �������� ����� ���� �� �� �ִ�.
--�μ��� �������
SELECT DEPARTMENT_ID,
       JOB_ID,
       ROUND(AVG(SALARY)) ��տ���
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID; --? ���� �׷쳢�� ����.. // �׷����� �������� SELECT �ڿ� �߰����ش�

--�μ��� �����հ�

SELECT DEPARTMENT_ID,
        SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--SUM,AVG �� �����Լ��� �⺻������ GROUP �Լ��̹Ƿ� GROUP BY�ξ� �����?
--�ٵ� �� �ʵ�� �׷��Լ��� �ƴϹǷ� �׷���̷� ����� �ȴ�.

SELECT JOB_ID,
        COUNT(JOB_ID),
        SUM(SALARY),
        ROUND(AVG(SALARY))        
FROM EMPLOYEES
GROUP BY JOB_ID;

--5-6) STDDEV �Լ� / ǥ������
SELECT DEPARTMENT_ID, 
        ROUND(STDDEV(SALARY),2)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1; --�������� �ʴ� �ʵ带 �������� ������ �ʵ������ȣ�� �ۼ����־ �ȴ�

--5-7) VARIANCE �Լ� / �л갪
SELECT DEPARTMENT_ID, 
        ROUND(VARIANCE(SALARY),2)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 2;

--5-8) ���߿� GROUP BY ��: GROUP BY ���� 2�� �̻��� ���� ����� �� ������,
--                       �� ��� GROUP BY ���� ���ʿ��� ������ �� ������ ����
--                       �׷����� ó���Ѵ�.

--�μ��� ���� ��
SELECT DEPARTMENT_ID,
       JOB_ID,
       COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY 1 ASC, 2 ASC, 3 DESC;

SELECT COUNT(*) --��� ���ڵ��
FROM EMPLOYEES;

--�μ��� ������ �ִ뿬��, �ּҿ���
SELECT DEPARTMENT_ID,
        JOB_ID,
        MIN(SALARY),
        MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID ASC, JOB_ID ASC, 4 DESC; --? GROUP->SELECT->ORDER�̱⶧���� 4�� ��Ī �� ������
                                                -- DEPARTMENT_ID�� DISTINCT�� ���� X // �� �ڿ��� �� �����̵ǳ�

--5-8) HAVING ��: WHERE���� SELECT������ ���� �˻��� ���� ����Ѵٸ�
--                HAVING���� GROUP BY���� ���� ������ ��� �� �� ���ϴ� ���ǿ� �����ϴ� �ڷ� �˻�

--�μ��� ��������� ���ϰ�, ��տ����� 5000�̻��� �μ��� ���
SELECT DEPARTMENT_ID,
        ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING ROUND(AVG(SALARY)) >= 5000; --? 2�� ��Ī�� ��������.. GROUP->HAVING->SELECT �����̱� ������


--������ ������հ� �ο����� ���ϰ� �ο����� 2�� �̻��� ������ ���
SELECT JOB_ID,
        ROUND(AVG(SALARY)),
        COUNT(JOB_ID)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING COUNT(JOB_ID) >= 2
ORDER BY 2 DESC; --? SELECT�Ѵ��� ORDER BY�̱� ������ ��Ī�̳� 2 ��������

-- ����) WHERE / HAVING
SELECT DEPARTMENT_ID, --5 �ѷ�
        SUM(SALARY)
FROM EMPLOYEES -- 1 ���̺���
WHERE DEPARTMENT_ID <> 90 -- 2 ����
GROUP BY DEPARTMENT_ID -- 3 ����
HAVING SUM(SALARY) >= 5000; --4 �ɷ���

SELECT STU_DEPT, STU_NAME, AVG(stu_grade)
FROM STUDENT
GROUP BY STU_DEPT, STU_NAME;

--JOIN : ���(���̺�)�� �������� ���� ��ġ�� ����(��ġ�� ���� ����� �� �����ߵȴ�)
--PM(PROJECT MANAGER):�ý��� �䱸���� �м�
--����(APPLICATION ARCHITECTURE): ���̺� ���� ����
--����:�ڵ�



--6. �Ϲ��Լ�: NVL







