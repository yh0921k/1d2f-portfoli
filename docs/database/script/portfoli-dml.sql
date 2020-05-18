-- 분야 샘플 데이터(pf_field)
INSERT INTO pf_field(field_no, category, name) VALUES(1, 'IT/인터넷', '웹프로그래머');
INSERT INTO pf_field(field_no, category, name) VALUES(2, 'IT/인터넷', '시스템프로그래머');
INSERT INTO pf_field(field_no, category, name) VALUES(3, 'IT/인터넷', '머신러닝');
INSERT INTO pf_field(field_no, category, name) VALUES(4, 'IT/인터넷', '인공지능');
INSERT INTO pf_field(field_no, category, name) VALUES(5, 'IT/인터넷', '앱프로그래머');
INSERT INTO pf_field(field_no, category, name) VALUES(6, 'IT/인터넷', '네트워크');
INSERT INTO pf_field(field_no, category, name) VALUES(7, 'IT/인터넷', '운영체제');
INSERT INTO pf_field(field_no, category, name) VALUES(8, 'IT/인터넷', '펌웨어');
INSERT INTO pf_field(field_no, category, name) VALUES(9, 'IT/인터넷', '하드웨어');
INSERT INTO pf_field(field_no, category, name) VALUES(10, 'IT/인터넷', '정보보안');

-- 기술 샘플 데이터(pf_skill)
INSERT INTO pf_skill(skill_no, category, name) VALUES(1, 'Web', 'JAVA');
INSERT INTO pf_skill(skill_no, category, name) VALUES(2, 'Web', 'JSP');
INSERT INTO pf_skill(skill_no, category, name) VALUES(3, 'Web', 'Spring');
INSERT INTO pf_skill(skill_no, category, name) VALUES(4, 'Web', 'Django');
INSERT INTO pf_skill(skill_no, category, name) VALUES(5, 'Web', 'JavaScript');
INSERT INTO pf_skill(skill_no, category, name) VALUES(6, 'App', 'IOS');
INSERT INTO pf_skill(skill_no, category, name) VALUES(7, 'App', 'Android');
INSERT INTO pf_skill(skill_no, category, name) VALUES(8, 'IoT', 'Arduino');
INSERT INTO pf_skill(skill_no, category, name) VALUES(9, 'Network', 'ns-3');
INSERT INTO pf_skill(skill_no, category, name) VALUES(10, 'OS', 'Linux');
INSERT INTO pf_skill(skill_no, category, name) VALUES(11, 'OS', 'Windows');

-- 관리자 샘플 데이터(pf_admin)
INSERT INTO pf_admin(id, pwd) VALUES('eomjinyoung', password('1111'));
INSERT INTO pf_admin(id, pwd) VALUES('kyh', password('1111'));

-- 학력 샘플 데이터(pf_final_education)
INSERT INTO pf_final_education(category) VALUES('고등학교 졸업');
INSERT INTO pf_final_education(category) VALUES('2,3년제 대학 졸업');
INSERT INTO pf_final_education(category) VALUES('4년제 대학 졸업');
INSERT INTO pf_final_education(category) VALUES('대학원 졸업(석사)');
INSERT INTO pf_final_education(category) VALUES('대학원 졸업(박사)');

-- 시도 샘플 데이터(pf_province_city)
INSERT INTO pf_province_city(province_city_no, province_name, city_name) VALUES(1, '경기도', '의정부시');
INSERT INTO pf_province_city(province_city_no, province_name, city_name) VALUES(2, '강원도', '춘천시');
INSERT INTO pf_province_city(province_city_no, province_name, city_name) VALUES(3, '제주특별자치도', '제주시');
INSERT INTO pf_province_city(province_city_no, province_name, city_name) VALUES(4, '경상남도', '김해시');
INSERT INTO pf_province_city(province_city_no, province_name) VALUES(5, '경상북도');
INSERT INTO pf_province_city(province_city_no, province_name) VALUES(6, '충청북도');
INSERT INTO pf_province_city(province_city_no, province_name) VALUES(7, '충청남도');
INSERT INTO pf_province_city(province_city_no, province_name, city_name) VALUES(8, '전라남도', '춘천시');
INSERT INTO pf_province_city(province_city_no, province_name) VALUES(9, '전라북도');
INSERT INTO pf_province_city(province_city_no, city_name) VALUES(10, '서울특별시');

-- 군구 샘플 데이터(pf_conty_district)
INSERT INTO pf_county_district(province_city_no, district_name) VALUES(10, '강남구');
INSERT INTO pf_county_district(province_city_no, county_name) VALUES(5, '울진군');
INSERT INTO pf_county_district(province_city_no, county_name) VALUES(6, '음성군');
INSERT INTO pf_county_district(province_city_no, county_name) VALUES(7, '태안군');
INSERT INTO pf_county_district(province_city_no, county_name) VALUES(9, '순창군');

-- 회원 예제 데이터
INSERT INTO pf_members(member_no, id, pwd, name, post_no, basic_address, email, tel, sms_yn, email_yn, type, userkey) VALUES (1, 'yh0921k', PASSWORD('1111'), '김용희', '06611', '서울특별시 서초구 강남대로 459 (서초동, 백암빌딩)', 'yh0921k@gmail.com', '010-1234-5678', 1, 1, 1, 'Y');
INSERT INTO pf_members(id, pwd, name, email, tel, sms_yn, email_yn, type, userkey) VALUES ('moonsolid', PASSWORD('2222'), '문국태', 'moonsolid@naver.com', '010-9876-5432', 1, 1, 1, 'Y');
INSERT INTO pf_members(id, pwd, name, email, tel, sms_yn, email_yn, type, userkey) VALUES ('oreotaste', PASSWORD('3333'), '손영쿡', 'oreotaste@daum.net', '010-2345-6789', 1, 1, 1, 'Y');
INSERT INTO pf_members(id, pwd, name, post_no, basic_address, email, tel, sms_yn, email_yn, type, userkey) VALUES ('juljasong', PASSWORD('4444'), '윤리아', '06621', '서울특별시 서초구 서초대로74길 33(서초동, 비트빌)', 'juljasong@gmail.com', '010-4567-8901', 1, 1, 1, 'Y');
INSERT INTO pf_members(id, pwd, name, email, tel, sms_yn, email_yn, type, userkey) VALUES ('jeoneunhee', PASSWORD('5555'), '전은희', 'jeoneunhee@naber.com', '010-1234-5674', 1, 1, 1, 'Y');
INSERT INTO pf_members(id, pwd, name, post_no, basic_address, email, tel, sms_yn, email_yn, type, userkey) VALUES ('warple', PASSWORD('6666'), '노정진', '63091', '제주특별자치도 제주시 1100로 3198-13(노형동)', 'contact_us@warple.co.kr', '010-2754-3257', 1, 1, 2, 'Y');
INSERT INTO pf_members(id, pwd, name, post_no, basic_address, detail_address, email, tel, sms_yn, email_yn, type, userkey) VALUES ('baegopa', PASSWORD('7777'), '김홍준', '05544', '서울특별시 송파 구 위례성대로 2(방이동, 장은빌딩)', '2층', 'help@baegopa.com', '010-4312-6754', 1, 1, 2, 'Y');
INSERT INTO pf_members(id, pwd, name, post_no, basic_address, email, tel, sms_yn, email_yn, type, userkey) VALUES ('hmarket', PASSWORD('8888'), '광병진', '06236', '서울특별시 강남구 테헤란로(역삼 동, 강남파이낸스센터)', 'hmk_cs@corp.hmarket.co.kr', '010-4952-6589', 1, 1, 2, 'Y');
INSERT INTO pf_members(id, pwd, name, post_no, basic_address, detail_address,  email, tel, sms_yn, email_yn, type, userkey) VALUES ('mosinna', PASSWORD('9999'), '김정우', '06017', '서울특별시 남구 언주로174길 30(신사동, 로빈명품관)', '지하1층', 'help@mosinna.com', '010-2394-3958', 1, 1, 2, 'Y');
INSERT INTO pf_members(id, pwd, name, post_no, basic_address, detail_address, email, tel, sms_yn, email_yn, type, userkey) VALUES ('planningadd', PASSWORD('1010'), '김성수', '13637', '경기도 성남시 분당구 구미로9번길 10(구미동, 세종그랑시아II)', '1-230', 'planning1@naver.com', '010-4958-9068', 1, 1, 2, 'Y');

-- 게시글 예제 데이터 (pf_board)
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
 VALUES(1, "제목1", "내용1", 3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (2,"제목2","내용2",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (3,"제목3","내용3",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (4,"제목4","내용4",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (5,"제목5","내용5",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (6,"제목6","내용6",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (7,"제목7","내용7",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (8,"제목8","내용8",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (9,"제목9","내용9",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (10,"제목10","내용10",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (11,"제목11","내용11",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (12,"제목12","내용12",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (13,"제목13","내용13",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (14,"제목14","내용14",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (15,"제목15","내용15",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (16,"제목16","내용16",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (17,"제목17","내용17",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (18,"제목18","내용18",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (19,"제목19","내용19",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (20,"제목20","내용20",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (21,"제목21","내용21",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (22,"제목22","내용22",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (23,"제목23","내용23",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (24,"제목24","내용24",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (25,"제목25","내용25",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (26,"제목26","내용26",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (27,"제목27","내용27",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (28,"제목28","내용28",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (29,"제목29","내용29",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (30,"제목30","내용30",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
 VALUES(31, "제목31", "내용31", 3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
 VALUES(32, "제목32", "내용32", 0, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (33,"제목33","내용33",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (34,"제목34","내용34",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (35,"제목35","내용35",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (36,"제목36","내용36",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (37,"제목37","내용37",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (38,"제목38","내용38",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (39,"제목39","내용39",3, "2020-04-01 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (40,"제목40","내용40",3, "2020-04-02 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
 VALUES(41,"제목41","내용41", 3, "2020-04-03 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
 VALUES(42,"제목42","내용42", 0, "2020-04-04 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (43,"제목43","내용43",3, "2020-04-05 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (44,"제목44","내용44",3, "2020-04-06 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (45,"제목45","내용45",3, "2020-04-06 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (46,"제목46","내용46",3, "2020-04-06 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (47,"제목47","내용47",3, "2020-04-07 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (48,"제목48","내용48",3, "2020-04-07 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (49,"제목49","내용49",3, "2020-04-07 00:00:00");
INSERT INTO pf_board (board_no, title, content, view_count, registered_date)
VALUES (50,"제목50","내용50",3, "2020-04-07 00:00:00");

-- 일반회원 예제 데이터
INSERT INTO pf_general_member(general_member_no, seeking_flag, photo, membership, career) VALUES (1, 1, 'photo2394823jfshf.jpg', 'Portfoli Pro', 5);
INSERT INTO pf_general_member(general_member_no, seeking_flag, photo, membership, career) VALUES (2, 1, 'photo2dfsadf23jfshf.jpg', 'Portfoli Basic', 2);
INSERT INTO pf_general_member(general_member_no, seeking_flag, membership, career) VALUES (3, 1, 'none', 4);
INSERT INTO pf_general_member(general_member_no, seeking_flag, membership) VALUES (4, 0, 'Portfoli Pro');
INSERT INTO pf_general_member(general_member_no, seeking_flag, membership, career) VALUES (5, 1, 'Portfoli Basic', 1);

-- 포트폴리오 예제데이터 (pf_portfolio) pf_general_member뒤에(완료)
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(31,1,'www.naver.com', "c:\folder1\folder2\file1.jpg", 1, 1);
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(32,1,'www.daum.com', "c:\folder1\folder2\file2.jpg", 0, 0);
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(33,1,'www. daum.com', "c:\folder1\folder2\file3.jpg", 3, 1);
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(34,1,'www.daum.com', "c:\folder1\folder2\file4.jpg", 0, 1);
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(35,1,'www.daum.com', "c:\folder1\folder2\file5.jpg", 0, 1);
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(36,2,'www.daum.com', "c:\folder1\file1.jpg", 0, 1);
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(37,2,'www.google.com', "c:\folder1\folder2\file1.jpg", 3, 0);
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(38,2,'www.daum.com', "c:\folder1\folder2\file2.jpg", 1, 1);
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(39,3,'www.google.com', "c:\ folder2\file3.jpg", 0, 0);
INSERT INTO pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) VALUES(40,3,'www.google.com', "c:\folder1\folder2\file4.jpg", 0, 1);

-- 회원보유기술 샘플 데이터(pf_member_skill)
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(1, 1, 1);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(1, 2, 1);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(1, 3, 1);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(1, 4, 1);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(1, 5, 1);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(2, 9, 1);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(2, 10, 2);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(2, 11, 3);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(5, 1, 3);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(5, 9, 2);
INSERT INTO pf_member_skill(general_member_no, skill_no, level) VALUES(5, 10, 2);

-- 포트폴리오구성기술 예제데이터 (pf_member_skill 인서트 후)
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(31, 1);
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(32, 1);
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(33, 2);
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(34, 2);
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(35, 2);
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(36, 2);
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(37, 3);
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(38, 3);
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(39, 3);
INSERT INTO pf_portfolio_skill(board_no, member_skill_no) VALUES(40, 4);

-- 기업 예제 데이터
INSERT INTO pf_company(company_no, business_registration_no, name, tel, representative) VALUES (1, '201-81-64418', '워플', '064-903-1555', '김국헌');
INSERT INTO pf_company(business_registration_no, name, tel, representative) VALUES ('120-87-65764', '배고파', '1600-0988', '신용재');
INSERT INTO pf_company(business_registration_no, name, tel, representative) VALUES ('220-81-83678', 'Hmarket', '1566-5700', '정재화');
INSERT INTO pf_company(business_registration_no, name, tel, representative) VALUES ('211-88-79575', '모신나', '1544-7200', '변진섭');
INSERT INTO pf_company(business_registration_no, name, tel, representative) VALUES ('129-86-50524', '플래닝애드', '070-8680-6620', '윤미래');

-- 기업회원 예제 데이터
INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (6, '대리', 1);
INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (7, '인사담당', 2);
INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (8, '인사담당', 3);
INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (9, '인사담당', 4);
INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (10, '대표', 5);

-- 자격증 예제 데이터
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(1322, '한국산업인력공단', '전자계산기조직응용기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(1320, '한국산업인력공단', '정보처리기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(1325, '한국인터넷진흥원', '정보보안기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(2290, '한국산업인력공단', '정보처리산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(2434, '한국산업인력공단', '시각디자인산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(1790, '한국산업인력공단', '시각디자인기사');

-- 기사 1XXX
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1511, '한국산업인력공단', '포장기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1500, '한국산업인력공단', '품질경영기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1512, '한국산업인력공단', '제품디자인기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1982, '한국산업인력공단', '컬러리스트기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1630, '한국산업인력공단', '건축기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1632, '한국산업인력공단', '건축설비기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1282, '한국산업인력공단', '실내건축기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1250, '한국산업인력공단', '토목기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1750, '한국산업인력공단', '건축재료시험기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1390, '한국산업인력공단', '지적기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1550, '한국산업인력공단', '응용지질기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1380, '한국산업인력공단', '측량및지형공간정보기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1048, '한국산업인력공단', '콘크리트기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1370, '한국산업인력공단', '조경기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1350, '한국산업인력공단', '도시계획기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1150, '한국산업인력공단', '전기기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1160, '한국산업인력공단', '전기공사기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1513, '한국산업인력공단', '광학기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1321, '한국산업인력공단', '전자계산기기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1170, '한국산업인력공단', '전자기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1121, '한국산업인력공단', '임베디드기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1194, '한국방송통신전파진흥원', '방송통신기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1200, '한국방송통신전파진흥원', '무선설비기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1195, '한국방송통신전파진흥원', '전파전자통신기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (1192, '한국방송통신전파진흥원', '정보통신기사');

-- 기술사 0XXX
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (0760, '한국산업인력공단', '공장관리기술사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (0960, '한국산업인력공단', '제품디자인기술사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (0872, '한국산업인력공단', '기계기술사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (0210, '한국산업인력공단', '화공기술사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (0250, '한국산업인력공단', '전기응용기술사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (0432, '한국산업인력공단', '전기철도기술사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (0301, '한국산업인력공단', '전자응용기술사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (0601, '한국산업인력공단', '정보관리기술사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (0622, '한국산업인력공단', '컴퓨터시스템응용기술사');

-- 산업기사 2XXX
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2432, '한국산업인력공단', '제품디자인산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2025, '한국산업인력공단', '컴퓨터응용가공산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2011, '한국산업인력공단', '기계조립산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2140, '한국산업인력공단', '전기산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2150, '한국산업인력공단', '전기공사산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2036, '한국산업인력공단', '전기철도산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2324, '한국산업인력공단', '전자계산기제어산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2170, '한국산업인력공단', '전자산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2193, '한국산업인력공단', '사무자동화산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2325, '한국산업인력공단', '정보보안산업기사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (2194, '한국방송통신전파진흥원', '방송통신산업기사');

-- 기능장 3XXX
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (3380, '한국산업인력공단', '전기기능장');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (3410, '한국산업인력공단', '전자기기기능장');

-- 기능사 6-7XXX
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (7798, '한국산업인력공단', '웹디자인기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (6793, '한국산업인력공단', '제품응용모델링기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (7796, '한국산업인력공단', '컴퓨터그래픽스운용기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (6012, '한국산업인력공단', '컴퓨터응용선반기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (6032, '한국산업인력공단', '컴퓨터응용밀링기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (7780, '한국산업인력공단', '전기기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (6801, '한국산업인력공단', '전자계산기기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (6790, '한국산업인력공단', '전자기기기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (6785, '한국산업인력공단', '전자캐드기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (6892, '한국산업인력공단', '정보기기운용기능사');
INSERT INTO pf_certificate(certificate_no, agency, name) VALUES (6921, '한국산업인력공단', '정보처리기능사');

-- 일반회원자격증 예제 데이터
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(1, 1322, '2019-5-5');
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(2, 1325, '2020-4-4');
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(3, 1325, '2018-7-7');
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(4, 2290, '2019-7-2');
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(5, 2434, '2018-12-2');
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(1, 1320, '2019-8-16');
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(2, 1320, '2019-8-16');
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(3, 1320, '2019-8-16');
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(4, 1320, '2019-8-16');
INSERT INTO pf_general_member_certification(general_member_no, certificate_no, issue_date) VALUES(5, 1320, '2019-8-16');

-- 팔로잉 예제 데이터
INSERT INTO pf_following(follower, following) VALUES(1, 2);
INSERT INTO pf_following(follower, following) VALUES(2, 3);
INSERT INTO pf_following(follower, following) VALUES(4, 7);
INSERT INTO pf_following(follower, following) VALUES(10, 4);
INSERT INTO pf_following(follower, following) VALUES(8, 5);

-- 쪽지 예제 데이터
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) VALUES(1, 1, 2, '안녕하세요~', '저랑 맞팔하실래요?', '2020-1-1', '2020-1-2', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, message_sender_delete, message_receiver_delete) VALUES(2, 2, 3, '반가워요~', '취업 정보 같이 공유해요!', '2020-2-10', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) VALUES(3, 4, 5, '쪽지제목3', '쪽지내용3', '2020-2-13', '2020-2-15', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) VALUES(4, 5, 4, '쪽지제목4', '쪽지내용4', '2020-2-15', '2020-2-16', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, message_sender_delete, message_receiver_delete) VALUES(5, 6, 7, '쪽지제목5', '쪽지내용5', '2020-2-16', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) VALUES(6, 6, 8, '쪽지제목6', '쪽지내용6', '2020-2-13', '2020-2-21', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) VALUES(7, 1, 9, '쪽지제목7', '쪽지내용7', '2020-2-13', '2020-2-21', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) VALUES(8, 9, 1, '쪽지제목8', '쪽지내용8', '2020-2-13', '2020-2-21', 0, 0);

-- 첨부파일(쪽지) 예제 데이터
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(1, 1, 'image.png', '.data/note/note1.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(2, 1, 'image2.png', '.data/note/note1.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(3, 1, 'image3.png', '.data/note/note1.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(4, 2, 'image.png', '.data/note/note4.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(5, 3, 'image.png', '.data/note/note5.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(6, 4, 'image.png', '.data/note/note6.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(7, 4, 'image2.png', '.data/note/note7.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(8, 5, 'image.jpg', '.data/note/note8.jpg');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(9, 5, 'image2.jpg', '.data/note/note9.jpg');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) VALUES(10, 6, 'image.png', '.data/note/note10.png');

-- 판매상품 예제 데이터
INSERT INTO pf_product(product_no, name, duration, price) VALUES(1, 'Portfoli Basic', 0, 8800);
INSERT INTO pf_product(product_no, name, duration, price) VALUES(2, 'Portfoli Pro', 0, 29800);

-- 결제수단 예제 데이터
INSERT INTO pf_payment_method(payment_method) VALUES('무통장입금');
INSERT INTO pf_payment_method(payment_method) VALUES('카드결제');
INSERT INTO pf_payment_method(payment_method) VALUES('휴대폰결제');

-- 결제 예제 데이터
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) VALUES(1, 2, 1, 1, 1, '2020-4-1 12:00:00');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) VALUES(2, 4, 2, 3, 1, '2020-4-1 13:10:20');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) VALUES(3, 5, 1, 3, 1, '2020-4-2 14:24:30');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) VALUES(4, 6, 1, 2, 1, '2020-4-3 15:48:20');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) VALUES(5, 7, 1, 1, 1, '2020-4-4 17:01:03');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat) VALUES(6, 8, 1, 1, 1);
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat) VALUES(7, 9, 2, 3, 1);

-- 알림분류 예제 데이터
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) VALUES(1,  '새 쪽지가 도착했습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) VALUES(2,  '일주일 뒤 마감되는 일정이 있습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) VALUES(3,  '3일 뒤 마감되는 일정이 있습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) VALUES(4,  '2일 뒤 마감되는 일정이 있습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) VALUES(5,  '1일 뒤 마감되는 일정이 있습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) VALUES(6,  '오늘 마감되는 일정이 있습니다.');

-- 알림 예제 데이터
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(1, 1, 1,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(2, 1, 2,  '내용2');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(3, 2, 1,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(4, 3, 3,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(5, 4, 4,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(6, 5, 5,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(7, 6, 6,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(8, 6, 1,  '내용2');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(9, 7, 1,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) VALUES(10, 8, 1,  '내용1');

-- 배너 예제 데이터
INSERT INTO pf_banner(banner_no, company_no, title, image, url, start_date, end_date, activate) VALUES(1, 1, '배너광고1', '.data/banner1.png', 'https://plus-ex.com/', '2020-3-1 08:00:00', '2020-03-31 23:59:59', 1);
INSERT INTO pf_banner(banner_no, company_no, title, image, url, start_date, end_date, activate) VALUES(2, 3, '배너광고2', '.data/banner2.png', 'http://sampartners.co.kr/', '2020-3-1 08:00:00', '2020-03-31 23:59:59', 0);
INSERT INTO pf_banner(banner_no, company_no, title, image, url, start_date, end_date, activate) VALUES(3, 4, '배너광고3', '.data/banner3.png', 'https://linepluscorp.com/', '2020-3-1 08:00:00', '2020-03-31 23:59:59', 0);
INSERT INTO pf_banner(company_no, title, image, url, start_date, end_date, activate) VALUES(2, '배너광고4', '.data/banner/banner4.png', 'http://www.woowahan.com/', '2020-4-1 08:00:00', '2020-04-30 23:59:59', 1);
INSERT INTO pf_banner(company_no, title, image, url, start_date, end_date, activate) VALUES(5, '배너광고5', '.data/banner/banner5.png', 'https://www.kakaocorp.com/', '2020-4-1 08:00:00', '2020-04-30 23:59:59', 0);

-- 신고분류 예제 데이터
INSERT INTO pf_report_class(report_class_no, report_class) VALUES(1, '도배');
INSERT INTO pf_report_class(report_class_no, report_class) VALUES(2, '타인 비방');
INSERT INTO pf_report_class(report_class_no, report_class) VALUES(3, '저작물 무단 도용');
INSERT INTO pf_report_class(report_class_no, report_class) VALUES(4, '상업적 홍보');
INSERT INTO pf_report_class(report_class_no, report_class) VALUES(5, '기타');

-- 신고처리분류 예제 데이터
INSERT INTO pf_handle_class(handle_class) VALUES('게시글 삭제');
INSERT INTO pf_handle_class(handle_class) VALUES('1개월 정지');
INSERT INTO pf_handle_class(handle_class) VALUES('3개월 정지');
INSERT INTO pf_handle_class(handle_class) VALUES('회원 추방');

-- 신고 예제 데이터 (게시글 데이터 입력 후 INSERT(완))
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no, handle_class_no, handle_date, handle_content) VALUES(1, 1, 2, 1, 1, '2020-4-1', '처리내용1');
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no, handle_class_no, handle_date, handle_content) VALUES(2, 3, 4, 2, 2, '2020-4-2', '처리내용2');
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no, handle_class_no, handle_date, handle_content) VALUES(3, 5, 6, 3, 4, '2020-4-2', '처리내용3');
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) VALUES(4, 7, 8, 5);
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) VALUES(5, 1, 3, 1);
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) VALUES(6, 1, 8, 1);
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) VALUES(7, 1, 9, 4);
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) VALUES(8, 1, 3, 5);

-- pf_bookmark (pf_portfolio 인서트 후(완))
INSERT INTO pf_bookmark(board_no, member_no) VALUES(31, 2);
INSERT INTO pf_bookmark(board_no, member_no) VALUES(32, 2);
INSERT INTO pf_bookmark(board_no, member_no) VALUES(33, 4);
INSERT INTO pf_bookmark(board_no, member_no) VALUES(34, 5);
INSERT INTO pf_bookmark(board_no, member_no) VALUES(35, 8);

-- pf_employment_status 고용형태
INSERT INTO pf_employment_status(employment_stat_no,employment_stat_name) VALUES(1,'정규직');
INSERT INTO pf_employment_status(employment_stat_no,employment_stat_name) VALUES(2,'계약직');
INSERT INTO pf_employment_status(employment_stat_no,employment_stat_name) VALUES(3,'인턴');
INSERT INTO pf_employment_status(employment_stat_no,employment_stat_name) VALUES(4,'프리랜서');
INSERT INTO pf_employment_status(employment_stat_no,employment_stat_name) VALUES(5,'파견직');

-- pf_major 전공 데이터
INSERT INTO pf_major(major_no, name) VALUES(1,'손영국');
INSERT INTO pf_major(major_no, name) VALUES(2,'김용휘');
INSERT INTO pf_major(major_no, name) VALUES(3,'전은혜');
INSERT INTO pf_major(major_no, name) VALUES(4,'송율리아');
INSERT INTO pf_major(major_no, name) VALUES(5,'문국대');
  
-- 공지사항분류 예제데이터 (pf_notice_category)
INSERT INTO pf_notice_category (category_no, name) VALUES(0, "미분류");
INSERT INTO pf_notice_category (category_no, name) VALUES(1, "로그인관련");
INSERT INTO pf_notice_category (category_no, name) VALUES(2, "상품관련");
INSERT INTO pf_notice_category (category_no, name) VALUES(3, "결제관련");
INSERT INTO pf_notice_category (category_no, name) VALUES(4, "배송관련");
INSERT INTO pf_notice_category (category_no, name) VALUES(5, "유형5");
INSERT INTO pf_notice_category (category_no, name) VALUES(6, "유형6");
INSERT INTO pf_notice_category (category_no, name) VALUES(7, "유형7");
INSERT INTO pf_notice_category (category_no, name) VALUES(8, "유형8");
INSERT INTO pf_notice_category (category_no, name) VALUES(9, "유형9"); 
INSERT INTO pf_notice_category (category_no, name) VALUES(10, "유형10");
INSERT INTO pf_notice_category (category_no, name) VALUES(11, "유형11");
INSERT INTO pf_notice_category (category_no, name) VALUES(12, "유형12");
INSERT INTO pf_notice_category (category_no, name) VALUES(13, "유형13");

-- 공지사항 예제데이터 (pf_notice)
INSERT INTO pf_notice (board_no, category_no) VALUES(11,1);
INSERT INTO pf_notice (board_no, category_no) VALUES(12,2);
INSERT INTO pf_notice (board_no, category_no) VALUES(13,3);
INSERT INTO pf_notice (board_no, category_no) VALUES(14,4);
INSERT INTO pf_notice (board_no, category_no) VALUES(15,5);
INSERT INTO pf_notice (board_no, category_no) VALUES(16,6);
INSERT INTO pf_notice (board_no, category_no) VALUES(17,7);
INSERT INTO pf_notice (board_no, category_no) VALUES(18,8);
INSERT INTO pf_notice (board_no, category_no) VALUES(19,9);
INSERT INTO pf_notice (board_no, category_no) VALUES(20,10);

-- 질문분류 예제데이터 (pf_question_category)
INSERT INTO pf_question_category(category_no, name) VALUES(1, "질문유형1");
INSERT INTO pf_question_category(category_no, name) VALUES(2, "질문유형2");
INSERT INTO pf_question_category(category_no, name) VALUES(3, "질문유형3");
INSERT INTO pf_question_category(category_no, name) VALUES(4, "질문유형4");
INSERT INTO pf_question_category(category_no, name) VALUES(5, "질문유형5");

-- qna질문 예제데이터 (pf_qna)
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(21, 1, 5, 1, 1, 1, "내용입니다", "2020-04-01 00:00:00");
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(22, 2, 1, 1, 0, 1, "내용입니다", "2020-04-01 00:00:00");
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(23, 3, 1, 0, 1, 0, "내용입니다", "2020-04-01 00:00:00");
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(24, 4, 2, 0, 0, 0, "내용입니다", "2020-04-01 00:00:00");
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(25, 5, 2, 0, 0, 0, "내용입니다", "2020-04-02 00:00:00");
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(26, 6, 2, 0, 1, 1, "내용입니다", "2020-04-02 00:00:00");
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(27, 7, 3, 1, 1, 0, "내용입니다", "2020-04-02 00:00:00");
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(28, 8, 3, 0, 0, 1, "내용입니다", "2020-04-02 00:00:00");
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(29, 9, 3, 0, 0, 0, "내용입니다", "2020-04-02 00:00:00");
INSERT INTO pf_qna(board_no, member_no, category_no, readable, email_notification, sms_notification, content, answer_date)
VALUES(30,10,4, 1, 1, 1, "내용입니다", "2020-04-01 00:00:00");

-- faq 질문 예제데이터 (pf_faq)
INSERT INTO pf_faq(board_no, category_no, readable, answer_content, answer_date)
VALUES(41, 5, 1, "내용입니다", "2020-05-01 00:00:00");
INSERT INTO pf_faq(board_no, category_no, readable, answer_content, answer_date)
VALUES(42, 1, 1, "내용입니다", "2020-05-01 00:00:00");
INSERT INTO pf_faq(board_no, category_no, readable, answer_content, answer_date)
VALUES(43, 1, 0, "내용입니다", "2020-05-01 00:00:00");
INSERT INTO pf_faq(board_no, category_no, readable, answer_content, answer_date)
VALUES(44, 2, 0, "내용입니다", "2020-05-01 00:00:00");
INSERT INTO pf_faq(board_no, category_no, readable, answer_content, answer_date)
VALUES(45, 2, 0, "내용입니다", "2020-05-02 00:00:00");
INSERT INTO pf_faq(board_no, category_no, readable, answer_content, answer_date)
VALUES(46, 2, 0, "내용입니다", "2020-05-02 00:00:00");
INSERT INTO pf_faq(board_no,  category_no, readable, answer_content, answer_date)
VALUES(47, 3, 1, "내용입니다", "2020-05-02 00:00:00");
INSERT INTO pf_faq(board_no, category_no, readable, answer_content, answer_date)
VALUES(48, 3, 0, "내용입니다", "2020-05-02 00:00:00");
INSERT INTO pf_faq(board_no, category_no, readable, answer_content, answer_date)
VALUES(49, 3, 0, "내용입니다", "2020-05-02 00:00:00");
INSERT INTO pf_faq(board_no, category_no, readable, answer_content, answer_date)
VALUES(50, 4, 1, "내용입니다", "2020-05-01 00:00:00");

-- 게시글추천 예제데이터 (pf_recommendation)
INSERT INTO pf_recommendation(board_no, member_no) VALUES (1, 1);
INSERT INTO pf_recommendation(board_no, member_no) VALUES (2, 2);
INSERT INTO pf_recommendation(board_no, member_no) VALUES (3, 3);
INSERT INTO pf_recommendation(board_no, member_no) VALUES (4, 4);
INSERT INTO pf_recommendation(board_no, member_no) VALUES (5, 5);

-- 포트폴리오파일 예제데이터 (pf_board_attachment)
INSERT INTO pf_board_attachment(attachment_no, board_no, file_name, file_path)
 VALUES(1, 5, "file1.jpg", "c:\file1\file1.jpg");
INSERT INTO pf_board_attachment(attachment_no, board_no, file_name, file_path)
 VALUES(2, 13, "file2.jpg", "c:\file1\file2.jpg");
INSERT INTO pf_board_attachment(attachment_no, board_no, file_name, file_path)
 VALUES(3, 15, "file3.jpg", "c:\file1\file3.jpg");
INSERT INTO pf_board_attachment(attachment_no, board_no, file_name, file_path)
 VALUES(4, 20, "file4.jpg", "c:\file1\file4.jpg");
INSERT INTO pf_board_attachment(attachment_no, board_no, file_name, file_path)
 VALUES(5, 30, "file5.jpg", "c:\file1\file5.jpg");
 
-- pf_job_posting 채용공고 (pf_company_member 인서트 후(완), pf_final_education인서트 후)
INSERT INTO pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,
year_salary,readable,minimum_education_no,employment_stat_no)
  VALUES(1,6,'프론트엔드 개발자 모집','내용1',1,1,1,NOW(),'2020-1-1','2020-2-2','프론트엔드',
  26000000,1,1,1);  
INSERT INTO pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,
year_salary,readable,minimum_education_no,employment_stat_no)
  VALUES(2,7,'백엔드 개발자 모집','내용2',2,2,2,NOW(),'2020-2-2','2020-3-3','백엔드',
  28000000,2,2,2);  
INSERT INTO pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,
year_salary,readable,minimum_education_no,employment_stat_no)
  VALUES(3,8,'서버 개발자 모집','내용3',3,3,3,NOW(),'2020-3-3','2020-4-4','서버개발',
  30000000,3,3,3);  
INSERT INTO pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,
year_salary,readable,minimum_education_no,employment_stat_no)
  VALUES(4,9,'자바 개발자 모집','내용4',4,4,4,NOW(),'2020-4-4','2020-5-5','자바',
  32000000,4,4,4);  
INSERT INTO pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,
year_salary,readable,minimum_education_no,employment_stat_no)
  VALUES(5,10,'풀스택 개발자 모집','내용5',5,5,5,NOW(),'2020-5-5','2020-6-6','풀스택',
  34000000,5,5,5);  
  
-- pf_apply (pf_job_posting 인서트 후)
INSERT INTO pf_apply(apply_no, general_member_no, job_posting_no) VALUES(1, 1, 1);
INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(2, 2);
INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(3, 4);
INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(4, 5);
INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(1, 2);
 
-- pf_job_posting_file 채용공고첨부파일 데이터  (pf_job_posting 인서트 후)
INSERT INTO pf_job_posting_file(job_posting_file_no,job_posting_no,file_path) VALUES(1,1,'/file/path'); 
INSERT INTO pf_job_posting_file(job_posting_file_no,job_posting_no,file_path) VALUES(2,2,'/file/path'); 
INSERT INTO pf_job_posting_file(job_posting_file_no,job_posting_no,file_path) VALUES(3,3,'/file/path'); 
INSERT INTO pf_job_posting_file(job_posting_file_no,job_posting_no,file_path) VALUES(4,4,'/file/path'); 
INSERT INTO pf_job_posting_file(job_posting_file_no,job_posting_no,file_path) VALUES(5,5,'/file/path');  
  
-- pf_company_required_major 기업요구전공 데이터 (pf_job_posting 인서트 후)
INSERT INTO pf_company_required_major(major_no, job_posting_no) VALUES(1,1);
INSERT INTO pf_company_required_major(major_no, job_posting_no) VALUES(2,2);
INSERT INTO pf_company_required_major(major_no, job_posting_no) VALUES(3,3);
INSERT INTO pf_company_required_major(major_no, job_posting_no) VALUES(4,4);
INSERT INTO pf_company_required_major(major_no, job_posting_no) VALUES(5,5); 
  
-- pf_job_recommendation 채용추천 (pf_job_posting 인서트 후)
INSERT INTO pf_job_recommendation (general_member_no,job_posting_no) VALUES(1,1);
INSERT INTO pf_job_recommendation (general_member_no,job_posting_no) VALUES(2,2);
INSERT INTO pf_job_recommendation (general_member_no,job_posting_no) VALUES(3,3);
INSERT INTO pf_job_recommendation (general_member_no,job_posting_no) VALUES(4,4);
INSERT INTO pf_job_recommendation (general_member_no,job_posting_no) VALUES(5,5);  
    
-- pf_company_required_certificate 기업요구자격증 (pf_job_posting 인서트 후)
INSERT INTO pf_company_required_certificate  (certificate_no,job_posting_no) VALUES(1322,1);
INSERT INTO pf_company_required_certificate  (certificate_no,job_posting_no) VALUES(1320,2);
INSERT INTO pf_company_required_certificate  (certificate_no,job_posting_no) VALUES(1325,3);
INSERT INTO pf_company_required_certificate  (certificate_no,job_posting_no) VALUES(2290,4);
INSERT INTO pf_company_required_certificate  (certificate_no,job_posting_no) VALUES(2434,5);  

-- pf_general_mem_edu 일반회원학력 데이터(pf_final_education 인서트 후)
INSERT INTO pf_general_mem_edu(general_member_no,education_no,school_name) VALUES(1,1,'서울대학교');
INSERT INTO pf_general_mem_edu(general_member_no,education_no,school_name) VALUES(2,2,'고려대학교');
INSERT INTO pf_general_mem_edu(general_member_no,education_no,school_name) VALUES(3,3,'연세대학교');
INSERT INTO pf_general_mem_edu(general_member_no,education_no,school_name) VALUES(4,4,'세종대학교');
INSERT INTO pf_general_mem_edu(general_member_no,education_no,school_name) VALUES(5,5,'한양대학교');

-- pf_general_mem_edu_major 일반회원학력전공(pf_general_mem_edu 인서트 후)
INSERT INTO pf_general_mem_edu_major (general_member_no,education_no,major_no) VALUES(1,1,1);
INSERT INTO pf_general_mem_edu_major (general_member_no,education_no,major_no) VALUES(2,2,2);
INSERT INTO pf_general_mem_edu_major (general_member_no,education_no,major_no) VALUES(3,3,3);
INSERT INTO pf_general_mem_edu_major (general_member_no,education_no,major_no) VALUES(4,4,4);
INSERT INTO pf_general_mem_edu_major (general_member_no,education_no,major_no) VALUES(5,5,5);
  
-- interest_location (pf_country_district 인서트 후)
INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(1, 1);
INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(2, 3);
INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(3, 4);
INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(3, 2);
INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(5, 3);
INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(4, 4);
INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(5, 1);

-- 일반회원관심분야 샘플 데이터(pf_general_member_interest)
INSERT INTO pf_general_member_interest(general_member_no, field_no) VALUES(1, 4);
INSERT INTO pf_general_member_interest(general_member_no, field_no) VALUES(2, 8);
INSERT INTO pf_general_member_interest(general_member_no, field_no) VALUES(2, 9);
INSERT INTO pf_general_member_interest(general_member_no, field_no) VALUES(2, 10);
INSERT INTO pf_general_member_interest(general_member_no, field_no) VALUES(4, 1);
INSERT INTO pf_general_member_interest(general_member_no, field_no) VALUES(4, 5);
INSERT INTO pf_general_member_interest(general_member_no, field_no) VALUES(5, 6);
INSERT INTO pf_general_member_interest(general_member_no, field_no) VALUES(5, 7);
INSERT INTO pf_general_member_interest(general_member_no, field_no) VALUES(5, 3);

-- 일정(개인용) 샘플 데이터(pf_schedule)
INSERT INTO pf_schedule(general_member_no, start_date, end_date, content) VALUES(1, '2020-05-01', '2020-07-01', 'TOEIC');
INSERT INTO pf_schedule(general_member_no, end_date, content) VALUES(1, '2020-08-11', '정보처리기사');
INSERT INTO pf_schedule(general_member_no, content) VALUES(1, '우아한형제들 날짜 확인할것');
INSERT INTO pf_schedule(general_member_no, start_date, end_date, content) VALUES(3, '2020-03-01', '2020-07-01', '1일 1알고리즘');
INSERT INTO pf_schedule(general_member_no, end_date, content) VALUES(3, '2020-08-11', '카카오 코딩 테스트');
INSERT INTO pf_schedule(general_member_no, end_date, content) VALUES(3, '2020-09-10', '카카오 1차 면접');
INSERT INTO pf_schedule(general_member_no, start_date, end_date, content) VALUES(5, '2020-01-01', '2020-06-01', 'SSAPY 활동 기간');
INSERT INTO pf_schedule(general_member_no, start_date, content) VALUES(5, '2020-06-10', '취업 준비 시작');
INSERT INTO pf_schedule(general_member_no, content) VALUES(5, '기업 공고 찾아보기');