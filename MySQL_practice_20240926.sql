-- SCOTT 스키마 사용 (사용할 데이터베이스 설정)
USE scott;

-- bonus 테이블의 구조를 보여줌 (스키마 확인)
DESC bonus;

-- dept 테이블의 구조를 보여줌 (스키마 확인)
DESC dept;

-- emp 테이블의 구조를 보여줌 (스키마 확인)
DESC emp;

-- emp 테이블에 저장된 모든 데이터를 조회
SELECT * FROM emp;

-- dept 테이블에 저장된 모든 데이터를 조회
SELECT * FROM dept;

-- emp 테이블에 저장된 모든 데이터를 다시 조회
SELECT * FROM emp;

-- 테이블명이 잘못된 예시. empHIREDATE라는 테이블은 없음
-- 오류 발생: emp 테이블이 아닌 다른 잘못된 테이블명을 조회하려고 시도
SELECT * FROM empHIREDATE;

-- emp 테이블의 구조를 다시 확인 (스키마 확인)
DESC emp;

-- emp 테이블의 구조를 다시 확인 (중복된 구조 확인)
DESC emp;

-- emp 테이블에 저장된 모든 데이터를 조회
SELECT * FROM emp;

-- salgrade 테이블에 저장된 모든 데이터를 조회
SELECT * FROM salgrade;

-- bonus 테이블에 저장된 모든 데이터를 조회
SELECT * FROM bonus;

-- 사원 번호(empno)가 7369인 직원의 데이터를 조회
SELECT * FROM emp WHERE empno = 7369;

-- 직업(job)이 'CLERK'인 직원의 데이터를 조회
SELECT * FROM emp WHERE job = 'CLERK';

-- 직업(job)이 'CLERK'인 직원의 이름(ename)만 조회
SELECT ename FROM emp WHERE job = 'CLERK';

-- 부서 번호(deptno)가 20인 직원의 데이터를 조회
SELECT * FROM emp WHERE deptno = 20;

-- 직업(job)이 'CLERK'인 직원의 이름(ename), 일(job), 돈(sal) 조회
SELECT ENAME, JOB, SAL FROM emp WHERE job = 'CLERK';

SELECT * FROM DEPT;

SELECT * FROM SALGRADE;

SELECT * FROM BONUS;

-- 직업(job)이 'CLERK'인 직원의 이름(ename), 일(job), 돈(sal) 조회
SELECT ENAME, JOB, SAL FROM emp WHERE job = 'CLERK';

-- 직업(JOB)이 'PRESIDENT'인 직원의 데이터를 조회
SELECT * FROM emp WHERE JOB = 'PRESIDENT';

-- 중복을 제거하고(JOB, DEPTNO의 조합이 고유한) 각 직원의 직업(JOB)과 부서 번호(DEPTNO)를 조회
SELECT DISTINCT JOB, DEPTNO FROM emp;

-- 중복을 허용하며 모든 직원의 직업(JOB)과 부서 번호(DEPTNO)를 조회
SELECT ALL JOB, DEPTNO FROM emp;

-- 직원 이름(ENAME), 월급(SAL), 연봉(SAL * 12 + COMM), 그리고 커미션(COMM)을 조회
-- COMM(커미션)이 NULL이면 연봉 계산 시 NULL이 될 수 있으므로 조심해야 함
SELECT ENAME, SAL, SAL * 12 + COMM, COMM FROM emp;

-- 직원 이름(ENAME), 월급(SAL), 12개월 치 월급을 수동으로 더한 값(SAL+SAL+...)과 커미션(COMM)을 함께 조회
-- COMM(커미션)이 NULL일 경우 결과가 NULL로 반환될 수 있음
SELECT ENAME, SAL, SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+COMM, COMM FROM EMP;

-- 직원 이름(ENAME), 연봉(ANNSAL: SAL * 12 + COMM 계산)과 커미션(COMM)을 함께 조회
-- SAL*12는 연봉 계산이고, COMM이 추가되며 AS로 컬럼명을 'ANNSAL'(Annual Salary)로 지정
SELECT ENAME, SAL*12+COMM AS ANNSAL, COMM FROM EMP;

-- ----------------------------------------------------------------

SELECT * FROM EMP;

SELECT DISTINCT JOB FROM EMP;

SELECT ENAME, SAL*12+COMM AS ANNSAL, COMM FROM EMP;

-- 사원 테이블(EMP)에서 월급(SAL)을 기준으로 오름차순(작은 값에서 큰 값)으로 정렬하여 조회
SELECT * FROM EMP ORDER BY SAL;

-- 사원 테이블(EMP)에서 월급(SAL)을 기준으로 내림차순(큰 값에서 작은 값)으로 정렬하여 조회
SELECT * FROM EMP ORDER BY SAL DESC;

-- 사원 테이블(EMP)에서 부서 번호(DEPTNO)를 기준으로 오름차순 정렬하고(1), 같은 부서 내에서는 월급(SAL)을 내림차순으로 정렬하여(2) 조회
SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC;

SELECT DISTINCT JOB FROM EMP;

SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISION, DEPTNO AS DEPARTMENT_NO FROM EMP;

-- 부서 번호(DEPTNO)가 30이고, 직업(JOB)이 'SALESMAN'인 직원들을 조회
SELECT * FROM EMP WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- 사원 번호(EMPNO)가 7499이고, 부서 번호(DEPTNO)가 30인 직원을 조회
SELECT * FROM EMP WHERE EMPNO = 7499 AND DEPTNO = 30;

-- 부서 번호(DEPTNO)가 30이고, 직업(JOB)이 'CLERK'인 직원을 조회
SELECT * FROM EMP WHERE DEPTNO = 30 AND JOB = 'CLERK';

-- 부서 번호(DEPTNO)가 20이거나, 직업(JOB)이 'SALESMAN'인 직원들을 조회
SELECT * FROM EMP WHERE DEPTNO = 20 OR JOB = 'SALESMAN';

SELECT * FROM EMP ORDER BY DEPTNO DESC, ENAME ASC ;

SELECT * FROM EMP WHERE EMPNO = 7782;

SELECT * FROM EMP WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- 부서 번호가 10이고 직업이 'MANAGER'이거나
-- 부서 번호가 20이고 직업이 'CLERK'인 직원을 조회

SELECT * FROM EMP WHERE (DEPTNO=10 AND JOB='MANAGER') OR (DEPTNO=20 AND JOB='CLERK');

-- 부서 번호가 10이거나 20인 직원 중에서
-- 월급이 2000 이상이고 직업이 'SALESMAN'인 직원을 조회

SELECT * FROM EMP
WHERE (DEPTNO = 10 OR DEPTNO = 20)
  AND SAL >= 2000
  AND JOB = 'SALESMAN';
  
  -- 부서 번호가 10 또는 30인 직원 중에서
-- 직업이 'CLERK' 또는 'SALESMAN'이며, 월급이 1500 이상인 직원 조회
SELECT * FROM EMP
WHERE (DEPTNO = 10 OR DEPTNO = 30)
  AND (JOB = 'CLERK' OR JOB = 'SALESMAN')
  AND SAL >= 1500;

-- 부서 번호가 20 또는 30이면서 직업이 'MANAGER'가 아닌 직원 조회
SELECT * FROM EMP
WHERE (DEPTNO = 20 OR DEPTNO = 30)
  AND NOT JOB = 'MANAGER';
  
SELECT * FROM EMP WHERE SAL*12 = 36000;

SELECT * FROM EMP WHERE SAL>=3000;

SELECT * FROM EMP WHERE SAL>=2500 AND JOB='ANALYST';

-- 이름의 첫 문자가 F와 같거나 뒤쪽인 것만 가져옴
SELECT * FROM EMP WHERE ENAME>='F';

-- 문자열을 대소 비교 연산자로 비교하기(비교 문자열이 여러 문자일 때)
SELECT * FROM EMP WHERE ENAME<='FORZ';

SELECT * FROM EMP WHERE SAL!=3000;

SELECT * FROM EMP WHERE SAL <> 3000;

-- 비트연산자 비교
SELECT * FROM EMP WHERE SAL ^ 3000;

SELECT * FROM EMP WHERE NOT SAL = 3000;

-- 직업(JOB)이 'MANAGER', 'SALESMAN', 'CLERK' 중 하나인 직원들을 조회
SELECT * FROM EMP 
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
-- IN

SELECT * FROM EMP WHERE JOB NOT IN('MANAGER','SALESMAN','CLERK');

SELECT * FROM EMP WHERE SAL>=2000 AND SAL<=3000;

SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;


-- S로 시작하는 문자열 찾기
SELECT * FROM EMP WHERE ENAME LIKE 'S%';

-- 두번째에서 S로 시작하는 문자열 찾기
SELECT * FROM EMP WHERE ENAME LIKE '_S%';

-- 이름에 AM이 있는 것만 찾기
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';

-- 이름에 AM이 없는 것만 찾기
SELECT * FROM EMP WHERE ENAME NOT LIKE '%AM%';

-- COMM 컬럼이 NULL과 같은지 비교하는 쿼리
-- 주의: 이 쿼리는 올바르게 동작하지 않음 (NULL은 '=' 비교로 확인할 수 없음)
SELECT * FROM EMP WHERE COMM = NULL;

-- COMM 컬럼이 NULL인지 확인하는 올바른 쿼리
-- IS NULL을 사용하여 COMM 값이 NULL인 행들을 조회
SELECT * FROM EMP WHERE COMM IS NULL;

SELECT * FROM EMP WHERE MGR IS NOT NULL;

SELECT * FROM EMP WHERE SAL>NULL AND COMM IS NULL;

SELECT * FROM EMP WHERE SAL>NULL OR COMM IS NULL;
