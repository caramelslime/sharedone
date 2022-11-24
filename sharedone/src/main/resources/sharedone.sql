SELECT * FROM tabs;

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