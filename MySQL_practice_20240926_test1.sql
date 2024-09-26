USE SCOTT;
/*
comm의 값이 null인 사원들의 전체 정보를 보여줘
*/
SELECT * FROM EMP WHERE COMM IS NULL;
/*급여가 2000~3000인 사원들의 전제 정보를 보여줘*/
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

-- 사원의 이름이 S로 시작하는 사원들의 전체 정보를 보여줘
SELECT * FROM EMP WHERE ENAME LIKE 'S%';

-- job이 manager,salesman인 사원들의 전체 정보를 보여줘
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN';

-- 급여가 3000이상인 사원들의 전체 정보를 보여줘
SELECT * FROM EMP WHERE SAL>=3000;

-- 집합 연산자
-- 부서 번호(DEPTNO)가 10이거나 20인 사원들을 조회
-- 중복된 행은 제거됨 (기본적으로 UNION은 중복을 제거함)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=20;

-- 부서 번호(DEPTNO)가 10이거나 20인 사원들을 조회
-- 중복된 행도 포함하여 반환 (UNION ALL은 중복을 제거하지 않음)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=20;

-- 부서 번호(DEPTNO)가 10인 사원을 제외한 모든 사원들을 조회
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE EMPNO NOT IN (
    -- 부서 번호가 10인 사원들의 EMPNO만 선택
    SELECT EMPNO
    FROM EMP
    WHERE DEPTNO = 10
);

-- 부서 번호(DEPTNO)가 10인 사원들과 일치하는 데이터를 INNER JOIN을 사용하여 조회
-- 두 SELECT 문에서 동일한 EMPNO, ENAME, SAL, DEPTNO 값을 가지는 행들만 반환
SELECT e1.EMPNO, e1.ENAME, e1.SAL, e1.DEPTNO
FROM EMP e1
INNER JOIN (
    SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
) e2 ON e1.EMPNO = e2.EMPNO
  AND e1.ENAME = e2.ENAME
  AND e1.SAL = e2.SAL
  AND e1.DEPTNO = e2.DEPTNO;

SELECT * FROM EMP WHERE ENAME LIKE '%S';

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE JOB='SALESMAN';

-- 집합연산자를 안 쓰기
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE SAL>2000 AND (DEPTNO=20 OR DEPTNO=30);

-- 집합연산자를 쓰기
-- 부서 번호가 20 또는 30인 사원 중에서 월급이 2000 이상인 사원을 조회 (집합 연산자 사용)


SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20 AND SAL > 2000;

SELECT * FROM EMP WHERE NOT (SAL >= 2000 AND SAL <= 3000);

SELECT ENAME,EMPNO, SAL, DEPTNO FROM EMP WHERE (SAL NOT BETWEEN 1000 AND 2000) AND ENAME LIKE '%E%' AND DEPTNO=30
UNION
SELECT ENAME,EMPNO, SAL, DEPTNO FROM EMP WHERE (SAL NOT BETWEEN 1000 AND 2000) AND DEPTNO=30;

-- 부서 번호가 30이고, 월급이 1000과 2000 사이가 아니면서, 이름에 'E'가 포함되거나 이름 조건 없이 모두 조회
SELECT ENAME,EMPNO, SAL, DEPTNO 
FROM EMP 
WHERE SAL NOT BETWEEN 1000 AND 2000
  AND DEPTNO = 30
  AND ENAME LIKE '%E%';

SELECT * FROM EMP WHERE COMM IS NULL AND MGR IS NOT NULL AND (JOB='MANAGER' OR JOB='CLERK') AND ENAME NOT LIKE '_L%';

