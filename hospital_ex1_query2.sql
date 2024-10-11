USE SCOTT;

USE HOSDB;

SELECT * FROM DOCTORS;

SELECT * FROM CHARTS;

USE HOSDB;

SELECT D.*
FROM DOCTORS D
JOIN (SELECT DOC_ID, COUNT(*) AS PATIENT_COUNT
      FROM PATIENTS
      GROUP BY DOC_ID
      HAVING PATIENT_COUNT >= 2) P
ON D.DOC_ID = P.DOC_ID;

SELECT * FROM DOCTORS;

USE HOSPITAL_DB;

SELECT * FROM DOCTORS;



INSERT INTO DOCTORS (
    DOC_ID, MAJOR_TREAT, DOC_NAME, DOC_GEN, DOC_PHONE, DOC_EMAIL, DOC_POSITION
) VALUES
(1, '내과', 'Dr. Kim', 'M', '010-1234-5678', 'kim@hospital.com', '과장'),
(2, '소아과', 'Dr. Lee', 'F', '010-2234-5678', 'lee@hospital.com', '과장'),
(3, '정형외과', 'Dr. Park', 'M', '010-3234-5678', 'park@hospital.com', '부장'),
(4, '내과', 'Dr. Choi', 'F', '010-4234-5678', 'choi@hospital.com', '과장'),
(5, '피부과', 'Dr. Jung', 'M', '010-5234-5678', 'jung@hospital.com', '원장');


INSERT INTO NURSES (
    NUR_ID, NUR_JOB, NUR_NAME, NUR_GEN, NUR_PHONE, NUR_EMAIL, NUR_POSITION
) VALUES
(1, '병동 간호사', 'Nurse Lee', 'F', '010-1111-1111', 'nurselee@hospital.com', '선임간호사'),
(2, '외래 간호사', 'Nurse Kim', 'F', '010-2222-2222', 'nursekim@hospital.com', '간호사'),
(3, '수술 간호사', 'Nurse Park', 'M', '010-3333-3333', 'nursepark@hospital.com', '수간호사'),
(4, '병동 간호사', 'Nurse Choi', 'F', '010-4444-4444', 'nursechoi@hospital.com', '선임간호사'),
(5, '외래 간호사', 'Nurse Jung', 'F', '010-5555-5555', 'nursejung@hospital.com', '간호사');

SELECT * FROM NURSES;

INSERT INTO PATIENTS (
    PAT_ID, NUR_ID, DOC_ID, PAT_NAME, PAT_GEN, PAT_JUMIN, PAT_ADDR, PAT_PHONE, PAT_EMAIL, PAT_JOB
) VALUES
(1, 1, 1, 'Patient A', 'M', '900101-1234567', '서울특별시 강남구', '010-1111-1234', 'patientA@gmail.com', '회사원'),
(2, 2, 2, 'Patient B', 'F', '920202-2345678', '서울특별시 서초구', '010-2222-2345', 'patientB@gmail.com', '교사'),
(3, 3, 3, 'Patient C', 'M', '930303-3456789', '서울특별시 송파구', '010-3333-3456', 'patientC@gmail.com', '의사'),
(4, 4, 4, 'Patient D', 'F', '940404-4567890', '서울특별시 관악구', '010-4444-4567', 'patientD@gmail.com', '변호사'),
(5, 5, 5, 'Patient E', 'M', '950505-5678901', '서울특별시 마포구', '010-5555-5678', 'patientE@gmail.com', '개발자');

SELECT * FROM PATIENTS;

INSERT INTO TREATMENTS (
    TREAT_ID, PAT_ID, DOC_ID, TREAT_CONTENTS, TREAT_DATE
) VALUES
(1, 1, 1, '감기 치료', '2023-04-12'),
(2, 2, 2, '소아 천식 치료', '2023-04-13'),
(3, 3, 3, '골절 수술', '2023-04-14'),
(4, 4, 4, '위염 치료', '2023-04-15'),
(5, 5, 5, '피부 염증 치료', '2023-04-16');

SELECT * FROM TREATMENTS;

INSERT INTO CHARTS (
    CHAT_ID, TREAT_ID, PAT_ID, DOC_ID, NUR_ID, CHAT_CONTENTS
) VALUES
('C001', 1, 1, 1, 1, '환자 A의 차트 기록'),
('C002', 2, 2, 2, 2, '환자 B의 차트 기록'),
('C003', 3, 3, 3, 3, '환자 C의 차트 기록'),
('C004', 4, 4, 4, 4, '환자 D의 차트 기록'),
('C005', 5, 5, 5, 5, '환자 E의 차트 기록');

SELECT * FROM CHARTS;

SELECT D.*
FROM DOCTORS D
JOIN (SELECT DOC_ID, COUNT(*) AS PATIENT_COUNT
      FROM PATIENTS
      GROUP BY DOC_ID
      HAVING PATIENT_COUNT >= 2) P
ON D.DOC_ID = P.DOC_ID;