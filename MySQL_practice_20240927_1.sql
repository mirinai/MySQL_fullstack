USE SCOTT;

-- Q1
SELECT * FROM EMP WHERE ENAME LIKE '%S';

-- Q2
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE JOB='SALESMAN' AND DEPTNO=30;

-- Q3
-- -- 집합연산자를 안 쓰기
-- SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE SAL>2000 AND (DEPTNO=20 OR DEPTNO=30);
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE SAL>2000 AND DEPTNO IN(20, 30);
-- -- 집합연산자를 쓰기
-- -- 부서 번호가 20 또는 30인 사원 중에서 월급이 2000 이상인 사원을 조회 (집합 연산자 사용)
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20 AND SAL > 2000;

-- Q4
SELECT * FROM EMP WHERE (SAL >= 2000 AND SAL <= 3000);
SELECT * FROM EMP WHERE NOT SAL BETWEEN 2000 AND 3000;
-- Q5
-- SELECT ENAME,EMPNO, SAL, DEPTNO FROM EMP WHERE (SAL NOT BETWEEN 1000 AND 2000) AND ENAME LIKE '%E%' AND DEPTNO=30
-- UNION
-- SELECT ENAME,EMPNO, SAL, DEPTNO FROM EMP WHERE (SAL NOT BETWEEN 1000 AND 2000) AND DEPTNO=30;

-- -- 부서 번호가 30이고, 월급이 1000과 2000 사이가 아니면서, 이름에 'E'가 포함되거나 이름 조건 없이 모두 조회
SELECT ENAME,EMPNO, SAL, DEPTNO 
FROM EMP 
WHERE SAL NOT BETWEEN 1000 AND 2000
  AND DEPTNO = 30
  AND ENAME LIKE '%E%';

-- Q6
SELECT * FROM EMP WHERE COMM IS NULL AND MGR IS NOT NULL AND (JOB='MANAGER' OR JOB='CLERK') AND ENAME NOT LIKE '_L%';


