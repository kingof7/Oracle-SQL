select * from employees;
select * from jobs;

-- 테이블 구조

describe employees; --데이터 스키마 구조
describe jobs;

-- 자료형  문자, 숫자 ,Date

-- 01.검색(선택) SELECT문
-- 형식) select [필드/컬럼명 또는 표현식]
--      from [테이블명 또는 뷰명]
--      where 조건절
--      group by [컬럼명]having 조건절
--      order by [컬럼명]

-- 1. 단순검색 : select [column or expression] from [tablename or viewname]
SELECT first_name FROM employees;

-- 나눠서 쓰는 편이 좋다, 가독성
SELECT last_name
FROM employees;

--대소문자를 구분하지 않는 언어는 컴파일 시 모두 대문자로 바뀜

SELECT last_name,
        first_name,
        salary,
        email
FROM employees;

-- 2. 모든 필드(열) 조회

SELECT * FROM employees;

SELECT job_id FROM employees;

Select Department_Id -- 107개(모두)가 나옴
From Employees;

-- 3. 중복값 제거

Select Distinct job_Id, Department_Id
From Employees; -- 같이쓰면 답이 이상하네

Select Distinct job_Id
From Employees;

Select Distinct Department_ID
From Employees;

-- 4. 연산(산술연산) +,-,*,/
SELECT EMPLOYEE_ID,
        SALARY,
        SALARY+100 AS "Rised", -- double quotation쓰면 대소문자 구분가능
        SALARY-100  "Lowed",
        SALARY*100  "Multiple",
        SALARY/2 AS "Dived"
        FROM EMPLOYEES;

-- 5.Select (NULL은 미확정 또는 알 수 없는 값을 의미한다. 그러면 연산, 할당, 비교 불가능
-- 오라클 일반함수 NVL(컬럼, 치환할 값)
SELECT employee_id,
       salary,
       commission_pct, -- 인센티브
       NVL((commission_pct+1)*salary, salary) as 계산 -- commission_pct = null이면 salary로 반환할 것
FROM employees;

select count(*) "Record_Number" from employees;

-- 6. 별칭(alias) AS ' '
-- 규칙 : 공백, 특수문자, 소문자 출력시 "쌍따옴표"
--      salary as 연봉 : AS 키워드를 생략할 수 있다.

select employee_id 사원번호,
        salary + NVL(commission_pct, 0) as 연봉
from employees;

select employee_id 사원번호,
        salary + NVL(commission_pct, 0) as "*연봉입니다.*"
from employees;

select employee_id 사원번호,
        salary + NVL(commission_pct, 0) as "sAl"
from employees;
--Model View Controller 각 단에서 무결한 데이터를 보내고 받아야함

-- 7. concatnation (합성문자, 연결연산자)
Select first_name,
        last_name
from employees;

-- 7-1) 서로다른 컬럼을 마치 하나의 컬럼인 것 처럼 연결해서 출력
Select first_name || ' ' || last_name As name
from employees;
-- 7-2) 문자열과 컬럼을 결합한 형태
Select first_name || '(' || last_name || ')' As name
from employees;
-- 








