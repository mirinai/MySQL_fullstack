USE SCOTT;

-- 전체 부서코드와 부서명을 알려줘
SELECT DNAME, DEPTNO FROM DEPT;

-- 직업이 manager이고, 20번 부서인 사원정보 알려줘
SELECT * FROM EMP WHERE JOB='MANAGER' AND DEPTNO=20;

-- 이름의 두번째 글자가 L인 사원정보를 부서번호로 내림차순 정렬해서 보여줘
SELECT * FROM EMP WHERE ENAME LIKE '_L%' ORDER BY DEPTNO DESC;

-- 부서정보가 30,20인 사원들의 아래정보만 보여줘.출력이름은 한글로 나오게 해주렴
-- (empno:사원번호,ename:사원명,job:직업,deptno:부서번호)
SELECT EMPNO AS 사원번호, ENAME AS 사원명, JOB AS 직업, DEPTNO AS 부서번호 FROM EMP WHERE DEPTNO IN(20,30);

-- 외래키에 대해서 설명해줘
-- 다른 테이블의 기본키를 레퍼런스로 둔 키

-- 성별이라는 컬럼에서 가질수 있는 데이터의 값에 대한 리스트를 일컫는 명칭은?(ex 남,여)
-- 어트리뷰트 또는 필드