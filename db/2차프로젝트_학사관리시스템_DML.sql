# 전공 추가
INSERT INTO MAJOR VALUES(123, '컴퓨터공학과'), (145, '기계공학과'), (167, '화학공학'), (700, '교양');

# 회원 추가 - 관리자
INSERT INTO MEMBER(ME_ID, ME_NAME, ME_EMAIL, ME_AUTHORITY)
VALUES('A24001001', '관리자1', 'admin123@naver.com', 'ADMIN');
INSERT INTO ADMIN VALUES('A24001001');

# 회원 추가 - 교수
INSERT INTO MEMBER(ME_ID, ME_NAME, ME_EMAIL, ME_AUTHORITY)
VALUES
	('P24123001', '김교수', 'kim123@naver.com', 'PROFESSOR'),
    ('P24123002', '이교수', 'lee123@naver.com', 'PROFESSOR'),
    ('P24145001', '박교수', 'park123@naver.com', 'PROFESSOR'),
    ('P24145002', '홍교수', 'hong123@naver.com', 'PROFESSOR'),
    ('P24167001', '최교수', 'choi123@naver.com', 'PROFESSOR'),
    ('P24167002', '정교수', 'jung123@naver.com', 'PROFESSOR'),
    ('P24700001', '윤교양', 'yun123@naver.com', 'PROFESSOR'),
    ('P24700002', '장교양', 'jang123@naver.com', 'PROFESSOR');
INSERT INTO PROFESSOR(ME_ID, PR_MA_NUM)
VALUES
	('P24123001', 123), ('P24123002', 123), ('P24145001', 145), ('P24145002', 145),
    ('P24167001', 167), ('P24167002', 167), ('P24700001', 700), ('P24700002', 700);

# 회원 추가 - 학생(컴공)
INSERT INTO MEMBER(ME_ID, ME_NAME, ME_EMAIL, ME_AUTHORITY)
VALUES
	('24123001', '김컴공', 'kimcom@naver.com', 'STUDENT'),
    ('24123002', '이컴공', 'leecom@naver.com', 'STUDENT'),
    ('24123003', '박컴공', 'parkcom@naver.com', 'STUDENT'),
    ('24123004', '홍컴공', 'hongcom@naver.com', 'STUDENT'),
    ('24123005', '최컴공', 'choicom@naver.com', 'STUDENT'),
    ('24123006', '정컴공', 'jungcom@naver.com', 'STUDENT');
INSERT INTO STUDENT(ME_ID, ST_MA_NUM)
VALUES
	('24123001', 123), ('24123002', 123), ('24123003', 123),
    ('24123004', 123), ('24123005', 123), ('24123006', 123);

# 회원 추가 - 학생(기계공)
INSERT INTO MEMBER(ME_ID, ME_NAME, ME_EMAIL, ME_AUTHORITY)
VALUES
	('24145001', '김기계', 'kimmachine@naver.com', 'STUDENT'),
    ('24145002', '이기계', 'leemachine@naver.com', 'STUDENT'),
    ('24145003', '박기계', 'parkmachine@naver.com', 'STUDENT'),
    ('24145004', '홍기계', 'hongmachine@naver.com', 'STUDENT'),
    ('24145005', '정기계', 'jungmachine@naver.com', 'STUDENT');
INSERT INTO STUDENT(ME_ID, ST_MA_NUM)
VALUES
	('24145001', 145), ('24145002', 145), ('24145003', 145),
    ('24145004', 145), ('24145005', 145);

# 회원 추가 - 학생(화공)
INSERT INTO MEMBER(ME_ID, ME_NAME, ME_EMAIL, ME_AUTHORITY)
VALUES
	('24167001', '김화공', 'kimchemi@naver.com', 'STUDENT'),
    ('24167002', '이화공', 'leechemi@naver.com', 'STUDENT'),
    ('24167003', '박화공', 'parkchemi@naver.com', 'STUDENT'),
    ('24167004', '홍화공', 'hongchemi@naver.com', 'STUDENT'),
    ('24167005', '송화공', 'songchemi@naver.com', 'STUDENT'),
    ('24167006', '양화공', 'yangchemi@naver.com', 'STUDENT'),
    ('24167007', '정화공', 'jungchemi@naver.com', 'STUDENT');
INSERT INTO STUDENT(ME_ID, ST_MA_NUM)
VALUES
	('24167001', 167), ('24167002', 167), ('24167003', 167), ('24167004', 167),
    ('24167005', 167), ('24167006', 167), ('24167007', 167);
    
# 과목추가 - 컴공
INSERT INTO SUBJECT(SU_NAME, SU_TIME, SU_POINT, SU_STATUS, SU_MA_NUM)
VALUES
	('컴퓨터공학개론', 3, 3, '전공필수', 123),
    ('객체지향프로그래밍', 4, 3, '전공필수', 123),
    ('소프트웨어설계', 4, 3, '전공필수', 123),
    ('데이터베이스시스템', 4, 3, '전공필수', 123),
    ('기초컴파일러구성', 3, 3, '전공필수', 123),
    ('시스템분석설계', 2, 2, '전공선택', 123),
    ('디지털신호처리', 4, 3, '전공선택', 123),
    ('알고리즘설계와분석', 2, 2, '전공선택', 123);

# 과목추가 - 기계공
INSERT INTO SUBJECT(SU_NAME, SU_TIME, SU_POINT, SU_STATUS, SU_MA_NUM)
VALUES
	('기계공학개론', 3, 3, '전공필수', 145),
    ('열유체역학', 3, 3, '전공필수', 145),
    ('기구동역학', 4, 3, '전공필수', 145),
    ('공학설계', 4, 3, '전공필수', 145),
    ('기계시스템설계 및 제작', 5, 3, '전공필수', 145),
    ('기계전자시스템모델링', 3, 3, '전공선택', 145),
    ('수치해석 및 가시화', 4, 3, '전공선택', 145),
    ('미세기계전자시스템', 3, 3, '전공선택', 145);
    
# 과목추가 - 화공
INSERT INTO SUBJECT(SU_NAME, SU_TIME, SU_POINT, SU_STATUS, SU_MA_NUM)
VALUES   
	('화학공학 입문설계', 3, 3, '전공필수', 167),
    ('화학반응공학', 3, 3, '전공필수', 167),
    ('반도체공정공학', 4, 3, '전공필수', 167),
    ('공정제어', 4, 3, '전공필수', 167),
    ('화학공학 종합설계', 4, 3, '전공필수', 167),
    ('화공안전공학', 3, 3, '전공선택', 167),
    ('고분자화학', 3, 3, '전공선택', 167),
    ('디스플레이공학', 3, 3, '전공선택', 167);
    
# 과목추가 - 교양
INSERT INTO SUBJECT(SU_NAME, SU_TIME, SU_POINT, SU_STATUS, SU_MA_NUM)
VALUES 
	('글쓰기와 의사소통', 2, 2, '교양필수', 700),
    ('동서문화 교류사', 2, 2, '교양필수', 700),
    ('대중매체의 이해', 2, 2, '교양선택', 700),
    ('글로벌시대 화법과 문화', 3, 3, '교양선택', 700),
    ('서양고전철학', 2, 2, '교양선택', 700),
    ('기술창업과 경영', 3, 3, '교양선택', 700),
    ('삶과 종교', 2, 2, '교양선택', 700),
    ('음악의 세계', 2, 2, '교양선택', 700);
    
# 강의추가
INSERT INTO LECTURE(LE_ROOM, LE_SCHEDULE, LE_YEAR, LE_SEMESTER, LE_SU_NUM, LE_ME_ID)
VALUES
	('A관 104호', '월 1,2,3교시', 2024, '1학기', 1, 'P24123001'),
    ('A관 105호', '화 3,4교시', 2024, '1학기', 6, 'P24123001'),
    ('A관 301호', '월 6,7,8,9교시', 2024, '1학기', 2, 'P24123002'),
    ('A관 301호', '금 3,4교시', 2024, '1학기', 8, 'P24123002'),
    ('B관 101호', '목 3,4,5교시', 2024, '1학기', 9, 'P24145001'),
    ('B관 101호', '금 3,4,5교시', 2024, '1학기', 14, 'P24145001'),
    ('B관 202호', '화 1,2,3,4교시', 2024, '1학기', 11, 'P24145002'),
    ('B관 304호', '목 7,8,9교시', 2024, '1학기', 16, 'P24145002'),
    ('C관 605호', '월 1,2,3교시', 2024, '1학기', 17, 'P24167001'),
    ('C관 403호', '목 1,2,3교시', 2024, '1학기', 22, 'P24167001'),
    ('C관 104호', '화 1,2,3,4교시', 2024, '1학기', 19, 'P24167002'),
    ('C관 101호', '수 3,4,5교시', 2024, '1학기', 24, 'P24167002'),
    ('F관 604호', '수 8,9교시', 2024, '1학기', 25, 'P24700001'),
    ('F관 707호', '화 8,9교시', 2024, '1학기', 26, 'P24700002'),
    ('F관 701호', '수 3,4교시', 2024, '1학기', 27, 'P24700002'),
    ('F관 405호', '금 5,6,7교시', 2024, '1학기', 28, 'P24700002'),
    ('F관 303호', '목 8,9교시', 2024, '1학기', 29, 'P24700001'),
    ('F관 103호', '월 1,2,3교시', 2024, '여름방학', 30, 'P24700001'),
    ('F관 105호', '금 1,2교시', 2024, '여름방학', 31, 'P24700001'),
    ('F관 204호', '수 3,4교시', 2024, '여름방학', 32, 'P24700002'),
	('A관 104호', '월 1,2,3,4교시', 2024, '2학기', 3, 'P24123001'),
    ('A관 105호', '화 3,4,5교시', 2024, '2학기', 5, 'P24123001'),
    ('A관 301호', '월 6,7,8,9교시', 2024, '2학기', 4, 'P24123002'),
    ('A관 301호', '금 1,2,3,4교시', 2024, '2학기', 7, 'P24123002'),
    ('B관 101호', '목 3,4,5교시', 2024, '2학기', 10, 'P24145001'),
    ('B관 101호', '금 1,2,3,4교시', 2024, '2학기', 15, 'P24145001'),
    ('B관 202호', '화 1,2,3,4교시', 2024, '2학기', 12, 'P24145002'),
    ('B관 304호', '목 6,7,8,9교시', 2024, '2학기', 13, 'P24145002'),
    ('C관 605호', '월 1,2,3교시', 2024, '2학기', 18, 'P24167001'),
    ('C관 403호', '목 1,2,3,4교시', 2024, '2학기', 20, 'P24167001'),
    ('C관 104호', '화 1,2,3,4교시', 2024, '2학기', 21, 'P24167002'),
    ('C관 101호', '수 3,4,5교시', 2024, '2학기', 23, 'P24167002'),
    ('F관 707호', '수 8,9교시', 2024, '2학기', 25, 'P24700001'),
    ('F관 405호', '목 8,9교시', 2024, '2학기', 27, 'P24700001');

# 학생 수강신청(성적포함)
INSERT INTO COURSE(CO_GRADE, CO_LE_NUM, CO_ME_ID)
VALUES
	('A+', 1, '24123001'), ('A', 1, '24123002'), ('B', 1, '24123003'), ('C+', 1, '24123004'), ('C', 1, '24123005'), ('F', 1, '24123006'),
    ('A', 2, '24123002'), ('B+', 2, '24123003'), ('B', 2, '24123004'), ('A+', 2, '24123005'),
    ('B', 3, '24123001'), ('D', 3, '24123002'), ('A+', 3, '24123003'), ('D+', 3, '24123004'), ('B', 3, '24123005'), ('C', 3, '24123006'),
    ('C', 4, '24123002'), ('B+', 4, '24123003'), ('B+', 4, '24123004'), ('A+', 4, '24123005'),
    ('A+', 3, '24145001'), ('C-', 3, '24145002'), ('A', 3, '24145003'), ('B+', 3, '24145004'), ('A', 3, '24145005'),
    ('B', 4, '24145001'), ('A+', 4, '24145003'), ('D', 4, '24145005'),
    ('C+', 5, '24145001'), ('A', 5, '24145002'), ('A', 5, '24145003'), ('D', 5, '24145004'), ('C', 6, '24145005'),
    ('B', 6, '24145001'), ('A+', 6, '24145003'), ('C+', 6, '24145005'),
    ('A', 9, '24167001'), ('B', 9, '24167002'), ('C+', 9, '24167003'), ('B+', 9, '24167004'), ('F', 9, '24167005'),
    ('A', 10, '24167002'), ('A+', 10, '24167003'), ('B', 10, '24167004'), ('C+', 10, '24167005'),
    ('B', 13, '24123001'), ('B', 13, '24123002'), ('A+', 13, '24123003'), ('A', 13, '24123004'), ('C', 13, '24123005'),
    ('B+', 13, '24145001'), ('A+', 13, '24145002'), ('C+', 13, '24145003'), ('C', 13, '24145004'),
    ('A', 13, '24167001'), ('A+', 13, '24167002'), ('F', 13, '24167003'), ('C+', 13, '24167004'),
    ('A', 14, '24123001'), ('A+', 15, '24123001'), ('C', 16, '24123001'), ('C+', 17, '24123001'),
	('A+', 18, '24123001'), ('A', 18, '24123002'), ('D+', 18, '24123003'), ('A', 18, '24145001'), ('B+', 18, '24145002'),
    ('B+', 18, '24145003'), ('B', 18, '24167001'), ('F', 18, '24167002'), ('B', 18, '24167003'),
    ('B', 19, '24123001'), ('C', 19, '24123002'), ('B+', 19, '24123003'), ('C', 19, '24145001'), ('A+', 19, '24145002'),
    ('C+', 19, '24145003'), ('C+', 19, '24167001'), ('A', 19, '24167002'), ('D', 19, '24167003'),
    ('C+', 20, '24123001'), ('B+', 20, '24123002'), ('D+', 20, '24123003'), ('F', 20, '24145001'), ('C+', 20, '24145002'),
    ('A', 20, '24145003'), ('A+', 20, '24167001'), ('C+', 20, '24167002'), ('F', 20, '24167003');
    
# 학생 수강신청(성적x)
INSERT INTO COURSE(CO_LE_NUM, CO_ME_ID)
VALUES
	(21, '24123001'), (22, '24123001'), (33, '24123001'), (34, '24123001'),
    (33, '24123002'), (33, '24123003'), (33, '24145001'), (33, '24145002'), (33, '24145003'),
    (33, '24167001'), (33, '24167002'), (33, '24167003'), (33, '24167004'),
    (34, '24123002'), (34, '24123003'), (34, '24145001'), (34, '24145002'), (34, '24145003'),
    (34, '24167001'), (34, '24167002'), (34, '24167003'), (34, '24167004');
    
# 공지사항
INSERT INTO NOTICE(NO_TITLE, NO_CONTENT, NO_dATE, NO_ME_ID)
VALUES
	('[재학생 및 신입생] 2024 KH대학교 가이드북', 'KH대학교에서는 본교 신입생 및 재학생의 성공적인 학교생활을 위하여 `2024 KH대학교 가이드북`을 아래와 같이 배포합니다.', '2024-01-15', 'A24001001'),
    ('2024 1학기 수강신청 방법 및 일정 안내', '홈페이지->로그인->수강신청', '2024-01-24', 'A24001001'),
    ('2024년도 2월 미졸업자 수강신청학점 변경 및 등록금 납부 안내', '2024년도 2월 미졸업자(8학기 초과학생)의 등록금 납부와 수강신청학점 변경 희망 학생을 위한 미졸코드 변경 신청기간과 방법을 안내하오니, 기간 내 신청하시기 바랍니다.', '2024-01-27', 'A24001001'),
    ('2024학년도 1학기 KH대학교 학점교류 안내', '신규 교류생 : 신규 학번 발급 예정, 기 수강 교류생 : 이전 교류 학기에 부여받은 학번 유지, 추가 상세 내용은 첨부파일 참고', '2024-02-21', 'A24001001'),
    ('2024년도 여름방학 계절학기 본수강신청 안내', '여름방학 계절학기 수강신청 안내 : 자세한 일정과 내용은 첨부파일을 참조 바랍니다.', '2024-05-24', 'A24001001'),
    ('2024년도 2학기 휴학 및 복학 개시 안내', '2024학년도 2학기 휴학 및 복학 개시 일정을 안내하오니 휴,복학 신청에 참고하시기 바랍니다.', '2024-06-12', 'A24001001'),
    ('2024 2학기 수강신청 방법 및 일정 안내', '홈페이지->로그인->수강신청', '2024-07-24', 'A24001001'),
    ('졸업요건 관리를 위한 필수확힌 사항 안내(2024재공지)', '최근 졸업요건 관리 미흡으로 졸업이 지연되는 사례가 종종 발생하고 있습니다. 이에 학생 본인의 졸업요건 관리를 위한 필수확인 사항을 안내하오니, 개인별 철저한 학점 관리를 통해 본인이 졸업을 희망하는 시기에 졸업하지 못하는 일이 발생하지 않도록 각별히 유의하시기 바랍니다.', '2024-07-25', 'A24001001'),
    ('2024학년도 2학기 추가등록 안내', '기간 내 미등록시 제적처리 되어니 등록금 납부 또는 휴학처리 바랍니다. 등록 관련문의는 재무팀에 연락 바랍니다.', '2024-08-26', 'A24001001');
