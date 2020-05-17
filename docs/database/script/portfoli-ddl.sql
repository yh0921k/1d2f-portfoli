-- 기존 데이터베이스가 존재하면 삭제
DROP DATABASE IF EXISTS portfolidb;

-- 로컬에서만 접속할 수 있는 사용자를 만들기:
CREATE USER 'team'@localhost IDENTIFIED BY '1111';
-- 원격에서만 접속할 수 있는 사용자를 만들기:
CREATE USER 'team'@'%' IDENTIFIED BY '1111';

-- 유저에게 데이터베이스 권한 부여
GRANT ALL ON portfolidb.* TO team@localhost;
GRANT ALL ON portfolidb.* TO team@'%';

-- 데이터베이스 새로 생성
CREATE DATABASE portfolidb
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

-- 데이터베이스 접속
use portfolidb;

-- 일반회원
DROP TABLE IF EXISTS pf_general_member RESTRICT;

-- 기업회원
DROP TABLE IF EXISTS pf_company_member RESTRICT;

-- 포트폴리오
DROP TABLE IF EXISTS pf_portfolio RESTRICT;

-- 채용공고
DROP TABLE IF EXISTS pf_job_posting RESTRICT;

-- 신고
DROP TABLE IF EXISTS pf_report RESTRICT;

-- 회원쪽지
DROP TABLE IF EXISTS pf_message RESTRICT;

-- 관리자
DROP TABLE IF EXISTS pf_admin RESTRICT;

-- 배너
DROP TABLE IF EXISTS pf_banner RESTRICT;

-- 결제
DROP TABLE IF EXISTS pf_payment RESTRICT;

-- 판매상품
DROP TABLE IF EXISTS pf_product RESTRICT;

-- 회원
DROP TABLE IF EXISTS pf_members RESTRICT;

-- 공지사항
DROP TABLE IF EXISTS pf_notice RESTRICT;

-- 알림
DROP TABLE IF EXISTS pf_alarm RESTRICT;

-- 즐겨찾기
DROP TABLE IF EXISTS pf_bookmark RESTRICT;

-- 기술
DROP TABLE IF EXISTS pf_skill RESTRICT;

-- 첨부파일
DROP TABLE IF EXISTS pf_attachments RESTRICT;

-- 채용공고첨부파일
DROP TABLE IF EXISTS pf_job_posting_file RESTRICT;

-- 포트폴리오파일
DROP TABLE IF EXISTS pf_board_attachment RESTRICT;

-- 분야
DROP TABLE IF EXISTS pf_field RESTRICT;

-- 군구
DROP TABLE IF EXISTS pf_county_district RESTRICT;

-- 학력
DROP TABLE IF EXISTS pf_final_education RESTRICT;

-- 전공
DROP TABLE IF EXISTS pf_major RESTRICT;

-- 자격증
DROP TABLE IF EXISTS pf_certificate RESTRICT;

-- 일반회원자격증
DROP TABLE IF EXISTS pf_general_member_certification RESTRICT;

-- 일반회원학력전공
DROP TABLE IF EXISTS pf_general_mem_edu_major RESTRICT;

-- 일반회원학력
DROP TABLE IF EXISTS pf_general_mem_edu RESTRICT;

-- 일반회원관심지역
DROP TABLE IF EXISTS pf_interest_location RESTRICT;

-- 일반회원관심분야
DROP TABLE IF EXISTS pf_general_member_interest RESTRICT;

-- 회원보유기술
DROP TABLE IF EXISTS pf_member_skill RESTRICT;

-- 포트폴리오구성기술
DROP TABLE IF EXISTS pf_portfolio_skill RESTRICT;

-- 고용형태
DROP TABLE IF EXISTS pf_employment_status RESTRICT;

-- 기업요구전공
DROP TABLE IF EXISTS pf_company_required_major RESTRICT;

-- 기업요구자격증
DROP TABLE IF EXISTS pf_company_required_certificate RESTRICT;

-- 게시글
DROP TABLE IF EXISTS pf_board RESTRICT;

-- QNA질문
DROP TABLE IF EXISTS pf_qna RESTRICT;

-- 기업
DROP TABLE IF EXISTS pf_company RESTRICT;

-- 회원기업공고지원
DROP TABLE IF EXISTS pf_apply RESTRICT;

-- 채용추천
DROP TABLE IF EXISTS pf_job_recommendation RESTRICT;

-- 시도
DROP TABLE IF EXISTS pf_province_city RESTRICT;

-- 게시글추천
DROP TABLE IF EXISTS pf_recommendation RESTRICT;

-- 질문분류
DROP TABLE IF EXISTS pf_question_category RESTRICT;

-- 신고분류
DROP TABLE IF EXISTS pf_report_class RESTRICT;

-- 팔로잉
DROP TABLE IF EXISTS pf_following RESTRICT;

-- 공지사항분류
DROP TABLE IF EXISTS pf_notice_category RESTRICT;

-- 일정(개인용)
DROP TABLE IF EXISTS pf_schedule RESTRICT;

-- 알림분류
DROP TABLE IF EXISTS pf_alarm_class RESTRICT;

-- 신고처리분류
DROP TABLE IF EXISTS pf_handle_class RESTRICT;

-- 결제수단
DROP TABLE IF EXISTS pf_payment_method RESTRICT;

-- FAQ 자주묻는질문
DROP TABLE IF EXISTS pf_faq RESTRICT;

-- 일반회원
CREATE TABLE pf_general_member (
  general_member_no INTEGER      NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  seeking_flag      INTEGER      NOT NULL COMMENT '구직여부', -- 구직여부
  photo             VARCHAR(255) NULL     COMMENT '사진', -- 사진
  membership        VARCHAR(255) NOT NULL COMMENT '멤버십(등급)', -- 멤버십(등급)
  career            INTEGER      NULL     COMMENT '경력' -- 경력
)
COMMENT '일반회원';

-- 일반회원
ALTER TABLE pf_general_member
  ADD CONSTRAINT PK_pf_general_member -- 일반회원 기본키
    PRIMARY KEY (
      general_member_no -- 일반회원번호
    );

ALTER TABLE pf_general_member
  MODIFY COLUMN general_member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '일반회원번호';

-- 기업회원
CREATE TABLE pf_company_member (
  company_member_no INTEGER      NOT NULL COMMENT '기업회원번호', -- 기업회원번호
  position          VARCHAR(255) NOT NULL COMMENT '직책', -- 직책
  company_no        INTEGER      NOT NULL COMMENT '기업번호' -- 기업번호
)
COMMENT '기업회원';

-- 기업회원
ALTER TABLE pf_company_member
  ADD CONSTRAINT PK_pf_company_member -- 기업회원 기본키
    PRIMARY KEY (
      company_member_no -- 기업회원번호
    );

ALTER TABLE pf_company_member
  MODIFY COLUMN company_member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '기업회원번호';

-- 포트폴리오
CREATE TABLE pf_portfolio (
  board_no          INTEGER      NOT NULL COMMENT '포트폴리오게시글번호', -- 포트폴리오게시글번호
  general_member_no INTEGER      NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  homepage          VARCHAR(255) NULL     COMMENT '홈페이지', -- 홈페이지
  thumbnail         VARCHAR(255) NULL     COMMENT '썸네일', -- 썸네일
  recommended_count INTEGER      NOT NULL COMMENT '추천수', -- 추천수
  readable          INTEGER      NOT NULL COMMENT '공개여부' -- 공개여부
)
COMMENT '포트폴리오';

-- 포트폴리오
ALTER TABLE pf_portfolio
  ADD CONSTRAINT PK_pf_portfolio -- 포트폴리오 기본키
    PRIMARY KEY (
      board_no -- 포트폴리오게시글번호
    );

ALTER TABLE pf_portfolio
  MODIFY COLUMN board_no INTEGER NOT NULL COMMENT '포트폴리오게시글번호';

-- 채용공고
CREATE TABLE pf_job_posting (
  job_posting_no       INTEGER      NOT NULL COMMENT '채용공고번호', -- 채용공고번호
  company_member_no    INTEGER      NOT NULL COMMENT '기업회원번호', -- 기업회원번호
  title                VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content              TEXT         NOT NULL COMMENT '내용', -- 내용
  work_place_no        INTEGER      NOT NULL COMMENT '근무지번호', -- 근무지번호
  minimum_career       INTEGER      NULL     COMMENT '최소경력년수', -- 최소경력년수
  view_count           INTEGER      NOT NULL COMMENT '조회수', -- 조회수
  posting_registration TIMESTAMP DEFAULT NOW() COMMENT '등록일', -- 등록일
  start_dated          DATETIME     NOT NULL COMMENT '시작일', -- 시작일
  end_dated            DATETIME     NOT NULL COMMENT '마감일', -- 마감일
  job                  TEXT         NOT NULL COMMENT '직무', -- 직무
  year_salary          INTEGER      NULL     COMMENT '연봉', -- 연봉
  readable             INTEGER      NOT NULL COMMENT '공개여부', -- 공개여부
  minimum_education_no INTEGER      NOT NULL COMMENT '최소학력번호', -- 최소학력번호
  
ment_stat_no   INTEGER      NOT NULL COMMENT '고용형태번호' -- 고용형태번호
)
COMMENT '채용공고';

-- 채용공고
ALTER TABLE pf_job_posting
  ADD CONSTRAINT PK_pf_job_posting -- 채용공고 기본키
    PRIMARY KEY (
      job_posting_no -- 채용공고번호
    );

ALTER TABLE pf_job_posting
  MODIFY COLUMN job_posting_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '채용공고번호';

-- 신고
CREATE TABLE pf_report (
  board_no        INTEGER  NOT NULL COMMENT '게시글번호', -- 게시글번호
  reporter_no     INTEGER  NOT NULL COMMENT '신고자번호', -- 신고자번호
  target_no       INTEGER  NOT NULL COMMENT '대상자번호', -- 대상자번호
  report_class_no INTEGER  NOT NULL COMMENT '신고분류번호', -- 신고분류번호
  handle_class_no INTEGER  NULL     COMMENT '처리분류번호', -- 처리분류번호
  handle_date     DATETIME NULL     COMMENT '신고처리일', -- 신고처리일
  handle_content  TEXT     NULL     COMMENT '신고처리내용' -- 신고처리내용
)
COMMENT '신고';

-- 신고
ALTER TABLE pf_report
  ADD CONSTRAINT PK_pf_report -- 신고 기본키
    PRIMARY KEY (
      board_no -- 게시글번호
    );

-- 회원쪽지
CREATE TABLE pf_message (
  message_no              INTEGER      NOT NULL COMMENT '회원쪽지번호', -- 회원쪽지번호
  message_sender          INTEGER      NOT NULL COMMENT '발신인ID', -- 발신인ID
  message_receiver        INTEGER      NOT NULL COMMENT '수신인ID', -- 수신인ID
  title                   VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content                 TEXT         NOT NULL COMMENT '내용', -- 내용
  send_date               DATETIME     NOT NULL DEFAULT now() COMMENT '보낸일시', -- 보낸일시
  receive_date            DATETIME     NULL     COMMENT '읽은일시', -- 읽은일시
  message_sender_delete   INTEGER      NOT NULL COMMENT '발신인 삭제여부', -- 발신인 삭제여부
  message_receiver_delete INTEGER      NOT NULL COMMENT '수신인 삭제여부' -- 수신인 삭제여부
)
COMMENT '회원쪽지';

-- 회원쪽지
ALTER TABLE pf_message
  ADD CONSTRAINT PK_pf_message -- 회원쪽지 기본키
    PRIMARY KEY (
      message_no -- 회원쪽지번호
    );

ALTER TABLE pf_message
  MODIFY COLUMN message_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원쪽지번호';

-- 관리자
CREATE TABLE pf_admin (
  admin_no    INTEGER      NOT NULL COMMENT '관리자번호', -- 관리자번호
  id          VARCHAR(40)  NOT NULL COMMENT '아이디', -- 아이디
  pwd         VARCHAR(255) NOT NULL COMMENT '암호', -- 암호
  ip_addr     VARCHAR(255) NULL     COMMENT '접속IP', -- 접속IP
  access_time DATETIME     NULL     COMMENT '접속시간' -- 접속시간
)
COMMENT '관리자';

-- 관리자
ALTER TABLE pf_admin
  ADD CONSTRAINT PK_pf_admin -- 관리자 기본키
    PRIMARY KEY (
      admin_no -- 관리자번호
    );

-- 관리자 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_admin
  ON pf_admin ( -- 관리자
    id ASC -- 아이디
  );

ALTER TABLE pf_admin
  MODIFY COLUMN admin_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '관리자번호';

-- 배너
CREATE TABLE pf_banner (
  banner_no     INTEGER      NOT NULL COMMENT '배너번호', -- 배너번호
  company_no    INTEGER      NOT NULL COMMENT '기업번호', -- 기업번호
  title         VARCHAR(40)  NOT NULL COMMENT '제목', -- 제목
  image         VARCHAR(255) NOT NULL COMMENT '이미지', -- 이미지
  url           VARCHAR(255) NOT NULL COMMENT '연결URL', -- 연결URL
  register_date DATETIME     NOT NULL DEFAULT now() COMMENT '등록일', -- 등록일
  start_date    DATETIME     NOT NULL COMMENT '시작일', -- 시작일
  end_date      DATETIME     NOT NULL COMMENT '마감일', -- 마감일
  activate      INTEGER      NOT NULL COMMENT '게시여부' -- 게시여부
)
COMMENT '배너';

-- 배너
ALTER TABLE pf_banner
  ADD CONSTRAINT PK_pf_banner -- 배너 기본키
    PRIMARY KEY (
      banner_no -- 배너번호
    );

ALTER TABLE pf_banner
  MODIFY COLUMN banner_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '배너번호';

-- 결제
CREATE TABLE pf_payment (
  pay_no            INTEGER  NOT NULL COMMENT '결제번호', -- 결제번호
  member_no         INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
  product_no        INTEGER  NOT NULL COMMENT '상품번호', -- 상품번호
  payment_method_no INTEGER  NOT NULL COMMENT '결제수단번호', -- 결제수단번호
  stat              INTEGER  NOT NULL COMMENT '결제상태', -- 결제상태
  pay_date          DATETIME NOT NULL DEFAULT now() COMMENT '결제일' -- 결제일
)
COMMENT '결제';

-- 결제
ALTER TABLE pf_payment
  ADD CONSTRAINT PK_pf_payment -- 결제 기본키
    PRIMARY KEY (
      pay_no -- 결제번호
    );

ALTER TABLE pf_payment
  MODIFY COLUMN pay_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '결제번호';

-- 판매상품
CREATE TABLE pf_product (
  product_no INTEGER      NOT NULL COMMENT '상품번호', -- 상품번호
  name       VARCHAR(255) NOT NULL COMMENT '상품명', -- 상품명
  duration   INTEGER      NOT NULL COMMENT '기간', -- 기간
  price      INTEGER      NOT NULL COMMENT '가격' -- 가격
)
COMMENT '판매상품';

-- 판매상품
ALTER TABLE pf_product
  ADD CONSTRAINT PK_pf_product -- 판매상품 기본키
    PRIMARY KEY (
      product_no -- 상품번호
    );

ALTER TABLE pf_product
  MODIFY COLUMN product_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '상품번호';

-- 회원
CREATE TABLE pf_members (
  member_no      INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  type           INTEGER      NOT NULL COMMENT '회원유형', -- 회원유형
  id             VARCHAR(40)  NOT NULL COMMENT '아이디', -- 아이디
  pwd            VARCHAR(255) NOT NULL COMMENT '비밀번호', -- 비밀번호
  name           VARCHAR(30)  NOT NULL COMMENT '이름', -- 이름
  post_no        VARCHAR(6)   NULL     COMMENT '우편번호', -- 우편번호
  basic_address  VARCHAR(100) NULL     COMMENT '기본주소', -- 기본주소
  detail_address VARCHAR(100) NULL     COMMENT '상세주소', -- 상세주소
  email          VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
  tel            VARCHAR(20)  NULL 	   COMMENT '연락처', -- 연락처
  create_date    DATETIME     NOT NULL DEFAULT now() COMMENT '가입일', -- 가입일
  sms_yn         INTEGER      NOT NULL COMMENT 'SMS수신동의여부', -- SMS수신동의여부
  email_yn       INTEGER      NOT NULL COMMENT '이메일 수신 동의여부', -- 이메일 수신 동의여부
  userkey        VARCHAR(20)  NULL     COMMENT '이메일인증', -- 이메일인증
  provider		 VARCHAR(20)  NULL	   COMMENT '정보제공자' -- 정보제공자
)
COMMENT '회원';

-- 회원
ALTER TABLE pf_members
  ADD CONSTRAINT PK_pf_members -- 회원 기본키
    PRIMARY KEY (
      member_no -- 회원번호
    );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_members
  ON pf_members ( -- 회원
    id ASC,    -- 아이디
    email ASC  -- 이메일
  );

ALTER TABLE pf_members
  MODIFY COLUMN member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 공지사항
CREATE TABLE pf_notice (
  board_no  INTEGER NOT NULL COMMENT '게시글번호', -- 게시글번호
  category_no INTEGER NULL     COMMENT '공지사항분류번호' -- 공지사항분류번호
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE pf_notice
  ADD CONSTRAINT PK_pf_notice -- 공지사항 기본키
    PRIMARY KEY (
      board_no -- 게시글번호
    );

-- 알림
CREATE TABLE pf_alarm (
  alarm_no       INTEGER NOT NULL COMMENT '알림번호', -- 알림번호
  member_no      INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  alarm_class_no INTEGER NOT NULL COMMENT '알림분류번호', -- 알림분류번호
  content        TEXT    NOT NULL COMMENT '내용' -- 내용
)
COMMENT '알림';

-- 알림
ALTER TABLE pf_alarm
  ADD CONSTRAINT PK_pf_alarm -- 알림 기본키
    PRIMARY KEY (
      alarm_no -- 알림번호
    );

ALTER TABLE pf_alarm
  MODIFY COLUMN alarm_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '알림번호';

-- 즐겨찾기
CREATE TABLE pf_bookmark (
  board_no  INTEGER NOT NULL COMMENT '포트폴리오게시글번호', -- 포트폴리오게시글번호
  member_no INTEGER NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '즐겨찾기';

-- 즐겨찾기
ALTER TABLE pf_bookmark
  ADD CONSTRAINT PK_pf_bookmark -- 즐겨찾기 기본키
    PRIMARY KEY (
      board_no,  -- 포트폴리오게시글번호
      member_no  -- 회원번호
    );

-- 기술
CREATE TABLE pf_skill (
  skill_no INTEGER     NOT NULL COMMENT '기술번호', -- 기술번호
  category VARCHAR(40) NOT NULL COMMENT '기술구분', -- 기술구분
  name     VARCHAR(40) NOT NULL COMMENT '기술이름' -- 기술이름
)
COMMENT '기술';

-- 기술
ALTER TABLE pf_skill
  ADD CONSTRAINT PK_pf_skill -- 기술 기본키
    PRIMARY KEY (
      skill_no -- 기술번호
    );

-- 기술 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_skill
  ON pf_skill ( -- 기술
    category ASC, -- 기술구분
    name ASC      -- 기술이름
  );

ALTER TABLE pf_skill
  MODIFY COLUMN skill_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '기술번호';

-- 첨부파일
CREATE TABLE pf_attachments (
  file_no    INTEGER      NOT NULL COMMENT '파일번호', -- 파일번호
  message_no INTEGER      NOT NULL COMMENT '회원쪽지번호', -- 회원쪽지번호
  file_name  VARCHAR(255) NOT NULL COMMENT '파일명', -- 파일명
  file_path  VARCHAR(255) NOT NULL COMMENT '파일경로' -- 파일경로
)
COMMENT '첨부파일';

-- 첨부파일
ALTER TABLE pf_attachments
  ADD CONSTRAINT PK_pf_attachments -- 첨부파일 기본키
    PRIMARY KEY (
      file_no -- 파일번호
    );

ALTER TABLE pf_attachments
  MODIFY COLUMN file_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '파일번호';

-- 채용공고첨부파일
CREATE TABLE pf_job_posting_file (
  job_posting_file_no INTEGER      NOT NULL COMMENT '채용공고첨부파일번호', -- 채용공고첨부파일번호
  job_posting_no      INTEGER      NOT NULL COMMENT '채용공고번호', -- 채용공고번호
  file_path           VARCHAR(255) NOT NULL COMMENT '파일경로' -- 파일경로
)
COMMENT '채용공고첨부파일';

-- 채용공고첨부파일
ALTER TABLE pf_job_posting_file
  ADD CONSTRAINT PK_pf_job_posting_file -- 채용공고첨부파일 기본키
    PRIMARY KEY (
      job_posting_file_no -- 채용공고첨부파일번호
    );

-- 채용공고첨부파일 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_job_posting_file
  ON pf_job_posting_file ( -- 채용공고첨부파일
    job_posting_no ASC, -- 채용공고번호
    file_path ASC       -- 파일경로
  );

ALTER TABLE pf_job_posting_file
  MODIFY COLUMN job_posting_file_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '채용공고첨부파일번호';

-- 포트폴리오파일
CREATE TABLE pf_board_attachment (
  attachment_no  INTEGER      NOT NULL COMMENT '파일번호', -- 파일번호
  board_no       INTEGER      NOT NULL COMMENT '게시글번호', -- 게시글번호
  file_name      VARCHAR(255) NOT NULL COMMENT '파일명', -- 파일명
  file_path      VARCHAR(255) NOT NULL COMMENT '파일경로' -- 파일경로
)
COMMENT '포트폴리오파일';

-- 포트폴리오파일
ALTER TABLE pf_board_attachment
  ADD CONSTRAINT PK_pf_board_attachment -- 포트폴리오파일 기본키
    PRIMARY KEY (
      attachment_no -- 파일번호
    );

ALTER TABLE pf_board_attachment
  MODIFY COLUMN attachment_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '파일번호';

-- 분야
CREATE TABLE pf_field (
  field_no INTEGER     NOT NULL COMMENT '분야번호', -- 분야번호
  category VARCHAR(40) NOT NULL COMMENT '분야구분', -- 분야구분
  name     VARCHAR(40) NOT NULL COMMENT '분야이름' -- 분야이름
)
COMMENT '분야';

-- 분야
ALTER TABLE pf_field
  ADD CONSTRAINT PK_pf_field -- 분야 기본키
    PRIMARY KEY (
      field_no -- 분야번호
    );

-- 분야 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_field
  ON pf_field ( -- 분야
    category ASC, -- 분야구분
    name ASC      -- 분야이름
  );

ALTER TABLE pf_field
  MODIFY COLUMN field_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '분야번호';

-- 군구
CREATE TABLE pf_county_district (
  county_district_no INTEGER     NOT NULL COMMENT '군구번호', -- 군구번호
  province_city_no   INTEGER     NOT NULL COMMENT '시도번호', -- 시도번호
  county_name        VARCHAR(40) NULL     COMMENT '군이름', -- 군이름
  district_name      VARCHAR(40) NULL     COMMENT '구이름' -- 구이름
)
COMMENT '군구';

-- 군구
ALTER TABLE pf_county_district
  ADD CONSTRAINT PK_pf_county_district -- 군구 기본키
    PRIMARY KEY (
      county_district_no -- 군구번호
    );

-- 군구 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_county_district
  ON pf_county_district ( -- 군구
    county_name ASC,   -- 군이름
    district_name ASC  -- 구이름
  );

ALTER TABLE pf_county_district
  MODIFY COLUMN county_district_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '군구번호';

-- 학력
CREATE TABLE pf_final_education (
  education_no INTEGER     NOT NULL COMMENT '학력번호', -- 학력번호
  category     VARCHAR(40) NOT NULL DEFAULT 'etc' COMMENT '학력구분' -- 학력구분
)
COMMENT '학력';

-- 학력
ALTER TABLE pf_final_education
  ADD CONSTRAINT PK_pf_final_education -- 학력 기본키
    PRIMARY KEY (
      education_no -- 학력번호
    );

-- 학력 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_final_education
  ON pf_final_education ( -- 학력
    category ASC -- 학력구분
  );

ALTER TABLE pf_final_education
  MODIFY COLUMN education_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '학력번호';

-- 전공
CREATE TABLE pf_major (
  major_no INTEGER      NOT NULL COMMENT '전공번호', -- 전공번호
  name     VARCHAR(255) NOT NULL COMMENT '전공이름' -- 전공이름
)
COMMENT '전공';

-- 전공
ALTER TABLE pf_major
  ADD CONSTRAINT PK_pf_major -- 전공 기본키
    PRIMARY KEY (
      major_no -- 전공번호
    );

-- 전공 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_major
  ON pf_major ( -- 전공
    name ASC -- 전공이름
  );

ALTER TABLE pf_major
  MODIFY COLUMN major_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '전공번호';

-- 자격증
CREATE TABLE pf_certificate (
  certificate_no INTEGER      NOT NULL COMMENT '자격증번호', -- 자격증번호
  agency         VARCHAR(255) NOT NULL COMMENT '발급기관', -- 발급기관
  name           VARCHAR(255) NOT NULL COMMENT '자격증이름' -- 자격증이름
)
COMMENT '자격증';

-- 자격증
ALTER TABLE pf_certificate
  ADD CONSTRAINT PK_pf_certificate -- 자격증 기본키
    PRIMARY KEY (
      certificate_no -- 자격증번호
    );

-- 자격증 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_certificate
  ON pf_certificate ( -- 자격증
    agency ASC, -- 발급기관
    name ASC    -- 자격증이름
  );

ALTER TABLE pf_certificate
  MODIFY COLUMN certificate_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '자격증번호';

-- 일반회원자격증
CREATE TABLE pf_general_member_certification (
  general_member_no INTEGER  NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  certificate_no    INTEGER  NOT NULL COMMENT '자격증번호', -- 자격증번호
  issue_date        DATETIME NULL     COMMENT '발급일자', -- 발급일자
  expire_date       DATETIME NULL     COMMENT '기간' -- 기간
)
COMMENT '일반회원자격증';

-- 일반회원자격증
ALTER TABLE pf_general_member_certification
  ADD CONSTRAINT PK_pf_general_member_certification -- 일반회원자격증 기본키
    PRIMARY KEY (
      general_member_no, -- 일반회원번호
      certificate_no     -- 자격증번호
    );

-- 일반회원학력전공
CREATE TABLE pf_general_mem_edu_major (
  general_member_no INTEGER NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  education_no      INTEGER NOT NULL COMMENT '학력번호', -- 학력번호
  major_no          INTEGER NOT NULL COMMENT '전공번호' -- 전공번호
)
COMMENT '일반회원학력전공';

-- 일반회원학력전공
ALTER TABLE pf_general_mem_edu_major
  ADD CONSTRAINT PK_pf_general_mem_edu_major -- 일반회원학력전공 기본키
    PRIMARY KEY (
      general_member_no, -- 일반회원번호
      education_no,      -- 학력번호
      major_no           -- 전공번호
    );

ALTER TABLE pf_general_mem_edu_major
  MODIFY COLUMN general_member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '일반회원번호';

-- 일반회원학력
CREATE TABLE pf_general_mem_edu (
  general_member_no INTEGER     NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  education_no      INTEGER     NOT NULL COMMENT '학력번호', -- 학력번호
  school_name       VARCHAR(40) NOT NULL COMMENT '학교명' -- 학교명
)
COMMENT '일반회원학력';

-- 일반회원학력
ALTER TABLE pf_general_mem_edu
  ADD CONSTRAINT PK_pf_general_mem_edu -- 일반회원학력 기본키
    PRIMARY KEY (
      general_member_no, -- 일반회원번호
      education_no       -- 학력번호
    );

ALTER TABLE pf_general_mem_edu
  MODIFY COLUMN general_member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '일반회원번호';

-- 일반회원관심지역
CREATE TABLE pf_interest_location (
  general_member_no INTEGER NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  location_no       INTEGER NOT NULL COMMENT '군구번호' -- 군구번호
)
COMMENT '일반회원관심지역';

-- 일반회원관심지역
ALTER TABLE pf_interest_location
  ADD CONSTRAINT PK_pf_interest_location -- 일반회원관심지역 기본키
    PRIMARY KEY (
      general_member_no, -- 일반회원번호
      location_no        -- 군구번호
    );

-- 일반회원관심분야
CREATE TABLE pf_general_member_interest (
  general_member_no INTEGER NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  field_no          INTEGER NOT NULL COMMENT '분야번호' -- 분야번호
)
COMMENT '일반회원관심분야';

-- 일반회원관심분야
ALTER TABLE pf_general_member_interest
  ADD CONSTRAINT PK_pf_general_member_interest -- 일반회원관심분야 기본키
    PRIMARY KEY (
      general_member_no, -- 일반회원번호
      field_no           -- 분야번호
    );

-- 회원보유기술
CREATE TABLE pf_member_skill (
  member_skill_no   INTEGER NOT NULL COMMENT '회원보유기술번호', -- 회원보유기술번호
  general_member_no INTEGER NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  skill_no          INTEGER NOT NULL COMMENT '기술번호', -- 기술번호
  level             INTEGER NOT NULL COMMENT '등급' -- 등급
)
COMMENT '회원보유기술';

-- 회원보유기술
ALTER TABLE pf_member_skill
  ADD CONSTRAINT PK_pf_member_skill -- 회원보유기술 기본키
    PRIMARY KEY (
      member_skill_no -- 회원보유기술번호
    );

-- 회원보유기술 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_member_skill
  ON pf_member_skill ( -- 회원보유기술
    skill_no ASC,          -- 기술번호
    general_member_no ASC  -- 일반회원번호
  );

ALTER TABLE pf_member_skill
  MODIFY COLUMN member_skill_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원보유기술번호';

-- 포트폴리오구성기술
CREATE TABLE pf_portfolio_skill (
  board_no        INTEGER NOT NULL COMMENT '포트폴리오게시글번호', -- 포트폴리오게시글번호
  member_skill_no INTEGER NOT NULL COMMENT '회원보유기술번호' -- 회원보유기술번호
)
COMMENT '포트폴리오구성기술';

-- 포트폴리오구성기술
ALTER TABLE pf_portfolio_skill
  ADD CONSTRAINT PK_pf_portfolio_skill -- 포트폴리오구성기술 기본키
    PRIMARY KEY (
      board_no,        -- 포트폴리오게시글번호
      member_skill_no  -- 회원보유기술번호
    );

-- 고용형태
CREATE TABLE pf_employment_status (
  employment_stat_no   INTEGER     NOT NULL COMMENT '고용형태번호', -- 고용형태번호
  employment_stat_name VARCHAR(40) NOT NULL COMMENT '고용형태이름' -- 고용형태이름
)
COMMENT '고용형태';

-- 고용형태
ALTER TABLE pf_employment_status
  ADD CONSTRAINT PK_pf_employment_status -- 고용형태 기본키
    PRIMARY KEY (
      employment_stat_no -- 고용형태번호
    );

-- 고용형태 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_employment_status
  ON pf_employment_status ( -- 고용형태
    employment_stat_name ASC -- 고용형태이름
  );

-- 기업요구전공
CREATE TABLE pf_company_required_major (
  major_no       INTEGER NOT NULL COMMENT '전공번호', -- 전공번호
  job_posting_no INTEGER NOT NULL COMMENT '채용공고번호' -- 채용공고번호
)
COMMENT '기업요구전공';

-- 기업요구전공
ALTER TABLE pf_company_required_major
  ADD CONSTRAINT PK_pf_company_required_major -- 기업요구전공 기본키
    PRIMARY KEY (
      major_no,       -- 전공번호
      job_posting_no  -- 채용공고번호
    );

-- 기업요구전공 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_company_required_major
  ON pf_company_required_major ( -- 기업요구전공
    major_no ASC,       -- 전공번호
    job_posting_no ASC  -- 채용공고번호
  );

-- 기업요구자격증
CREATE TABLE pf_company_required_certificate (
  certificate_no INTEGER NOT NULL COMMENT '자격증번호', -- 자격증번호
  job_posting_no INTEGER NOT NULL COMMENT '채용공고번호' -- 채용공고번호
)
COMMENT '기업요구자격증';

-- 기업요구자격증
ALTER TABLE pf_company_required_certificate
  ADD CONSTRAINT PK_pf_company_required_certificate -- 기업요구자격증 기본키
    PRIMARY KEY (
      certificate_no, -- 자격증번호
      job_posting_no  -- 채용공고번호
    );

ALTER TABLE pf_company_required_certificate
  MODIFY COLUMN certificate_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '자격증번호';

-- 게시글
CREATE TABLE pf_board (
  board_no        INTEGER      NOT NULL COMMENT '게시글번호', -- 게시글번호
  title           VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content         TEXT         NOT NULL COMMENT '내용', -- 내용
  view_count      INTEGER      NOT NULL COMMENT '조회수', -- 조회수
  registered_date DATETIME     NOT NULL COMMENT '등록일' -- 등록일
)
COMMENT '게시글';

-- 게시글
ALTER TABLE pf_board
  ADD CONSTRAINT PK_pf_board -- 게시글 기본키
    PRIMARY KEY (
      board_no -- 게시글번호
    );

ALTER TABLE pf_board
  MODIFY COLUMN board_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시글번호';

-- QNA질문
CREATE TABLE pf_qna (
  board_no           INTEGER  NOT NULL COMMENT '게시글번호', -- 게시글번호
  member_no          INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
  category_no        INTEGER  NOT NULL COMMENT '질문분류번호', -- 질문분류번호
  readable           INTEGER  NOT NULL COMMENT '비밀글여부', -- 비밀글여부
  email_notification INTEGER  NOT NULL COMMENT '이메일답변알림여부', -- 이메일답변알림여부
  sms_notification   INTEGER  NULL COMMENT '문자답변알림여부', -- 문자답변알림여부
  content            TEXT     NULL COMMENT '답변내용', -- 답변내용
  answer_date        DATETIME NULL COMMENT '답변일' -- 답변일
)
COMMENT 'QNA질문';

-- QNA질문
ALTER TABLE pf_qna
  ADD CONSTRAINT PK_pf_qna -- QNA질문 기본키
    PRIMARY KEY (
      board_no -- 게시글번호
    );

ALTER TABLE pf_qna
  MODIFY COLUMN board_no INTEGER NOT NULL COMMENT '게시글번호';

-- 기업
CREATE TABLE pf_company (
   company_no               INTEGER      NOT NULL COMMENT '기업번호', -- 기업번호
   business_registration_no VARCHAR(15)  NOT NULL COMMENT '사업자등록번호', -- 사업자등록번호
   name                     VARCHAR(255) NOT NULL COMMENT '기업명', -- 기업명
   tel                      VARCHAR(20)  NOT NULL COMMENT '대표전화', -- 대표전화
   representative           VARCHAR(40)  NULL COMMENT '대표자' -- 대표자
)
COMMENT '기업';

-- 기업
ALTER TABLE pf_company
  ADD CONSTRAINT PK_pf_company -- 기업 기본키
    PRIMARY KEY (
      company_no -- 기업번호
    );

-- 기업 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_company
  ON pf_company ( -- 기업
    business_registration_no ASC, -- 사업자등록번호
    name ASC,                     -- 기업명
    tel ASC                       -- 대표전화
  );

ALTER TABLE pf_company
  MODIFY COLUMN company_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '기업번호';

-- 회원기업공고지원
CREATE TABLE pf_apply (
  apply_no          INTEGER NOT NULL COMMENT '지원번호', -- 지원번호
  general_member_no INTEGER NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  job_posting_no    INTEGER NOT NULL COMMENT '채용공고번호' -- 채용공고번호
)
COMMENT '회원기업공고지원';

-- 회원기업공고지원
ALTER TABLE pf_apply
  ADD CONSTRAINT PK_pf_apply -- 회원기업공고지원 기본키
    PRIMARY KEY (
      apply_no -- 지원번호
    );

ALTER TABLE pf_apply
  MODIFY COLUMN apply_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '지원번호';

-- 채용추천
CREATE TABLE pf_job_recommendation (
  general_member_no INTEGER NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  job_posting_no    INTEGER NOT NULL COMMENT '채용공고번호' -- 채용공고번호
)
COMMENT '채용추천';

-- 채용추천
ALTER TABLE pf_job_recommendation
  ADD CONSTRAINT PK_pf_job_recommendation -- 채용추천 기본키
    PRIMARY KEY (
      general_member_no, -- 일반회원번호
      job_posting_no     -- 채용공고번호
    );

ALTER TABLE pf_job_recommendation
  MODIFY COLUMN general_member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '일반회원번호';

-- 시도
CREATE TABLE pf_province_city (
  province_city_no INTEGER     NOT NULL COMMENT '시도번호', -- 시도번호
  province_name    VARCHAR(40) NULL     COMMENT '도이름', -- 도이름
  city_name        VARCHAR(40) NULL     COMMENT '시이름' -- 시이름
)
COMMENT '시도';

-- 시도
ALTER TABLE pf_province_city
  ADD CONSTRAINT PK_pf_province_city -- 시도 기본키
    PRIMARY KEY (
      province_city_no -- 시도번호
    );

-- 시도 유니크 인덱스
CREATE UNIQUE INDEX UIX_pf_province_city
  ON pf_province_city ( -- 시도
    province_name ASC, -- 도이름
    city_name ASC      -- 시이름
  );

ALTER TABLE pf_province_city
  MODIFY COLUMN province_city_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '시도번호';

-- 게시글추천
CREATE TABLE pf_recommendation (
  board_no  INTEGER NOT NULL COMMENT '게시글번호', -- 게시글번호
  member_no INTEGER NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '게시글추천';

-- 게시글추천
ALTER TABLE pf_recommendation
  ADD CONSTRAINT PK_pf_recommendation -- 게시글추천 기본키
    PRIMARY KEY (
      board_no,  -- 게시글번호
      member_no  -- 회원번호
    );

ALTER TABLE pf_recommendation
  MODIFY COLUMN board_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시글번호';

-- 질문분류
CREATE TABLE pf_question_category (
  category_no INTEGER      NOT NULL COMMENT '질문분류번호', -- 질문분류번호
  name    VARCHAR(255) NOT NULL COMMENT '질문분류명' -- 질문분류명
)
COMMENT '질문분류';

-- 질문분류
ALTER TABLE pf_question_category
  ADD CONSTRAINT PK_pf_question_category -- 질문분류 기본키
    PRIMARY KEY (
      category_no -- 질문분류번호
    );

ALTER TABLE pf_question_category
  MODIFY COLUMN category_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '질문분류번호';

-- 신고분류
CREATE TABLE pf_report_class (
  report_class_no INTEGER      NOT NULL COMMENT '신고분류번호', -- 신고분류번호
  report_class    VARCHAR(255) NOT NULL COMMENT '신고분류명' -- 신고분류명
)
COMMENT '신고분류';

-- 신고분류
ALTER TABLE pf_report_class
  ADD CONSTRAINT PK_pf_report_class -- 신고분류 기본키
    PRIMARY KEY (
      report_class_no -- 신고분류번호
    );

ALTER TABLE pf_report_class
  MODIFY COLUMN report_class_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '신고분류번호';

-- 팔로잉
CREATE TABLE pf_following (
  follower  INTEGER NOT NULL COMMENT '팔로워', -- 팔로워
  following INTEGER NOT NULL COMMENT '팔로잉' -- 팔로잉
)
COMMENT '팔로잉';

-- 팔로잉
ALTER TABLE pf_following
  ADD CONSTRAINT PK_pf_following -- 팔로잉 기본키
    PRIMARY KEY (
      follower,  -- 팔로워
      following  -- 팔로잉
    );

-- 공지사항분류
CREATE TABLE pf_notice_category (
  category_no INTEGER      NOT NULL COMMENT '공지사항분류번호', -- 공지사항분류번호
  name      VARCHAR(255) NOT NULL COMMENT '분류명' -- 분류명
)
COMMENT '공지사항분류';

-- 공지사항분류
ALTER TABLE pf_notice_category
  ADD CONSTRAINT PK_pf_notice_category -- 공지사항분류 기본키
    PRIMARY KEY (
      category_no -- 공지사항분류번호
    );

-- 일정(개인용)
CREATE TABLE pf_schedule (
  schedule_no       INTEGER  NOT NULL COMMENT '일정번호', -- 일정번호
  general_member_no INTEGER  NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  start_date        DATETIME NULL     COMMENT '시작일', -- 시작일
  end_date          DATETIME NULL     COMMENT '종료일', -- 종료일
  content           TEXT     NOT NULL COMMENT '일정내용' -- 일정내용
)
COMMENT '일정(개인용)';

-- 일정(개인용)
ALTER TABLE pf_schedule
  ADD CONSTRAINT PK_pf_schedule -- 일정(개인용) 기본키
    PRIMARY KEY (
      schedule_no -- 일정번호
    );

ALTER TABLE pf_schedule
  MODIFY COLUMN schedule_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '일정번호';

-- 알림분류
CREATE TABLE pf_alarm_class (
  alarm_class_no INTEGER      NOT NULL COMMENT '알림분류번호', -- 알림분류번호
  alarm_class    VARCHAR(255) NOT NULL COMMENT '알림분류명' -- 알림분류명
)
COMMENT '알림분류';

-- 알림분류
ALTER TABLE pf_alarm_class
  ADD CONSTRAINT PK_pf_alarm_class -- 알림분류 기본키
    PRIMARY KEY (
      alarm_class_no -- 알림분류번호
    );

ALTER TABLE pf_alarm_class
  MODIFY COLUMN alarm_class_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '알림분류번호';

-- 신고처리분류
CREATE TABLE pf_handle_class (
  handle_class_no INTEGER     NOT NULL COMMENT '처리분류번호', -- 처리분류번호
  handle_class    VARCHAR(40) NOT NULL COMMENT '처리분류명' -- 처리분류명
)
COMMENT '신고처리분류';

-- 신고처리분류
ALTER TABLE pf_handle_class
  ADD CONSTRAINT PK_pf_handle_class -- 신고처리분류 기본키
    PRIMARY KEY (
      handle_class_no -- 처리분류번호
    );

ALTER TABLE pf_handle_class
  MODIFY COLUMN handle_class_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '처리분류번호';

-- 결제수단
CREATE TABLE pf_payment_method (
  payment_method_no INTEGER     NOT NULL COMMENT '결제수단번호', -- 결제수단번호
  payment_method    VARCHAR(40) NOT NULL COMMENT '결제수단명' -- 결제수단명
)
COMMENT '결제수단';

-- 결제수단
ALTER TABLE pf_payment_method
  ADD CONSTRAINT PK_pf_payment_method -- 결제수단 기본키
    PRIMARY KEY (
      payment_method_no -- 결제수단번호
    );

ALTER TABLE pf_payment_method
  MODIFY COLUMN payment_method_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '결제수단번호';

-- FAQ 자주묻는질문
CREATE TABLE pf_faq (
  board_no       INTEGER  NOT NULL COMMENT '게시글번호', -- 게시글번호
  category_no    INTEGER  NOT NULL COMMENT '질문분류번호', -- 질문분류번호
  readable       INTEGER  NOT NULL COMMENT '비밀글여부', -- 비밀글여부
  answer_content TEXT     NULL COMMENT '답변내용', -- 답변내용
  answer_date    DATETIME NULL COMMENT '답변일' -- 답변일
)
COMMENT 'FAQ 자주묻는질문';

-- FAQ 자주묻는질문
ALTER TABLE pf_faq
  ADD CONSTRAINT PK_pf_faq -- FAQ 자주묻는질문 기본키
    PRIMARY KEY (
      board_no -- 게시글번호
    );

-- 일반회원
ALTER TABLE pf_general_member
  ADD CONSTRAINT FK_pf_members_TO_pf_general_member -- 회원 -> 일반회원
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 기업회원
ALTER TABLE pf_company_member
  ADD CONSTRAINT FK_pf_members_TO_pf_company_member -- 회원 -> 기업회원
    FOREIGN KEY (
      company_member_no -- 기업회원번호
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 기업회원
ALTER TABLE pf_company_member
  ADD CONSTRAINT FK_pf_company_TO_pf_company_member -- 기업 -> 기업회원
    FOREIGN KEY (
      company_no -- 기업번호
    )
    REFERENCES pf_company ( -- 기업
      company_no -- 기업번호
    );

-- 포트폴리오
ALTER TABLE pf_portfolio
  ADD CONSTRAINT FK_pf_general_member_TO_pf_portfolio -- 일반회원 -> 포트폴리오
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_general_member ( -- 일반회원
      general_member_no -- 일반회원번호
    );

-- 포트폴리오
ALTER TABLE pf_portfolio
  ADD CONSTRAINT FK_pf_board_TO_pf_portfolio -- 게시글 -> 포트폴리오
    FOREIGN KEY (
      board_no -- 포트폴리오게시글번호
    )
    REFERENCES pf_board ( -- 게시글
      board_no -- 게시글번호
    );

-- 채용공고
ALTER TABLE pf_job_posting
  ADD CONSTRAINT FK_pf_company_member_TO_pf_job_posting -- 기업회원 -> 채용공고
    FOREIGN KEY (
      company_member_no -- 기업회원번호
    )
    REFERENCES pf_company_member ( -- 기업회원
      company_member_no -- 기업회원번호
    );

-- 채용공고
ALTER TABLE pf_job_posting
  ADD CONSTRAINT FK_pf_final_education_TO_pf_job_posting -- 학력 -> 채용공고
    FOREIGN KEY (
      minimum_education_no -- 최소학력번호
    )
    REFERENCES pf_final_education ( -- 학력
      education_no -- 학력번호
    );

-- 채용공고
ALTER TABLE pf_job_posting
  ADD CONSTRAINT FK_pf_employment_status_TO_pf_job_posting -- 고용형태 -> 채용공고
    FOREIGN KEY (
      employment_stat_no -- 고용형태번호
    )
    REFERENCES pf_employment_status ( -- 고용형태
      employment_stat_no -- 고용형태번호
    );

-- 채용공고
ALTER TABLE pf_job_posting
  ADD CONSTRAINT FK_pf_county_district_TO_pf_job_posting -- 군구 -> 채용공고
    FOREIGN KEY (
      work_place_no -- 근무지번호
    )
    REFERENCES pf_county_district ( -- 군구
      county_district_no -- 군구번호
    );

-- 신고
ALTER TABLE pf_report
  ADD CONSTRAINT FK_pf_members_TO_pf_report -- 회원 -> 신고
    FOREIGN KEY (
      reporter_no -- 신고자번호
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 신고
ALTER TABLE pf_report
  ADD CONSTRAINT FK_pf_members_TO_pf_report2 -- 회원 -> 신고2
    FOREIGN KEY (
      target_no -- 대상자번호
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 신고
ALTER TABLE pf_report
  ADD CONSTRAINT FK_pf_report_class_TO_pf_report -- 신고분류 -> 신고
    FOREIGN KEY (
      report_class_no -- 신고분류번호
    )
    REFERENCES pf_report_class ( -- 신고분류
      report_class_no -- 신고분류번호
    );

-- 신고
ALTER TABLE pf_report
  ADD CONSTRAINT FK_pf_board_TO_pf_report -- 게시글 -> 신고
    FOREIGN KEY (
      board_no -- 게시글번호
    )
    REFERENCES pf_board ( -- 게시글
      board_no -- 게시글번호
    );

-- 신고
ALTER TABLE pf_report
  ADD CONSTRAINT FK_pf_handle_class_TO_pf_report -- 신고처리분류 -> 신고
    FOREIGN KEY (
      handle_class_no -- 처리분류번호
    )
    REFERENCES pf_handle_class ( -- 신고처리분류
      handle_class_no -- 처리분류번호
    );

-- 회원쪽지
ALTER TABLE pf_message
  ADD CONSTRAINT FK_pf_members_TO_pf_message -- 회원 -> 회원쪽지
    FOREIGN KEY (
      message_sender -- 발신인ID
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 회원쪽지
ALTER TABLE pf_message
  ADD CONSTRAINT FK_pf_members_TO_pf_message2 -- 회원 -> 회원쪽지2
    FOREIGN KEY (
      message_receiver -- 수신인ID
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 배너
ALTER TABLE pf_banner
  ADD CONSTRAINT FK_pf_company_TO_pf_banner -- 기업 -> 배너
    FOREIGN KEY (
      company_no -- 기업번호
    )
    REFERENCES pf_company ( -- 기업
      company_no -- 기업번호
    );

-- 결제
ALTER TABLE pf_payment
  ADD CONSTRAINT FK_pf_product_TO_pf_payment -- 판매상품 -> 결제
    FOREIGN KEY (
      product_no -- 상품번호
    )
    REFERENCES pf_product ( -- 판매상품
      product_no -- 상품번호
    );

-- 결제
ALTER TABLE pf_payment
  ADD CONSTRAINT FK_pf_members_TO_pf_payment -- 회원 -> 결제
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 결제
ALTER TABLE pf_payment
  ADD CONSTRAINT FK_pf_payment_method_TO_pf_payment -- 결제수단 -> 결제
    FOREIGN KEY (
      payment_method_no -- 결제수단번호
    )
    REFERENCES pf_payment_method ( -- 결제수단
      payment_method_no -- 결제수단번호
    );

-- 공지사항
ALTER TABLE pf_notice
  ADD CONSTRAINT FK_pf_board_TO_pf_notice -- 게시글 -> 공지사항
    FOREIGN KEY (
      board_no -- 게시글번호
    )
    REFERENCES pf_board ( -- 게시글
      board_no -- 게시글번호
    );

-- 공지사항
ALTER TABLE pf_notice
  ADD CONSTRAINT FK_pf_notice_category_TO_pf_notice -- 공지사항분류 -> 공지사항
    FOREIGN KEY (
      category_no -- 공지사항분류번호
    )
    REFERENCES pf_notice_category ( -- 공지사항분류
      category_no -- 공지사항분류번호
    );

-- 알림
ALTER TABLE pf_alarm
  ADD CONSTRAINT FK_pf_members_TO_pf_alarm -- 회원 -> 알림
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 알림
ALTER TABLE pf_alarm
  ADD CONSTRAINT FK_pf_alarm_class_TO_pf_alarm -- 알림분류 -> 알림
    FOREIGN KEY (
      alarm_class_no -- 알림분류번호
    )
    REFERENCES pf_alarm_class ( -- 알림분류
      alarm_class_no -- 알림분류번호
    );

-- 즐겨찾기
ALTER TABLE pf_bookmark
  ADD CONSTRAINT FK_pf_portfolio_TO_pf_bookmark -- 포트폴리오 -> 즐겨찾기
    FOREIGN KEY (
      board_no -- 포트폴리오게시글번호
    )
    REFERENCES pf_portfolio ( -- 포트폴리오
      board_no -- 포트폴리오게시글번호
    );

-- 즐겨찾기
ALTER TABLE pf_bookmark
  ADD CONSTRAINT FK_pf_members_TO_pf_bookmark -- 회원 -> 즐겨찾기
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 첨부파일
ALTER TABLE pf_attachments
  ADD CONSTRAINT FK_pf_message_TO_pf_attachments -- 회원쪽지 -> 첨부파일
    FOREIGN KEY (
      message_no -- 회원쪽지번호
    )
    REFERENCES pf_message ( -- 회원쪽지
      message_no -- 회원쪽지번호
    );

-- 채용공고첨부파일
ALTER TABLE pf_job_posting_file
  ADD CONSTRAINT FK_pf_job_posting_TO_pf_job_posting_file -- 채용공고 -> 채용공고첨부파일
    FOREIGN KEY (
      job_posting_no -- 채용공고번호
    )
    REFERENCES pf_job_posting ( -- 채용공고
      job_posting_no -- 채용공고번호
    );

-- 포트폴리오파일
ALTER TABLE pf_board_attachment
  ADD CONSTRAINT FK_pf_board_TO_pf_board_attachment -- 게시글 -> 포트폴리오파일
    FOREIGN KEY (
      board_no -- 게시글번호
    )
    REFERENCES pf_board ( -- 게시글
      board_no -- 게시글번호
    );

-- 군구
ALTER TABLE pf_county_district
  ADD CONSTRAINT FK_pf_province_city_TO_pf_county_district -- 시도 -> 군구
    FOREIGN KEY (
      province_city_no -- 시도번호
    )
    REFERENCES pf_province_city ( -- 시도
      province_city_no -- 시도번호
    );

-- 일반회원자격증
ALTER TABLE pf_general_member_certification
  ADD CONSTRAINT FK_pf_general_member_TO_pf_general_member_certification -- 일반회원 -> 일반회원자격증
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_general_member ( -- 일반회원
      general_member_no -- 일반회원번호
    );

-- 일반회원자격증
ALTER TABLE pf_general_member_certification
  ADD CONSTRAINT FK_pf_certificate_TO_pf_general_member_certification -- 자격증 -> 일반회원자격증
    FOREIGN KEY (
      certificate_no -- 자격증번호
    )
    REFERENCES pf_certificate ( -- 자격증
      certificate_no -- 자격증번호
    );

-- 일반회원학력전공
ALTER TABLE pf_general_mem_edu_major
  ADD CONSTRAINT FK_pf_major_TO_pf_general_mem_edu_major -- 전공 -> 일반회원학력전공
    FOREIGN KEY (
      major_no -- 전공번호
    )
    REFERENCES pf_major ( -- 전공
      major_no -- 전공번호
    );

-- 일반회원학력전공
ALTER TABLE pf_general_mem_edu_major
  ADD CONSTRAINT FK_pf_general_mem_edu_TO_pf_general_mem_edu_major -- 일반회원학력 -> 일반회원학력전공
    FOREIGN KEY (
      general_member_no, -- 일반회원번호
      education_no       -- 학력번호
    )
    REFERENCES pf_general_mem_edu ( -- 일반회원학력
      general_member_no, -- 일반회원번호
      education_no       -- 학력번호
    );

-- 일반회원학력
ALTER TABLE pf_general_mem_edu
  ADD CONSTRAINT FK_pf_general_member_TO_pf_general_mem_edu -- 일반회원 -> 일반회원학력
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_general_member ( -- 일반회원
      general_member_no -- 일반회원번호
    );

-- 일반회원학력
ALTER TABLE pf_general_mem_edu
  ADD CONSTRAINT FK_pf_final_education_TO_pf_general_mem_edu -- 학력 -> 일반회원학력
    FOREIGN KEY (
      education_no -- 학력번호
    )
    REFERENCES pf_final_education ( -- 학력
      education_no -- 학력번호
    );

-- 일반회원관심지역
ALTER TABLE pf_interest_location
  ADD CONSTRAINT FK_pf_general_member_TO_pf_interest_location -- 일반회원 -> 일반회원관심지역
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_general_member ( -- 일반회원
      general_member_no -- 일반회원번호
    );

-- 일반회원관심지역
ALTER TABLE pf_interest_location
  ADD CONSTRAINT FK_pf_county_district_TO_pf_interest_location -- 군구 -> 일반회원관심지역
    FOREIGN KEY (
      location_no -- 군구번호
    )
    REFERENCES pf_county_district ( -- 군구
      county_district_no -- 군구번호
    );

-- 일반회원관심분야
ALTER TABLE pf_general_member_interest
  ADD CONSTRAINT FK_pf_field_TO_pf_general_member_interest -- 분야 -> 일반회원관심분야
    FOREIGN KEY (
      field_no -- 분야번호
    )
    REFERENCES pf_field ( -- 분야
      field_no -- 분야번호
    );

-- 일반회원관심분야
ALTER TABLE pf_general_member_interest
  ADD CONSTRAINT FK_pf_general_member_TO_pf_general_member_interest -- 일반회원 -> 일반회원관심분야
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_general_member ( -- 일반회원
      general_member_no -- 일반회원번호
    );

-- 회원보유기술
ALTER TABLE pf_member_skill
  ADD CONSTRAINT FK_pf_general_member_TO_pf_member_skill -- 일반회원 -> 회원보유기술
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_general_member ( -- 일반회원
      general_member_no -- 일반회원번호
    );

-- 회원보유기술
ALTER TABLE pf_member_skill
  ADD CONSTRAINT FK_pf_skill_TO_pf_member_skill -- 기술 -> 회원보유기술
    FOREIGN KEY (
      skill_no -- 기술번호
    )
    REFERENCES pf_skill ( -- 기술
      skill_no -- 기술번호
    );

-- 포트폴리오구성기술
ALTER TABLE pf_portfolio_skill
  ADD CONSTRAINT FK_pf_portfolio_TO_pf_portfolio_skill -- 포트폴리오 -> 포트폴리오구성기술
    FOREIGN KEY (
      board_no -- 포트폴리오게시글번호
    )
    REFERENCES pf_portfolio ( -- 포트폴리오
      board_no -- 포트폴리오게시글번호
    );

-- 포트폴리오구성기술
ALTER TABLE pf_portfolio_skill
  ADD CONSTRAINT FK_pf_member_skill_TO_pf_portfolio_skill -- 회원보유기술 -> 포트폴리오구성기술
    FOREIGN KEY (
      member_skill_no -- 회원보유기술번호
    )
    REFERENCES pf_member_skill ( -- 회원보유기술
      member_skill_no -- 회원보유기술번호
    );

-- 기업요구전공
ALTER TABLE pf_company_required_major
  ADD CONSTRAINT FK_pf_major_TO_pf_company_required_major -- 전공 -> 기업요구전공
    FOREIGN KEY (
      major_no -- 전공번호
    )
    REFERENCES pf_major ( -- 전공
      major_no -- 전공번호
    );

-- 기업요구전공
ALTER TABLE pf_company_required_major
  ADD CONSTRAINT FK_pf_job_posting_TO_pf_company_required_major -- 채용공고 -> 기업요구전공
    FOREIGN KEY (
      job_posting_no -- 채용공고번호
    )
    REFERENCES pf_job_posting ( -- 채용공고
      job_posting_no -- 채용공고번호
    );

-- 기업요구자격증
ALTER TABLE pf_company_required_certificate
  ADD CONSTRAINT FK_pf_certificate_TO_pf_company_required_certificate -- 자격증 -> 기업요구자격증
    FOREIGN KEY (
      certificate_no -- 자격증번호
    )
    REFERENCES pf_certificate ( -- 자격증
      certificate_no -- 자격증번호
    );

-- 기업요구자격증
ALTER TABLE pf_company_required_certificate
  ADD CONSTRAINT FK_pf_job_posting_TO_pf_company_required_certificate -- 채용공고 -> 기업요구자격증
    FOREIGN KEY (
      job_posting_no -- 채용공고번호
    )
    REFERENCES pf_job_posting ( -- 채용공고
      job_posting_no -- 채용공고번호
    );

-- QNA질문
ALTER TABLE pf_qna
  ADD CONSTRAINT FK_pf_board_TO_pf_qna -- 게시글 -> QNA질문
    FOREIGN KEY (
      board_no -- 게시글번호
    )
    REFERENCES pf_board ( -- 게시글
      board_no -- 게시글번호
    );

-- QNA질문
ALTER TABLE pf_qna
  ADD CONSTRAINT FK_pf_members_TO_pf_qna -- 회원 -> QNA질문
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- QNA질문
ALTER TABLE pf_qna
  ADD CONSTRAINT FK_pf_question_category_TO_pf_qna -- 질문분류 -> QNA질문
    FOREIGN KEY (
      category_no -- 질문분류번호
    )
    REFERENCES pf_question_category ( -- 질문분류
      category_no -- 질문분류번호
    );

-- 회원기업공고지원
ALTER TABLE pf_apply
  ADD CONSTRAINT FK_pf_general_member_TO_pf_apply -- 일반회원 -> 회원기업공고지원
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_general_member ( -- 일반회원
      general_member_no -- 일반회원번호
    );

-- 회원기업공고지원
ALTER TABLE pf_apply
  ADD CONSTRAINT FK_pf_job_posting_TO_pf_apply -- 채용공고 -> 회원기업공고지원
    FOREIGN KEY (
      job_posting_no -- 채용공고번호
    )
    REFERENCES pf_job_posting ( -- 채용공고
      job_posting_no -- 채용공고번호
    );

-- 채용추천
ALTER TABLE pf_job_recommendation
  ADD CONSTRAINT FK_pf_general_member_TO_pf_job_recommendation -- 일반회원 -> 채용추천
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_general_member ( -- 일반회원
      general_member_no -- 일반회원번호
    );

-- 채용추천
ALTER TABLE pf_job_recommendation
  ADD CONSTRAINT FK_pf_job_posting_TO_pf_job_recommendation -- 채용공고 -> 채용추천
    FOREIGN KEY (
      job_posting_no -- 채용공고번호
    )
    REFERENCES pf_job_posting ( -- 채용공고
      job_posting_no -- 채용공고번호
    );

-- 게시글추천
ALTER TABLE pf_recommendation
  ADD CONSTRAINT FK_pf_board_TO_pf_recommendation -- 게시글 -> 게시글추천
    FOREIGN KEY (
      board_no -- 게시글번호
    )
    REFERENCES pf_board ( -- 게시글
      board_no -- 게시글번호
    );

-- 게시글추천
ALTER TABLE pf_recommendation
  ADD CONSTRAINT FK_pf_members_TO_pf_recommendation -- 회원 -> 게시글추천
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 팔로잉
ALTER TABLE pf_following
  ADD CONSTRAINT FK_pf_members_TO_pf_following -- 회원 -> 팔로잉
    FOREIGN KEY (
      follower -- 팔로워
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 팔로잉
ALTER TABLE pf_following
  ADD CONSTRAINT FK_pf_members_TO_pf_following2 -- 회원 -> 팔로잉2
    FOREIGN KEY (
      following -- 팔로잉
    )
    REFERENCES pf_members ( -- 회원
      member_no -- 회원번호
    );

-- 일정(개인용)
ALTER TABLE pf_schedule
  ADD CONSTRAINT FK_pf_general_member_TO_pf_schedule -- 일반회원 -> 일정(개인용)
    FOREIGN KEY (
      general_member_no -- 일반회원번호
    )
    REFERENCES pf_general_member ( -- 일반회원
      general_member_no -- 일반회원번호
    );


-- FAQ 자주묻는질문
ALTER TABLE pf_faq
  ADD CONSTRAINT FK_pf_board_TO_pf_faq -- 게시글 -> FAQ 자주묻는질문
    FOREIGN KEY (
      board_no -- 게시글번호
    )
    REFERENCES pf_board ( -- 게시글
      board_no -- 게시글번호
    );

-- FAQ 자주묻는질문
ALTER TABLE pf_faq
  ADD CONSTRAINT FK_pf_question_category_TO_pf_faq -- 질문분류 -> FAQ 자주묻는질문
    FOREIGN KEY (
      category_no -- 질문분류번호
    )
    REFERENCES pf_question_category ( -- 질문분류
      category_no -- 질문분류번호
    );

