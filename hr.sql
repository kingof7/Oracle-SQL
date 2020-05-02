select * from employees;
select * from jobs;

-- 테이블 구조

describe employees; --데이터 스키마 구조
describe jobs;

-- 자료형  문자, 숫자 ,Date

-- 01.검색(선택) SELECT문
-- 형식) select [컬럼명 또는 표현식]
--      from [테이블명 또는 뷰명]
--      where 조건절
--      group by [컬럼명]having 조건절
--      order by [컬럼명]