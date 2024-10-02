USE HOSDB;

CREATE TABLE PATIENTS(
	PAT_ID INT(10),
    NUR_ID INT(10),
	DOC_ID INT(10),
    PAT_NAME VARCHAR(20),
    PAT_GEN CHAR(1),
    PAT_JUMIN VARCHAR(14),
    PAT_ADDR VARCHAR(100),
    PAT_PHONE VARCHAR(15),
    PAT_EMAIL VARCHAR(50),
    PAT_JOB VARCHAR(20)
);

DESC PATIENTS;
SELECT * FROM PATIENTS;

INSERT INTO PATIENTS(
	PAT_ID,
    NUR_ID,
	DOC_ID,
    PAT_NAME,
    PAT_GEN,
    PAT_JUMIN,
    PAT_ADDR,
    PAT_PHONE,
    PAT_EMAIL,
    PAT_JOB
)
VALUES
(1,5,5,'PAT_NAME1','M','961223-1944753','ADDR1','010-2567-4331','ERT754@GMAIL.COM','PAT_JOB1'),
(2,4,3,'PAT_NAME2','M','991323-1567831','ADDR2','010-2317-4341','ERT754@GMAIL.COM','PAT_JOB1'),
(3,3,4,'PAT_NAME3','F','911223-2895678','ADDR3','010-9457-0991','ERT754@GMAIL.COM','PAT_JOB1'),
(4,2,1,'PAT_NAME4','M','941223-1346578','ADDR4','010-3660-0361','ERT754@GMAIL.COM','PAT_JOB1'),
(5,1,2,'PAT_NAME5','M','951223-19S5178','ADDR5','010-1566-8091','ERT754@GMAIL.COM','PAT_JOB1');

DELETE FROM PATIENTS;
-- INSERT INTO PATIENTS(
-- 	PAT_ID,
--     NUR_ID,
-- 	DOC_ID,
--     PAT_NAME,
--     PAT_GEN,
--     PAT_JUMIN,
--     PAT_ADDR,
--     PAT_PHONE,
--     PAT_EMAIL,
--     PAT_JOB
-- )
-- VALUES
-- (1,4,4,'PAT_NAME1','M','961223-1944753','ADDR1','010-2567-4331','ERT754@GMAIL.COM','PAT_JOB1');

DESC PATIENTS;
SELECT * FROM PATIENTS;

CREATE TABLE TREATMENTS(
	TREAT_ID INT(15),
    PAT_ID INT(10),
    DOC_ID INT(10),
    TREAT_CONTENTS VARCHAR(1000),
    TREAT_DATE DATE
);

INSERT INTO TREATMENTS(
	TREAT_ID,
    PAT_ID,
    DOC_ID,
    TREAT_CONTENTS,
    TREAT_DATE
)
VALUES
(1,2,1,'TREAT_CONTENTS1','2023-04-12'),
(2,1,2,'TREAT_CONTENTS2','2023-04-11'),
(3,4,3,'TREAT_CONTENTS3','2023-04-10'),
(4,3,4,'TREAT_CONTENTS4','2023-04-13'),
(5,5,5,'TREAT_CONTENTS5','2023-04-22');

DESC TREATMENTS;
SELECT * FROM TREATMENTS;

CREATE TABLE CHARTS(
	CHAR_ID VARCHAR(20),
    TREAT_ID INT(15),
    PAT_ID INT(10),
    DOC_ID INT(10),
    NUR_ID INT(10),
    CHAT_CONTENTS VARCHAR(1000)
);

INSERT INTO CHARTS(
	CHAR_ID,
    TREAT_ID,
    PAT_ID,
    DOC_ID,
    NUR_ID,
    CHAT_CONTENTS
)
VALUES
(1,1,2,1,4,'CHAT_CONTENTS1'),
(2,2,1,2,5,'CHAT_CONTENTS1'),
(3,3,4,3,3,'CHAT_CONTENTS1'),
(4,4,3,4,2,'CHAT_CONTENTS1'),
(5,5,5,5,1,'CHAT_CONTENTS1');
DESC CHARTS;
SELECT * FROM CHARTS;

CREATE TABLE DOCTORS(
	DOC_ID INT(10),
    MAJOR_TREAT VARCHAR(25),
    DOC_NAME VARCHAR(20),
    DOC_GEN CHAR(1),
    DOC_PHONE VARCHAR(15),
    DOC_EMAIL VARCHAR(50),
    DOC_POSITION VARCHAR(20)
);

INSERT INTO DOCTORS(
	DOC_ID,
	MAJOR_TREAT,
    DOC_NAME,
    DOC_GEN,
    DOC_PHONE,
    DOC_EMAIL,
    DOC_POSITION
)
VALUES
(1,'TREATMENT1','DOC_NAME1','M','010-1294-5678','ASD123@GMAIL.COM','DOC_POSITION1'),
(2,'TREATMENT2','DOC_NAME2','F','010-4234-5648','AQD123@GMAIL.COM','DOC_POSITION2'),
(3,'TREATMENT3','DOC_NAME3','M','010-1334-5678','RSD123@GMAIL.COM','DOC_POSITION3'),
(4,'TREATMENT4','DOC_NAME4','M','010-5234-5378','FSD123@GMAIL.COM','DOC_POSITION4'),
(5,'TREATMENT5','DOC_NAME5','M','010-1236-56Q8','ASJ123@GMAIL.COM','DOC_POSITION5');
-- INSERT INTO DOCTORS(
-- 	DOC_ID,
-- 	MAJOR_TREAT,
--     DOC_NAME,
--     DOC_GEN,
--     DOC_PHONE,
--     DOC_EMAIL,
--     DOC_POSITION
-- )
-- VALUES
-- (6,'TREATMENT6','DOC_NAME6','M','010-2294-6578','AAD123@GMAIL.COM','DOC_POSITION6');

ROLLBACK;
DESC DOCTORS;
SELECT * FROM DOCTORS;


CREATE TABLE NURSES(
	NUR_ID INT(10),
    NUR_JOB VARCHAR(25),
    NUR_NAME VARCHAR(20),
    NUR_GEN CHAR(1),
    NUR_PHONE VARCHAR(15),
    NUR_EMAIL VARCHAR(50),
    NUR_POSITION VARCHAR(20)
);

INSERT INTO NURSES(
	NUR_ID,
    NUR_JOB,
    NUR_NAME,
    NUR_GEN,
    NUR_PHONE,
    NUR_EMAIL,
    NUR_POSITION
)
VALUES
(1,'NUR_JOB1','NUR_NAME1','M','010-3224-5374','ADD123@GMAIL.COM','NUR_POSITION1'),
(2,'NUR_JOB2','NUR_NAME2','F','010-4454-5648','AWE123@GMAIL.COM','NUR_POSITION2'),
(3,'NUR_JOB3','NUR_NAME3','F','010-6733-5678','RSG123@GMAIL.COM','NUR_POSITION3'),
(4,'NUR_JOB4','NUR_NAME4','F','010-5214-5878','ADL123@GMAIL.COM','NUR_POSITION4'),
(5,'NUR_JOB5','NUR_NAME5','F','010-3232-56Q8','RUJ123@GMAIL.COM','NUR_POSITION5');

DESC NURSES;
SELECT * FROM NURSES;

DESC DOCTORS;
DESC NURSES;
DESC PATIENTS;
DESC TREATMENTS;
DESC CHARTS;
SELECT * FROM DOCTORS;
SELECT * FROM NURSES;
SELECT * FROM PATIENTS;
SELECT * FROM TREATMENTS;
SELECT * FROM CHARTS;


-- 의사 소아과로 바꾸기

UPDATE DOCTORS
SET DOC_POSITION='소아과'
WHERE DOC_ID=1;
SET SQL_SAFE_UPDATES=0;
-- 간호사 그만 둠
DELETE FROM NURSES
WHERE NUR_GEN='F';

-- 내과를 오름차순
UPDATE DOCTORS
SET DOC_POSITION='내과'
WHERE DOC_ID=2 OR DOC_ID=3;
SET SQL_SAFE_UPDATES=0;
-- ROLLBACK;
-- COMMIT;

SELECT D.*, T.* 
FROM DOCTORS D, TREATMENTS T
WHERE D.DOC_ID=T.DOC_ID
ORDER BY D.DOC_ID;

-- 환자 수가 2명 이상인 의사의 전체정보를 출력
-- SELECT D.* 
-- FROM DOCTORS D
-- JOIN PATIENTS P 
-- ON D.DOC_ID=P.DOC_ID
-- WHERE(SELECT COUNT(P2.DOC_ID) AS CNT_DOC_ID FROM PATIENTS P2 WHERE P2.DOC_ID IN(1,2,3,4,5)) >=2;


