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


/* Q2)
tbl_employee 테이블에서 직급별 직급코드, 보너스를 받는 사원수를 조회하여
직급코드 순으로 오름차순 정렬하시오.
*/


/* Q3) HARD!!
tbl_employee 테이블에서 주민번호의 8번 째 자리를 조회하여 1이면 남, 2면 여로 결과를 조회하고
성별별 급여 평균(정수처리), 급여 합계, 인원수를 조회한 뒤
인원수로 내림차순 정렬하시오.
(힌트: case문 사용 : https://www.w3schools.com/sql/func_mysql_case.asp)
*/


/* Q4)
300만원 이상을 받는 사원들의 부서별 평균 급여를 조회하시오.
(힌트: 평균 급여는 floor()를 사용해 적절히 잘라내야 할 수도 있다)
*/


/* Q5)
평균이 300만원 이상인 부서 사원들의 평균 급여를 조회하시오.
(힌트: 평균 급여는 floor()를 사용해 적절히 잘라내야 할 수도 있다)
*/


/* Q6)
급여 합계가 가장 많은 부서의 부서 코드와 급여 합계를 구하시오.
*/
