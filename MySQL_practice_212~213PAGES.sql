-- 212~213P.

USE SCOTT;
-- Q1
SELECT DEPTNO, FLOOR(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_AVG, MIN(SAL) AS MIN_AVG 
FROM EMP 
GROUP BY DEPTNO
ORDER BY DEPTNO DESC;

-- Q2
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*)>=3;

-- Q3 
SELECT YEAR(E1.HIREDATE) AS HIRE_YEAR, E1.DEPTNO, COUNT(YEAR(E1.HIREDATE)) AS CNT
FROM EMP E1
JOIN EMP E2 ON E1.DEPTNO=E2.DEPTNO
GROUP BY YEAR(E1.HIREDATE), DEPTNO;
