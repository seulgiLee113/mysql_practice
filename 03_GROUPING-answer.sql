/*
01. GROUP BY 및 HAVING 및 ORDER BY 관련 예제
:
*/

/*
< 면접 단골 질문 : SQL 실행 순서 >
    5 : SELECT
    1 : FROM
    2 : WHERE      (필터링)
    3 : GROUP BY   (필터링)
    4 : HAVING     (필터링)
    6 : ORDER BY
    7 : LIMIT
*/

/* Q1)
tbl_employee 테이블에서 부서 코드별 그룹을 지정하여
부서코드, 그룹별 급여의 합계, 그룹별 급여의 평균(정수처리), 인원수를 조회하고,
부서코드 순으로 오름차순 정렬하시오.
*/
SELECT 
    dept_code,
    SUM(salary) AS 급여합계,
    FLOOR(AVG(salary)) AS 급여평균,
    COUNT(*) AS 인원수
FROM 
    tbl_employee
GROUP BY 
    dept_code
ORDER BY 
    dept_code ASC;
-- SUM(): 주어진 컬럼의 모든 값의 합계를 계산.
-- FLOOR(): 주어진 숫자를 내림하여 정수로 변환.
-- AVG(): 주어진 컬럼의 모든 값의 평균을 계산.
-- COUNT(): 주어진 조건에 맞는 행의 수를 계산.
-- GROUP BY: 지정된 컬럼을 기준으로 행을 그룹화.
-- ORDER BY: 결과를 지정된 컬럼을 기준으로 정렬.

/* Q2)
tbl_employee 테이블에서 직급별 직급코드, 보너스를 받는 사원수를 조회하여
직급코드 순으로 오름차순 정렬하시오.
*/
SELECT 
    job_code,
    COUNT(bonus) AS '보너스 받는 사원수'
FROM 
    tbl_employee
WHERE 
    bonus IS NOT NULL
GROUP BY 
    job_code
ORDER BY 
    job_code ASC;
-- IS NOT NULL: NULL이 아닌 값을 찾음.

/* Q3) HARD!!
tbl_employee 테이블에서 주민번호의 8번 째 자리를 조회하여 1이면 남, 2면 여로 결과를 조회하고
성별별 급여 평균(정수처리), 급여 합계, 인원수를 조회한 뒤
인원수로 내림차순 정렬하시오.
(힌트: case문 사용 : https://www.w3schools.com/sql/func_mysql_case.asp)
*/
SELECT 
    CASE SUBSTR(emp_no, 8, 1)
        WHEN '1' THEN '남'
        WHEN '2' THEN '여'
    END AS 성별,
    FLOOR(AVG(salary)) AS 급여평균,
    SUM(salary) AS 급여합계,
    COUNT(*) AS 인원수
FROM 
    tbl_employee
GROUP BY 
    성별
ORDER BY 
    인원수 DESC;
-- CASE: 조건에 따라 다른 값을 반환하는 제어문.
-- SUBSTR(): 문자열의 특정 부분을 추출.

/* Q4)
300만원 이상을 받는 사원들의 부서별 평균 급여를 조회하시오.
(힌트: 평균 급여는 floor()를 사용해 적절히 잘라내야 할 수도 있다)
*/
SELECT 
    dept_code,
    FLOOR(AVG(salary)) AS 평균급여
FROM 
    tbl_employee
WHERE 
    salary >= 3000000
GROUP BY 
    dept_code;

/* Q5)
평균이 300만원 이상인 부서 사원들의 평균 급여를 조회하시오.
(힌트: 평균 급여는 floor()를 사용해 적절히 잘라내야 할 수도 있다)
*/
SELECT 
    dept_code,
    FLOOR(AVG(salary)) AS 평균급여
FROM 
    tbl_employee
GROUP BY 
    dept_code
HAVING 
    AVG(salary) >= 3000000;
-- HAVING: GROUP BY로 그룹화된 결과에 조건을 적용.

/* Q6)
급여 합계가 가장 많은 부서의 부서 코드와 급여 합계를 구하시오.
*/
SELECT 
    dept_code,
    SUM(salary) AS 급여합계
FROM 
    tbl_employee
GROUP BY 
    dept_code
ORDER BY 
    급여합계 DESC
LIMIT 1;
