drop table price;
--판매 가격 테이블
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

SELECT * FROM price;

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