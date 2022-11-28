--거래처 마스터 테이블
CREATE TABLE M_BUYER (
	BUYERCD	VARCHAR2(20) PRIMARY KEY,		--거래처코드
	BUYERNM	VARCHAR2(50) NOT NULL,			--거래처명
	BRNO CHAR(10) NOT NULL,					--사업자등록번호
	RPRSV_NM VARCHAR2(40) NOT NULL,			--대표자
	BUSINESS_STATUS	VARCHAR2(200) NOT NULL,	--업태
	EVENT VARCHAR2(200) NOT	NULL,			--종목
	RECEIVEUSERID VARCHAR2(40) NOT NULL,	--담당자
	STATUS VARCHAR2(20) NOT NULL,			--거래처상태
	NATIONCD CHAR(2) NOT NULL,				--국가코드
	POSTCODE CHAR(5) NOT NULL,				--우편번호
	ADDRESS	VARCHAR2(50) NOT NULL,			--소재지
	ADDRESS_DETAIL VARCHAR2(50) NOT NULL,	--소재지상세
	TEL	CHAR(11) NOT NULL,					--전화번호
	EMAIL VARCHAR2(320)	NULL,				--이메일
	REMARK VARCHAR2(1000) NULL,				--참고사항
	ADDDATE	DATE NOT NULL,					--등록일시
	ADDUSER	VARCHAR2(255) NOT NULL,			--작성자
	DELYN CHAR DEFAULT 'n' NOT NULL			--삭제여부
);

--fk추가해야함
SELECT * FROM M_BUYER;
DROP TABLE M_BUYER;
ALTER TABLE m_buyer MODIFY nationcd char(5);
DELETE FROM m_buyer WHERE buyercd='BA0009';

insert into M_BUYER values(
'BA0001' 				--거래처코드
, '이마트'				--거래처명
, '2068650913'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, '김철수'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, ''					--이메일
, ''					--참고사항
, sysdate				--등록일시
, '김철수'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'BA0002' 				--거래처코드
, '노스마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '소매업'				--업태
, '식품'					--종목
, '김미애'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, ''					--이메일
, ''					--참고사항
, sysdate				--등록일시
, '김미애'				--작성자
, 'n' 					--삭제여부
);

update M_BUYER set remark='이 가게는 우리집 앞에 있다 안간지 오래됐넹 한번 가보쟈' where buyercd='BA0001';
update M_BUYER set email='emart@emart.com' where buyercd='BA0001';


drop table employee;
--직원 테이블
CREATE TABLE employee (
	EMPCD	varchar(20)	NOT NULL PRIMARY KEY,
	PW	varchar(40)	NOT NULL,
	PHONE_NO	VARCHAR(20)	NOT NULL,
    name varchar(20) NOT NULL,
	EMAIL	VARCHAR(50)	NOT NULL,
	HIREDATE	date	NOT NULL,
    DEPT VARCHAR(20) NOT NULL,
	JOB	VARCHAR(10)	NOT NULL
);
-- 판매부번 테이블
CREATE TABLE product (
	productcd VARCHAR2(20) PRIMARY KEY,
	productnm VARCHAR2(50),
	unit VARCHAR2(10),
	productgroup VARCHAR2(20)
);

SELECT * FROM product;

INSERT INTO product VALUES ( 'A00001', '새우깡', 'box', '스넥류' );
INSERT INTO product VALUES ( 'A00002', '포카칩', 'box', '스넥류' );
INSERT INTO product VALUES ( 'A00003', '바나나킥', 'box', '스넥류' );
INSERT INTO product VALUES ( 'A00004', '꼬북칩', 'box', '스넥류' );
INSERT INTO product VALUES ( 'A00005', '빈츠', 'box', '스넥류' );
INSERT INTO product VALUES ( 'B00001', 'ABC 초콜릿', 'box', '초콜릿류' );
INSERT INTO product VALUES ( 'B00002', '트윅스', 'box', '초콜릿류' );
INSERT INTO product VALUES ( 'B00003', '스니커즈', 'box', '초콜릿류' );
INSERT INTO product VALUES ( 'B00004', '카카오 72', 'box', '초콜릿류' );
INSERT INTO product VALUES ( 'B00005', '허쉬', 'box', '초콜릿류' );

delete from employee;
insert into employee values('b0247','1234','010-8838-0247','김현서','ksh98520@naver.com','1998-07-13','영업1','staff');
insert into employee values('b1234','1234','010-8838-0245','엄준식','ksh624@naver.com','1998-07-05','영업1','staff');
insert into employee values('b2345','1234','010-2634-0247','하인호','ksh5325@naver.com','1995-03-24','영업1','staff');
insert into employee values('b3456','1234','010-7457-0247','최인석','ksh93250@naver.com','1990-06-22','영업1','staff');
insert into employee values('b4567','1234','010-3067-4088','강병준','kbj010@naver.com','2002-03-29','영업1','manager');
select * from employee;