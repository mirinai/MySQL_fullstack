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


