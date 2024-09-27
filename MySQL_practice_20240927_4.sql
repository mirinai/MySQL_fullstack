USE SCOTT;

-- EQUI JOIN

-- EMP 테이블과 DEPT 테이블을 DEPTNO를 기준으로 등가 조인하여 직원 번호, 이름, 부서 번호, 부서 이름, 위치를 조회
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.DEPTNO;

-- EMP 테이블과 DEPT 테이블을 DEPTNO로 등가 조인한 후, 급여(SAL)가 3000 이상인 직원만 필터링하여 조회
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;

-- NON EQUI JOIN
-- SALGRADE 테이블과 EMP 테이블을 SAL을 기준으로 범위 조건을 사용하여 비등가 조인
SELECT * FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL; -- EQUI JOIN

-- EMP 테이블과 DEPT 테이블을 DEPTNO로 등가 조인하여 전체 직원과 부서 정보를 조회
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.DEPTNO;

-- EMP 테이블과 DEPT 테이블을 DEPTNO로 등가 조인한 후, 급여(SAL)가 3000 이상인 직원만 조회
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;

-- NON EQUI JOIN
-- SALGRADE 테이블과 EMP 테이블을 SAL을 기준으로 범위 조건을 사용하여 비등가 조인
SELECT * FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- 자체 조인

-- EMP 테이블을 두 번 참조하여 직원과 그들의 매니저 정보를 조회. (자기 조인)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2 -- 줄임말을 다르게 하기
WHERE E1.MGR = E2.EMPNO;
-- NULL => 빠짐

-- 외부(OUTER) 조인

-- LEFT OUTER JOIN
-- EMP 테이블의 모든 직원과 해당 직원의 매니저 정보를 LEFT JOIN을 사용하여 조회. 매니저가 없는 경우 NULL로 표시
SELECT 
    E1.EMPNO, 
    E1.ENAME, 
    E1.MGR,
    E2.EMPNO AS MGR_EMPNO,
    E2.ENAME AS MGR_ENAME
FROM 
    EMP E1
LEFT JOIN 
    EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY 
    E1.EMPNO;

-- RIGHT OUTER JOIN
-- EMP 테이블과 DEPT 테이블을 RIGHT JOIN을 사용하여 부서의 모든 정보를 포함하면서 해당 부서에 속한 직원 정보를 조회
SELECT 
    E1.EMPNO, 
    E1.ENAME, 
    E1.MGR,
    E2.EMPNO AS MGR_EMPNO,
    E2.ENAME AS MGR_ENAME
FROM 
    EMP E1
RIGHT JOIN 
    EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY 
    E1.EMPNO;

-- EMP 테이블과 DEPT 테이블을 LEFT JOIN하여 모든 직원과 그들이 속한 부서 정보를 조회. 부서 정보가 없는 직원도 포함
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC
FROM EMP E
LEFT JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY E.EMPNO;

-- EMP 테이블과 DEPT 테이블을 RIGHT JOIN하여 모든 부서와 그 부서에 속한 직원 정보를 조회. 직원 정보가 없는 부서도 포함
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC
FROM EMP E
RIGHT JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY E.EMPNO;

-- EMP 테이블과 DEPT 테이블을 LEFT JOIN과 RIGHT JOIN을 UNION하여 FULL OUTER JOIN과 유사한 결과를 조회
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC
FROM EMP E
LEFT JOIN DEPT D ON E.DEPTNO = D.DEPTNO
UNION
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC
FROM EMP E
RIGHT JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

-- SQL-99 표준 문법으로 배우는 조인

-- NATURAL JOIN

SELECT 
    E.EMPNO,      -- 직원 번호
    E.ENAME,      -- 직원 이름
    E.JOB,        -- 직원 직책
    E.MGR,        -- 매니저 번호
    E.HIREDATE,   -- 직원 입사일
    E.SAL,        -- 직원 급여
    E.COMM,       -- 직원 커미션
    DEPTNO,       -- 부서 번호 (공통 열)
    D.DNAME,      -- 부서 이름
    D.LOC         -- 부서 위치
FROM 
    EMP E 
    NATURAL JOIN DEPT D -- EMP 테이블과 DEPT 테이블을 공통 열(DEPTNO)을 기준으로 자연 조인
ORDER BY 
    DEPTNO,         -- 부서 번호를 기준으로 먼저 정렬
    E.EMPNO;        -- 같은 부서 내에서는 직원 번호 순으로 정렬
    
SELECT 
    E.EMPNO, 
    E.ENAME, 
    E.JOB, 
    E.MGR, 
    E.HIREDATE, 
    E.SAL, 
    E.COMM, 
    D.DEPTNO, 
    D.DNAME, 
    D.LOC
FROM 
    EMP E 
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO -- 명시적 조인 사용
ORDER BY 
    D.DEPTNO, 
    E.EMPNO;
-- ----------------------------------------------------------------------
-- JOIN ~ USING

SELECT 
    E.EMPNO,      -- 직원 번호
    E.ENAME,      -- 직원 이름
    E.JOB,        -- 직원 직책
    E.MGR,        -- 매니저 번호
    E.HIREDATE,   -- 직원 입사일
    E.SAL,        -- 직원 급여
    E.COMM,       -- 직원 커미션
    DEPTNO,       -- 부서 번호 (공통 열)
    D.DNAME,      -- 부서 이름
    D.LOC         -- 부서 위치
FROM 
    EMP E 
    JOIN DEPT D USING(DEPTNO) -- EMP 테이블과 DEPT 테이블을 DEPTNO 열을 기준으로 등가 조인
WHERE 
    SAL >= 3000                -- 급여가 3000 이상인 직원만 필터링
ORDER BY 
    DEPTNO,                    -- 부서 번호를 기준으로 먼저 정렬
    E.EMPNO;                   -- 같은 부서 내에서는 직원 번호 순으로 정렬
    
-- INNER JOIN을 사용한 동일한 결과를 얻는 쿼리

SELECT 
    E.EMPNO,      -- 직원 번호
    E.ENAME,      -- 직원 이름
    E.JOB,        -- 직원 직책
    E.MGR,        -- 매니저 번호
    E.HIREDATE,   -- 직원 입사일
    E.SAL,        -- 직원 급여
    E.COMM,       -- 직원 커미션
    E.DEPTNO,     -- 부서 번호
    D.DNAME,      -- 부서 이름
    D.LOC         -- 부서 위치
FROM 
    EMP E 
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO -- EMP 테이블과 DEPT 테이블을 DEPTNO 열을 기준으로 INNER JOIN
WHERE 
    E.SAL >= 3000                -- 급여가 3000 이상인 직원만 필터링
ORDER BY 
    D.DEPTNO,                    -- 부서 번호를 기준으로 먼저 정렬
    E.EMPNO;                     -- 같은 부서 내에서는 직원 번호 순으로 정렬
--  --------------------------------------------------------------------------------------------
-- JOIN~ON

SELECT 
    E.EMPNO,      -- 직원 번호
    E.ENAME,      -- 직원 이름
    E.JOB,        -- 직원 직책
    E.MGR,        -- 매니저 번호
    E.HIREDATE,   -- 직원 입사일
    E.SAL,        -- 직원 급여
    E.COMM,       -- 직원 커미션
    E.DEPTNO,     -- 부서 번호 (EMP 테이블의 외래 키)
    D.DNAME,      -- 부서 이름 (DEPT 테이블)
    D.LOC         -- 부서 위치 (DEPT 테이블)
FROM 
    EMP E 
    JOIN DEPT D ON (E.DEPTNO = D.DEPTNO) -- EMP 테이블과 DEPT 테이블을 DEPTNO 열을 기준으로 INNER JOIN
WHERE 
    SAL <= 3000                        -- 급여가 3000 이하인 직원만 필터링
ORDER BY 
    E.DEPTNO,                          -- 부서 번호를 기준으로 먼저 정렬
    EMPNO;                             -- 같은 부서 내에서는 직원 번호 순으로 정렬


-- -------------------------------------------------------------------------------
-- OUTER JOIN

-- OUTER LEFT JOIN
SELECT 
    E1.EMPNO,               -- 직원 번호
    E1.ENAME,               -- 직원 이름
    E1.MGR,                 -- 매니저 번호
    E2.EMPNO AS MGR_EMPNO,  -- 매니저의 직원 번호
    E2.ENAME AS MGR_ENAME   -- 매니저의 이름
FROM 
    EMP E1 
    LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)  -- EMP 테이블을 자기 자신과 매니저 번호를 기준으로 LEFT OUTER JOIN
ORDER BY 
    E1.EMPNO;               -- 직원 번호 순으로 정렬

-- OUTER RIGHT JOIN
SELECT 
    E1.EMPNO,               -- 직원 번호
    E1.ENAME,               -- 직원 이름
    E1.MGR,                 -- 매니저 번호
    E2.EMPNO AS MGR_EMPNO,  -- 매니저의 직원 번호
    E2.ENAME AS MGR_ENAME   -- 매니저의 이름
FROM 
    EMP E1 
    RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) -- EMP 테이블을 자기 자신과 매니저 번호를 기준으로 RIGHT OUTER JOIN
ORDER BY 
    E1.EMPNO,               -- 직원 번호 순으로 먼저 정렬
    MGR_EMPNO;              -- 매니저 직원 번호 순으로 정렬

-- FULL OUTER JOIN
-- SELECT E1.EMPNO, E1.ENAME, E1.MGR,
-- E2.EMPNO AS MGR_EMPNO,
-- E2.ENAME AS MGR_ENAME
-- FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR=E2.EMPNO)
-- ORDER BY E1.EMPNO;
-- FULL OUTER JOIN 유사 구현 (MySQL)

SELECT 
    E1.EMPNO, 
    E1.ENAME, 
    E1.MGR,
    E2.EMPNO AS MGR_EMPNO,
    E2.ENAME AS MGR_ENAME
FROM 
    EMP E1
LEFT JOIN 
    EMP E2 ON E1.MGR = E2.EMPNO

UNION

SELECT 
    E1.EMPNO, 
    E1.ENAME, 
    E1.MGR,
    E2.EMPNO AS MGR_EMPNO,
    E2.ENAME AS MGR_ENAME
FROM 
    EMP E1
RIGHT JOIN 
    EMP E2 ON E1.MGR = E2.EMPNO

ORDER BY 
    EMPNO;

SELECT 
    E.EMPNO,      -- 직원 번호
    E.ENAME,      -- 직원 이름
    E.JOB,        -- 직원 직책
    E.MGR,        -- 매니저 번호
    E.HIREDATE,   -- 직원 입사일
    E.SAL,        -- 직원 급여
    E.COMM,       -- 직원 커미션
    D.DEPTNO,     -- 부서 번호
    D.DNAME,      -- 부서 이름
    D.LOC         -- 부서 위치
FROM 
    EMP E 
    JOIN DEPT D USING(DEPTNO) -- EMP 테이블과 DEPT 테이블을 DEPTNO 열을 기준으로 등가 조인
WHERE 
    SAL >= 3000                -- 급여가 3000 이상인 직원만 필터링
    AND E.MGR IS NOT NULL      -- 매니저가 있는 직원만 필터링
ORDER BY 
    D.DEPTNO,                  -- 부서 번호 기준으로 먼저 정렬
    E.EMPNO;                   -- 같은 부서 내에서는 직원 번호 순으로 정렬