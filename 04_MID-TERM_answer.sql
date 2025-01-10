/* Q1)
직원명과 주민번호를 조회하되, 주민번호 9번째 자리부터 끝까지 '*'문자로 채움.
예 : 홍길동 771120-1******
*/
SELECT
    emp_name,
    CONCAT(SUBSTR(emp_no, 1, 8), '******') AS 주민번호
FROM
    tbl_employee;


/* Q2)
직원명, 직급코드, 연봉(원) 조회.
단, 연봉은 보너스 포인트가 적용된 1년치 급여임.
*/
SELECT
    emp_name,
    job_code,
    CONCAT('₩', FORMAT(salary * (1 + IFNULL(bonus, 0)) * 12, 0)) AS '연봉(원)'
FROM
    tbl_employee;


/* Q3)
부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원의 사번, 사원명, 부서코드, 입사일 조회
*/
SELECT
    emp_id,
    emp_name,
    dept_code,
    hire_date
FROM
    tbl_employee
WHERE
    dept_code IN ('D5', 'D9') AND
    YEAR(hire_date) = 2004;


/* Q4)
직원명, 입사일, 입사한 달의 근무일수 조회.
단, 주말 포함.
*/
SELECT
    emp_name,
    hire_date,
    -- LAST_DAY(hire_date),		-- 힌트
    DATEDIFF(LAST_DAY(hire_date), hire_date) + 1
FROM
    tbl_employee;


/* Q5) HARD!!
직원명, 부서코드, 생년월일, 나이(만) 조회.
단, 생년월일은 주민번호에서 추출, 나이는 계산.
(힌트: CASE문 사용)
*/
SELECT
    emp_name AS 직원명,
    dept_code AS 부서코드,
    CONCAT(SUBSTR(emp_no, 1, 2), '년', SUBSTR(emp_no, 3, 2), '월', SUBSTR(emp_no, 5, 2), '일') AS 생년월일,
    CASE 
        WHEN SUBSTR(emp_no, 1, 2) <= '23' THEN YEAR(CURDATE()) - (2000 + CAST(SUBSTR(emp_no, 1, 2) AS UNSIGNED))
        ELSE YEAR(CURDATE()) - (1900 + CAST(SUBSTR(emp_no, 1, 2) AS UNSIGNED))
    END AS 나이
FROM
    tbl_employee;
-- 이 문제는 못 풀어도 무관하다.
-- 왜냐하면 이 정도의 로직을 데이터베이스에서 처리하는 것은 비효율적이며
-- Java 코드에서 처리하는 것이 훨씬 효율적이다.


/* Q6)
부서코드가 D5이면 총무부, D6이면 기획부, D9이면 영업부로 처리하여 조회.
단, 부서코드가 D5, D6, D9 인 직원의 정보만 조회.
*/
SELECT
    emp_name,
    dept_code,
    CASE
        WHEN dept_code = 'D5' THEN '총무부'
        WHEN dept_code = 'D6' THEN '기획부'
        WHEN dept_code = 'D9' THEN '영업부'
    END AS 부서
FROM
    tbl_employee
WHERE
    dept_code IN ('D5', 'D6', 'D9')
ORDER BY
    dept_code;


/* Q7)
직원들의 입사일로부터 각 년도별 입사 인원수를 조회.
ex) ----------------------------------------------------------
    |전체직원수   | 2001년   | 2002년   | 2003년   | 2004년  |
    ----------------------------------------------------------
*/
SELECT
    COUNT(*) AS 전체직원수,
    SUM(CASE WHEN YEAR(hire_date) = 2001 THEN 1 ELSE 0 END) AS '2001년',
    SUM(CASE WHEN YEAR(hire_date) = 2002 THEN 1 ELSE 0 END) AS '2002년',
    SUM(CASE WHEN YEAR(hire_date) = 2003 THEN 1 ELSE 0 END) AS '2003년',
    SUM(CASE WHEN YEAR(hire_date) = 2004 THEN 1 ELSE 0 END) AS '2004년'
FROM
    tbl_employee;


