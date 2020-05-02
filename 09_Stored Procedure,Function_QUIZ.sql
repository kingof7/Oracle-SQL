--1 ?

CREATE OR REPLACE PROCEDURE quiz01
IS
    vemp emp%ROWTYPE; --행 데이터를 모두 가져옴
    vdept dept%ROWTYPE;
    CURSOR empcur IS SELECT empno, ename, dname, SAL FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND SAL >= 2000; --커서형 변수 선언, empcur안에 넣어줌(다수의 행)
BEGIN
    --커서 열고
    OPEN empcur;
    --복수행처리 / 커서로부터 데이터를 읽어와 변수에 저장
    LOOP --반복문
        FETCH EMPCUR INTO vemp.empno, vemp.ename, vdept.dname; --행순서대로 데이터를 집어넣음
        EXIT WHEN empcur%NOTFOUND; --더 이상 읽어올 게 없을 때 나간다
    --FETCH
        DBMS_OUTPUT.PUT_LINE(vemp.empno || ' ' || vemp.ename || ' ' || vdept.dname);
    END LOOP;
    --커서 닫고
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

EXECUTE quiz02(7890,'홍지후','대리',7839,3000,10);

--3
CREATE OR REPLACE PROCEDURE quiz03 --public void abc)int x, int y)와 같음
    (vempno IN emp.empno%TYPE, --INSERT DELETE UPDATE는 들어가는거니까 IN 씀 // 레퍼변수
    vdeptno IN emp.deptno%TYPE) --넘어가는
IS  
BEGIN
    UPDATE emp SET deptno = vdeptno --바꿀대상
    WHERE empno = vempno;  
END;

EXECUTE quiz03(7890,30); -- 7890emp를찾아서 deptno를 10에서 30으로 바꿔준것

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

--5 학과를 입력받아 과 점수의 표준편차를 출력하는 함수를 작성



CREATE OR REPLACE FUNCTION quiz05
    (vstu_dept IN student.stu_dept%TYPE)  --파라미터 값
    RETURN NUMBER              --반환자료형 OUT대신 RETURN넣어줌, 1개만 넘어감
IS
    vsteddev NUMBER(7,2);            --지역변수명
BEGIN
    SELECT STDDEV(ENR_GRADE) INTO vsteddev
    FROM ENROL E, STUDENT S
    WHERE E.STU_NO = S.STU_NO
    GROUP BY STU_DEPT
    HAVING STU_DEPT='기계'; -- 데이터 입력받아서 들어갈 곳
    RETURN (vsteddev);
END;

SELECT DISTINCT quiz05('기계') FROM student;