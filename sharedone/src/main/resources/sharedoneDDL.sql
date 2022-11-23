drop table employee;
--직원 테이블
CREATE TABLE employee (
	EMPCD	varchar(20)	NOT NULL,
	PW	varchar(40)	NOT NULL,
	PHONE_NO	VARCHAR(20)	NOT NULL,
    name varchar(20) NOT NULL,
	EMAIL	VARCHAR(50)	NOT NULL,
	HIREDATE	date	NOT NULL,
	JOB	VARCHAR(10)	NOT NULL,
	rank	VARCHAR(10)	NOT NULL,
	authority	char(1) DEFAULT 'n'   NULL
);
-- 판매부번 테이블
CREATE TABLE product (
	productcd VARCHAR2(20) PRIMARY KEY,
	productnm VARCHAR2(50),
	unit VARCHAR2(10),
	productgroup VARCHAR2(20)
);