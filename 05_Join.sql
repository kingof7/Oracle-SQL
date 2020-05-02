SELECT * FROM EMPLOYEES; -- 107
SELECT * FROM DEPARTMENTS; -- 27
SELECT * FROM LOCATIONS; -- 23

UPDATE LOCATIONS SET CITY = 'Rome';

-- JOIN
-- RDBMS(Relational DataBase Management System)
-- ������ �����ͺ��̽��� �Ϸ��� ����ȭ�� ���̺� ������ ������ �׸����
-- ����ü�μ�, �پ��� ������� �����ϰų� ���յ� �� �ִ�. �̷� ���踦
-- �δ� ����� ����(�����)�̴�.

--1. Cross Join : ���̺��� ���� ���Ǿ��� �����Ͽ� ������ ��
--107 * 27 = 2889, �ƹ� �ǹ̾��� ����

--2.Equal Join : ���� ���� ����ϴ� ���� ������� ����� �Ǵ� ���̺� ���������� 
--               �����ϴ� �÷��� ���� ��ġ�Ǵ� ���� �����Ͽ� ����� ����
--               WHERE���� ���̺��� ����� �÷��� ���� �������� �����Ѵ�.

SELECT * FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

SELECT FIRST_NAME, --EMPLOYEES
        EMPLOYEES.DEPARTMENT_ID �μ��ڵ�, --��ȣ�� ������ �����ϱ� ���ؼ� ���̺�.�÷����� ��������� �Ѵ�.
        DEPARTMENT_NAME --DEPARTMENTS
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

--David ����� �̸�, �μ���ȣ, �μ��� �˻�
SELECT FIRST_NAME,
        EMPLOYEES.DEPARTMENT_ID,
        DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
AND FIRST_NAME='David'
AND EMPLOYEES.DEPARTMENT_ID = 60;

--IT�μ� �Ҽ� ����� �̸�, �μ���ȣ, �μ���, �Ի����� �˻�
SELECT  A.FIRST_NAME,
        A.DEPARTMENT_ID,
        B.DEPARTMENT_NAME,
        A.HIRE_DATE
FROM EMPLOYEES A, DEPARTMENTS B --���̺��� AS ������
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.DEPARTMENT_NAME='IT';

--4/13
--�μ� 90��ȣ�� ������ ����� �����, �μ��ڵ�, �μ��� �˻�
SELECT  A.FIRST_NAME,
        A.DEPARTMENT_ID,
        B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A.DEPARTMENT_ID <> 90;

SELECT COUNT(*) FROM EMPLOYEES;

--IT�μ��� MAKETING �μ� �Ҽ� ����� �̸�, �μ���ȣ, �Ի���, �μ���

SELECT EMP.FIRST_NAME,
        EMP.DEPARTMENT_ID,
        EMP.HIRE_DATE,
        DEP.DEPARTMENT_NAME
FROM EMPLOYEES EMP, DEPARTMENTS DEP
WHERE EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID
AND DEPARTMENT_NAME IN('IT','Marketing');

-- AND (DEPARTMENT_NAME='IT' OR DEPARTMENT_NAME='MARKETING'); 
-- . > () > �迭 > ���� > ĳ��Ʈ > ��� (������ �켱����)

--�μ��� ��տ���
SELECT  DEPARTMENT_ID, 
        TRUNC(AVG(SALARY)),
        COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

SELECT  DEP.DEPARTMENT_NAME �μ���,
        DEP.DEPARTMENT_ID �μ��ڵ�,
        TRUNC(AVG(SALARY)) ��տ���,
        COUNT(*) �ο���
FROM EMPLOYEES EMP, DEPARTMENTS DEP
WHERE EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME, DEP.DEPARTMENT_ID --�׷��Լ��� �����ϰ� ���� �ʵ��� ������ �̸��� ��ġ�ؾ���
ORDER BY 3 ASC;

--2-1) Natural Join : Equal join�� ȿ�������� ����ϴ� �� ���
--����) ~ FROM ���̺�� Natural Join ���̺��

SELECT *
FROM STUDENT;

SELECT * FROM STUDENT; --�л�/ (�л���ȣ),�̸�,�а�,�г�,��,����,Ű,������
SELECT * FROM ENROL; --���� / �����ȣ, (�л���ȣ), ����

SELECT *
FROM STUDENT.STU_NO - STATUS_NO
STUDENT,ENROL;


SELECT stu_no,
       welect stu
FROM STUDENT STU, ENROL ENR
WHERE STUDENT_no =ENROL.stu_no;

SELECT STU_NO,
        STU_NAME,
        STU_DEPT,
        ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL; --���̸��� ���� ���� ã�Ƽ� ����

SELECT * FROM NATURAL JOIN ENROL;

--NATURAL JOIN ���Ѵ�. �� ������ �� ���̺� ���� �̸��� 2�� �̻� ���� ���� ���Ұ�


SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

DESC EMPLOYEES;

SELECT STU_NO,
        STU_NAME,
        STU_DEPT,
        ENR_GRADE
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;

--NATURAL USING : ��������� ������ �ʵ� ǥ��

SELECT * FROM EMPLOYEES NATURAL JOIN DEPARTMENTS; --������ 107���� ��� ������ ����.

SELECT STU_NO,
        STU_NAME,
        STU_DEPT,
        ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL
WHERE STU_NAME='������' OR STU_NAME='������';


--����) ~ FROM ���̺�� Join ���̺�� ON ���ǽ�

SELECT  FIRST_NAME �μ���,
        DEPARTMENT_ID �μ��ڵ�,
        DEPARTMENT_NAME ��տ���
FROM EMPLOYEES JOIN DEPARTMENTS USING(DEPARTMENT_ID)
WHERE DEPARTMENT_NAME IN('IT','Marketing');

-- Join ~ on = Join ~ Using�� ����
-- ���� ~ FROM ���̺�� JOIN ���̺�� ON ���ǽ� WHERE ~
SELECT  FIRST_NAME �μ���,
        DEP.DEPARTMENT_ID �μ��ڵ�,
        DEPARTMENT_NAME ��տ���
FROM EMPLOYEES EMP JOIN DEPARTMENTS DEP
ON EMP.DEPARTMENT_ID=DEP.DEPARTMENT_ID
WHERE DEPARTMENT_NAME IN('IT','Marketing');

-- TABLE 3: JOIN 2
SELECT * FROM EMPLOYEES; --(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, 
                         -- COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
SELECT * FROM DEPARTMENTS; --(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
SELECT * FROM LOCATIONS; --(LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID)
SELECT * FROM JOBS; --(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
DESC STUDENT;   --STU_NO     NOT NULL CHAR(9)      
                --STU_NAME            VARCHAR2(12) 
                --STU_DEPT            VARCHAR2(20) 
                --STU_GRADE           NUMBER(1)    
                --STU_CLASS           CHAR(1)      
                --STU_GENDER          CHAR(1)      
                --STU_HEIGHT          NUMBER(5,2)  
                --STU_WEIGHT          NUMBER(5,2)  
SELECT * FROM ENROL;


--����� �̸�, �μ���, ���� �˻��϶�
SELECT  E.FIRST_NAME || ' ' || LAST_NAME,
        D.DEPARTMENT_NAME,
        L.LOCATION_ID
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;



SELECT DEPARTMENT_NAME,
        CITY,
        FIRST_NAME
FROM DEPARTMENTS DEP, LOCATIONS LOC, EMPLOYEES EMP
WHERE DEP.MANAGER_ID = EMP.EMPLOYEE_ID
AND DEP.LOCATION_ID = LOC.LOCATION_ID;

--������ȣ 2500�� ����� �����, �μ���, �������� �˻�
SELECT FIRST_NAME,
        DEPARTMENT_NAME,
        CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS LO
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
AND D.LOCATION_ID=LO.LOCATION_ID
AND LO.LOCATION_ID=2500;


--���� AD_VP, IT-PROG�� ����� �����, �μ���, ������(JOB_TITLE)�� �˻�

SELECT  FIRST_NAME,
        DEPARTMENT_NAME,
        CITY,
        JOB_TITLE,
        E.JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS LO, JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND d.location_id = lo.location_id
AND e.job_id = j.job_ID
AND E.JOB_ID IN('AD_VP','IT_PROG')
ORDER BY 2 DESC;

SELECT JOB_ID FROM EMPLOYEES;

--3. NOT-EQUAL JOIN : WHERE���� ��������(=) ������ �̿��� �� �����ڸ� ����ϴ� ���
--                    NOT-EQUAL JOIN�� �ߺ��Ǵ� �÷��� ������ �ȵȴ�.
--                    ��, �⺻Ű�� �ܷ�Ű ���谡 �ƴ� �� ������ �ǹ��ִ� ����� ������
--                    

--�л���ȣ, �̸�, �а�, �г�, ��, ���� �˻�
SELECT  S.STU_NO,
        SUB_NO,
        STU_NAME,
        STU_DEPT,
        STU_CLASS,
        ENR_GRADE,
        SCORE_NAME
FROM STUDENT S, ENROL E, GRADE G
WHERE S.STU_NO = E.STU_NO
AND ENR_GRADE BETWEEN SCORE_FROM AND SOCRE_TO;

SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM GRADE;



--Smith �Ŵ����� �����
SELECT manager_id
FROM employees
WHERE last_name='Smith';

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID=146 OR employee_id =148;

--** 4. Self Join : �ڽŰ� ���� ���̺��� �ΰ��� ��ó�� �ڱ� �ڽ��� ���̺�� �����ϴ� ��
SELECT * FROM EMPLOYEES;

SELECT  E.EMPLOYEE_ID �����ȣ,  
        E.LAST_NAME �����,
        E.MANAGER_ID �����ڹ�ȣ,
        M.EMPLOYEE_ID �����ڻ����ȣ,
        M.FIRST_NAME �����ڸ�
FROM EMPLOYEES E, EMPLOYEES M --���� �����̼�
WHERE E.MANAGER_ID = M.EMPLOYEE_ID
AND E.LAST_NAME='Smith';

--Steven ����ϰ� ���� �μ��� �ٹ��ϴ� ��� �˻�
--1)
SELECT DEPARTMENT_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Steven'; --90,50 E
--2)
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID=90 OR DEPARTMENT_ID=50; -- M
--1+2)
SELECT  M.FIRST_NAME,
        M.DEPARTMENT_ID
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.DEPARTMENT_ID = M.DEPARTMENT_ID
AND E.FIRST_NAME='Steven'; -- ��Ƽ��� ���� ����


SELECT SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'Neena';

SELECT FIRST_NAME FROM EMPLOYEES WHERE SALARY > 17000;

--Neena ������ ���� �޴� ��� �ǻ�
SELECT  E.SALARY,
        M.FIRST_NAME
FROM EMPLOYEES E, EMPLOYEES M
WHERE M.SALARY > E.SALARY
AND E.FIRST_NAME='Neena'
AND E.FIRST_NAME<>m.FIRST_NAME;

--����� �μ���
SELECT  M.FIRST_NAME,
        D.DEPARTMENT_NAME
FROM EMPLOYEES E,EMPLOYEES M,DEPARTMENTS D
WHERE E.DEPARTMENT_ID = M.DEPARTMENT_ID
AND D.DEPARTMENT_ID=D.DEPARTMENT_ID
AND E.FIRST_NAME = 'Steven';

SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES;

--OUTER JOIN = ���̺��� ���ε� ��, ��� ������ ���̺��� �ش��ϴ� �����Ͱ� ������, �ٸ�
--             ���̺��� ���� ���, �� �����ʹ� ��µ��� �ʴ´�. �� ������ �ذ��ϱ� ���� ����
--             Right Out Join, Left Outer Join, Full Outer Join (NULL�� ��ü??)

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID; -- 0~110��, NULL

SELECT * FROM DEPARTMENTS
ORDER BY DEPARTMENT_ID; --10~110��, 120��~270�� // �μ��� �ִµ� ����� ���� ���

--LEFT OUTER
SELECT  FIRST_NAME,
        D.DEPARTMENT_ID,
        DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID --Ư�� �÷��� NULL������ �ٸ� �÷����� ����ϰ� ���� �� - OUTER JOIN ����
ORDER BY DEPARTMENT_ID DESC;

--RIGHT OUTER
SELECT  FIRST_NAME,
        D.DEPARTMENT_ID,
        DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+) -- �μ��� ���� ������� �˻�
ORDER BY DEPARTMENT_ID DESC; 

--FULL OUTER
SELECT  FIRST_NAME,
        D.DEPARTMENT_ID,
        DEPARTMENT_NAME
FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID; 
--*****(�����)�μ���, ����, �μ������ڸ� �˻��ϼ���.

--����� �Ŵ��� �̸� ���
SELECT  E.LAST_NAME ���,
        NVL(TO_CHAR(M.LAST_NAME), 'CEO') �Ŵ���,
        E.MANAGER_ID,
        M.EMPLOYEE_ID
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID(+) = M.EMPLOYEE_ID
AND M.LAST_NAME = 'King';

SELECT * FROM EMPLOYEES;
