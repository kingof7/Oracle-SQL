--CREATE TABLE SUNGJUK(
--        BUN NUMBER(2),
--        IRUM VARCHAR2(20),
--        KOR NUMBER(3),
--        ENG NUMBER(3),
--        MAT NUMBER(3),
--        TOT NUMBER(3) DEFAULT 0,
--        AVG NUMBER(5,2)
--        CONSTRAINT PK_BUN PRIMARY KEY(BUN)
--    );
--    --AVG�� ����Ʈ������ �ٲٷ��� �����ؾߵ���?   
--    
--    CREATE SEQUENCE SUNGJUK_BUN_SEQ;
--    
--    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
--    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '������', 90, 80, 70); -- ��ȣ�� NEXTVAL�� �ڵ�����
--    
--    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
--    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '����', 90, 80, 70);
--    
--    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
--    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '������', 90, 80, 70);
--    
--    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
--    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '����ȭ', 90, 80, 70);
--        
--    UPDATE SUNGJUK SET TOT=KOR+ENG+MAT; --�ѹ��� ��� ���ڵ� ������Ʈ
--    UPDATE SUNGJUK SET AVG=TOT/3;
--    
--    CREATE TABLE PERSON(
--        bunho NUMBER(4),
--        name VARCHAR2(20),
--        ki NUMBER(5,1)
--    );
--
--
----PL(PROCEDURAL LANGUAGE EXTENSION)/SQL(STURCTURED QUERY LANGUAGE)
----DML�� �ܼ� ������ Ȱ�� �Ѱ��, SQL �� ������ ����� ��Ҹ� ���Ͽ� ������ ó����
----����Ų ���(�ݺ�,���� ��..)
----1.�⺻���� DECLARE ~ BEGIN ~ EXCEPTION ~ END
--
----1-1) ��������
----ȭ�鿡 �������
--SET SERVEROUTPUT ON; --SQL���� ���� �ѹ��� ����
--DECLARE         -- �����(��������) / NUMBER, CHAR, VARCHAR2, DATE, BOOLEAN
--    bunho number(4);
--    irum varchar(10);   --scalar ����
--    
--    vstu_no enrol.stu_no%TYPE;  --���۷��� ���� / Ư���� ����
--    
--    venrol enrol%ROWTYPE;       --���۷��� ���� / ��ü�� ����
--    
---- ���๮( :=�� �����Ѵٴ� ��)
--BEGIN
--    bunho := 7788;
--    irum := 'KIM';
--    DBMS_OUTPUT.PUT_LINE('��� / �̸�');            --System.out.println();�̶� �Ȱ���
--    DBMS_OUTPUT.PUT_LINE('===================');
--    DBMS_OUTPUT.PUT_LINE(bunho || '/' || irum);
---- ����ó��    
----EXCEPTION             
-- -- ����
--END;
--
----2) ����ó�� : IF ~ THEN ~ END IF / IF ~ THEN ~ ELSE ~ END IF / IF ~ THEN ~ ELSIF ~ END IF
--
--DECLARE
--    su NUMBER(4);
--BEGIN
--    su := 10;
--    
--    IF MOD(su, 2)=0 THEN 
--        DBMS_OUTPUT.PUT_LINE('¦��');
--    END IF;
--    
--    IF su >= 50 THEN
--        DBMS_OUTPUT.PUT_LINE('�հ�');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('���հ�');
--    END IF;
--    
--    IF su > 0 THEN
--        DBMS_OUTPUT.PUT_LINE('���');
--    ELSIF su < 0 THEN
--        DBMS_OUTPUT.PUT_LINE('����');
--    ELSIF su = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('0');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('��Ÿ���');
--    END IF;
--END;
--
----3) �ݺ��� :  FOR ~ LOOP ~ END LOOP(=FOR) / WHILE ~ LOOP ~ END LOOP(=WHILE) / LOOP ~ END LOOP(=DO WHILE) 
--
----PACKAGE TRIGGER
--
----3-1) FOR ~ LOOP ~ END LOOP
--DECLARE
--    cnt NUMBER(2) := 0;
--    hap NUMBER(4) := 0;
--BEGIN
--    FOR cnt IN 1..10 LOOP -- IN �ʱ�.. ����
--        hap := hap + cnt;
--        DBMS_OUTPUT.PUT_LINE(cnt || ' ' ||hap);
--    END LOOP;
--END;
--
--DECLARE
--    cnt NUMBER(2) := 0;
--    
--BEGIN
--    FOR cnt IN REVERSE 1..10 LOOP -- IN �ʱ�.. ����
--        
--        DBMS_OUTPUT.PUT_LINE(cnt || ' ' ||hap);
--    END LOOP;
--END;
--
----4-2) LOOP ~ END LOOP
--DECLARE
--    cnt NUMBER(2) := 0;
--    hap NUMBER(2) := 0;
--BEGIN
--    LOOP
--        cnt := cnt + 1;
--        hap := hap + cnt;
--        DBMS_OUTPUT.PUT_LINE(cnt || ' ' || hap);
--        EXIT WHEN cnt = 10; -- ���Ǹ��� ������ ��� ����
--    END LOOP;
--END;
----4-3) WHILE ~ LOOP ~ END LOOP
--DECLARE
--    cnt NUMBER(2) := 0;
--    hap NUMBER(2) := 0;
--BEGIN
--    WHILE cnt <= 10
--      LOOP
--      cnt := cnt+1;
--      hap := hap+cnt;
--      DBMS_OUTPUT.PUT_LINE(cnt || ' ' || hap);  
--    END LOOP;
--END;
--
----2. PL/SQL ���� SQL
---- 1)SELECT �÷�����Ʈ INTO ��Į�󺯼� FROM ���̺� WHERE
--SELECT * FROM STUDENT WHERE STU_NAME='���¿�';
--
----���¿� �л��� �й��� �̸� ���
DECLARE
    vstu_no student.stu_no%TYPE; --��Ʃ��Ʈ ���̺��� stu_no�� �ڷ����� ������ / ������(���۷���) ����
    vstu_name student.stu_name%TYPE; --�ش翭 %TYPE
BEGIN
    SELECT stu_no, stu_name INTO vstu_no, vstu_name
    FROM STUDENT
    WHERE STU_NAME='���¿�';
    
    DBMS_OUTPUT.PUT_LINE(vstu_no || ' ' || vstu_name);
END;
--
----��� ���־��� ���� �ؽ�Ʈ�� ���� ����
----�Լ��� ���ϰ��� 1��
----���ν����� ���ϰ��� 1�� �̻�
--
---- 5�� �л��� ���� ���ϱ� (�й�, �̸�, ����, ���, ����)
--SELECT * FROM SUNGJUK WHERE BUN=5;
--    
--DECLARE
--    vsungjuk sungjuk%ROWTYPE; -- �� ���� ���� ������
--    hakjum CHAR;
--BEGIN
--    SELECT * INTO vsungjuk
--    FROM SUNGJUK 
--    WHERE BUN=5;
--    
--    IF(vsungjuk.avg >= 90) THEN
--        hakjum := 'A';
--    ELSIF(vsungjuk.avg >= 80) THEN
--        hakjum := 'B';
--    ELSIF(vsungjuk.avg >= 70) THEN
--        hakjum := 'C';
--    ELSIF(vsungjuk.avg >= 60) THEN
--        hakjum := 'D';
--    ELSE
--        hakjum := 'F';    
--    END IF;
--    
--    DBMS_OUTPUT.PUT_LINE(vsungjuk.irum || ' ' || vsungjuk.avg || ' ' || hakjum);
--END;
--PL/SQL�� �����͸� ���� �� ����
--���� ���ν����� ���� �����͸� �ְ�޵��� ����
--SQLPLUS���� ���Ѽ���

--3.���� ���ν���(Stored Procedure)�� �Լ�/ ���Ѽ��� SQL>GRANT CREATE PROCEDURE, CREATE SESSION TO HR;
-- �Լ��� ���ν����� ����: ��ȯ���� �ϳ��� �Լ� / �� �̻��̸� ���ν���

/*
--���ν����� ����? ���־��� ���Ǿ ���α׷��� ���ó�� �Լ��θ���� ������
 3-1) PL/SQL ����� DML ��ɾ�
    1) SELECT �÷�����Ʈ INTO ��Į�󺯼� FROM ���̺� WHERE
    2) UPDATE ���̺�� SET �÷��� = ��Į�󺯼�(���۷�������),...,... WHERE ������ [��Į��/���۷��� ����]
    3) INSERT INTO ���̺��(�÷�����Ʈ) VALUES(��Į�� �Ǵ� ���۷��� ����, ...., ....)
    4) DELETE FROM ���̺�� WHERE ������ [��Į��/���۷��� ����]
*/

--SELECT * FROM STUDENT; --20152088 5�г� ����
--
CREATE OR REPLACE PROCEDURE EXAM01 --public void abc)int x, int y)�� ����
    (vstu_no IN student.stu_no%TYPE, --INSERT DELETE UPDATE�� ���°Ŵϱ� IN �� // ���ۺ���
    vstu_grade IN student.stu_grade%TYPE) --�Ѿ��
IS  
BEGIN
    UPDATE student SET stu_grade = vstu_grade
    WHERE stu_no = vstu_no;
END;
--
--EXECUTE EXAM01(20152088,5);
--EXECUTE EXAM01(20142021,4);
--
----INSERT : INSERT INTO ���̺��(�÷�����Ʈ) VALUES(��Į�� �Ǵ� ���۷��� ����, ...., ....)
--SELECT * FROM PERSON;
--INSERT INTO PERSON(BUNHO, NAME, KI) VALUES(7,'���',210);
--
CREATE OR REPLACE PROCEDURE EXAM02
    (vbunho IN person.bunho%TYPE,
    vname IN person.name%TYPE,
    vki IN person.ki%TYPE)
IS
BEGIN
    INSERT INTO PERSON(BUNHO, NAME, KI) 
    VALUES(vbunho,vname,vki);
END;
--
--EXECUTE EXAM02(8,'PIKACHU',80);
--EXECUTE EXAM02(99,'������',189);
--
----DELETE : DELETE FROM ���̺�� WHERE ������ [��Į��/���۷��� ����]
--
--SELECT * FROM SUNGJUK;
--CREATE OR REPLACE PROCEDURE EXAM03
--    (vbun IN sungjuk.bun%TYPE)
--IS
--BEGIN
--    DELETE FROM sungjuk WHERE BUN = vbun;
--END;
--
--EXECUTE EXAM03(5);
--
----UPDATE : UPDATE ���̺�� SET �÷��� = ��Į�󺯼�(���۷�������),...,... WHERE ������ [��Į��/���۷��� ����]
----SELECT : SELECT �÷�����Ʈ INTO ��Į�󺯼� FROM ���̺� WHERE
--SELECT stu_name FROM student WHERE stu_no = 20153075;
--
CREATE OR REPLACE PROCEDURE EXAM04 --stu_no�� ���� stu_name�� ����
    (vstu_no IN student.stu_no%TYPE,
     vstu_name OUT student.stu_name%TYPE) --public String Exam04(int vstu_no) �� ����
IS
BEGIN
  SELECT stu_name INTO vstu_name
  FROM student WHERE stu_no=vstu_no; 
END;


VARIABLE p_stu_name VARCHAR2(20); -- ���ε� ���� : ���ϰ��� �����ϴ� ����
EXECUTE exam04(20153075, :p_stu_name); --(�Ѿ�°�, :���ϵǴ°�)
PRINT p_stu_name; -- System.out.print(p_stu_name);
/*
public int abc(int x, int y){
    int z = x+y;
    return z;
}
public void sub(){\
    int hap = abc(10,20);
    System.out.print(hap);
}
*/

--7839 ����� �����ȣ, �̸�, ������ ����ϴ� ���ν���
--SELECT * FROM EMP;
--
CREATE OR REPLACE PROCEDURE EXAM05
    (invno IN emp.empno%TYPE,
     outvno OUT emp.empno%TYPE,
     vname OUT emp.ename%TYPE,
     vsal OUT emp.sal%TYPE)
IS
BEGIN
    SELECT empno, ename, sal INTO outvno, vname, vsal
    FROM emp WHERE empno = invno;
END;

VARIABLE p_vempno NUMBER;
VARIABLE p_vname VARCHAR2;
VARIABLE p_vsal NUMBER;
EXECUTE EXAM05(7839, :p_vempno, :p_vname, :p_vsal);
PRINT p_vempno;
PRINT p_vname;
PRINT p_vsal;

--4. CURSOR & FETCH / ������ ���
--���� ���̺� ���� ���

CREATE OR REPLACE PROCEDURE EXAM07
IS
    venrol enrol%ROWTYPE; --�� �����͸� ��� ������
    CURSOR empcur IS SELECT * FROM ENROL; --Ŀ���� ���� ����, empcur�ȿ� �־���(�ټ��� ��)
BEGIN
    --Ŀ�� ����
    OPEN empcur;
    --������ó�� / Ŀ���κ��� �����͸� �о�� ������ ����
    LOOP --�ݺ���
        FETCH EMPCUR INTO venrol.sub_no, venrol.stu_no, venrol.enr_grade; --�������� �����͸� �������
        EXIT WHEN empcur%NOTFOUND; --�� �̻� �о�� �� ���� �� ������
    --FETCH
        DBMS_OUTPUT.PUT_LINE(venrol.sub_no || ' ' || venrol.stu_no || ' ' || venrol.enr_grade);
    END LOOP;
    --Ŀ�� �ݰ�
    CLOSE empcur;
END;

--SET SERVEROUTPUT ON;

EXECUTE EXAM07();

--�μ���ȣ 10���� �ٹ��ϴ� ��� ���
SELECT * FROM EMP;
SELECT * FROM DEPT;
WHERE DEPTNO = 10;

--IS �൥���� �������� Ŀ�� ���� -> BEGIN (Ŀ������ -> �ݺ��� ��->FETCH INTO EXIT WHEN ->�ݺ� �� -> Ŀ������)
CREATE OR REPLACE PROCEDURE EXAM08
    (vdeptno IN dept.deptno%TYPE) --�ܺο��� �μ���ȣ�� �ް�
IS
    vemp emp%ROWTYPE; -- EMP���̺��� ��Ÿ���� ����
    CURSOR empcur IS SELECT * FROM emp WHERE deptno = vdeptno; --SELECT�� �̾Ƽ� empcur�� ���� ��
BEGIN
    OPEN empcur;
        LOOP
            FETCH empcur INTO vemp; --fetch(������ ����) into(~�� �ִ�)
            EXIT WHEN empcur%NOTFOUND; --%ROWCOUNT, %FOUND
            DBMS_OUTPUT.PUT_LINE(vemp.empno || ' ' || vemp.ename || ' ' || vemp.job);
        END LOOP;
    CLOSE empcur;
END;

execute exam08(10);

SELECT * FROM EMP;
SELECT * FROM DEPT;


--�����ȣ 101 ���� ���(�л���ȣ, �����ȣ, �����̸�, ����) �����ؼ� ���� ���ϱ� 

SELECT * FROM ENROL WHERE SUB_NO=101;

SELECT STU_NO, ENROL.SUB_NO, ENR_GRADE, SUB_NAME
FROM ENROL, SUBJECT
WHERE ENROL.SUB_NO = SUBJECT.SUB_NO
AND ENROL.SUB_NO=101;



CREATE OR REPLACE PROCEDURE EXAM09
    (insubno IN enrol.sub_no%TYPE,
    hap OUT NUMBER)
IS
    vstu_no enrol.stu_no%TYPE;
    vsub_no enrol.sub_no%TYPE;
    venr_grade enrol.enr_grade%TYPE;
    vsub_name subject.sub_name%TYPE;
    
    CURSOR ecursor IS SELECT STU_NO, ENROL.SUB_NO, SUB_NAME, ENR_GRADE --1���̻��� �Ѿ�� CURSOR�� FETCH�� ��
                        FROM ENROL, SUBJECT
                        WHERE ENROL.SUB_NO = SUBJECT.SUB_NO
                        AND ENROL.SUB_NO=insubno;
    
BEGIN
    hap := 0;
    OPEN ecursor;
        LOOP
            FETCH ecursor INTO vstu_no,vsub_no,vsub_name,venr_grade;
            EXIT WHEN ecursor%NOTFOUND;
            
            hap := hap + venr_grade;
            DBMS_OUTPUT.PUT_LINE(vstu_no || ' ' || vsub_no || ' ' || vsub_name || ' ' || venr_grade);
        END LOOP;
            DBMS_OUTPUT.PUT_LINE(hap);
    CLOSE ecursor;
END;

VARIABLE p_hap VARCHAR2;
EXECUTE EXAM09(101, :p_hap);
PRINT p_hap;

--<SYS_REFCURSOR> : �������� ���ν����� Ȱ���Ͽ� ��� ?
--���� : blog.naver.com/giriyo/221354299585
--������ EXECUTE() ��½� ���ε� ���� REFCURSOR�� �����ϱ� ����
--CURSOR ���õ� ������ ���� ���̺� �°� CUSTOMIZE �ؾ��Ѵ�.

--4-4)���ν��� ����
DROP PROCEDURE EXAM01;

--5. �����Լ� : PROCEDURE �������� ������ ��� �ȵ�/ CURSOR, FETCH
--���ʽ�
CREATE OR REPLACE FUNCTION bonus
    (vempno IN emp.empno%TYPE)  --�Ķ���� ��
    RETURN NUMBER              --��ȯ�ڷ��� OUT��� RETURN�־���, 1���� �Ѿ
IS
    vsal NUMBER(7,2);            --����������
BEGIN
    SELECT sal INTO vsal FROM emp WHERE empno = vempno; -- ������ �Է¹޾Ƽ� �� ��
    RETURN (vsal*200);
END;

SELECT sal, bonus(7788) FROM emp WHERE empno = 7788;

--���Ͽ����� �޴� ���
SELECT ename FROM emp
WHERE sal=(SELECT MIN(sal) FROM emp);

CREATE OR REPLACE FUNCTION slamaxname
    RETURN emp.ename%TYPE
IS
    vename emp.ename%TYPE;
BEGIN
    SELECT ename INTO vename FROM emp
    WHERE sal=(SELECT MIN(sal) FROM emp);
    RETURN vename;
END;

SELECT slamaxname() FROM emp;


