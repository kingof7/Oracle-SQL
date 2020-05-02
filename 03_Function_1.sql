-- 오라클 함수:https://docs.oracle.com/cd/E11882_01/server.112/e41084/functions155.htm#SQLRF00698\
/*
4/9
함수(Function)
    - 인수를 전달받아 처리한 결과를 반환해주는 프로그램 모듈
    *****숫자함수, 문자함수, 날짜함수, 일반함수nvl, 변환함수******
*/

-- 1. 숫자함수 Numeric Functions
SELECT 10*20 FROM DUAL; -- DUAL: DEFAULT TABLE
SELECT SYSDATE FROM DUAL; -- 오라클 서버의 현재시간
SELECT SYSDATE "TODAY", SYSDATE+1, SYSDATE-5, SYSDATE+10 FROM DUAL;

SELECT ROUND(123.567, 0) "ROUND" -- 소수 0번 째자리(정수첫번째자리)
FROM DUAL;

SELECT ROUND(1234.567, 1)
FROM DUAL;

-- 1-1) ROUND(값, 자리수) 함수 : 반올림 함수
SELECT ROUND (15.2547, 3) "Round" FROM DUAL;
SELECT ROUND (15.2547, -1) "Round" FROM DUAL;

-- 음수는 소숫점 생각하지말고 반올림 ->1230
SELECT ROUND(1234.567, 1), --양수는 소숫점 해당자리까지~반올림
       ROUND(1234.567, 2), 
       ROUND(1234.567, -1), --음수는 정수 해당자리에서~반올림
       ROUND(1234.567, -2),
       ROUND(1234.567, -3), 
       ROUND(1234.567, -4)
FROM DUAL;

-- 1-2) TRUNC(값, 자리수) 함수: 버림 함수

SELECT TRUNC(3456.789, 1) "Truncate", --3456.7 // 양수의 경우 소수 해당자리 뒤로 버림
       TRUNC(3456.789, 2) "Truncate", --3456.78
       TRUNC(3456.789, -1) "Truncate", --3450 // 음수의 경우 정수 해당자리부터 버림
       TRUNC(3456.789, -2) "Truncate", --3400
       TRUNC(3456.789, -3) "Truncate", --3000
       TRUNC(3456.789, -4) "Truncate" -- 0
FROM DUAL;

-- 1-3) CEIL(값) / FLOOR(값) : 소수이하 무조건 올림, 버림
SELECT CEIL(2.123), --올리고 버림
       FLOOR(2.567), --그냥 다 버림
       CEIL(4.054)
FROM DUAL;

--FLOOR 소수첫째자리 버림

-- 1-4) MOD(숫자1, 숫자2):주어진 숫자를 지정된 숫자로 나눈 나머지를 반환
SELECT MOD(10,3) AS "나머지" FROM DUAL;
SELECT MOD(10,3)
FROM DUAL;

-- 1-5) POWER(숫자, 숫자) : 주어진 숫자의 지정된 수 만큼 제곱을 한 값을 반환
SELECT POWER(2,10) "POWER" FROM DUAL;

SELECT SIGN(-15) "Sign" FROM DUAL;

--서버는 대부분 가변길이를 쓴다 (EX) VARCHAR(10) 최대 10바이트)
--성별의 경우는 고정길이를 쓰는게 좋음 (남/녀 == 2바이트) EX CHAR(2)
--oracle 10version 이상은 VARCHAR2를 쓰는 것이 좋음
--nvarchar는 varchar보다 동일 데이터 저장시 공간을 2배 사용하며, 다국어 지원이 필요한 DB 작업일 경우에 적당한 데이터형

--2. 문자함수
--2-1) UPPER(문자 또는 문자열) 대문자로 변환
SELECT UPPER('Welcome to Oracle 11g')
FROM DUAL;

SELECT FIRST_NAME,
       UPPER(FIRST_NAME),
       LOWER(FIRST_NAME)
FROM EMPLOYEES;

--2-2) LOWER(문자 또는 문자열) 소문자로 변환
SELECT LOWER('Welcome to Oracle 11g')
FROM DUAL;
--2-3) INITCAP(문자 또는 문자열) 첫 글자만 대문자로 변환
SELECT INITCAP('Welcome to Oracle 11g')
FROM DUAL;

--2-4) ASCII
SELECT ASCII('A'),
       ASCII('a')
FROM DUAL;

--2-5) LENGTH(문자 또는 문자열): 문자열의 길이(갯수) + 공백 포함
SELECT LENGTH('ORA C L E')
FROM DUAL;

SELECT FIRST_NAME, 
        LENGTH(FIRST_NAME) AS 문자길이
FROM EMPLOYEES;

--2-6) CONCAT (문자, 문자): 문자를 연결
SELECT FIRST_NAME,
       LAST_NAME,
       FIRST_NAME || LAST_NAME AS NAME1,
       FIRST_NAME || '(' || LAST_NAME || '입니다.)',
       CONCAT(FIRST_NAME, LAST_NAME) AS NAME2,
       CONCAT(CONCAT(FIRST_NAME, '('), CONCAT(LAST_NAME, '입니다.)'))
FROM EMPLOYEES;

--***********문자열의 갯수, 특정문자, 특정문자열의 위치, 문자를 숫자로변환************

--2-7) INSTR(): 특정 문자열의 위치 -> 반환값은 숫자


--2-8) SUBSTR(): 특정 문자(문자열) 추출

--   날짜함수
--   일반함수
--   변환함수

--2-9) INSTR(문자열, 찾는문자, 시작위치, 몇번째): 특정 문자 위치
SELECT INSTR('Welcome to oracle 11g','o')
FROM DUAL; -- 5번째 / 1부터 찾아서 첫번째 o의 위치를 출력
--2-10) SUBSTR(): 특정 문자(문자열) 추출
SELECT INSTR('Welcome to oracle 11g','o',1,2)
FROM DUAL; --첫번째부터 찾아서 2번째 O의 위치를 출력

SELECT INSTR('CORPORATE FLOOR', 'OR', 5, 2)
FROM DUAL;

SELECT INSTR('Welcome to oracle 11g','o',11,1) -- *** 11번째부터 시작해서 첫번째 O의 위치를 출력
FROM DUAL;

Select First_Name,
        Instr(First_Name, 'a')
From Employees
Where First_Name Like '%a%';

--2-11) SUBSTR(문자열,시작위치,문자갯수): 특정 문자(문자열) 추출
SELECT SUBSTR('Welcome to oracle 11g', 4, 4) -- 앞에서 4번째부터 4개의 문자를 출력
FROM DUAL;

SELECT SUBSTR('Welcome to oracle 11g', -3, 3) -- 뒤에서 3번째부터 3개의 문자를 출력
FROM DUAL;

--19801225-1234567 -다음 1뽑아내기
SELECT INSTR('19801225-1234567', '-')
FROM DUAL;
SELECT SUBSTR('19801225-1234567', INSTR('19801225-1234567', '-')+1, 1) --근데왜같이씀?
FROM DUAL;
--02-070-8000 // 070뽑아내기

SELECT INSTR('02-070-8000','-')
FROM DUAL;

SELECT SUBSTR('02-070-8000', INSTR('02-070-8000','-')+1,3)
FROM DUAL;

-- 2-12) LPAD(문자열, 자리수, 채울문자열):오른쪽 정렬 후 왼쪽에 생긴 빈 공백에 특정문자를 채운다.
SELECT LPAD('Oracle 11g', 20, '#')
FROM DUAL;
-- 2-12) RPAD(문자열, 자리수, 채울문자열):왼쪽 정렬 후 왼쪽에 생긴 빈 공백에 특정문자를 채운다.
SELECT RPAD('Oracle 11g', 20, '#')
FROM DUAL;

--공백찾기가 힘듬
--2-10) LTRIM(문자열, 제거할 문자) / 왼쪽에 특정문자 삭제
SELECT LTRIM('<=====>BROWNING<=====>', '><=') "LTRIM Example" --제거할 문자 순서상관 x
FROM DUAL;

SELECT LTRIM('aaaa Oracle 11g aaaa', 'a')
FROM DUAL;

SELECT LTRIM('   Oracle 11g ', ' ')
FROM DUAL;
--2-11) RTRIM(문자열, 제거할 문자) / 오른쪽에 특정문자 삭제
SELECT RTRIM('aaaa Oracle 11g aaaa', 'a')
FROM DUAL;

SELECT RTRIM('   Oracle 11g ', ' ')
FROM DUAL;
--2-12) TRIM(제거할 문자, FROM 문자열) / 특정문자 삭제
SELECT TRIM('a' FROM 'aaaa Oracle 11g aaaa')
FROM DUAL;
SELECT TRIM('a' FROM 'aaaa Oracle 11g aaaa')
FROM DUAL;
SELECT TRIM(' ' FROM ' Oracle 11g  ')
FROM DUAL;

--2-13) REPLACE(문자열, 기존문자, 교체문자) / 문자열에서 특정문자를 특정문자로 치환
SELECT PHONE_NUMBER,
REPLACE (PHONE_NUMBER,'.','-')
FROM EMPLOYEES;

SELECT FIRST_NAME,
        REPLACE(FIRST_NAME, SUBSTR(FIRST_NAME,2,1), '#') -- 왜 2개가바뀌는지? SUBSTR부분이 l로바뀌므로 모두 #으로 바꿔줌
FROM EMPLOYEES;

--3. 날짜함수
--3-1)SYSDATE:시스템에 지정된 현재 날짜/시간
SELECT SYSDATE,
        SYSTIMESTAMP
FROM DUAL;

--3-2)날짜 연산: 사칙연산가능
SELECT SYSDATE,
        SYSDATE + 1,
        SYSDATE - 1
FROM DUAL;

SELECT EMPLOYEE_ID,
       HIRE_DATE,
       TRUNC(SYSDATE - HIRE_DATE) AS 근무일수
FROM EMPLOYEES;

-- 3-3)MONTHS_BETWEEN(날짜, 날짜) / 날짜와 날짜 사이의 개월 수 를 계산
SELECT EMPLOYEE_ID,
       HIRE_DATE,
       TRUNC(SYSDATE - HIRE_DATE) AS 근무일수,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) 근무개월수,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) 근속년수
FROM EMPLOYEES;

-- 3-4) ADD_MONTHS(날짜,숫자) / 주어진 날짜에 숫자만큼 더한 달
SELECT SYSDATE,
        ADD_MONTHS(SYSDATE, 7)
FROM DUAL;

-- 3-4)ADD_MONTHS(날짜,자료형)
SELECT FIRST_NAME,
        DEPARTMENT_ID,
        HIRE_DATE,
        ADD_MONTHS(HIRE_DATE, 24) "24개월 후 진급시험"
FROM EMPLOYEES;

-- 3-5) LAST_DAY(날짜) / 주어진 날짜가 속한 달의 가장 마지막 날 건색
SELECT SYSDATE,
        LAST_DAY(SYSDATE)
FROM DUAL;

SELECT FIRST_NAME,
        DEPARTMENT_ID,
        HIRE_DATE,
        LAST_DAY(HIRE_DATE) "마지막날짜"
FROM EMPLOYEES;

--3-6) NEXT_DAY() / 주어진 날짜를 기준으로 돌아오는 가장 최근 요일의 날짜
--한글(일,월~~)/영문(SUN, MON ~~)/숫자(일요일 1, 월요일 2 ~~~)

SELECT SYSDATE,
        NEXT_DAY(SYSDATE, '수') --현재시간으로부터 수요일이니까 다음주(15일)
FROM DUAL;

SELECT SYSDATE,
        NEXT_DAY(ADD_MONTHS(SYSDATE,6),'수')
FROM DUAL;

--***변환함수***
--숫자
--문자(1byte 문자열, 특수문자) ex:)!dekf2kfkE -> 숫자,문자합쳐진것은 문자열이다
--날짜
--
--숫자-->문자
--날짜
--
--문자 --> 숫자/날짜
--1)TO_CHAR(날짜, 날짜형식)
SELECT SYSDATE, 
    TO_CHAR(SYSDATE,'YYYY') 년도,
    TO_CHAR(SYSDATE,'MM') 월,
    TO_CHAR(SYSDATE,'MM') 일
FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE, 'YY/MM/DD'),
TO_CHAR(SYSDATE, 'YYYY.MM.DD'),
TO_CHAR(SYSDATE, 'MONTH DD.YYYY'),
TO_CHAR(SYSDATE, 'DY DD MON YY'),
TO_CHAR(SYSDATE, 'DAY MON DD'),
TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" day')
FROM DUAL;


SELECT HIRE_DATE,
        FIRST_NAME
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'MM')=03;

SELECT HIRE_DATE,
        FIRST_NAME
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YY') > 00;

--2)TO_CHAR(숫자, 숫자형식): 숫자형이 문자형으로 변환
--9는 들어갈 숫자가 없으면 안채워지지만, 0은 들어갈 숫자가 없으면 0이 채워짐
--
SELECT TO_CHAR(1234, '9999'), --포맷형식 지정
        TO_CHAR(1234, '9,9999'), --오른쪽부터 채워짐
        TO_CHAR(12345, '9,9999'),
        TO_CHAR(12345, '0,9999'),
        TO_CHAR(1234.56, '9999.99'),
        TO_CHAR(1234.56, '9999.9999'),
        TO_CHAR(1234.56, '9999.9900'),
        TO_CHAR(1234, '$9,999'),
        TO_CHAR(1234, 'L9,999'),
        TO_CHAR(1234, '9999EEEE')
FROM DUAL;

--4-3) TO_NUMBER(문자열): 문자를 숫자로 변환
SELECT '11,000' - '10,000'
FROM DUAL;      --ERROR

SELECT TO_NUMBER('11,000', '99,999') - TO_NUMBER('10,000', '99,999')
FROM DUAL;

SELECT TO_NUMBER('1')
FROM DUAL;
--4-4) TO_DATA(문자열): 문자열 날짜로 변환

SELECT SYSDATE - '2020/12/25'
FROM DUAL;      --ERROR

SELECT TRUNC(SYSDATE,'DD') - TRUNC(TO_DATE('2019/12/25','YYYY/MM/DD'),'DD')
FROM DUAL;

SELECT TO_DATE('2020/12/25','YYYY/MM/DD')
FROM DUAL;

--5. 그룹함수 : 열(컬럼)을 기준으로 행을 그룹화시켜 그룹함수를 적용하면 각 그룹에
--              하나의 결과를 반환한다. (연신시 NULL값을 제외한다. 그러므로 count함수 사용 고려)

--5-1) SUM 함수
SELECT SUM(SALARY) "인건비(만원)"
FROM EMPLOYEES;

SELECT SUM(COMMISSION_PCT) "커미션합계"
FROM EMPLOYEES;

SELECT SUM(SALARY) "100부서의 인건비(만원)"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

SELECT TO_CHAR(SUM(SALARY), 'L999,999')
FROM EMPLOYEES
WHERE DEPARTMENT_ID=100;

--5-2) AVG 함수
SELECT ROUND(AVG(SALARY)) 평균연봉
FROM EMPLOYEES;

SELECT ROUND(AVG(COMMISSION_PCT),2) 평균커미션
FROM EMPLOYEES;

SELECT ROUND(AVG(SALARY)) "IT직군 평균연봉"
FROM EMPLOYEES
WHERE JOB_ID='IT_PROG' AND DEPARTMENT_ID=60;




--5-3) MAX, MIN 함수
SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES;

SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
WHERE JOB_ID='IT_PROG';

--5-4) COUNT 함수

SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES;

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

-- DINSTINCT를 왜 COUNT안에 써야되는지?
SELECT COUNT(DISTINCT DEPARTMENT_ID) --NULL빼고 다가져옴 
FROM EMPLOYEES;

--NULL값을 포함, DISTINCT를 쓸 수 없음
SELECT COUNT(*)
FROM EMPLOYEES;

--5-5) GROUP BY : 특정 조건을 주고 더 세부적인 결과를 추출 할 수 있다.
--부서별 연봉평균
SELECT DEPARTMENT_ID,
       JOB_ID,
       ROUND(AVG(SALARY)) 평균연봉
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID; --? 같은 그룹끼리 묶는.. // 그룹으로 먼저묶고 SELECT 뒤에 추가해준다

--부서별 연봉합계

SELECT DEPARTMENT_ID,
        SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--SUM,AVG 등 집계함수는 기본적으로 GROUP 함수이므로 GROUP BY로안 묶어도됨?
--근데 각 필드는 그룹함수가 아니므로 그룹바이로 묶어야 된다.

SELECT JOB_ID,
        COUNT(JOB_ID),
        SUM(SALARY),
        ROUND(AVG(SALARY))        
FROM EMPLOYEES
GROUP BY JOB_ID;

--5-6) STDDEV 함수 / 표준편차
SELECT DEPARTMENT_ID, 
        ROUND(STDDEV(SALARY),2)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1; --존재하지 않는 필드를 기준으로 잡을때 필드순서번호를 작성해주어도 된다

--5-7) VARIANCE 함수 / 분산값
SELECT DEPARTMENT_ID, 
        ROUND(VARIANCE(SALARY),2)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 2;

--5-8) 다중열 GROUP BY 절: GROUP BY 절에 2개 이상의 열이 기술될 수 있으며,
--                       이 경우 GROUP BY 절의 왼쪽에서 오른쪽 열 순으로 행을
--                       그룹지어 처리한다.

--부서별 직군 수
SELECT DEPARTMENT_ID,
       JOB_ID,
       COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY 1 ASC, 2 ASC, 3 DESC;

SELECT COUNT(*) --모든 레코드수
FROM EMPLOYEES;

--부서별 직군의 최대연봉, 최소연봉
SELECT DEPARTMENT_ID,
        JOB_ID,
        MIN(SALARY),
        MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID ASC, JOB_ID ASC, 4 DESC; --? GROUP->SELECT->ORDER이기때문에 4나 별칭 쓸 수있음
                                                -- DEPARTMENT_ID는 DISTINCT가 적용 X // 그 뒤에는 다 적용이되네

--5-8) HAVING 절: WHERE절이 SELECT문에서 조건 검색을 위해 사용한다면
--                HAVING절은 GROUP BY절에 의해 생성된 결과 값 중 원하는 조건에 부합하는 자료 검색

--부서별 연봉평균을 구하고, 평균연봉이 5000이상인 부서만 출력
SELECT DEPARTMENT_ID,
        ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING ROUND(AVG(SALARY)) >= 5000; --? 2나 별칭을 쓸수없다.. GROUP->HAVING->SELECT 순서이기 때문에


--직군별 연봉평균과 인원수를 구하고 인원수가 2명 이상인 직군만 출력
SELECT JOB_ID,
        ROUND(AVG(SALARY)),
        COUNT(JOB_ID)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING COUNT(JOB_ID) >= 2
ORDER BY 2 DESC; --? SELECT한다음 ORDER BY이기 때문에 별칭이나 2 쓸수있음

-- 참조) WHERE / HAVING
SELECT DEPARTMENT_ID, --5 뿌려
        SUM(SALARY)
FROM EMPLOYEES -- 1 테이블에서
WHERE DEPARTMENT_ID <> 90 -- 2 제외
GROUP BY DEPARTMENT_ID -- 3 묶어
HAVING SUM(SALARY) >= 5000; --4 걸러서

SELECT STU_DEPT, STU_NAME, AVG(stu_grade)
FROM STUDENT
GROUP BY STU_DEPT, STU_NAME;

--JOIN : 모듈(테이블)로 나눠놓은 것을 합치는 개념(합치기 전에 모듈을 잘 나눠야된다)
--PM(PROJECT MANAGER):시스템 요구사항 분석
--설계(APPLICATION ARCHITECTURE): 테이블 관계 설정
--개발:코딩



--6. 일반함수: NVL







