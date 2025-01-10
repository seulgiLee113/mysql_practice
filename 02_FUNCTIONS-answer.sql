/*
01. 그룹 함수 및 단일행 함수 관련 예제
: SUM, AVG, MAX, MIN, COUNT 등...
*/

/* Q1)
사원들의 급여의 총 합을 조회하시오.
*/
SELECT
	SUM(salary)
FROM
	tbl_employee;
-- SUM(): 주어진 컬럼의 모든 값의 합계를 계산.

/* Q2)
사원들의 급여의 평균을 구하시오.
*/
SELECT
	AVG(salary)
FROM
	tbl_employee;
-- AVG(): 주어진 컬럼의 모든 값의 평균을 계산.

/* Q3)
모든 사원들의 아이디를 '@' 이후를 제외하여 조회하시오.
(힌트: SUBSTR())
*/
SELECT
	SUBSTR(email, 1, INSTR(email, '@') - 1)
FROM
	tbl_employee;
-- SUBSTR(): 문자열의 특정 부분을 추출.
-- INSTR(): 특정 문자열이 다른 문자열 내에서 처음 나타나는 위치를 반환.

/* Q4)
tbl_employee 테이블에서 직원들의 주민번호를 조회하여 사원명, 생년, 생월, 생일을 각각 분리하여 조회할 것.
(단, 컬럼의 별칭은 사원명, 생년, 생월, 생일로 한다.)
(힌트: SUBSTR())
*/
SELECT
	emp_name AS 사원명,
	SUBSTR(emp_no, 1, 2) AS 생년,
	SUBSTR(emp_no, 3, 2) AS 생월,
	SUBSTR(emp_no, 5, 2) AS 생일
FROM
	tbl_employee;

/* Q5)
여직원들을 조회하시오.
(단, WHERE 조건절에는 emp_no 컬럼만 사용할 수 있음)
(힌트: 대한민국에서 여자의 주민등록번호 뒷자리는 2 또는 4로 시작한다.)
*/
SELECT
	*
FROM
	tbl_employee
WHERE
	SUBSTR(emp_no, 8, 1) IN ('2', '4');

/* Q6)
tbl_employee 테이블에서 모든 직원들이 입사일로부터 현재까지 몇 개월 간 근무했는지를 계산하여 이름과 개월 수를 조회하시오.
(힌트: period_diff() 또는 timestampdiff(), floor(), sysdate() 또는 now())
*/
SELECT
	emp_name,
	TIMESTAMPDIFF(MONTH, hire_date, NOW())
FROM
	tbl_employee;
-- TIMESTAMPDIFF(): 두 날짜 간의 차이를 특정 단위(예: MONTH)로 반환.
-- NOW(): 현재 날짜와 시간을 반환.

/* Q7)
tbl_employee 테이블에서 사원의 이름, 입사일, 입사 후 6개월이 되는 날짜를 계산하여 조회하시오.
(힌트: date_add(), sysdate() 또는 now())
*/
SELECT
	emp_name,
	hire_date,
	DATE_ADD(hire_date, INTERVAL 6 MONTH)
FROM
	tbl_employee;
-- DATE_ADD(): 주어진 날짜에 특정 간격을 더함.

/* Q8)
tbl_employee 테이블에서 근속 년수가 20년 이상인 직원을 조회하시오.
(힌트: date_add(), period_diff() 또는 timestampdiff(), sysdate() 또는 now())
(여러가지 답이 나올 수 있음.)
*/
SELECT
	emp_name,
	hire_date
FROM
	tbl_employee
WHERE
	TIMESTAMPDIFF(YEAR, hire_date, NOW()) >= 20;

/* Q9)
tbl_employee 테이블에서 사원명, 입사일, 입사한 월의 근무 일수를 계산하여 조회하시오.
예를 들어 입사일이 2000년 12월 29일이라면, 해당 입사월에는 29일, 30일, 31일 총 3일을 근무하게 된다.
(힌트: last_day())
*/
SELECT
	emp_name,
	hire_date,
	DAY(LAST_DAY(hire_date)) - DAY(hire_date) + 1 AS '입사한 월의 근무 일수'
FROM
	tbl_employee;
-- LAST_DAY(): 주어진 날짜가 속한 달의 마지막 날을 반환.
-- DAY(): 주어진 날짜의 일(day) 부분을 반환.

/* Q10)
tbl_employee 테이블에서 사원 이름, 입사년, 입사월, 입사일 조회하시오.
단, extract()를 반드시 사용할 것.
*/
SELECT 
	emp_name,
	EXTRACT(YEAR FROM hire_date) AS 입사년,
	EXTRACT(MONTH FROM hire_date) AS 입사월,
	EXTRACT(DAY FROM hire_date) AS 입사일
FROM 
	tbl_employee;
-- EXTRACT(): 주어진 날짜에서 특정 부분(예: YEAR, MONTH, DAY)을 추출.

/* Q11)
tbl_employee 테이블에서 직원의 이름, 입사일, 근무 년수를 조회할 것.
단, 근무 년수는 '현재년도 - 입사년도'로 계산하며, extract()를 반드시 사용할 것.
*/
SELECT 
	emp_name,
	hire_date,
	EXTRACT(YEAR FROM NOW()) - EXTRACT(YEAR FROM hire_date) AS 근무년수
FROM 
	tbl_employee;

/* Q12)
tbl_employee 테이블에서 사원명, 급여를 조회하시오.
단, 급여는 '￦9,000,000' 형식으로 표시할 것.
(힌트: format())
*/
SELECT 
	emp_name,
	CONCAT('₩', FORMAT(salary, 0))
FROM 
	tbl_employee;
-- FORMAT(): 숫자를 특정 형식으로 포맷.

/* Q13)
tbl_employee 테이블에서 이름, 입사일을 조회하시오.
단, 입사일에 포맷을 적용하여 '2018년 6월 10일 (Tue)' 형식으로 출력할 것.
(힌트: date_format(), to_date())
*/
SELECT 
	emp_name,
	DATE_FORMAT(hire_date, '%Y년 %c월 %e일 (%a)') AS 입사일
FROM 
	tbl_employee;
-- DATE_FORMAT(): 날짜를 특정 형식의 문자열로 변환.

/* Q14)
tbl_employee 테이블에서 2000년도 이후에 입사한 사원의 사번, 이름, 입사일을 조회하시오.
(힌트: year(), to_date())
*/
SELECT 
	emp_id,
	emp_name,
	hire_date
FROM 
	tbl_employee
WHERE 
	YEAR(hire_date) > 2000;
-- YEAR(): 주어진 날짜의 연도 부분을 반환.

/* Q15)
tbl_employee 테이블에서 사번이 홀수인 직원들의 모든 정보를 조회하시오.
(힌트: mod())
*/
SELECT 
	* 
FROM 
	tbl_employee
WHERE 
	MOD(emp_id, 2) = 1;
-- MOD(): 두 숫자를 나눈 나머지를 반환.

/* Q16)
tbl_employee 테이블에서 보너스 포인트가 NULL인 직원은 0.5로, 보너트 포인터가 NULL이 아닌 경우 0.7로 변경하여 조회하시오.
(힌트: if() 또는 ifnull() https://www.w3schools.com/sql/func_mysql_if.asp)
*/
SELECT 
	emp_name,
	salary,
	IFNULL(bonus, 0.5) AS '보너스 포인트'
FROM 
	tbl_employee;
-- IFNULL(): 주어진 값이 NULL이면 대체 값을 반환.

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
SELECT 
	emp_name,
	job_code,
	salary,
	CASE 
		WHEN job_code = 'J7' THEN salary * 1.10
		WHEN job_code = 'J6' THEN salary * 1.15
		WHEN job_code = 'J5' THEN salary * 1.20
		ELSE salary * 1.05
	END AS 인상급여
FROM 
	tbl_employee;
-- CASE: 조건에 따라 다른 값을 반환하는 제어문.

/* Q18) HARD!!
사번, 사원명, 급여를 EMPLOYEE 테이블에서 조회하고
급여가 500만원 초과이면 '고급',
급여가 300만원 초과~ 500만원 이하이면 '중급',
그 이하는 '출력'으로 출력하여 처리하고 별명은 '구분'으로 한다.
(힌트: CASE문 사용 : https://www.w3schools.com/sql/func_mysql_case.asp)
*/
SELECT 
	emp_id,
	emp_name,
	salary,
	CASE 
		WHEN salary > 5000000 THEN '고급'
		WHEN salary > 3000000 THEN '중급'
		ELSE '출력'
	END AS 구분
FROM 
	tbl_employee;
