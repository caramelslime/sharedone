drop table m_employee cascade constraint;
drop table m_product cascade constraint;
drop table M_BUYER cascade constraint;
drop table m_price cascade constraint;
drop table t_order cascade constraint;
drop table t_order_detail cascade constraint;
drop table t_notice cascade constraint;
--직원 테이블
CREATE TABLE m_employee (
	EMPCD	varchar(20)	NOT NULL PRIMARY KEY,
	PW	varchar(40)	NOT NULL,
	PHONE	VARCHAR(20)	NOT NULL,
    name varchar(20) NOT NULL,
	EMAIL	VARCHAR(50)	NOT NULL,
	HIREDATE	date	NOT NULL,
    DEPT VARCHAR(20) NOT NULL,
	JOB	VARCHAR(10)	NOT NULL
);
-- 판매부번 테이블
CREATE TABLE m_product (
	productcd VARCHAR2(20) PRIMARY KEY,
	productnm VARCHAR2(50),
	unit VARCHAR2(10),
	productgroup VARCHAR2(20),
	delyn CHAR(1)
);

--거래처 테이블
CREATE TABLE M_BUYER (
	BUYERCD	VARCHAR2(20) PRIMARY KEY,		--거래처코드
	BUYERNM	VARCHAR2(50) NOT NULL,			--거래처명
	BRNO CHAR(10) NOT NULL,					--사업자등록번호
	RPRSVNM VARCHAR2(40) NOT NULL,			--대표자
	BUSINESSSTATUS	VARCHAR2(200) NOT NULL,	--업태
	EVENT VARCHAR2(200) NOT	NULL,			--종목
	EMPCD VARCHAR2(40)  NOT NULL,			--담당자
	STATUS VARCHAR2(20) NOT NULL,			--거래처상태
	NATIONCD CHAR(2) NOT NULL,				--국가코드
	POSTCODE CHAR(5) NOT NULL,				--우편번호
	ADDRESS	VARCHAR2(50) NOT NULL,			--소재지
	ADDRESSDETAIL VARCHAR2(50) NOT NULL,	--소재지상세
	TEL	CHAR(11) NOT NULL,					--전화번호
	EMAIL VARCHAR2(320)	NULL,				--이메일
	REMARK VARCHAR2(1000) NULL,				--참고사항
	ADDDATE	DATE NOT NULL,					--등록일시
	ADDUSER	VARCHAR2(255) NOT NULL,			--작성자
	DELYN CHAR DEFAULT 'n' NOT NULL			--삭제여부
);
--판매가격 테이블
CREATE TABLE m_price (
	buyercd	VARCHAR2(20)	NOT NULL references M_BUYER(buyercd),
	productcd	VARCHAR2(20)	NOT NULL references M_PRODUCT(productcd),
	periodstart	date	NOT NULL,
	periodend	date	NOT NULL,
    listPrice NUMBER(11) NOT NULL,
	currency	VARCHAR2(20)	NOT NULL,
	del CHAR(1) NOT NULL,
	PRIMARY KEY (buyercd, productcd, periodstart)
);
--오더 헤더 테이블
CREATE TABLE t_order (
	sono VARCHAR2(20) PRIMARY KEY,
	buyercd VARCHAR2(20) NOT NULL references M_BUYER(buyercd),
	souser VARCHAR2(20) NOT NULL references M_EMPLOYEE(empcd),
	adddate DATE NOT NULL,
	pricingdate DATE NOT NULL,
	requestdate DATE NOT NULL,
	status VARCHAR(20) NOT NULL, -- 임시저장,승인대기,승인완료,반려,종결
	currency CHAR(3) NOT NULL
);
--오더 아이템 테이블
CREATE TABLE t_order_detail (
	sono VARCHAR2(20) NOT NULL,
	productcd VARCHAR2(20) NOT NULL references M_PRODUCT(productcd),
	qty number(11) NOT NULL,
	unitprice number(11) NOT NULL,
	CONSTRAINT t_order_detail_pk PRIMARY KEY (sono, productcd)
);
--코멘트 테이블
CREATE TABLE t_NOTICE (
	NOTICECD	number(11)	NOT NULL PRIMARY KEY,
	CONTENT	VARCHAR(1000)	NOT NULL,
	EMPCD	varchar(20)	NOT NULL references M_EMPLOYEE(empcd),
	SONO	VARCHAR2(20)	NOT NULL references T_ORDER(sono),
	registDate	date	NOT NULL,
	status varchar(20) not null--상태로는 승인,반려,승인요청이 있을거 같습니다.
);