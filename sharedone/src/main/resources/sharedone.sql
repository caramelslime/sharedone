--판매가격 테이블
drop table price;

CREATE TABLE price (
	buyercd	VARCHAR2(20)	NOT NULL,
	productcd	VARCHAR2(20)	NOT NULL,
	periodstart	date	NOT NULL,
	periodend	date	NOT NULL,
    listPrice NUMBER(11) NOT NULL,
	currency	VARCHAR2(10)	NOT NULL,
	del CHAR(1),
	PRIMARY KEY (buyercd, productcd, periodstart)
);

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
CREATE TABLE NOTICE (
	NOTICECD	number(11)	NOT NULL,
	CONTENT	VARCHAR(1000)	NOT NULL,
	EMPCD	varchar(20)	NOT NULL  references m_employee(empcd),
	SONO	VARCHAR2(20)	NOT NULL  references order(SONO),
	registDate	date	NOT NULL
);
SELECT * FROM product;

INSERT INTO product VALUES ( 'P00001', '새우깡', 'box', '스넥류' );
INSERT INTO product VALUES ( 'P00002', '포카칩', 'box', '스넥류' );
INSERT INTO product VALUES ( 'P00003', '바나나킥', 'box', '스넥류' );
INSERT INTO product VALUES ( 'P00004', '꼬북칩', 'box', '스넥류' );
INSERT INTO product VALUES ( 'P00005', '빈츠', 'box', '스넥류' );
INSERT INTO product VALUES ( 'P00006', 'ABC 초콜릿', 'box', '초콜릿류' );
INSERT INTO product VALUES ( 'P00007', '트윅스', 'box', '초콜릿류' );
INSERT INTO product VALUES ( 'P00008', '스니커즈', 'box', '초콜릿류' );
INSERT INTO product VALUES ( 'P00009', '카카오 72', 'box', '초콜릿류' );
INSERT INTO product VALUES ( 'P00010', '허쉬', 'box', '초콜릿류' );

delete from employee;
insert into employee values('E00001','1234','010-8838-0247','김현서','ksh98520@naver.com','1998-07-13','영업1','staff');
insert into employee values('E00002','1234','010-8838-0245','엄준식','ksh624@naver.com','1998-07-05','영업1','staff');
insert into employee values('E00003','1234','010-2634-0247','하인호','ksh5325@naver.com','1995-03-24','영업1','staff');
insert into employee values('E00004','1234','010-7457-0247','최인석','ksh93250@naver.com','1990-06-22','영업1','staff');
insert into employee values('E00005','1234','010-3067-4088','강병준','kbj010@naver.com','2002-03-29','영업1','manager');
select * from employee;

INSERT INTO price VALUES ( 'A00011', 'A00021', '2022-11-20', '2022-12-20', '2000', '원', 'n' );
INSERT INTO price VALUES ( 'A00012', 'A00022', '2022-11-21', '2022-12-21', '1500', '원', 'n' );
INSERT INTO price VALUES ( 'A00013', 'A00023', '2022-11-22', '2022-12-22', '3000', '원', 'n' );
INSERT INTO price VALUES ( 'A00014', 'A00024', '2022-11-23', '2022-12-23', '2000', '원', 'n' );
INSERT INTO price VALUES ( 'A00015', 'A00025', '2022-11-24', '2022-12-24', '1200', '원', 'n' );
INSERT INTO price VALUES ( 'A00011', 'A00021', '2022-11-05', '2022-12-05', '1800', '원', 'n' );
INSERT INTO price VALUES ( 'A00012', 'A00022', '2022-11-06', '2022-12-06', '1900', '원', 'n' );
INSERT INTO price VALUES ( 'A00013', 'A00023', '2022-11-07', '2022-12-07', '2000', '원', 'n' );
INSERT INTO price VALUES ( 'A00014', 'A00024', '2022-11-08', '2022-12-08', '2400', '원', 'n' );
INSERT INTO price VALUES ( 'A00015', 'A00025', '2022-11-09', '2022-12-09', '5500', '원', 'n' );