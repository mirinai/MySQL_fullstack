USE SCOTT;
-- 1. 추가수당이 존재하지 않고, 상급자가 있으며, 직책이 MANAGER 또는 CLERK인 사원 중에서
-- 사원 이름의 두 번째 글자가 'L'이 아닌 사원의 정보를 출력
SELECT * 
FROM EMP
WHERE COMM IS NULL -- 추가수당(COMM)이 없는 사원
  AND MGR IS NOT NULL -- 상급자(MGR)가 있는 사원
  AND JOB IN ('MANAGER', 'CLERK') -- 직책이 MANAGER 또는 CLERK인 사원
  AND ENAME NOT LIKE '_L%'; -- 사원 이름의 두 번째 글자가 'L'이 아닌 사원

-- 2. 부서번호 20번인 사원 중, 입사일이 가장 오래된 사원의 입사일 출력
SELECT MIN(HIREDATE) -- 가장 오래된 입사일을 찾기 위해 MIN 함수 사용
FROM EMP
WHERE DEPTNO = 20; -- 부서번호가 20번인 사원들 중에서

-- 3. 부서번호 및 직책별 평균 급여를 출력하는데, 부서번호 및 직책별로 오름차순 정렬하기
SELECT DEPTNO, JOB, AVG(SAL) AS AVG_SAL -- 부서번호와 직책별 평균 급여 계산
FROM EMP
GROUP BY DEPTNO, JOB -- 부서번호와 직책별로 그룹화
ORDER BY DEPTNO, JOB; -- 부서번호 및 직책별로 오름차순 정렬

-- 4. 급여가 3000 이하인 사원들 중에서 부서번호 및 직책별 평균 급여를 계산
-- 단, 평균급여가 2000 이상인 경우만 출력하고 부서번호 및 직책별로 오름차순 정렬
SELECT DEPTNO, JOB, AVG(SAL) AS AVG_SAL -- 부서번호와 직책별 평균 급여 계산
FROM EMP
WHERE SAL <= 3000 -- 급여가 3000 이하인 사원들만 선택
GROUP BY DEPTNO, JOB -- 부서번호와 직책별로 그룹화
HAVING AVG(SAL) >= 2000 -- 평균 급여가 2000 이상인 경우만 선택
ORDER BY DEPTNO, JOB; -- 부서번호 및 직책별로 오름차순 정렬

-- 5. 전체 사원번호와 사원이름, 상급자 사원번호와 상급자 이름을 출력
-- (상급자가 없는 경우는 사원번호와 사원이름만 출력)
SELECT E.EMPNO, E.ENAME, -- 사원의 사원번호와 이름
       M.EMPNO AS MGR_EMPNO, M.ENAME AS MGR_ENAME -- 상급자의 사원번호와 이름 (상급자가 없으면 NULL)
FROM EMP E
LEFT JOIN EMP M ON E.MGR = M.EMPNO -- 사원의 MGR(상급자 사원번호)와 상급자의 EMPNO를 매칭
ORDER BY E.EMPNO; -- 사원번호 기준으로 정렬

-- 6. 용어와 설명 연결
-- ㄱ. 릴레이션 - C. 테이블
-- ㄴ. 튜플 - B. 행
-- ㄷ. 애트리뷰트 - A. 속성
-- ㄹ. 차수 - D. 테이블의 열

-- 7. PRIMARY KEY(PK)에 대한 설명
-- PRIMARY KEY는 테이블 내에서 각 튜플을 고유하게 식별할 수 있는 속성 또는 속성들의 집합입니다.
-- 주요 특징:
-- 1. 유일성: PRIMARY KEY는 테이블 내에서 유일해야 합니다. 즉, 중복된 값을 가질 수 없습니다.
-- 2. NOT NULL: PRIMARY KEY로 지정된 열은 NULL 값을 가질 수 없습니다.
-- 3. 단일성: 테이블당 하나의 PRIMARY KEY만 존재할 수 있습니다.
-- 4. 인덱스: PRIMARY KEY는 자동으로 인덱스가 생성되어 검색 성능을 향상시킵니다.
-- PRIMARY KEY는 데이터의 무결성을 유지하고, 테이블 간의 관계를 설정하는 데 중요한 역할을 합니다.


