USE SCOTT;

-- 사원의 이름을 대소문자 구분 없이 'SCOTT'과 일치하는 사원 정보를 조회
SELECT * FROM EMP  WHERE UPPER(ENAME) = UPPER('scott');

-- 사원의 이름에 'scott'이 포함된 경우를 대소문자 구분 없이 조회 (현재 주석 처리됨)
-- SELECT * FROM EMP  WHERE UPPER(ENAME) = UPPER('%scott%');

-- 사원의 이름과 이름의 길이를 조회
SELECT ENAME, LENGTH(ENAME) FROM EMP;

-- 사원의 이름과 이름의 길이가 5 이상인 사원의 정보를 조회
SELECT ENAME, LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME) >=5;

-- '한글'의 문자 길이와 바이트 길이를 조회
SELECT CHAR_LENGTH('한글') AS char_length, LENGTH('한글') AS byte_length;

-- 사원의 직책과 직책의 일부 문자열을 조회
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,1,2), SUBSTR(JOB,5) FROM EMP;

-- 사원의 직책과 직책의 특정 부분을 음수 인덱스를 사용하여 조회
SELECT JOB, 
    SUBSTR(JOB, -LENGTH(JOB)),
    SUBSTR(JOB, -LENGTH(JOB),2),
    SUBSTR(JOB, -3)
FROM EMP;

-- 문자열 'HELLO, MYSQL'에서 'L'의 위치를 찾는 함수들
SELECT INSTR('HELLO, MYSQL', 'L') AS INSTR_1,            -- 첫 번째 'L'의 위치
       LOCATE('L', 'HELLO, MYSQL', 5) AS INSTR_2,        -- 5번째 문자부터 'L'을 검색
       LOCATE('L', 'HELLO, MYSQL', 2) AS INSTR_3;        -- 2번째 문자부터 'L'을 검색

-- ENAME에 'S'가 포함된 사원 정보 조회
SELECT * FROM EMP WHERE INSTR(ENAME, 'S') >0;

-- ENAME에 'S'가 포함된 사원 정보 조회 (LIKE 사용)
SELECT * FROM EMP WHERE ENAME LIKE '%S%';

-- 전화번호 문자열에서 '-'를 공백이나 제거한 형태로 변환
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-',' ') AS REPLACE_1,       -- '-'를 공백으로 대체
    REPLACE('010-1234-5678','-','') AS REPLACE_2;         -- '-'를 제거

-- 'MYSQL'을 다양한 방식으로 패딩하여 출력
SELECT 'MYSQL',
       LPAD('MYSQL', 10, '#') AS LPAD_1,  -- 'MYSQL'을 10자로 채우고, 앞에 '#'으로 패딩
       RPAD('MYSQL', 10, '*') AS RPAD_1,  -- 'MYSQL'을 10자로 채우고, 뒤에 '*'으로 패딩
       LPAD('MYSQL', 10, ' ') AS LPAD_2,  -- 'MYSQL'을 10자로 채우고, 앞에 공백으로 패딩
       RPAD('MYSQL', 10, ' ') AS RPAD_2;  -- 'MYSQL'을 10자로 채우고, 뒤에 공백으로 패딩

-- 특정 문자열을 '*'로 패딩하여 지정된 길이로 맞춤
SELECT
    RPAD('971225-',14,'*') AS RPAD_JMNO,        -- '971225-'를 14자로 채우고, 뒤에 '*'으로 패딩
    RPAD('010-1234-', 13, '*') AS RPAD_PHONE;   -- '010-1234-'를 13자로 채우고, 뒤에 '*'으로 패딩

-- EMPNO와 ENAME을 CONCAT 함수를 사용하여 연결
SELECT CONCAT(EMPNO, ENAME) AS CONCAT_EMPNO_ENAME, 
       CONCAT(EMPNO, CONCAT(" : ",ENAME)) AS CONCAT_WITH_COLON
FROM EMP
WHERE ENAME="SCOTT";

-- EMPNO와 ENAME을 || 연산자로 연결 (MySQL에서는 CONCAT 함수 사용 권장)
SELECT EMPNO || ENAME AS CONCAT_EMPNO_ENAME,
       EMPNO || ' : ' || ENAME AS CONCAT_WITH_COLON
FROM EMP
WHERE ENAME="SCOTT";

-- TRIM 함수를 사용하여 문자열의 양쪽, 앞, 뒤의 공백을 제거하고 대괄호로 감쌈
SELECT CONCAT('[', TRIM('_ _MYSQL_ _'), ']') AS TRIM,
       CONCAT('[', TRIM(LEADING FROM '_ _MYSQL_ _'), ']') AS TRIM_LEADING,
       CONCAT('[', TRIM(TRAILING FROM '_ _MYSQL_ _'), ']') AS TRIM_TRAILING,
       CONCAT('[', TRIM(BOTH FROM '_ _MYSQL_ _'), ']') AS TRIM_BOTH;

-- TRIM 함수를 사용하여 '_' 문자를 제거하고 대괄호로 감쌈
SELECT CONCAT('[', TRIM('_' FROM '_ _MYSQL_ _'), ']') AS TRIM,
       CONCAT('[', TRIM(LEADING '_' FROM '_ _MYSQL_ _'), ']') AS TRIM_LEADING,
       CONCAT('[', TRIM(TRAILING '_' FROM '_ _MYSQL_ _'), ']') AS TRIM_TRAILING,
       CONCAT('[', TRIM(BOTH '_' FROM '_ _MYSQL_ _'), ']') AS TRIM_BOTH;

-- 문자열의 왼쪽과 오른쪽의 공백을 제거하고 대괄호로 감쌈
SELECT 
    CONCAT('[', LTRIM('   MYSQL   '), ']') AS LTRIM_EXAMPLE,    -- 왼쪽 공백 제거
    CONCAT('[', RTRIM('   MYSQL   '), ']') AS RTRIM_EXAMPLE;    -- 오른쪽 공백 제거

-- 다양한 TRIM 함수를 사용하여 문자열의 특정 부분을 제거하고 대괄호로 감쌈
SELECT 
    CONCAT('[', TRIM(LEADING '# ' FROM '# # # MYSQL # #'), ']') AS LTRIM_EXAMPLE,          -- 왼쪽에서 '# ' 제거
    CONCAT('[', TRIM(TRAILING ' *' FROM '* * * MYSQL * * *'), ']') AS RTRIM_EXAMPLE,     -- 오른쪽에서 ' *' 제거
    CONCAT('[', TRIM(BOTH ' ' FROM '   LEFT AND RIGHT TRIM   '), ']') AS BOTH_TRIM_EXAMPLE, -- 양쪽 공백 제거
    CONCAT(
        '[',
        TRIM(LEADING '#' FROM '###MySQL###***'),    -- 왼쪽에서 '#' 제거
        TRIM(TRAILING '*' FROM '###MySQL###***'),   -- 오른쪽에서 '*' 제거
        ']'
    ) AS COMPLEX_TRIM_EXAMPLE;                      -- 복합적인 트림 적용

-- 다양한 ROUND 함수를 사용하여 숫자를 반올림
SELECT ROUND(1234.5678) AS ROUND,          -- 소수점 이하를 반올림하여 정수로 반환
       ROUND(1234.5678, 0) AS ROUND_0,    -- 소수점 이하 0자리로 반올림
       ROUND(1234.5678, 1) AS ROUND_1,    -- 소수점 이하 1자리로 반올림
       ROUND(1234.5678, 2) AS ROUND_2,    -- 소수점 이하 2자리로 반올림
       ROUND(1234.5678, -1) AS ROUND_MINUS1, -- 소수점 왼쪽으로 1자리에서 반올림
       ROUND(1234.5678, -2) AS ROUND_MINUS2; -- 소수점 왼쪽으로 2자리에서 반올림

-- 다양한 TRUNCATE 함수를 사용하여 숫자를 자름
SELECT 
    TRUNCATE(1234.5678, 2) AS ROUND_2,       -- 소수점 이하 2자리까지 자름
    TRUNCATE(1234.5678, 0) AS ROUND_0,       -- 소수점 이하를 모두 제거하여 정수로 만듦
    TRUNCATE(1234.5678, -1) AS ROUND_MINUS1, -- 소수점 왼쪽으로 1자리에서 자름
    TRUNCATE(1234.5678, -2) AS ROUND_MINUS2; -- 소수점 왼쪽으로 2자리에서 자름

-- 다양한 TRUNCATE 함수를 사용하여 숫자를 자름
SELECT TRUNCATE(1234.5678, 0) AS ROUND_0,        -- 소수점 이하를 모두 제거하여 정수로 만듦
       TRUNCATE(1234.5678, 1) AS ROUND_1,        -- 소수점 이하 1자리까지 자름
       TRUNCATE(1234.5678, 2) AS ROUND_2,        -- 소수점 이하 2자리까지 자름
       TRUNCATE(1234.5678, -1) AS ROUND_MINUS1, -- 소수점 왼쪽으로 1자리에서 자름
       TRUNCATE(1234.5678, -2) AS ROUND_MINUS2; -- 소수점 왼쪽으로 2자리에서 자름


SELECT CEIL(3.14),
FLOOR(3.14),
CEIL(-3.14),
FLOOR(-3.14);

SELECT MOD(15, 6),
MOD(10,2),
MOD(11,2);

SELECT SYSDATE() AS NOW,
DATE_SUB(sysdate(),interval 1 DAY) AS YESTERDAY,
DATE_ADD(SYSDATE(),INTERVAL 1 DAY) AS TOMORROW;

SELECT NOW() AS NOW,
NOW()-INTERVAL 1 DAY AS YESTERDAY,
NOW()+INTERVAL 1 DAY AS TOMORROW; 

SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS formatted_now;
SELECT DATE_FORMAT(NOW(), '%m-%d-%Y %H:%i:%s') AS formatted_now;

SELECT DATE_FORMAT(NOW()-INTERVAL 1 DAY, '%Y-%m-%d | %H:%i:%s') AS formatted_NOWMINUS1;
SELECT DATE_FORMAT(NOW()+INTERVAL 1 DAY, '%Y-%m-%d | %H:%i:%s') AS formatted_NOWMINUS1;

SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH) AS next_month,
       DATE_SUB(NOW(), INTERVAL 1 MONTH) AS last_month;

SELECT sysdate(), addtime(SYSDATE(),INTERVAL 1);


/*
date_format()
to_number()
str_to_date()
*/

