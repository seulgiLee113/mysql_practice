/*
01. 그룹 함수 및 단일행 함수 관련 예제
: SUM, AVG, MAX, MIN, COUNT 등...
*/

/* Q1)
사원들의 급여의 총 합을 조회하시오.
*/
select sum(salary)
from tbl_employee;

/* Q2)
사원들의 급여의 평균을 구하시오.
*/
select AVG(salary) from tbl_employee;

/* Q3)
모든 사원들의 아이디를 '@' 이후를 제외하여 조회하시오.
(힌트: SUBSTR())
*/
select emp_name, SUBSTR(email, 1, 6) from tbl_employee;
select emp_name, email, instr(email, '@') from tbl_employee;
select emp_name, SUBSTR(email, 1, instr(email, '@')-1) from tbl_employee;
-----------------------------------------------------------------------
-- https://blog.naver.com/tnsqo1126/221987578077


/* Q4)
tbl_employee 테이블에서 직원들의 주민번호를 조회하여 사원명, 생년, 생월, 생일을 각각 분리하여 조회할 것.
(단, 컬럼의 별칭은 사원명, 생년, 생월, 생일로 한다.)
(힌트: SUBSTR())
*/
select emp_name as '사원명', SUBSTR(emp_no, 1, 2) as "생년", substr(emp_no, 3, 2) as "생월", substr(emp_no, 5, 2) as "생일"
from tbl_employee;

/* Q5)
여직원들을 조회하시오.
(단, WHERE 조건절에는 emp_no 컬럼만 사용할 수 있음)
(힌트: 대한민국에서 여자의 주민등록번호 뒷자리는 2 또는 4로 시작한다.)
*/
select * from tbl_employee where SUBSTR(emp_no, 8,1) = 2 or substr(emp_no, 8 ,1 ) = 4;

/* Q6)
tbl_employee 테이블에서 모든 직원들이 입사일로부터 현재까지 몇 개월 간 근무했는지를 계산하여 이름과 개월 수를 조회하시오.
(힌트: period_diff() 또는 timestampdiff(), floor(), sysdate() 또는 now())
*/
select emp_name, TIMESTAmpdiff(MONTH, hire_date, now()) as "근무월수" from tbl_employee;
-- timestampdiff(단위, 날짜1, 날짜2) : 날짜2-날짜1


/* Q7)
tbl_employee 테이블에서 사원의 이름, 입사일, 입사 후 6개월이 되는 날짜를 계산하여 조회하시오.
(힌트: date_add(), sysdate() 또는 now())
*/
select emp_name, hire_date, date_add(hire_date, INTERVAL 6 MONTH) as "입사 후 6개월" from tbl_employee;


/* Q8)
tbl_employee 테이블에서 근속 년수가 20년 이상인 직원을 조회하시오.
(힌트: date_add(), period_diff() 또는 timestampdiff(), sysdate() 또는 now())
(여러가지 답이 나올 수 있음.)
*/
-- timestampdiff(단위, 날짜1, 날짜2) : 날짜2-날짜1
select emp_name, TIMESTAmpdiff(YEAR, hire_date, now()) as "근속 년수" from tbl_employee;
-- select emp_name, TIMESTAmpdiff(YEAR, hire_date, now()) as "근속 년수" from tbl_employee having "근속 년수" >= 20;
-- 
select emp_name, TIMESTAmpdiff(YEAR, hire_date, now()) as "근속 년수" from tbl_employee having `근속 년수` >= 20;
-------------------------------------------
-- https://byson.tistory.com/100
---------------
select emp_name, hire_date from tbl_employee where TIMESTAMPDIFF(year, hire_date, now()) >= 20;


/* Q9)
tbl_employee 테이블에서 사원명, 입사일, 입사한 월의 근무 일수를 계산하여 조회하시오.
예를 들어 입사일이 2000년 12월 29일이라면, 해당 입사월에는 29일, 30일, 31일 총 3일을 근무하게 된다.
(힌트: last_day())
*/
-- select emp_name, hire_date, last_day(hire_date) 
-- from tbl_employee;
-- select DATEDIFF(last_day(hire_date), hire_date) as "입사한 월의 근무일 수"
-- from tbl_employee;
select emp_name, hire_date, DATEDIFF(last_day(hire_date), hire_date) +1 as "입사한 월의 근무일 수"
from tbl_employee;


/* Q10)
tbl_employee 테이블에서 사원 이름, 입사년, 입사월, 입사일 조회하시오.
단, extract()를 반드시 사용할 것.
*/
select emp_name, EXTRACT(YEAR from hire_date) as 입사년,
    EXTRACT(MONTH from hire_date) as 입사월,
    EXTRACT(DAY from hire_date) as 입사일
from tbl_employee;


/* Q11)
tbl_employee 테이블에서 직원의 이름, 입사일, 근무 년수를 조회할 것.
단, 근무 년수는 '현재년도 - 입사년도'로 계산하며, extract()를 반드시 사용할 것.
*/
select emp_name, hire_date, 
    EXTRACT(year from hire_date) as '입사한 연도',
    extract(year from now())
from tbl_employee;

select emp_name, hire_date, extract(year from now()) - EXTRACT(year from hire_date) as '근무 년수' from tbl_employee;



/* Q12)
tbl_employee 테이블에서 사원명, 급여를 조회하시오.
단, 급여는 '￦9,000,000' 형식으로 표시할 것.
(힌트: format())
*/
select emp_name, concat('￦',FORMAT(salary,0))
 from tbl_employee;


/* Q13)
tbl_employee 테이블에서 이름, 입사일을 조회하시오.
단, 입사일에 포맷을 적용하여 '2018년 6월 10일 (Tue)' 형식으로 출력할 것.
(힌트: date_format(), to_date())
*/
select emp_name, date_format(hire_date, '%Y년 %m월 %d일 (%a)') from tbl_employee;
select emp_name, date_format(hire_date, '%Y년 %c월 %e일 (%a)') from tbl_employee;


/* Q14)
tbl_employee 테이블에서 2000년도 이후에 입사한 사원의 사번, 이름, 입사일을 조회하시오.
(힌트: year(), to_date())
*/
select emp_id, emp_name, year(hire_date) from tbl_employee;
select year(hire_date) from tbl_employee;
select emp_id, emp_name, hire_date from tbl_employee where year(hire_date) > 2000;

/* Q15)
EMPLOYEE 테이블에서 사번이 홀수인 직원들의 모든 정보를 조회하시오.
(힌트: mod())
*/
select emp_id, mod(emp_id, 2) from tbl_employee;    -- 사번/2 결과 리턴
select * from tbl_employee where mod(emp_id, 2) = 1;



/* Q16)
EMPLOYEE 테이블에서 보너스 포인트가 NULL인 직원은 0.5로, 보너트 포인터가 NULL이 아닌 경우 0.7로 변경하여 조회하시오.
(힌트: if() 또는 ifnull() https://www.w3schools.com/sql/func_mysql_if.asp)
*/
select emp_name, bonus from tbl_employee;
update tbl_employee set bonus = 0.5 where bonus = null; 
select emp_name, bonus, if((bonus is null), 0.5, 0.7) from tbl_employee;
select if((bonus is null), 0.5, 0.7) from tbl_employee;



/* Q17) HARD!!
직원의 급여를 아래와 같이 인상하고자 한다.
- 직급 코드가 J7인 직원은 급여의 10%를 인상하고,
- 직급 코드가 J6인 직원은 급여의 15%를 인상하고,
- 직급 코드가 J5인 직원은 급여의 20%를 인상하고,
- 그 외 직급의 직원은 5%만 인상한다.
tbl_employee 테이블에서 직원명, 직급코드, 급여, 인상급여(위 조건)을 조회하시오.
단, 인상된 급여는 '인상급여'라는 별칭을 붙여 조회할 것.
(힌트: CASE문 사용 : https://www.w3schools.com/sql/func_mysql_case.asp)
*/
select emp_name, job_code, salary,
CASE 
    WHEN job_code = 'J7' THEN salary + (salary * 0.1) 
    when job_code = 'J6' THEN salary + (salary * 0.15)
    WHEN job_code = 'J5' THEN salary + (salary * 0.2)
    ELSE  salary + (salary * 0.05)
END as "인상급여"
from tbl_employee;



/* Q18) HARD!!
사번, 사원명, 급여를 EMPLOYEE 테이블에서 조회하고
급여가 500만원 초과이면 '고급',
급여가 300만원 초과~ 500만원 이하이면 '중급',
그 이하는 '출력'으로 출력하여 처리하고 별명은 '구분'으로 한다.
(힌트: CASE문 사용 : https://www.w3schools.com/sql/func_mysql_case.asp)
*/
select emp_id, emp_name, salary,
CASE 
    WHEN salary > 5000000 THEN '고급'
    WHEN 3000000 < salary and salary <= 5000000 THEN '중급' 
    ELSE  '출력'
END as '구분'
from tbl_employee;
