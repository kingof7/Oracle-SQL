--복습시 ?나 ERROR를 검색하세요!


/*
    1.오라클 기본 용어
        1)Relation : 테이블
        2)Tuple:레코드(행)
        3)Attribute:컬럼(열)
        4)Domain:속성의 집합
            4-1)단순 도메인(Simple Domain) : 단순속성
            4-2)복합 도메인(Complex Domain) : 복합속성, 단순 도메인 결합 (예) 날짜
            4-3)다치 도메인(Multivalued Domain) : 다치속성, 하나의 속성에 여러개의 값을 갖는다. (예: 콤마로 취미속성 구분)
    
    2. 오라클 데이터 속성
    1)문자 / 숫자 
        1-1)고정길이:integer,float,double,char(n) (char(4)) // 
        1-2)가변길이:varchar(n), varchar2(2), number(n), number(p,s)//전체자릿수(소숫점포함),소수 자리수
    2)날 짜 : DATE, TIMESTMP
    3)LONG : 2GB 문자 데이터
    4)LOB : 4GB 텍스트, 동영상, 이미지, 사운드
    5)ROWID : 테이블 행의 논리적인 위치(고유주소)를 표현
*/
--    데이터 정의어(DDL: DATA DEFINITION LANGUAGE)
--    3.테이블 : 행과 열로 구성된 2차원 테이블로 데이터를 저장하는 객체
--    3-1) 테이블 생성 : CREATE TABLE 테이블명 ((컬럼명 자료형), ...)
    CREATE TABLE PERSON(
        bunho NUMBER(4),
        name VARCHAR2(20),
        ki NUMBER(5,1)
    );
    --테이블 구조
    DESC PERSON;
    --동일계정의 모든 테이블 보기
    SELECT * FROM TAB; 
--    3-2) 테이블 삭제 : DROP TALBE 테이블명
    DROP TABLE PERSON;
    
    CREATE TABLE addr(
        irum VARCHAR2(15),
        phone VARCHAR2(15),
        address VARCHAR2(50),
        email VARCHAR2(15)
    );
--    3-3) 테이블 변경 : 
    CREATE TABLE addr(
        irum VARCHAR2(15),
        phone VARCHAR2(15),
        address VARCHAR2(50),
        email VARCHAR2(15)
    );
    SELECT * FROM ADDR;
    
    --1) 컬럼추가 ALTER TABLE 테이블명 ADD(컬럼명 자료형(크기), ...);
    ALTER TABLE ADDR ADD(TEL VARCHAR2(15));
    
    --2) 컬럼변경/컬럼명 변경
    --  2-1) 자료형 변경 : ALTER TABLE 테이블명 MODIFY(컬럼명 자료형, ...); 
          ALTER TABLE ADDR MODIFY(TEL VARCHAR2(20)); 
    --  2_2) 컬럼명 변경 : ALTER TABLE 테이블명 RENAME COLUMN 기존컬럼명 TO 새로운 컬럼명 
          ALTER TABLE ADDR RENAME COLUMN TEL TO TELNET;
    --3) 컬럼삭제 : ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
          ALTER TABLE ADDR DROP COLUMN TELNET;
   DESC ADDR;
   
   --3-4) 테이블내의 테이블 삭제 / DML - TRUNCATE TABLE 테이블명
   --   DML - DELETE FROM 테이블명 동일
   TRUNCATE TABLE MAN;
   SELECT * FROM MAN;
   --4. 데이터 조작어 DML : 선택,삽입,수정,삭제
   --4-2) INSERT: INSERT INTO 테이블명 VALUES(값,..., ...);
   INSERT INTO PERSON VALUES(1, '홍길동', 185.0);
   INSERT INTO PERSON VALUES(2, '이길동', 180.0);
   INSERT INTO PERSON VALUES(3, '김길동', 178.0);
   INSERT INTO PERSON VALUES(4, '조길동', 169.0);
   
   INSERT INTO PERSON VALUES(6, 167,7); --ERROR 데이터 생략시 반드시 컬럼표시
   INSERT INTO PERSON(bunho, ki) VALUES(6, 167.7);
   INSERT INTO PERSON(bunho, name, ki) VALUES(7, '김경은', 177.5); --데이터 있는 경우 컬럼표시 생략가능
   SELECT * FROM PERSON;
   --UPDATE PERSON SET NAME='' WHERE KI=167.7;
   --4-3) UPDATE:
   CREATE TABLE MAN(
    NUM NUMBER(3),
    NAME VARCHAR2(15),
    PHONE VARCHAR2(15),
    JUMIN VARCHAR2(20),
    CITY VARCHAR2(15),
    BIRTHDAY DATE       --TIMESTAMP
   );
   
   INSERT INTO MAN
   VALUES
   (1, '홍길동', '010-123-1234', '123456-1234567', '서울', 
   TO_DATE('1980-12-25', 'YYYY-MM-DD'));
   
   INSERT INTO MAN
   VALUES
   (2, '김길동', '010-123-5678', '123456-2234567', '수원', 
   TO_DATE('1987-12-25', 'YYYY-MM-DD'));
   
   INSERT INTO MAN
   VALUES
   (3, '박길동', '010-123-6678', '123456-2334567', '부천', 
   TO_DATE('1992-01-25', 'YYYY-MM-DD'));
   
   SELECT * FROM MAN;
   
   UPDATE MAN SET CITY='제주도' WHERE NUM=2;
   UPDATE MAN SET CITY='서을' WHERE NUM=1;
   UPDATE MAN SET CITY='인천', NAME='조길동' WHERE NUM=3;
   --4-4) DELETE: DELETE FROM 테이블명 WHERE 조건절, DDL - TRUNCATE TABLE MAN과 동일
   DELETE FROM MAN WHERE NUM=1;
   TRUNCATE TABLE MAN;
   
   SELECT * FROM PERSON;
   
   
   --5.테이블 복사
   --5-1) 테이블 구조와 레코드 복사
   CREATE TABLE COPY_PERSON
   AS SELECT * FROM PERSON
   WHERE 1=2; -- 조건이 모순이므로 레코드가 들어가지 않고 구조만(필드만)만들어짐
   
   DROP TABLE COPY_PERSON;
   
   --6.제약조건(Constraint)
   --6-1) 도메인 제약조건
   --6-2) 키제약조건
   --6-3) 무결성 제약조건
   
   --6-4) 제약조건 유형
   -- 1) NOT NULL : 해당 컬럼 값으로 NULL을 허용하지 않음
   -- 2) UNIQUE : 테이블 내에서 해당 컬럼 값은 항상 유일무이(중복X)한 값, NULL 허용
   -- 3) PRIMARY KEY : 해당 컬럼 값으로 반드시 존재해야함, 유일해야함 (NOT NULL + UNIQUE) 유일성과 최소성을 동시에 만족해야함
   
   SELECT * FROM COPY_PERSON;
   
   CREATE TABLE TEST(
        ONE NUMBER(2) CONSTRAINT N_ONE NOT NULL,
        TWO NUMBER(2) CONSTRAINT UK_TWO UNIQUE, --널 값허용되면서 중복값 허용 안됨?
        THREE NUMBER(2) CONSTRAINT PK_THREE PRIMARY KEY -- 기본키도 기본적으로 널값을 허용하지 않음 (NOT NULL + UNIQUE)
   );
   
   SELECT * FROM TEST;
   
   SELECT * FROM TAB;
   
   INSERT INTO TEST VALUES(1, 10, 55);
   INSERT INTO TEST VALUES(2, 20, 66);

   INSERT INTO TEST VALUES(3, 20, 76); -- 2번째 필드가 중복값 허용을 하지 않는다.
   INSERT INTO TEST VALUES('', 21, 66); --1번째 필드가 널값을 허용하지 않는다.
   INSERT INTO TEST(two,three) VALUES(21, 66); --마찬가지
   INSERT INTO TEST(one,three) VALUES(4, 88);
   INSERT INTO TEST(one,twe) VALUES(1,2); -- 기본키도 기본적으로 널값을 허용하지 않음
   
   INSERT INTO TEST VALUES(6, 12, 99);

   SELECT * FROM TEST;
   
   --4) CHECK : 이 조건으로 설정된 값만 입력을 허용
    CREATE TABLE apple(
        bunho NUMBER(3), 
        age NUMBER(3),
        gender NUMBER(1),
        
        CONSTRAINT pk_bunho PRIMARY KEY(bunho), --어떤 필드의 제약을 걸어주는지 알아내기위해 (bunho)
        CONSTRAINT ch_age CHECK(age BETWEEN 1 AND 120),
        CONSTRAINT ch_gender CHECK(gender IN(1,2)) --CHECK 제약은 범위를 설정해준다
    );
    SELECT * FROM apple;
    DELETE FROM apple WHERE BUNHO = 150;
    INSERT INTO apple VALUES(1,25,1); -- check constraint (JAVA.CH_AGE)
    INSERT INTO apple VALUES(2,150,1); 
    INSERT INTO apple VALUES(3,55,5); --check constraint (JAVA.CH_GENDER)
    
    -- 5)FOREIGN KEY : 해당 컬럼의 값이 다른 테이블의 컬럼 값을 참조
    --                  컬럼에 없는 값을 입력하지 못함
    CREATE TABLE student(
        stu_no CHAR(9),
        stu_name VARCHAR2(12),
        stu_dept VARCHAR2(20),
        stu_grade NUMBER(1),
        stu_class CHAR(1),
        stu_gender CHAR(1),
        stu_height NUMBER(5,2),
        stu_weight NUMBER(5,2),
        
        CONSTRAINT pk_stu_no PRIMARY KEY(stu_no)
    );
    INSERT INTO student VALUES(20153075, '옥한빛', '기계', 1, 'C', 'M', 177.8, 80);
    INSERT INTO student VALUES(20153088, '이태연', '기계', 1, 'C', 'F', 162.2, 50);
    INSERT INTO student VALUES(20143054, '유가인', '기계', 2, 'C', 'F', 154.3, 47);
    INSERT INTO student VALUES(20152088, '조민우', '전기전자', 1, 'C', 'M', 188.7, 90);
    INSERT INTO student VALUES(20142021, '심수정', '전기전자', 2, 'A', 'F', 168, 45);
    INSERT INTO student VALUES(20132003, '박희철', '전기전자', 3, 'B', 'M', null, 63);
    INSERT INTO student VALUES(20151062, '김인중', '컴퓨터정보', 1, 'B', 'M', 166, 67);
    INSERT INTO student VALUES(20141007, '진현무', '컴퓨터정보', 2, 'A', 'M', 174, 64);
    INSERT INTO student VALUES(20131001, '김종헌', '컴퓨터정보', 3, 'C', 'M', null, 72);
    INSERT INTO student VALUES(20131025, '옥성우', '컴퓨터정보', 3, 'A', 'F', 177, 63);
    
    SELECT * FROM student;
    
    --과목테이블
   CREATE TABLE subject(
        sub_no CHAR(3),                         -- 과목번호
        sub_name VARCHAR2(30),             -- 과목이름 
        sub_prof VARCHAR2(12),              -- 교수명
        sub_grade NUMBER(1),                -- 학년
        sub_dept VARCHAR2(20),              -- 학과
        CONSTRAINT pk_sub_no PRIMARY KEY(sub_no)
    );
    
    INSERT INTO subject VALUES('111', '데이터베이스', '이재영', 2, '컴퓨터정보');
    INSERT INTO subject VALUES('110', '자동제어', '정순정', 2, '전기전자');
    INSERT INTO subject VALUES('109', '자동화설계', '박민영', 3, '기계');
    INSERT INTO subject VALUES('101', '컴퓨터개론', '강종영', 3, '컴퓨터정보');
    INSERT INTO subject VALUES('102', '기계공작법', '김태영', 1, '기계');
    INSERT INTO subject VALUES('103', '기초전자실험', '김유석', 1, '전기전자');
    INSERT INTO subject VALUES('104', '시스템분석설계', '강석현', 3, '컴퓨터정보');
    INSERT INTO subject VALUES('105', '기계요소설계', '김명성', 1, '기계');
    INSERT INTO subject VALUES('106', '전자회로실험', '최영민', 3, '전기전자');
    INSERT INTO subject VALUES('107', 'CAD응용실습', '구봉규', 2, '기계');
    INSERT INTO subject VALUES('108', '소프트웨어공학', '권민성', 1, '컴퓨터정보');
    SELECT * FROM subject;
    
    --수강테이블
    CREATE TABLE enrol(
        sub_no CHAR(3),
        stu_no CHAR(9),
        enr_grade NUMBER(3),
        CONSTRAINT fk_stu_no FOREIGN KEY(stu_no) REFERENCES student(stu_no),
        CONSTRAINT fk_sub_no FOREIGN KEY(sub_no) REFERENCES subject(sub_no)
    );
    
    DROP TABLE ENROL;
    
    INSERT INTO enrol VALUES('101', '20131001', 80);
    INSERT INTO enrol VALUES('104', '20131001', 56);
    INSERT INTO enrol VALUES('106', '20132003', 72);
    INSERT INTO enrol VALUES('103', '20152088', 45);
    INSERT INTO enrol VALUES('101', '20131025', 65);
    INSERT INTO enrol VALUES('104', '20131025', 65);
    INSERT INTO enrol VALUES('108', '20151062', 81);
    INSERT INTO enrol VALUES('107', '20143054', 41);
    INSERT INTO enrol VALUES('102', '20153075', 66);
    INSERT INTO enrol VALUES('105', '20153075', 56);
    INSERT INTO enrol VALUES('102', '20153088', 61);
    INSERT INTO enrol VALUES('105', '20153088', 78);
    SELECT * FROM enrol;
    DROP TABLE ENROL;
     
    SELECT * FROM STUDENT S, SUBJECT J, ENROL E
    WHERE S.STU_NO=E.STU_NO
    AND E.SUB_NO=J.SUB_NO;
    
    --6) 비활성/활성, 삭제/추가
    DELETE FROM SUBJECT WHERE SUB_NO='108'; -- 조인되있기 때문에 삭제안됨 (기본키가있는 레코드가 참조하고있는 다른 테이블의 레코드가 있고, 제약되어 있다면 삭제가안됨)
    
    -- 비활성
    ALTER TABLE ENROL DISABLE CONSTRAINT FK_SUB_NO CASCADE;
    
    -- 삭제(서브젝트에서)
    DELETE FROM SUBJECT WHERE SUB_NO='108'; 
    
     --다시 삽입
    INSERT INTO subject VALUES('108', '소프트웨어공학', '권민성', 1, '컴퓨터정보');
    -- 활성화    
    ALTER TABLE ENROL ENABLE CONSTRAINT FK_SUB_NO;
    
    -- 다시 삭제
    DELETE FROM SUBJECT WHERE SUB_NO='108'; --불가능
    
    SELECT * FROM ENROL;
    
    -- 제약조건 삭제
    ALTER TABLE ENROL DROP CONSTRAINT fk_sub_no CASCADE; -- FOREIGN KEY까지 날아감
    DELETE FROM SUBJECT WHERE SUB_NO='108';
    
    --추가
    INSERT INTO subject VALUES('108', '소프트웨어공학', '권민성', 1, '컴퓨터정보');
    
    ALTER TABLE ENROL ADD CONSTRAINT fk_sub_no
    FOREIGN KEY(sub_no) REFERENCES subject(sub_no); --제약조건 추가
    
    DELETE FROM SUBJECT WHERE SUB_NO='108'; --불가

    --7. DML - SUBQUERY 절
    SELECT * FROM ENROL WHERE STU_NO LIKE '2015%';
    
    --2015학번 학생들의 수강정보를 새로운 COPY_ENROL 테이블 생성시 삽입
    CREATE TABLE COPY_ENROL -- CREATE는 AS SELECT
    AS SELECT * FROM ENROL
    WHERE 1=2;
    SELECT * FROM COPY_ENROL;
    
    INSERT INTO COPY_ENROL SELECT * FROM ENROL WHERE STU_NO LIKE '2015%'; -- INSERT는 그냥 SELECT
    
    SELECT * FROM COPY_ENROL;
    SELECT * FROM SUBJECT;
    SELECT * FROM ENROL;
    
    --SUBQUERY, JOIN은 SELECT뿐만아니라 INSERT UPDATE DELETE에 모두 사용 가능합니다
    
    --기초전자실험 과목점수 10 증가 시켜라 (SUB_NO=103, ENR_GRADE=45)
    UPDATE COPY_ENROL SET ENR_GRADE = ENR_GRADE + 10
    WHERE SUB_NO = (SELECT SUB_NO FROM SUBJECT WHERE SUB_NAME='기초전자실험');
    
    --SEQUENCE 생성
    --SEQUENCE 삭제
    --DDL : TALBE, SEQUENCE, VIEW
    CREATE TABLE MSG(
    NUM NUMBER(2),
    MESSAGE VARCHAR2(50),
    CONSTRAINT PK_NUM PRIMARY KEY(NUM)
    );
    --8.SEQUENCE 
    --SEQUENCE 생성 (게시물만들때 번호 자동증가)
    CREATE SEQUENCE MSG_NUM_SEQ --고유일련번호, 테이블_컬럼명_시퀀스식별자
    START WITH 10               --시작번호
    INCREMENT BY 5              --증가
    MAXVALUE 5000;              --최대값
    
    --SEQEUENCE 삭제
    INSERT INTO MSG VALUES(MSG_NUM_SEQ.NEXTVAL, '안녕하세요'); --.NEXTVAL=다음번호
    INSERT INTO MSG VALUES(MSG_NUM_SEQ.NEXTVAL, 'hi');
    
    SELECT * FROM MSG;
    
    DROP SEQUENCE MSG_NUM_SEQ;
    
    --9. TRANSACTION : 하나의 작업을 트랜잭션이라고 한다.
    CREATE TABLE SUNGJUK(
        BUN NUMBER(2),
        IRUM VARCHAR2(20),
        KOR NUMBER(3),
        ENG NUMBER(3),
        MAT NUMBER(3),
        TOT NUMBER(3) DEFAULT 0,
        AVG NUMBER(5,2)
        CONSTRAINT PK_BUN PRIMARY KEY(BUN)
    );
    --AVG도 디폴트값으로 바꾸려면 어케해야되져?   
    
    CREATE SEQUENCE SUNGJUK_BUN_SEQ;
    
    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '김윤재', 90, 80, 70); -- 번호는 NEXTVAL에 자동삽입
    
    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '오일', 90, 80, 70);
    
    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '김현수', 90, 80, 70);
    
    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '이종화', 90, 80, 70);
        
    UPDATE SUNGJUK SET TOT=KOR+ENG+MAT; --한번에 모든 레코드 업데이트
    UPDATE SUNGJUK SET AVG=TOT/3;
    
    SELECT * FROM SUNGJUK;
        
    --select는 commit rollback 필요없음 -->테이블의 변화가 없고 단지 데이터만 뿌려주는거니까
    
    --insert, update, delete는 필요함 (단 환경설정에서 자동커밋 체크해서 따로 안해줘도 됨)
    
    --9-1) COMMIT : 하나의 트랜잭션 과정을 종료한다.
    DELETE FROM SUNGJUK WHERE BUN=1;
    COMMIT;
    --9-2) ROLLBACK : 이전 상태로 돌아감 (취소)
    UPDATE SUNGJUK SET TOT=KOR+ENG+MAT WHERE BUN=7;
    ROLLBACK;   `
    --9-3) SAVEPOINT : 중간단계로 되돌리기
    UPDATE SUNGJUK SET TOT=KOR+ENG+MAT WHERE BUN=6;
    SAVEPOINT S;
    UPDATE SUNGJUK SET AVG=TOT/3 WHERE BUN=6;
    SELECT * FROM SUNGJUK;
    ROLLBACK TO S; -- BUN=6의 AVG값을 되돌림
    COMMIT;
    --면접기출: db뭐썼니? RDBMS가뭐니?  트랜잭션해봤니? 하나의 작업흐름이 끝날때 커밋해주고 취소시에는 롤백해주는것 / 빅데이터해봤니,
    --            넌누구니?
    
    --10.INDEX
    SELECT * FROM PERSON;
    
    CREATE TABLE COPY_PERSON
    AS SELECT * FROM PERSON;
    
    SELECT * FROM COPY_PERSON;
    
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    
    INSERT INTO COPY_PERSON VALUES(999,'PENGSU',210);
    SELECT * FROM COPY_PERSON WHERE NAME='PENGSU';
    
    --데이터 저장시 하드에 저장되고, 실행시(WHERE 조건에 따라) RAM에 X,Y가 할당되고 CPU에서 연산을 처리한다 / 연산이 끝난후 RAM에서 메모리 저장공간 해제
    --한편, 데이터가 많은 테이블의 경우, 한꺼번에 메모리공간에 올라가면 속도가 느려지니까 // 원하는 필드만 인덱싱을 해줘서, RAM에 올라가게 해줘야 한다.
    
    --인덱싱(C언어에서 동작하는 원리)
    -- 1필드당 1개의 포인터 열이 따라옴
    -- 장점:속도가빨라짐 단점:메모리 차지가 더크다(포인터때문에)
    -- PRIMARY KEY는 자동 인덱싱이 됨 (NULL,중복X // 내부적으로 인덱스가 있음)
    --[필드] [포인터(주소)=인덱스테이블]
    -- 값1   2398DFD#@r
    -- 값2   349F$fdfGJI
    -- 값3   AKLSDF@#dfsd
    -- ..   23$90DJdfads
    
    --주소값
    SELECT ROWID FROM COPY_PERSON;
    -- 10. INDEX : 데이터베이스 테이블에 있는 데이터를 빨리 찾기 위한 용도의 색인 기술임
    --             모든 블럭을 다 알지 않고도 원하는 데이터가 있는 주소를 찾아내서 그 블럭만
    --             메모리에 복사해오면 빠른 작업이 가능하다.
    SELECT * FROM PERSON;
    
    CREATE TABLE COPY_PERSON
    AS SELECT * FROM PERSON;
    
    
    SELECT COUNT(*) FROM COPY_PERSON;
    INSERT INTO COPY_PERSON VALUES(
    SELECT * FROM COPY_PERSON WHERE NAME='PENGSU';
    
    --10-1)인덱스 생성 / CREATE INDEX 인덱스명 ON 테이블명(필드명, ... ,...)
    CREATE INDEX INDEX_NAME ON COPY_PERSON(NAME);
    SELECT * FROM COPY_PERSON WHERE NAME = 'PENGSU';
    
    --10-2)인덱스 삭제 / DROP INDEX 인덱스명
    DROP INDEX INDEX_NAME;
    
    --11.ROWNUM : 가상의 일련번호 (내부적으로 부여함) // 레코드마다 번호를 순서대로 부여
    SELECT ROWNUM, BUNHO, NAME FROM COPY_PERSON;
    
    --5개의 데이터 출력
    SELECT * FROM SUNGJUK;
    
    SELECT ROWNUM "RNUM" , BUN, IRUM, TOT 
    FROM SUNGJUK
    WHERE ROWNUM BETWEEN 1 AND 4; --게시판에서 페이지당 출력 게시물수를 구할때 쓰곤함
    
    DELETE FROM SUNGJUK WHERE BUN = 7;
    
    INSERT INTO SUNGJUK VALUES('홍길동', 80, 50, 99);
    
    SELECT ROWNUM RNUM, BUN, IRUM, TOT FROM SUNGJUK -- FROM -> WHERE(RNUM은 원래없는거라 에러)->그다음 SELECT를 뿌림
    WHERE RNUM >= 1 AND RNUM <= 5;                  -- 뿌리지도 않은 RNUM을 가져올 수 없다 --> INLINEVIEW로 해결
    
        
    --ROWNUM 제일 마지막(우선순위)에 실행되므로 ERROR
    
    SELECT A.RNUM, --3. 뿌려준다
            A.BUN,
            A.IRUM,
            A.TOT
    FROM (SELECT ROWNUM RNUM, BUN, IRUM, TOT FROM SUNGJUK) A -- 1.FROM에서 먼저 ROWNUM을 가지고오고나서)
    WHERE A.RNUM >=1 AND A.RNUM <=5; -- 2. 조건을 뽑아내고
    
    SELECT ROWNUM RNUM, BUN, IRUM, KOR, ENG, MAT, TOT, AVG FROM SUNGJUK;
    
    --SELECT ROWNUM, * FROM SUNGJUK; -- ERROR: 불가
    
    SELECT ROWNUM RNUM, A.* --2. 다뿌려준다
    FROM (SELECT * FROM SUNGJUK) A; -- 1. A라는 서브쿼리절을 가져와서
     
    SELECT * FROM  (SELECT ROWNUM RNUM, A.*
                    FROM (SELECT * FROM SUNGJUK ORDER BY AVG DESC) A) B
    WHERE B.RNUM >=1 AND B.RNUM <= 3;
    
     INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
     VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '전교2등', 100, 98, 100);
    
    SELECT * FROM SUNGJUK;
    --뷰에다가 자주쓰는 데이터를 저장해둠 (그 이전에 권한설정 필요)
    --프로시저 : 함수타입으로 매개변수를 던질 수 있다.
    
    --12.VIEW : 자주 사용하는 DML을 텍스트 형태로 저장해 놓는다.
    --12-1) 뷰 생성 
    CREATE VIEW V_PERSON
    AS SELECT NAME FROM PERSON WHERE NAME='홍길동';
    --12-2) 뷰 선택
    SELECT * FROM V_PERSON;
    --12-3) 뷰 수정(OR REPLACE): 기존 뷰는 그대로 유지하면서 내용만 변경
    CREATE VIEW V_PERSON
    AS
    SELECT NAME, KI FROM PERSON WHERE NAME ='홍길동';
    
    CREATE OR REPLACE VIEW V_NAME_PERSON
    AS
    SELECT NAME, KI FROM PERSON WHERE NAME ='홍길동';
    
    SELECT * FROM V_NAME_PERSON;
    --12-4) 뷰 삭제
    DROP VIEW V_PERSON;
    DROP VIEW V_NAME_PERSON;
        
    --12-5) 응용예들
    --과목명 출력하는 VIEW (SELECT 문)
    CREATE OR REPLACE VIEW view_enrol
    AS
    SELECT S.STU_NO, SUB_NAME, STU_NAME, E.SUB_NO
    FROM STUDENT S, ENROL E, SUBJECT J
    WHERE S.STU_NO = E.STU_NO
    AND E.SUB_NO = J.SUB_NO;
    
    SELECT * FROM VIEW_ENROL;
    
    
    --옥성우 학생이 수강한 과목 출력
    SELECT S.STU_NAME, SUB_NAME
    FROM STUDENT S, view_enrol V
    WHERE S.STU_NO = V.STU_NO --테이블과 뷰도 조인이 가능
    AND S.STU_NAME='옥성우';
    
    --과목별 평균구하기

    SELECT AVG(ENR_GRADE),
           SUB_NAME
    FROM ENROL E, VIEW_ENROL V
    WHERE E.SUB_NO = V.SUB_NO
    GROUP BY (SUB_NAME);
    
    
    