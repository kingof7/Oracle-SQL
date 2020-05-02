-- 1-1. 학생(STUDENT) 테이블 
CREATE TABLE student(
    stu_no CHAR(9),                     -- 학번   
    stu_name VARCHAR2(12),         -- 이름
    stu_dept VARCHAR2(20),          -- 학과
    stu_grade NUMBER(1),             -- 학년
    stu_class CHAR(1),                   -- 반
    stu_gender CHAR(1),                -- 성별
    stu_height NUMBER(5,2),           -- 신장
    stu_weight NUMBER(5,2),          -- 체중
    CONSTRAINT p_stu_no PRIMARY KEY(stu_no)
);

-- 1-2. 학생(STUDENT) 레코드
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

-- 2-1. 과목(SUBJECT) 테이블 
CREATE TABLE subject(
    sub_no CHAR(3),                         -- 과목번호
    sub_name VARCHAR2(30),             -- 과목이름 
    sub_prof VARCHAR2(12),              -- 교수명
    sub_grade NUMBER(1),                -- 학년
    sub_dept VARCHAR2(20),              -- 학과
    CONSTRAINT p_sub_no primary key(sub_no)
);

-- 2-2. 과목(SUBJECT) 레코드
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

-- 3-1. 수강(ENROL) 테이블
CREATE TABLE enrol(
    sub_no CHAR(3),
    stu_no CHAR(9),
    enr_grade NUMBER(3),
    CONSTRAINT p_course PRIMARY KEY(sub_no, stu_no)
);

-- 3-2. 수강(ENROL) 레코드
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

-- 4. Non-Eqaul-Join-Talbe

CREATE TABLE grade(
  score_name VARCHAR2(10) UNIQUE,
  score_from NUMBER(3),
  socre_to NUMBER(3)
);

INSERT INTO grade VALUES('A', 90, 100);
INSERT INTO grade VALUES('B', 80, 89);
INSERT INTO grade VALUES('C', 70, 79);
INSERT INTO grade VALUES('D', 60, 69);
INSERT INTO grade VALUES('E', 50, 59);
INSERT INTO grade VALUES('F', 0, 49);

SELECT * FROM GRADE;