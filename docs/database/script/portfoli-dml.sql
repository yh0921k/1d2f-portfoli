-- 회원 예제 데이터

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


-- 게시글 예제 데이터 (pf_board)
Insert into pf_board (board_no, title, content, view_count, registered_date)
 values(1, "제목1", "내용1", 3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (2,"제목2","내용2",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (3,"제목3","내용3",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (4,"제목4","내용4",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date, attachment)
values (5,"제목5","내용5",3, "2020-04-01 00:00:00", 1);
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (6,"제목6","내용6",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (7,"제목7","내용7",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (8,"제목8","내용8",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (9,"제목9","내용9",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (10,"제목10","내용10",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (11,"제목11","내용11",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (12,"제목12","내용12",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (13,"제목13","내용13",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (14,"제목14","내용14",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (15,"제목15","내용15",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (16,"제목16","내용16",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (17,"제목17","내용17",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (18,"제목18","내용18",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (19,"제목19","내용19",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (20,"제목20","내용20",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (21,"제목21","내용21",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (22,"제목22","내용22",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (23,"제목23","내용23",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (24,"제목24","내용24",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (25,"제목25","내용25",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (26,"제목26","내용26",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (27,"제목27","내용27",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (28,"제목28","내용28",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (29,"제목29","내용29",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date, attachment)
values (30,"제목30","내용30",3, "2020-04-01 00:00:00", 4);
Insert into pf_board (board_no, title, content, view_count, registered_date)
 values(31, "제목31", "내용31", 3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
 values(32, "제목32", "내용32", 0, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (33,"제목33","내용33",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (34,"제목34","내용34",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date, attachment)
values (35,"제목35","내용35",3, "2020-04-01 00:00:00", 5);
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (36,"제목36","내용36",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (37,"제목37","내용37",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (38,"제목38","내용38",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (39,"제목39","내용39",3, "2020-04-01 00:00:00");
Insert into pf_board (board_no, title, content, view_count, registered_date)
values (40,"제목40","내용40",3, "2020-04-01 00:00:00");


-- 일반회원 예제 데이터

INSERT INTO pf_general_member(general_member_no, seeking_flag, photo, membership, career) VALUES (1, 1, 'photo2394823jfshf.jpg', 'Portfoli Pro', 5);

INSERT INTO pf_general_member(general_member_no, seeking_flag, photo, membership, career) VALUES (2, 1, 'photo2dfsadf23jfshf.jpg', 'Portfoli Basic', 2);

INSERT INTO pf_general_member(general_member_no, seeking_flag, membership, career) VALUES (3, 1, 'none', 4);

INSERT INTO pf_general_member(general_member_no, seeking_flag, membership) VALUES (4, 0, 'Portfoli Pro');

INSERT INTO pf_general_member(general_member_no, seeking_flag, membership, career) VALUES (5, 1, 'Portfoli Basic', 1);



-- 포트폴리오 예제데이터 (pf_portfolio) pf_general_member뒤에(완료)
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(31,1,”www.naver.com”, "c:\folder1\folder2\file1.jpg", 1, 1);
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(32,1,”www.daum.com”, "c:\folder1\folder2\file2.jpg", 0, 0);
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(33,1,”www. daum.com”, "c:\folder1\folder2\file3.jpg", 3, 1);
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(34,1,”www.daum.com”, "c:\folder1\folder2\file4.jpg", 0, 1);
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(35,1,”www.daum.com”, "c:\folder1\folder2\file5.jpg", 0, 1);
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(36,2,”www.daum.com”, "c:\folder1\file1.jpg", 0, 1);
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(37,2,”www.google.com”, "c:\folder1\folder2\file1.jpg", 3, 0);
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(38,2,”www.daum.com”, "c:\folder1\folder2\file2.jpg", 1, 1);
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(39,3,”www.google.com”, "c:\ folder2\file3.jpg", 0, 0);
Insert into pf_portfolio (board_no, general_member_no, homepage, thumbnail, recommended_count, readable) values(40,3,”www.google.com”, "c:\folder1\folder2\file4.jpg", 0, 1);



-- 기업 예제 데이터

INSERT INTO pf_company(company_no, business_registration_no, name, tel) VALUES (1, '201-81-64418', '워플', '064-903-1555');

INSERT INTO pf_company(business_registration_no, name, tel) VALUES ('120-87-65764', '배고파', '1600-0988');

INSERT INTO pf_company(business_registration_no, name, tel) VALUES ('220-81-83678', 'Hmarket', '1566-5700');

INSERT INTO pf_company(business_registration_no, name, tel) VALUES ('211-88-79575', '모신나', '1544-7200');

INSERT INTO pf_company(business_registration_no, name, tel) VALUES ('129-86-50524', '플래닝애드', '070-8680-6620');

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

INSERT INTO 
(certificate_no, agency, name) VALUES(1790, '한국산업인력공단', '시각디자인기사');

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

INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) values(1, 1, 2, '안녕하세요~', '저랑 맞팔하실래요?', '2020-1-1', '2020-1-2', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, message_sender_delete, 
message_receiver_delete) values(2, 2, 3, '반가워요~', '취업 정보 같이 공유해요!', '2020-2-10', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) values(3, 4, 5, '쪽지제목3', '쪽지내용3', '2020-2-13', '2020-2-15', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) values(4, 5, 4, '쪽지제목4', '쪽지내용4', '2020-2-15', '2020-2-16', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, message_sender_delete, 
message_receiver_delete) values(5, 6, 7, '쪽지제목5', '쪽지내용5', '2020-2-16', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) values(6, 6, 8, '쪽지제목6', '쪽지내용6', '2020-2-13', '2020-2-21', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) values(7, 1, 9, '쪽지제목7', '쪽지내용7', '2020-2-13', '2020-2-21', 0, 0);
INSERT INTO pf_message(message_no, message_sender, message_receiver, title, content, send_date, receive_date, message_sender_delete, message_receiver_delete) values(8, 9, 1, '쪽지제목8', '쪽지내용8', '2020-2-13', '2020-2-21', 0, 0);

-- 첨부파일(쪽지) 예제 데이터
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(1, 1, 'image.png', '.data/note/note1.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(2, 1, 'image2.png', '.data/note/note1.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(3, 1, 'image3.png', '.data/note/note1.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(4, 2, 'image.png', '.data/note/note4.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(5, 3, 'image.png', '.data/note/note5.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(6, 4, 'image.png', '.data/note/note6.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(7, 4, 'image2.png', '.data/note/note7.png');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(8, 5, 'image.jpg', '.data/note/note8.jpg');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(9, 5, 'image2.jpg', '.data/note/note9.jpg');
INSERT INTO pf_attachments(file_no, message_no, file_name, file_path) values(10, 6, 'image.png', '.data/note/note10.png');

-- 판매상품 예제 데이터
INSERT INTO pf_product(product_no, name, duration, price) values(1, 'Portfoli Basic', 0, 8800);
INSERT INTO pf_product(product_no, name, duration, price) values(2, 'Portfoli Pro', 0, 29800);

-- 결제수단 예제 데이터
INSERT INTO pf_payment_method(payment_method) values('무통장입금');
INSERT INTO pf_payment_method(payment_method) values('카드결제');
INSERT INTO pf_payment_method(payment_method) values('휴대폰결제');

-- 결제 예제 데이터
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) values(1, 2, 1, 1, 1, '2020-4-1 12:00:00');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) values(2, 4, 2, 3, 1, '2020-4-1 13:10:20');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) values(3, 5, 1, 3, 1, '2020-4-2 14:24:30');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) values(4, 6, 1, 2, 1, '2020-4-3 15:48:20');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat, pay_date) values(5, 7, 1, 1, 1, '2020-4-4 17:01:03');
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat) values(6, 8, 1, 1, 1);
INSERT INTO pf_payment(pay_no, member_no, product_no, payment_method_no, stat) values(7, 9, 2, 3, 1);

-- 알림분류 예제 데이터
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) values(1,  '새 쪽지가 도착했습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) values(2,  '일주일 뒤 마감되는 일정이 있습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) values(3,  '3일 뒤 마감되는 일정이 있습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) values(4,  '2일 뒤 마감되는 일정이 있습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) values(5,  '1일 뒤 마감되는 일정이 있습니다.');
INSERT INTO pf_alarm_class(alarm_class_no, alarm_class) values(6,  '오늘 마감되는 일정이 있습니다.');

-- 알림 예제 데이터
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(1, 1, 1,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(2, 1, 2,  '내용2');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(3, 2, 1,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(4, 3, 3,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(5, 4, 4,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(6, 5, 5,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(7, 6, 6,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(8, 6, 1,  '내용2');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(9, 7, 1,  '내용1');
INSERT INTO pf_alarm(alarm_no, member_no, alarm_class_no, content) values(10, 8, 1,  '내용1');

-- 배너 예제 데이터
INSERT INTO pf_banner(banner_no, company_no, image, url, register_date, end_date) values(1, 1, '.data/banner1.png', 'https://plus-ex.com/', '2020-3-1 08:00:00', '2020-03-31 23:59:59');
INSERT INTO pf_banner(banner_no, company_no, image, url, register_date, end_date) values(2, 3, '.data/banner2.png', 'http://sampartners.co.kr/', '2020-3-1 08:00:00', '2020-03-31 23:59:59');
INSERT INTO pf_banner(banner_no, company_no, image, url, register_date, end_date) values(3, 4, '.data/banner3.png', 'https://linepluscorp.com/', '2020-3-1 08:00:00', '2020-03-31 23:59:59');
INSERT INTO pf_banner(company_no, image, url, register_date, end_date) values(2, '.data/banner/banner4.png', 'http://www.woowahan.com/', '2020-4-1 08:00:00', '2020-04-30 23:59:59');
INSERT INTO pf_banner(company_no, image, url, register_date, end_date) values(5, '.data/banner/banner5.png', 'https://www.kakaocorp.com/', '2020-4-1 08:00:00', '2020-04-30 23:59:59');

-- 신고분류 예제 데이터
INSERT INTO pf_report_class(report_class_no, report_class) values(1, '도배');
INSERT INTO pf_report_class(report_class_no, report_class) values(2, '타인 비방');
INSERT INTO pf_report_class(report_class_no, report_class) values(3, '저작물 무단 도용');
INSERT INTO pf_report_class(report_class_no, report_class) values(4, '상업적 홍보');
INSERT INTO pf_report_class(report_class_no, report_class) values(5, '기타');

-- 신고처리분류 예제 데이터
INSERT INTO pf_handle_class(handle_class) values('게시글 삭제');
INSERT INTO pf_handle_class(handle_class) values('1개월 정지');
INSERT INTO pf_handle_class(handle_class) values('3개월 정지');
INSERT INTO pf_handle_class(handle_class) values('회원 추방');

-- 신고 예제 데이터 (게시글 데이터 입력 후 insert(완))
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no, handle_class_no, handle_date, handle_content) values(1, 1, 2, 1, 1, '2020-4-1', '처리내용1');
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no, handle_class_no, handle_date, handle_content) values(2, 3, 4, 2, 2, '2020-4-2', '처리내용2');
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no, handle_class_no, handle_date, handle_content) values(3, 5, 6, 3, 4, '2020-4-2', '처리내용3');
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) values(4, 7, 8, 5);
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) values(5, 1, 3, 1);
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) values(6, 1, 8, 1);
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) values(7, 1, 9, 4);
INSERT INTO pf_report(board_no, reporter_no, target_no, report_class_no) values(8, 1, 3, 5);





-- pf_bookmark (pf_portfolio 인서트 후(완))

INSERT INTO pf_bookmark(board_no, member_no) VALUES(31, 2);

INSERT INTO pf_bookmark(board_no, member_no) VALUES(32, 2);

INSERT INTO pf_bookmark(board_no, member_no) VALUES(33, 4);

INSERT INTO pf_bookmark(board_no, member_no) VALUES(34, 5);

INSERT INTO pf_bookmark(board_no, member_no) VALUES(35, 8);



-- pf_employment_status 고용형태
insert into pf_employment_status(employment_stat_no,employment_stat_name)
  values(1,'정규직');
insert into pf_employment_status(employment_stat_no,employment_stat_name)
  values(2,'계약직');
insert into pf_employment_status(employment_stat_no,employment_stat_name)
  values(3,'인턴');
insert into pf_employment_status(employment_stat_no,employment_stat_name)
  values(4,'경력직');
insert into pf_employment_status(employment_stat_no,employment_stat_name)
  values(5,'파견직');

-- pf_major 전공 데이터
insert into pf_major(major_no, name)
  values(1,'손영국');
insert into pf_major(major_no, name)
  values(2,'김용휘');
insert into pf_major(major_no, name)
  values(3,'전은혜');
insert into pf_major(major_no, name)
  values(4,'송율리아');
insert into pf_major(major_no, name)
  values(5,'문국대');
  






-- 공지사항분류 예제데이터 (pf_notice_category)
Insert into pf_notice_category (notice_no, name) values(1, "제목1");
Insert into pf_notice_category (notice_no, name) values(2, "제목2");
Insert into pf_notice_category (notice_no, name) values(3, "제목3");
Insert into pf_notice_category (notice_no, name) values(4, "제목4");
Insert into pf_notice_category (notice_no, name) values(5, "제목5");
Insert into pf_notice_category (notice_no, name) values(6, "제목6");
Insert into pf_notice_category (notice_no, name) values(7, "제목7");
Insert into pf_notice_category (notice_no, name) values(8, "제목8");
Insert into pf_notice_category (notice_no, name) values(9, "제목9"); 
Insert into pf_notice_category (notice_no, name) values(10, "제목10");

-- 공지사항 예제데이터 (pf_notice)
Insert into pf_notice (board_no, notice_no) values(11,1);
Insert into pf_notice (board_no, notice_no) values(12,2);
Insert into pf_notice (board_no, notice_no) values(13,3);
Insert into pf_notice (board_no, notice_no) values(14,4);
Insert into pf_notice (board_no, notice_no) values(15,5);
Insert into pf_notice (board_no, notice_no) values(16,6);
Insert into pf_notice (board_no, notice_no) values(17,7);
Insert into pf_notice (board_no, notice_no) values(18,8);
Insert into pf_notice (board_no, notice_no) values(19,9);
Insert into pf_notice (board_no, notice_no) values(20,10);

-- 질문분류 예제데이터 (pf_question_class)
Insert into pf_question_class(question_no, category) values(1, "질문유형1");
Insert into pf_question_class(question_no, category) values(2, "질문유형2");
Insert into pf_question_class(question_no, category) values(3, "질문유형3");
Insert into pf_question_class(question_no, category) values(4, "질문유형4");
Insert into pf_question_class(question_no, category) values(5, "질문유형5");


-- qna질문 예제데이터 (pf_qna)
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(21, 1, 5, 1, 1, 1, "내용입니다", "2020-04-01 00:00:00");
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(22, 2, 1, 1, 0, 1, "내용입니다", "2020-04-01 00:00:00");
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(23, 3, 1, 0, 1, 0, "내용입니다", "2020-04-01 00:00:00");
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(24, 4, 2, 0, 0, 0, "내용입니다", "2020-04-01 00:00:00");
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(25, 5, 2, 0, 0, 0, "내용입니다", "2020-04-02 00:00:00");
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(26, 6, 2, 0, 1, 1, "내용입니다", "2020-04-02 00:00:00");
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(27, 7, 3, 1, 1, 0, "내용입니다", "2020-04-02 00:00:00");
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(28, 8, 3, 0, 0, 1, "내용입니다", "2020-04-02 00:00:00");
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(29, 9, 3, 0, 0, 0, "내용입니다", "2020-04-02 00:00:00");
Insert into pf_qna(board_no, member_no, question_no, readable, email_notification, sms_notification, content, answer_date)
values(30,10,4, 1, 1, 1, "내용입니다", "2020-04-01 00:00:00");



-- 게시글추천 예제데이터 (pf_recommendation)
Insert into pf_recommendation(board_no, member_no) values (1, 1);
Insert into pf_recommendation(board_no, member_no) values (2, 2);
Insert into pf_recommendation(board_no, member_no) values (3, 3);
Insert into pf_recommendation(board_no, member_no) values (4, 4);
Insert into pf_recommendation(board_no, member_no) values (5, 5);

-- 포트폴리오파일 예제데이터 (pf_portfolio_file)
Insert into pf_portfolio_file(portfolio_file_no, board_no, file_name, file_path)
 values(1, 5, "file1.jpg", "c:\file1\file1.jpg");
Insert into pf_portfolio_file(portfolio_file_no, board_no, file_name, file_path)
 values(2, 13, "file2.jpg", "c:\file1\file2.jpg");
Insert into pf_portfolio_file(portfolio_file_no, board_no, file_name, file_path)
 values(3, 15, "file3.jpg", "c:\file1\file3.jpg");
Insert into pf_portfolio_file(portfolio_file_no, board_no, file_name, file_path)
 values(4, 20, "file4.jpg", "c:\file1\file4.jpg");
Insert into pf_portfolio_file(portfolio_file_no, board_no, file_name, file_path)
 values(5, 30, "file5.jpg", "c:\file1\file5.jpg");


-------------------------------------------------------------------------------------------
-- 여기서부터 FK로 인해 입력불가함.

-- pf_job_posting 채용공고 (pf_company_member 인서트 후(완), pf_final_education인서트 후)
insert into pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,thumbnail,
year_salary,readable,minimum_education_no,employment_stat_no)
  values(1,6,'프론트엔드 개발자 모집','내용1',1,1,1,'2020-1-1','2020-1-1','2020-2-2','프론트엔드','www.google.com',
  26000000,1,1,1);  
insert into pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,thumbnail,
year_salary,readable,minimum_education_no,employment_stat_no)
  values(2,7,'백엔드 개발자 모집','내용2',2,2,2,'2020-2-2','2020-2-2','2020-3-3','백엔드','www.google.com',
  28000000,2,2,2);  
insert into pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,thumbnail,
year_salary,readable,minimum_education_no,employment_stat_no)
  values(3,8,'서버 개발자 모집','내용3',3,3,3,'2020-3-3','2020-3-3','2020-4-4','서버개발','www.google.com',
  30000000,3,3,3);  
insert into pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,thumbnail,
year_salary,readable,minimum_education_no,employment_stat_no)
  values(4,9,'자바 개발자 모집','내용4',4,4,4,'2020-4-4','2020-4-4','2020-5-5','자바','www.google.com',
  32000000,4,4,4);  
insert into pf_job_posting (job_posting_no,company_member_no,title,content,work_place_no,
minimum_career,view_count,posting_registration,start_dated,end_dated,job,thumbnail,
year_salary,readable,minimum_education_no,employment_stat_no)
  values(5,10,'풀스택 개발자 모집','내용5',5,5,5,'2020-5-5','2020-5-5','2020-6-6','풀스택','www.google.com',
  34000000,5,5,5);  
  



-- pf_apply (pf_job_posting 인서트 후)

INSERT INTO pf_apply(apply_no, general_member_no, job_posting_no) VALUES(1, 1, 1);

INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(2, 2);

INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(3, 4);

INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(4, 5);

INSERT INTO pf_apply(general_member_no, job_posting_no) VALUES(1, 2);



 
-- pf_job_posting_file 채용공고첨부파일 데이터  (pf_job_posting 인서트 후)
insert into pf_job_posting_file(job_posting_file_no,job_posting_no,file_path)
  values(1,1,'/file/path'); 
insert into pf_job_posting_file(job_posting_file_no,job_posting_no,file_path)
  values(2,2,'/file/path'); 
insert into pf_job_posting_file(job_posting_file_no,job_posting_no,file_path)
  values(3,3,'/file/path'); 
insert into pf_job_posting_file(job_posting_file_no,job_posting_no,file_path)
  values(4,4,'/file/path'); 
insert into pf_job_posting_file(job_posting_file_no,job_posting_no,file_path)
  values(5,5,'/file/path');  
  
-- pf_company_required_major 기업요구전공 데이터 (pf_job_posting 인서트 후)
insert into pf_company_required_major(major_no, job_posting_no)
  values(1,1);
insert into pf_company_required_major(major_no, job_posting_no)
  values(2,2);
insert into pf_company_required_major(major_no, job_posting_no)
  values(3,3);
insert into pf_company_required_major(major_no, job_posting_no)
  values(4,4);
insert into pf_company_required_major(major_no, job_posting_no)
  values(5,5); 
  
-- pf_job_recommendation 채용추천 (pf_job_posting 인서트 후)
insert into pf_job_recommendation (general_member_no,job_posting_no)
  values(1,1);
insert into pf_job_recommendation (general_member_no,job_posting_no)
  values(2,2);
insert into pf_job_recommendation (general_member_no,job_posting_no)
  values(3,3);
insert into pf_job_recommendation (general_member_no,job_posting_no)
  values(4,4);
insert into pf_job_recommendation (general_member_no,job_posting_no)
  values(5,5);  
  

  
-- pf_company_required_certificate 기업요구자격증 (pf_job_posting 인서트 후)
insert into pf_company_required_certificate  (certificate_no,job_posting_no)
  values(1322,1);
insert into pf_company_required_certificate  (certificate_no,job_posting_no)
  values(1320,2);
insert into pf_company_required_certificate  (certificate_no,job_posting_no)
  values(1325,3);
insert into pf_company_required_certificate  (certificate_no,job_posting_no)
  values(2290,4);
insert into pf_company_required_certificate  (certificate_no,job_posting_no)
  values(2434,5);  



-- pf_general_mem_edu 일반회원학력 데이터(pf_final_education 인서트 후)
insert into pf_general_mem_edu(general_member_no,education_no,school_name)
  values(1,1,'서울대학교');
insert into pf_general_mem_edu(general_member_no,education_no,school_name)
  values(1,1,'고려대학교');
insert into pf_general_mem_edu(general_member_no,education_no,school_name)
  values(1,1,'연세대학교');
insert into pf_general_mem_edu(general_member_no,education_no,school_name)
  values(1,1,'세종대학교');
insert into pf_general_mem_edu(general_member_no,education_no,school_name)
  values(1,1,'한양대학교');


-- pf_general_mem_edu_major 일반회원학력전공(pf_general_mem_edu 인서트 후)
insert into pf_general_mem_edu_major (general_member_no,education_no,major_no)
  values(1,1,1);
insert into pf_general_mem_edu_major (general_member_no,education_no,major_no)
  values(2,2,2);
insert into pf_general_mem_edu_major (general_member_no,education_no,major_no)
  values(3,3,3);
insert into pf_general_mem_edu_major (general_member_no,education_no,major_no)
  values(4,4,4);
insert into pf_general_mem_edu_major (general_member_no,education_no,major_no)
  values(5,5,5);

  
-- interest_location (pf_country_district 인서트 후)

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(1, 1);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(2, 3);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(3, 4);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(3, 2);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(5, 3);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(4, 4);

INSERT INTO pf_interest_location(general_member_no, location_no) VALUES(5, 1);


-- 포트폴리오구성기술 예제데이터 (pf_member_skill 인서트 후)
Insert into pf_portfolio_skill(board_no, member_skill_no) values(31, 1);
Insert into pf_portfolio_skill(board_no, member_skill_no) values(32, 1);
Insert into pf_portfolio_skill(board_no, member_skill_no) values(33, 2);
Insert into pf_portfolio_skill(board_no, member_skill_no) values(34, 2);
Insert into pf_portfolio_skill(board_no, member_skill_no) values(35, 2);
Insert into pf_portfolio_skill(board_no, member_skill_no) values(36, 2);
Insert into pf_portfolio_skill(board_no, member_skill_no) values(37, 3);
Insert into pf_portfolio_skill(board_no, member_skill_no) values(38, 3);
Insert into pf_portfolio_skill(board_no, member_skill_no) values(39, 3);
Insert into pf_portfolio_skill(board_no, member_skill_no) values(40, 4);