--1 ?

CREATE OR REPLACE PROCEDURE quiz01
IS
    vemp emp%ROWTYPE; --�� �����͸� ��� ������
    vdept dept%ROWTYPE;
    CURSOR empcur IS SELECT empno, ename, dname, SAL FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND SAL >= 2000; --Ŀ���� ���� ����, empcur�ȿ� �־���(�ټ��� ��)
BEGIN
    --Ŀ�� ����
    OPEN empcur;
    --������ó�� / Ŀ���κ��� �����͸� �о�� ������ ����
    LOOP --�ݺ���
        FETCH EMPCUR INTO vemp.empno, vemp.ename, vdept.dname; --�������� �����͸� �������
        EXIT WHEN empcur%NOTFOUND; --�� �̻� �о�� �� ���� �� ������
    --FETCH
        DBMS_OUTPUT.PUT_LINE(vemp.empno || ' ' || vemp.ename || ' ' || vdept.dname);
    END LOOP;
    --Ŀ�� �ݰ�
    CLOSE empcur;
END;

EXECUTE quiz01;

select * from emp;
select * from

--2
CREATE OR REPLACE PROCEDURE quiz02
    (inveno IN emp.empno%TYPE,
     invename IN emp.ename%TYPE,
     invjob IN emp.job%TYPE,
     invmgr IN emp.mgr%TYPE,
     invsal IN emp.sal%TYPE,
     invdeptno IN emp.deptno%TYPE)
IS
BEGIN
    INSERT INTO EMP(empno, ename, job, mgr, sal, deptno) 
    VALUES(inveno,invename,invjob,invmgr,invsal,invdeptno);
END;

EXECUTE quiz02(7890,'ȫ����','�븮',7839,3000,10);

--3
CREATE OR REPLACE PROCEDURE quiz03 --public void abc)int x, int y)�� ����
    (vempno IN emp.empno%TYPE, --INSERT DELETE UPDATE�� ���°Ŵϱ� IN �� // ���ۺ���
    vdeptno IN emp.deptno%TYPE) --�Ѿ��
IS  
BEGIN
    UPDATE emp SET deptno = vdeptno --�ٲܴ��
    WHERE empno = vempno;  
END;

EXECUTE quiz03(7890,30); -- 7890emp��ã�Ƽ� deptno�� 10���� 30���� �ٲ��ذ�

--4

CREATE OR REPLACE FUNCTION quiz04
    RETURN emp.ename%TYPE
IS
    vename emp.ename%TYPE;
BEGIN
    SELECT ENAME INTO vename
    FROM EMP
    WHERE SAL = (SELECT MAX(SAL) FROM EMP);
    RETURN vename;
END;

SELECT DISTINCT quiz04() FROM EMP;

--5 �а��� �Է¹޾� �� ������ ǥ�������� ����ϴ� �Լ��� �ۼ�



CREATE OR REPLACE FUNCTION quiz05
    (vstu_dept IN student.stu_dept%TYPE)  --�Ķ���� ��
    RETURN NUMBER              --��ȯ�ڷ��� OUT��� RETURN�־���, 1���� �Ѿ
IS
    vsteddev NUMBER(7,2);            --����������
BEGIN
    SELECT STDDEV(ENR_GRADE) INTO vsteddev
    FROM ENROL E, STUDENT S
    WHERE E.STU_NO = S.STU_NO
    GROUP BY STU_DEPT
    HAVING STU_DEPT='���'; -- ������ �Է¹޾Ƽ� �� ��
    RETURN (vsteddev);
END;

SELECT DISTINCT quiz05('���') FROM student;