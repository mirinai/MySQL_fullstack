use scott;

CREATE TABLE member (
    name VARCHAR(10),
    userid VARCHAR(10) PRIMARY KEY,
    pwd VARCHAR(10),
    email VARCHAR(20),
    phone CHAR(13),
    admin INT(1) DEFAULT 0
);

DESC MEMBER;

INSERT INTO MEMBER(NAME, USERID, PWD, EMAIL, PHONE, ADMIN)
VALUES('이소미','somi','1234','gmd@naver.com','010-2362-5157',0),
('하상오','sang12','1234','ha12@naver.com','010-5629-8888',1),
('김윤승','light','1234','youn1004@naver.com','010-9999-8282',0);

SELECT * FROM MEMBER;

UPDATE MEMBER
SET EMAIL="irina1234@gmail.com"
where userid = "irina123";


COMMIT;