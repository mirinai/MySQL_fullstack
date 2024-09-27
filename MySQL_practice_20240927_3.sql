USE SCOTT;
-- 사원의 급여 합계를 조회
SELECT SUM(SAL) FROM EMP;

-- 리턴하는 튜플의 수가 달라서 안됨
-- SELECT ENAME, SUM(SAL) FROM EMP;

-- SAL의 중복 값을 제외한 합계, 모든 SAL의 합계, SAL의 합계를 조회
SELECT SUM(DISTINCT SAL) AS sum_distinct_sal,
       SUM(ALL SAL) AS sum_all_sal,
       SUM(SAL) AS sum_sal
FROM EMP;

-- EMP 테이블의 총 행 수를 조회
SELECT COUNT(*) AS total_employees FROM EMP;

-- DEPTNO가 30인 부서의 사원 수를 조회
SELECT COUNT(*) AS dept30_employee_count FROM EMP
WHERE DEPTNO = 30;

-- SAL의 중복 값을 제외한 개수, 모든 SAL의 개수, SAL의 개수를 조회
SELECT COUNT(DISTINCT SAL) AS count_distinct_sal,
       COUNT(ALL SAL) AS count_all_sal,
       COUNT(SAL) AS count_sal
FROM EMP;

-- COMM 컬럼의 NULL이 아닌 값의 개수를 조회
SELECT COUNT(COMM) AS count_comm FROM EMP;

-- COMM 컬럼에서 NULL이 아닌 값의 개수를 조회
SELECT COUNT(COMM) AS count_comm_non_null FROM EMP
WHERE COMM IS NOT NULL;

-- DEPTNO가 10인 부서의 최대 급여를 조회
SELECT MAX(SAL) AS max_sal_dept10
FROM EMP
WHERE DEPTNO = 10;

-- DEPTNO가 10인 부서의 최소 급여를 조회
SELECT MIN(SAL) AS min_sal_dept10
FROM EMP
WHERE DEPTNO = 10;

-- DEPTNO가 20인 부서의 가장 최근 입사일을 조회
SELECT MAX(HIREDATE) AS latest_hiredate_dept20
FROM EMP
WHERE DEPTNO = 20;

-- DEPTNO가 20인 부서의 가장 이른 입사일을 조회
SELECT MIN(HIREDATE) AS earliest_hiredate_dept20
FROM EMP
WHERE DEPTNO = 20;

-- DEPTNO가 30인 부서의 평균 급여를 조회
SELECT AVG(SAL) AS avg_sal_dept30 FROM EMP
WHERE DEPTNO = 30;

-- DEPTNO가 30인 부서의 SAL 중 중복을 제외한 평균을 조회
SELECT AVG(DISTINCT SAL) AS avg_distinct_sal_dept30 FROM EMP
WHERE DEPTNO = 30;

-- DEPTNO별 평균 급여를 UNION ALL로 합쳐서 조회
SELECT AVG(SAL) AS avg_sal_dept10 FROM EMP WHERE DEPTNO = 10
UNION ALL 
SELECT AVG(SAL) AS avg_sal_dept20 FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL) AS avg_sal_dept30 FROM EMP WHERE DEPTNO = 30;

-- 각 부서별 평균 급여를 조회
SELECT AVG(SAL) AS avg_sal, DEPTNO
FROM EMP
GROUP BY DEPTNO;

-- 부서번호와 직책별 평균 급여를 조회하고 정렬
SELECT DEPTNO, JOB, AVG(SAL) AS avg_sal
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- SELECT ENAME, DEPTNO, AVG(SAL)
-- FROM EMP
-- GROUP BY DEPTNO;

-- HAVING 절을 사용하여 평균 급여가 2000 이상인 부서번호와 직책별 평균 급여를 조회
SELECT DEPTNO, JOB, AVG(SAL) AS avg_sal
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- SELECT DEPTNO, JOB, AVG(SAL)
-- FROM EMP
-- WHERE AVG(SAL)>=2000
-- GROUP BY DEPTNO, JOB
-- ORDER BY DEPTNO, JOB;

-- HAVING 절에 조건 없이 평균 급여를 조회 (올바르지 않음)
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL)>2000
ORDER BY DEPTNO, JOB;

-- SAL이 3000 이하인 사원을 필터링한 후, 부서번호와 직책별 평균 급여를 조회
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000 -- 이게 먼저 실행됨
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- SAL이 3000 이하인 사원들의 부서번호, 직책, SAL을 조회하고 정렬
SELECT DEPTNO, JOB, SAL FROM EMP
WHERE SAL <= 3000
ORDER BY DEPTNO, JOB;

-- GROUP BY를 사용하여 부서 번호별 평균 추가수당을 조회
-- group by 사용해서 부서 번호별 평균 추가수당을 출력해라
SELECT AVG(COMM) AS avg_comm, DEPTNO 
FROM EMP
GROUP BY DEPTNO;

-- HAVING 절을 사용하여 부서별 직책의 평균 급여가 500 이상인 사원들의 부서번호, 직책, 평균 급여를 조회
-- having절 사용해서 emp 테이블의 부서별 직책의 평균급여가 500이상인 사원들의 부서번호,직책,부서별직책의 평균급여를 출력해라
SELECT 
    DEPTNO AS department_number, 
    JOB AS job, 
    AVG(SAL) AS avg_salary
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;

