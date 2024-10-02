USE SCOTT;

COMMIT;
--- 12-1: EMP 테이블의 모든 데이터를 조회
SELECT * FROM EMP;

-- DICT 테이블의 모든 데이터를 조회 (사전 테이블)
SELECT * FROM DICT;

-- 현재 사용자 소유의 테이블 목록을 조회
SELECT TABLE_NAME FROM USER_TABLES;

-- EMP_DDL 테이블을 생성, 필드와 데이터 타입 정의
CREATE TABLE EMP_DDL(
	EMPNO	INT(4),          -- 직원 번호, 4자리 정수
    ENAME	VARCHAR(10),     -- 직원 이름, 최대 10자
    JOB		VARCHAR(9),      -- 직무, 최대 9자
    MGR		INT(4),          -- 관리자 번호, 4자리 정수
    HIREDATE DATE,           -- 고용 날짜
    SAL		DECIMAL(7,2),    -- 급여, 소수점 이하 2자리
    COMM	DECIMAL(7,2),    -- 커미션, 소수점 이하 2자리
    DEPTNO	INT(2)           -- 부서 번호, 2자리 정수
);

-- EMP_DDL 테이블에서 EMPNO 필드의 데이터 타입을 INT로 수정
ALTER TABLE EMP_DDL
MODIFY EMPNO INT;

-- EMP_DDL 테이블에서 MGR 필드의 데이터 타입을 INT로 수정
ALTER TABLE EMP_DDL
MODIFY MGR INT;

-- EMP_DDL 테이블에서 DEPTNO 필드의 데이터 타입을 INT로 수정
ALTER TABLE EMP_DDL
MODIFY DEPTNO INT;

-- EMP_DDL 테이블에서 SAL 필드의 데이터 타입을 DOUBLE로 수정
ALTER TABLE EMP_DDL
MODIFY SAL DOUBLE;

-- EMP_DDL 테이블에서 COMM 필드의 데이터 타입을 DOUBLE로 수정
ALTER TABLE EMP_DDL
MODIFY COMM DOUBLE;

-- EMP_DDL 테이블에서 HIREDATE 필드의 데이터 타입을 DATETIME으로 수정
ALTER TABLE EMP_DDL
MODIFY HIREDATE DATETIME;

-- EMP_DDL 테이블에서 EMPNO 필드에 NOT NULL 및 PRIMARY KEY 제약 조건 추가
ALTER TABLE EMP_DDL
MODIFY EMPNO INT NOT NULL PRIMARY KEY;

-- EMP_DDL 테이블 구조 조회
DESC EMP_DDL;

-- EMP 테이블 구조 조회
DESC EMP;

-- DEPT 테이블을 복사하여 DEPT_DDL 테이블 생성
CREATE TABLE DEPT_DDL
AS SELECT * FROM DEPT;

-- DEPT_DDL 테이블 구조 조회
DESC DEPT_DDL;

-- DEPT_DDL 테이블의 모든 데이터 조회
SELECT * FROM DEPT_DDL;

-- EMP 테이블에서 DEPTNO가 30인 데이터만 복사하여 EMP_DDL_30 테이블 생성
CREATE TABLE EMP_DDL_30
AS SELECT * FROM EMP
WHERE DEPTNO=30;

-- EMP_DDL_30 테이블의 모든 데이터 조회
SELECT * FROM EMP_DDL_30;

-- 빈 EMPDEPT_DDL 테이블 생성 (EMP와 DEPT 테이블의 컬럼을 조인하여 생성)
CREATE TABLE EMPDEPT_DDL
AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE 1<>1;

-- EMPDEPT_DDL 테이블의 모든 데이터 조회 (현재 빈 테이블)
SELECT * FROM EMPDEPT_DDL;

