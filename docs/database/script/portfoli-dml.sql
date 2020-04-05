-- MOD

ALTER TABLE pf_general_member MODIFY COLUMN general_member_no INTEGER NOT NULL COMMENT '일반회원번호';

ALTER TABLE pf_company_member MODIFY COLUMN company_member_no INTEGER NOT NULL COMMENT '기업회원번호';

ALTER TABLE pf_certificate MODIFY COLUMN certificate_no INTEGER NOT NULL COMMENT '자격증번호';

ALTER TABLE pf_certificate DROP issue_date;

ALTER TABLE pf_certificate DROP expiration_date;

--pf_members;

INSERT INTO pf_members(member_no, id, password, name, post_no, basic_address, email, tel, sms_yn, email_yn) VALUES (1, 'yh0921k', PASSWORD('1111'), '김용희', '06611', '서울특별시 서초구 강남대로 459 (서초동, 백암빌딩)', 'yh0921k@gmail.com', '010-1234-5678', 1, 1);

INSERT INTO pf_members(id, password, name, email, tel, sms_yn, email_yn) VALUES ('moonsolid', PASSWORD('2222'), '문국태', 'moonsolid@naver.com', '010-9876-5432', 1, 1);

INSERT INTO pf_members(id, password, name, email, tel, sms_yn, email_yn) VALUES ('oreotaste', PASSWORD('3333'), '손영쿡', 'oreotaste@daum.net', '010-2345-6789', 1, 1);

INSERT INTO pf_members(id, password, name, post_no, basic_address, email, tel, sms_yn, email_yn) VALUES ('juljasong', PASSWORD('4444'), '윤리아', '06621', '서울특별시 서초구 서초대로74길 33(서초동, 비트빌)', 'juljasong@gmail.com', '010-4567-8901', 1, 1);

INSERT INTO pf_members(id, password, name, email, tel, sms_yn, email_yn) VALUES ('jeoneunhee', PASSWORD('5555'), '전은희', 'jeoneunhee@naber.com', '010-1234-5674', 1, 1);

INSERT INTO pf_members(id, password, name, post_no, basic_address, email, tel, sms_yn, email_yn) VALUES ('warple', PASSWORD('6666'), '노정진', '63091', '제주특별자치도 제주시 1100로 3198-13(노형동)', 'contact_us@warple.co.kr', '010-2754-3257', 1, 1);

INSERT INTO pf_members(id, password, name, post_no, basic_address, detail_address, email, tel, sms_yn, email_yn) VALUES ('baegopa', PASSWORD('7777'), '김홍준', '05544', '서울특별시 송파 구 위례성대로 2(방이동, 장은빌딩)', '2층', 'help@baegopa.com', '010-4312-6754', 1, 1);

INSERT INTO pf_members(id, password, name, post_no, basic_address, email, tel, sms_yn, email_yn) VALUES ('hmarket', PASSWORD('8888'), '광병진', '06236', '서울특별시 강남구 테헤란로(역삼 동, 강남파이낸스센터)', 'hmk_cs@corp.hmarket.co.kr', '010-4952-6589', 1, 1);

INSERT INTO pf_members(id, password, name, post_no, basic_address, detail_address,  email, tel, sms_yn, email_yn) VALUES ('mosinna', PASSWORD('9999'), '김정우', '06017', '서울특별시 남구 언주로174길 30(신사동, 로빈명품관)', '지하1층', 'help@mosinna.com', '010-2394-3958', 1, 1);

INSERT INTO pf_members(id, password, name, post_no, basic_address, detail_address, email, tel, sms_yn, email_yn) VALUES ('planningadd', PASSWORD('1010'), '김성수', '13637', '경기도 성남시 분당구 구미로9번길 10(구미동, 세종그랑시아II)', '1-230', 'planning1@naver.com', '010-4958-9068', 1, 1);

-- pf_general_member

INSERT INTO pf_general_member(general_member_no, seeking_flag, photo, membership, career) VALUES (1, 1, 'photo2394823jfshf.jpg', 'Portfoli Pro', 5);

INSERT INTO pf_general_member(general_member_no, seeking_flag, photo, membership, career) VALUES (2, 1, 'photo2dfsadf23jfshf.jpg', 'Portfoli Basic', 2);

INSERT INTO pf_general_member(general_member_no, seeking_flag, membership, career) VALUES (3, 1, 'none', 4);

INSERT INTO pf_general_member(general_member_no, seeking_flag, membership) VALUES (4, 0, 'Portfoli Pro');

INSERT INTO pf_general_member(general_member_no, seeking_flag, membership, career) VALUES (5, 1, 'Portfoli Basic', 1);

-- pf_company

INSERT INTO pf_company(company_no, business_registration_no, name, tel) VALUES (1, '201-81-64418', '워플', '064-903-1555');

INSERT INTO pf_company(business_registration_no, name, tel) VALUES ('120-87-65764', '배고파', '1600-0988');

INSERT INTO pf_company(business_registration_no, name, tel) VALUES ('220-81-83678', 'Hmarket', '1566-5700');

INSERT INTO pf_company(business_registration_no, name, tel) VALUES ('211-88-79575', '모신나', '1544-7200');

INSERT INTO pf_company(business_registration_no, name, tel) VALUES ('129-86-50524', '플래닝애드', '070-8680-6620');

-- pf_company_member

INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (6, '대리', 1);

INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (7, '인사담당', 2);

INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (8, '인사담당', 3);

INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (9, '인사담당', 4);

INSERT INTO pf_company_member(company_member_no, position, company_no) VALUES (10, '대표', 5);

-- pf_following

INSERT INTO pf_following(follower, following) VALUES(1, 2);

INSERT INTO pf_following(follower, following) VALUES(2, 3);

INSERT INTO pf_following(follower, following) VALUES(4, 7);

INSERT INTO pf_following(follower, following) VALUES(10, 4);

INSERT INTO pf_following(follower, following) VALUES(8, 5);

-- pf_certificate

INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(1322, '한국산업인력공단', '전자계산기조직응용기사');

INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(1320, '한국산업인력공단', '정보처리기사');

INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(1325, '한국인터넷진흥원', '정보보안기사');

INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(2290, '한국산업인력공단', '정보처리산업기사');

INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(2434, '한국산업인력공단', '시각디자인산업기사');

INSERT INTO pf_certificate(certificate_no, agency, name) VALUES(1790, '한국산업인력공단', '시각디자인기사');

-- pf_general_member_certification

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

-- pf_interest_location

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(1, 1);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(2, 3);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(3, 4);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(3, 2);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(5, 3);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(4, 4);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(5, 1);






-- pf_bookmark (pf_portfolio 인서트 후)

INSERT INTO pf_bookmark(board_no, member_no) VALUES(1, 2);

INSERT INTO pf_bookmark(board_no, member_no) VALUES(2, 2);

INSERT INTO pf_bookmark(board_no, member_no) VALUES(3, 4);

INSERT INTO pf_bookmark(board_no, member_no) VALUES(4, 5);

INSERT INTO pf_bookmark(board_no, member_no) VALUES(5, 8);

-- pf_apply (job_posting 인서트 후)

INSERT INTO pf_apply(apply_no, general_member_no, job_posting_no) VALUES(1, 1, 1);

INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(2, 2);

INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(3, 4);

INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(4, 5);

INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(1, 2);
