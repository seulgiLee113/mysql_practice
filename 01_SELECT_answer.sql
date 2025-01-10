/* Q1)
tbl_employee 테이블의 사번(사원번호), 이름을 조회하시오.
*/
select
	emp_id,
	emp_name
from
	tbl_employee;

/* Q2)
tbl_employee 테이블에서 부서코드가 D9인 사원을 조회하시오.
*/
select
	*
from
	tbl_employee
where
	dept_code = 'D9';

/* Q3)
tbl_employee 테이블에서 직급코드가 J1인 사원을 조회하시오.
*/
select
	*
from
	tbl_employee
where
	job_code = 'J1';

/* Q4)
tbl_employee 테이블에서 급여가 300만원 이상인 사원의 사번, 이름, 부서코드, 급여를 조회하시오.
*/
select
	emp_id,
	emp_name,
	dept_code,
	salary
from
	tbl_employee
where
	salary >= 3000000;

/* Q5)
부서코드가 D6이고 급여를 200만원보다 많이 받는 직원의 이름, 부서코드, 급여를 조회하시오.
*/
select
	emp_name,
	dept_code,
	salary
from
	tbl_employee
where
	dept_code = 'D6'
	and salary > 2000000;

/* Q6)
보너스를 받지 않는 사원에 대해 사번, 직원명, 급여, 보너스를 조회하시오.
*/
select
	emp_id,
	emp_name,
	salary,
	bonus
from
	tbl_employee
where
	bonus is null;

/* Q7)
D9부서에서 근무하지 않는 사원의 사번, 이름, 부서코드를 조회하시오.
단, 아마 '!='연산자를 사용할텐데, '<=>', '<>' 연산자를 검색해서 공부한 후 모두 응용해보세요~
*/
-- '!=' 연산자는 두 값이 같지 않음을 확인.
select
	emp_id,
	emp_name,
	dept_code
from
	tbl_employee
where
	dept_code != 'D9';

-- '<>' 연산자는 '!='와 동일하게 두 값이 같지 않음을 확인.
-- SQL 표준에서는 <>를 사용하지만, MySQL에서는 !=도 지원한다.
select
	emp_id,
	emp_name,
	dept_code
from
	tbl_employee
where
	dept_code <> 'D9';

-- '<=>' 연산자는 NULL-safe equal 연산자로, NULL 값을 포함한 비교를 수행.
-- 참고로 MySQL에서만 지원하는 연산자다.
select
	emp_id,
	emp_name,
	dept_code
from
	tbl_employee
where
	not dept_code <=> 'D9';

/* Q8)
tbl_employee 테이블에서 퇴사여부가 N인 직원을 조회하고 사번, 이름, 입사일을 별칭을 사용해 조회하시오.
(퇴사여부 컬럼은 'ent_yn'이고 N은 퇴사 안 한사람, Y는 퇴사 한 사람)
*/
select
	emp_id as '사번',
	emp_name as '이름',
	hire_date as '입사일'
from
	tbl_employee
where
	ent_yn = 'N';

/* Q9)
tbl_employee 테이블에서 급여를 350만원 이상, 550만원 이하를 받는 직원의
사번, 이름, 급여, 부서코드, 직급코드를 조회하시오.
*/
select
	emp_id,
	emp_name,
	salary,
	dept_code,
	job_code
from
	tbl_employee
where
	salary between 3500000 and 5500000;

/* Q10)
tbl_employee 테이블에서 350만원 미만, 또는 550만원을 초과하는 직원의 사번, 이름, 부서코드, 급여를 조회하시오.
*/
select
	emp_id,
	emp_name,
	dept_code,
	salary
from
	tbl_employee
where
	salary < 3500000
	or salary > 5500000;

/* Q11)
tbl_employee 테이블에서 성이 김씨인 직원의 사번, 이름, 입사일을 조회하시오.
*/
select
	emp_id,
	emp_name,
	hire_date
from
	tbl_employee
where
	emp_name like '김%';

/* Q12)
tbl_employee 테이블에서 성이 김씨 성이 아닌 직원의 사번, 이름, 입사일을 조회하시오.
*/
select
	emp_id,
	emp_name,
	hire_date
from
	tbl_employee
where
	emp_name not like '김%';

/* Q13)
tbl_employee 테이블에서 '하'가 이름에 포함된 직원의 이름, 주민번호, 부서코드를 조회하시오.
*/
select
	emp_name,
	emp_no,
	dept_code
from
	tbl_employee
where
	emp_name like '%하%';

/* Q14)
tbl_employee 테이블에서 전화번호 국번이 3자리 이면서 9로 시작하는 직원의 사번, 이름, 전화번호를 조회하시오.
(힌트: '_')
*/
select
	emp_id,
	emp_name,
	phone
from
	tbl_employee
where
	phone like '___9%';

/* Q15)
tbl_employee 테이블에서 9뒤에 7개의 번호가 있는 전화번호를 가진 직원의 사번, 이름, 전화번호를 조회하시오.
(힌트: '_')
*/
select
	emp_id,
	emp_name,
	phone
from
	tbl_employee
where
	phone like '%9_______';

/* Q16)
tbl_employee 테이블에서 앞글자가 3자리인 이메일 주소를 가진 사원의 사번, 이름, 이메일 주소를 조회하시오.
*/
select
	emp_id,
	emp_name,
	email
from
	tbl_employee
where
	email like '___%';

/* Q17)
tbl_employee 테이블에서 이씨 성이 아닌 직원의 사번, 이름, 이메일 주소 조회
*/
select
	emp_id,
	emp_name,
	email
from
	tbl_employee
where
	emp_name not like '이%';

/* Q18)
tbl_employee 테이블에서 D6부서 이거나 D8 부서인 직원들의 이름, 부서코드, 급여를 조회하시오
*/
select
	emp_name,
	dept_code,
	salary
from
	tbl_employee
where
	dept_code in ('D6', 'D8');

/* Q19)
tbl_employee 테이블에서 D6부서나 D8부서가 아닌 사원을 조회하시오.
*/
select
	*
from
	tbl_employee
where
	dept_code not in('D6', 'D8');

/* Q20)
J2직급이면서 급여 200만원 이상 받는 직원이거나 J7직급인 직원의 이름, 급여, 직급코드를 조회하시오.
*/
select
	emp_name,
	salary,
	job_code
from
	tbl_employee
where
	(
        job_code = 'J2'
		and salary >= 2000000
    )
	or job_code = 'J7';

/* Q21)
J2직급이거나 J7직급인 직원들 중에 급여가 200만원 이상인 직원의 이름, 급여, 직급코드를 조회하시오.
*/
select
	emp_name,
	salary,
	job_code
from
	tbl_employee
where
	(
        job_code = 'J2'
		or job_code = 'J7'
    )
	and salary >= 2000000;