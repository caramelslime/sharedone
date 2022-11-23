SELECT * FROM tabs;

CREATE TABLE product (
	productcd VARCHAR2(20) PRIMARY KEY,
	productnm VARCHAR2(50),
	unit VARCHAR2(10),
	productgroup VARCHAR2(20)
);

SELECT * FROM product;

drop table price;
--판매 가격 테이블
CREATE TABLE price (
	pricingcd	varchar2(20)	PRIMARY KEY	NOT NULL,
	buyercd	varchar2(20)	NOT NULL,
	productcd	VARCHAR2(20)	NOT NULL,
    price number(11) NOT NULL,
	currency	VARCHAR2(10)	NOT NULL,
	periodstart	date	NOT NULL,
	periodend	date	NOT NULL,
	rate	VARCHAR2(10)	NOT NULL
);

SELECT * FROM price;

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

INSERT INTO price VALUES ( 'A00001', 'A00011', 'A00021', '2000', '원', '2022-11-20', '2022-11-22', '30' );
INSERT INTO price VALUES ( 'A00002', 'A00011', 'A00021', '1500', '원', '2022-11-20', '2022-11-22', '30' );
INSERT INTO price VALUES ( 'A00003', 'A00011', 'A00021', '3000', '원', '2022-11-20', '2022-11-22', '30' );
INSERT INTO price VALUES ( 'A00004', 'A00011', 'A00021', '2000', '원', '2022-11-20', '2022-11-22', '30' );
INSERT INTO price VALUES ( 'A00005', 'A00011', 'A00021', '1200', '원', '2022-11-20', '2022-11-22', '30' );
INSERT INTO price VALUES ( 'B00001', 'A00011', 'A00021', '1800', '원', '2022-11-20', '2022-11-22', '30' );
INSERT INTO price VALUES ( 'B00002', 'A00011', 'A00021', '1900', '원', '2022-11-20', '2022-11-22', '30' );
INSERT INTO price VALUES ( 'B00003', 'A00011', 'A00021', '2000', '원', '2022-11-20', '2022-11-22', '30' );
INSERT INTO price VALUES ( 'B00004', 'A00011', 'A00021', '2400', '원', '2022-11-20', '2022-11-22', '30' );
INSERT INTO price VALUES ( 'B00005', 'A00011', 'A00021', '5500', '원', '2022-11-20', '2022-11-22', '30' );
