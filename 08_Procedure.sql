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
--    --AVG도 디폴트값으로 바꾸려면 어케해야되져?   
--    
--    CREATE SEQUENCE SUNGJUK_BUN_SEQ;
--    
--    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
--    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '김윤재', 90, 80, 70); -- 번호는 NEXTVAL에 자동삽입
--    
--    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
--    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '오일', 90, 80, 70);
--    
--    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
--    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '김현수', 90, 80, 70);
--    
--    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
--    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '이종화', 90, 80, 70);
--        
--    UPDATE SUNGJUK SET TOT=KOR+ENG+MAT; --한번에 모든 레코드 업데이트
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
----DML의 단순 데이터 활용 한계로, SQL 언어에 절차적 언어의 요소를 더하여 데이터 처리를
----향상시킨 기능(반복,조건 등..)
----1.기본구성 DECLARE ~ BEGIN ~ EXCEPTION ~ END
--
----1-1) 변수선언
----화면에 보여줘라
--SET SERVEROUTPUT ON; --SQL실행 동안 한번만 설정
--DECLARE         -- 선언부(변수선언) / NUMBER, CHAR, VARCHAR2, DATE, BOOLEAN
--    bunho number(4);
--    irum varchar(10);   --scalar 변수
--    
--    vstu_no enrol.stu_no%TYPE;  --레퍼런스 변수 / 특정열 참조
--    
--    venrol enrol%ROWTYPE;       --레퍼런스 변수 / 전체행 참조
--    
---- 실행문( :=는 대입한다는 뜻)
--BEGIN
--    bunho := 7788;
--    irum := 'KIM';
--    DBMS_OUTPUT.PUT_LINE('사번 / 이름');            --System.out.println();이랑 똑같음
--    DBMS_OUTPUT.PUT_LINE('===================');
--    DBMS_OUTPUT.PUT_LINE(bunho || '/' || irum);
---- 예외처리    
----EXCEPTION             
-- -- 종료
--END;
--
----2) 선택처리 : IF ~ THEN ~ END IF / IF ~ THEN ~ ELSE ~ END IF / IF ~ THEN ~ ELSIF ~ END IF
--
--DECLARE
--    su NUMBER(4);
--BEGIN
--    su := 10;
--    
--    IF MOD(su, 2)=0 THEN 
--        DBMS_OUTPUT.PUT_LINE('짝수');
--    END IF;
--    
--    IF su >= 50 THEN
--        DBMS_OUTPUT.PUT_LINE('합격');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('불합격');
--    END IF;
--    
--    IF su > 0 THEN
--        DBMS_OUTPUT.PUT_LINE('양수');
--    ELSIF su < 0 THEN
--        DBMS_OUTPUT.PUT_LINE('음수');
--    ELSIF su = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('0');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('기타등등');
--    END IF;
--END;
--
----3) 반복문 :  FOR ~ LOOP ~ END LOOP(=FOR) / WHILE ~ LOOP ~ END LOOP(=WHILE) / LOOP ~ END LOOP(=DO WHILE) 
--
----PACKAGE TRIGGER
--
----3-1) FOR ~ LOOP ~ END LOOP
--DECLARE
--    cnt NUMBER(2) := 0;
--    hap NUMBER(4) := 0;
--BEGIN
--    FOR cnt IN 1..10 LOOP -- IN 초기.. 최종
--        hap := hap + cnt;
--        DBMS_OUTPUT.PUT_LINE(cnt || ' ' ||hap);
--    END LOOP;
--END;
--
--DECLARE
--    cnt NUMBER(2) := 0;
--    
--BEGIN
--    FOR cnt IN REVERSE 1..10 LOOP -- IN 초기.. 최종
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
--        EXIT WHEN cnt = 10; -- 조건만족 전까지 계속 루프
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
----2. PL/SQL 에서 SQL
---- 1)SELECT 컬럼리스트 INTO 스칼라변수 FROM 테이블 WHERE
--SELECT * FROM STUDENT WHERE STU_NAME='이태연';
--
----이태연 학생의 학번과 이름 출력
DECLARE
    vstu_no student.stu_no%TYPE; --스튜던트 테이블의 stu_no의 자료형을 가져옴 / 참조형(레퍼런스) 변수
    vstu_name student.stu_name%TYPE; --해당열 %TYPE
BEGIN
    SELECT stu_no, stu_name INTO vstu_no, vstu_name
    FROM STUDENT
    WHERE STU_NAME='이태연';
    
    DBMS_OUTPUT.PUT_LINE(vstu_no || ' ' || vstu_name);
END;
--
----뷰는 자주쓰는 것을 텍스트로 만들어서 저장
----함수는 리턴값이 1개
----프로시저는 리턴값이 1개 이상
--
---- 5번 학생의 학점 구하기 (학번, 이름, 총점, 평균, 학점)
--SELECT * FROM SUNGJUK WHERE BUN=5;
--    
--DECLARE
--    vsungjuk sungjuk%ROWTYPE; -- 한 행을 전부 가져옴
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
--PL/SQL은 데이터를 받을 수 없다
--따라서 프로시저를 통해 데이터를 주고받도록 하자
--SQLPLUS에서 권한설정

--3.저장 프로시저(Stored Procedure)와 함수/ 권한설정 SQL>GRANT CREATE PROCEDURE, CREATE SESSION TO HR;
-- 함수와 프로시저의 차이: 반환값이 하나면 함수 / 그 이상이면 프로시저

/*
--프로시저가 뭐니? 자주쓰는 질의어를 프로그래밍 언어처럼 함수로만들어 놓은것
 3-1) PL/SQL 사용한 DML 명령어
    1) SELECT 컬럼리스트 INTO 스칼라변수 FROM 테이블 WHERE
    2) UPDATE 테이블명 SET 컬럼명 = 스칼라변수(레퍼런스변수),...,... WHERE 조건절 [스칼라/레퍼런스 변수]
    3) INSERT INTO 테이블명(컬럼리스트) VALUES(스칼라 또는 레퍼런스 변수, ...., ....)
    4) DELETE FROM 테이블명 WHERE 조건절 [스칼라/레퍼런스 변수]
*/

--SELECT * FROM STUDENT; --20152088 5학년 수정
--
CREATE OR REPLACE PROCEDURE EXAM01 --public void abc)int x, int y)와 같음
    (vstu_no IN student.stu_no%TYPE, --INSERT DELETE UPDATE는 들어가는거니까 IN 씀 // 레퍼변수
    vstu_grade IN student.stu_grade%TYPE) --넘어가는
IS  
BEGIN
    UPDATE student SET stu_grade = vstu_grade
    WHERE stu_no = vstu_no;
END;
--
--EXECUTE EXAM01(20152088,5);
--EXECUTE EXAM01(20142021,4);
--
----INSERT : INSERT INTO 테이블명(컬럼리스트) VALUES(스칼라 또는 레퍼런스 변수, ...., ....)
--SELECT * FROM PERSON;
--INSERT INTO PERSON(BUNHO, NAME, KI) VALUES(7,'펭수',210);
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
--EXECUTE EXAM02(99,'강동원',189);
--
----DELETE : DELETE FROM 테이블명 WHERE 조건절 [스칼라/레퍼런스 변수]
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
----UPDATE : UPDATE 테이블명 SET 컬럼명 = 스칼라변수(레퍼런스변수),...,... WHERE 조건절 [스칼라/레퍼런스 변수]
----SELECT : SELECT 컬럼리스트 INTO 스칼라변수 FROM 테이블 WHERE
--SELECT stu_name FROM student WHERE stu_no = 20153075;
--
CREATE OR REPLACE PROCEDURE EXAM04 --stu_no가 들어가고 stu_name이 나옴
    (vstu_no IN student.stu_no%TYPE,
     vstu_name OUT student.stu_name%TYPE) --public String Exam04(int vstu_no) 와 같음
IS
BEGIN
  SELECT stu_name INTO vstu_name
  FROM student WHERE stu_no=vstu_no; 
END;


VARIABLE p_stu_name VARCHAR2(20); -- 바인드 변수 : 리턴값을 저장하는 변수
EXECUTE exam04(20153075, :p_stu_name); --(넘어가는값, :리턴되는값)
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

--7839 사원의 사원번호, 이름, 연봉을 출력하는 프로시저
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

--4. CURSOR & FETCH / 복수행 출력
--수강 테이블 내용 출력

CREATE OR REPLACE PROCEDURE EXAM07
IS
    venrol enrol%ROWTYPE; --행 데이터를 모두 가져옴
    CURSOR empcur IS SELECT * FROM ENROL; --커서형 변수 선언, empcur안에 넣어줌(다수의 행)
BEGIN
    --커서 열고
    OPEN empcur;
    --복수행처리 / 커서로부터 데이터를 읽어와 변수에 저장
    LOOP --반복문
        FETCH EMPCUR INTO venrol.sub_no, venrol.stu_no, venrol.enr_grade; --행순서대로 데이터를 집어넣음
        EXIT WHEN empcur%NOTFOUND; --더 이상 읽어올 게 없을 때 나간다
    --FETCH
        DBMS_OUTPUT.PUT_LINE(venrol.sub_no || ' ' || venrol.stu_no || ' ' || venrol.enr_grade);
    END LOOP;
    --커서 닫고
    CLOSE empcur;
END;

--SET SERVEROUTPUT ON;

EXECUTE EXAM07();

--부서번호 10에서 근무하는 사원 출력
SELECT * FROM EMP;
SELECT * FROM DEPT;
WHERE DEPTNO = 10;

--IS 행데이터 가져오고 커서 선언 -> BEGIN (커서오픈 -> 반복문 열->FETCH INTO EXIT WHEN ->반복 닫 -> 커서닫음)
CREATE OR REPLACE PROCEDURE EXAM08
    (vdeptno IN dept.deptno%TYPE) --외부에서 부서번호를 받고
IS
    vemp emp%ROWTYPE; -- EMP테이블의 행타입을 선언
    CURSOR empcur IS SELECT * FROM emp WHERE deptno = vdeptno; --SELECT로 뽑아서 empcur에 넣을 것
BEGIN
    OPEN empcur;
        LOOP
            FETCH empcur INTO vemp; --fetch(가지고 오다) into(~로 넣다)
            EXIT WHEN empcur%NOTFOUND; --%ROWCOUNT, %FOUND
            DBMS_OUTPUT.PUT_LINE(vemp.empno || ' ' || vemp.ename || ' ' || vemp.job);
        END LOOP;
    CLOSE empcur;
END;

execute exam08(10);

SELECT * FROM EMP;
SELECT * FROM DEPT;


--과목번호 101 정보 출력(학생번호, 과목번호, 과목이름, 점수) 연산해서 합을 구하기 

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
    
    CURSOR ecursor IS SELECT STU_NO, ENROL.SUB_NO, SUB_NAME, ENR_GRADE --1행이상이 넘어갈때 CURSOR와 FETCH를 씀
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

--<SYS_REFCURSOR> : 복수행을 프로시저를 활용하여 출력 ?
--참고 : blog.naver.com/giriyo/221354299585
--복수행 EXECUTE() 출력시 바인드 변수 REFCURSOR를 실행하기 위해
--CURSOR 관련된 내용을 나의 테이블에 맞게 CUSTOMIZE 해야한다.

--4-4)프로시저 삭제
DROP PROCEDURE EXAM01;

--5. 저장함수 : PROCEDURE 차이점은 복수행 출력 안됨/ CURSOR, FETCH
--보너스
CREATE OR REPLACE FUNCTION bonus
    (vempno IN emp.empno%TYPE)  --파라미터 값
    RETURN NUMBER              --반환자료형 OUT대신 RETURN넣어줌, 1개만 넘어감
IS
    vsal NUMBER(7,2);            --지역변수명
BEGIN
    SELECT sal INTO vsal FROM emp WHERE empno = vempno; -- 데이터 입력받아서 들어갈 곳
    RETURN (vsal*200);
END;

SELECT sal, bonus(7788) FROM emp WHERE empno = 7788;

--최하연봉을 받는 사원
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


