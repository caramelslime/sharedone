
-- 제품 테이블

CREATE TABLE m_product (
	productcd VARCHAR2(20) PRIMARY KEY,
	productnm VARCHAR2(50),
	unit VARCHAR2(10),
	productgroup VARCHAR2(20),
	delyn CHAR(1)
);

INSERT INTO m_product VALUES ( 'P00001', '새우깡', 'box', '스낵류', 'n' );
INSERT INTO m_product VALUES ( 'P00002', '포카칩', 'box', '스낵류', 'n'  );
INSERT INTO m_product VALUES ( 'P00003', '바나나킥', 'box', '스낵류', 'n'  );
INSERT INTO m_product VALUES ( 'P00004', '꼬북칩', 'box', '스낵류', 'n'  );
INSERT INTO m_product VALUES ( 'P00005', '빈츠', 'box', '스낵류', 'n'  );
INSERT INTO m_product VALUES ( 'P00006', 'ABC 초콜릿', 'box', '초콜릿류', 'n'  );
INSERT INTO m_product VALUES ( 'P00007', '트윅스', 'box', '초콜릿류', 'n'  );
INSERT INTO m_product VALUES ( 'P00008', '스니커즈', 'box', '초콜릿류', 'n'  );
INSERT INTO m_product VALUES ( 'P00009', '카카오 72', 'box', '초콜릿류', 'n'  );
INSERT INTO m_product VALUES ( 'P00010', '허쉬', 'box', '초콜릿류', 'n'  );


-- 오더 테이블

CREATE TABLE t_order (
	sono VARCHAR2(20) PRIMARY KEY,
	buyercd VARCHAR2(20),
	souser VARCHAR2(20),
	adddate DATE,
	pricingdate DATE,
	requestdate DATE,
	status VARCHAR(20),
	currency CHAR(3)
);

INSERT INTO t_order VALUES ('S00001', 'B00001', '아무개', TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-12-04', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00002', 'B00003', '아무개', TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-12-04', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00003', 'B00005', '아무개', TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-25', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00004', 'B00007', '아무개', TO_DATE('2022-11-07', 'YYYY--MM-DD'), TO_DATE('2022-11-07', 'YYYY--MM-DD'), TO_DATE('2022-12-05', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00005', 'B00009', '아무개', TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-12-10', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00006', 'B00011', '아무개', TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-12-30', 'YYYY--MM-DD'), '반려', 'KRW');
INSERT INTO t_order VALUES ('S00007', 'B00002', '아무개', TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-12-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
INSERT INTO t_order VALUES ('S00008', 'B00004', '아무개', TO_DATE('2022-11-19', 'YYYY--MM-DD'), TO_DATE('2022-11-19', 'YYYY--MM-DD'), TO_DATE('2022-12-10', 'YYYY--MM-DD'), '승인대기', 'KRW');
INSERT INTO t_order VALUES ('S00009', 'B00006', '아무개', TO_DATE('2022-11-25', 'YYYY--MM-DD'), TO_DATE('2022-11-25', 'YYYY--MM-DD'), TO_DATE('2022-12-23', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00010', 'B00008', '아무개', TO_DATE('2022-11-26', 'YYYY--MM-DD'), TO_DATE('2022-11-26', 'YYYY--MM-DD'), TO_DATE('2022-12-18', 'YYYY--MM-DD'), '입력완료', 'KRW');


-- 오더 디테일 테이블

CREATE TABLE t_order_detail (
	sono VARCHAR2(20),
	productcd VARCHAR2(20),
	qty number(11),
	unitprice number(11)
);

INSERT INTO t_order_detail VALUES ('S00001', 'P00002', 10, 30000);
INSERT INTO t_order_detail VALUES ('S00001', 'P00009', 5, 30000);
INSERT INTO t_order_detail VALUES ('S00001', 'P00010', 5, 50000);

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












-- test

SELECT * FROM product WHERE productCD LIKE '%A0%' AND productNM LIKE '%새우%';

<select id="productList" parameterType="product" resultType="product">
		SELECT * FROM (SELECT a.*, rowNum rn FROM (SELECT * FROM product
			<where>
				<!-- keyword에 값이 있으면 where속에 like옵션을 사용 ${}변수 #{}은 값 -->
				<!-- #은 값 $는 변수를 의미, #은 작은 따옴표 예) 'writer' $면 writer -->
				<if test="keyword!=null and keyword!=''">
					<if test="search=='subcon'">
						productCD LIKE '%'||#{keyword1}||'%' AND
						contproductNM LIKE '%'||#{keyword2}||'%'
					</if>
					<if test="search!='subcon'">
						<!-- subject like '%'||'비'||'%' -->
						${search} LIKE '%'||#{keyword}||'%'
					</if>					
				</if>
			</where>
			ORDER BY ref DESC, re_step ASC) a)
				WHERE rn BETWEEN #{startRow} AND #{endRow}
</select>



SELECT * FROM TABS;

CREATE TABLE t_order (
	sono VARCHAR2(20) PRIMARY KEY,
	buyercd VARCHAR2(20),
	souser VARCHAR2(20),
	adddate DATE,
	pricingdate DATE,
	requestdate DATE,
	status VARCHAR(20),
	currency CHAR(3)
);

INSERT INTO t_order VALUES ('S00001', 'B00001', '아무개', TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-12-04', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00002', 'B00003', '아무개', TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-12-04', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00003', 'B00005', '아무개', TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-25', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00004', 'B00007', '아무개', TO_DATE('2022-11-07', 'YYYY--MM-DD'), TO_DATE('2022-11-07', 'YYYY--MM-DD'), TO_DATE('2022-12-05', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00005', 'B00009', '아무개', TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-12-10', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00006', 'B00011', '아무개', TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-12-30', 'YYYY--MM-DD'), '반려', 'KRW');
INSERT INTO t_order VALUES ('S00007', 'B00002', '아무개', TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-12-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
INSERT INTO t_order VALUES ('S00008', 'B00004', '아무개', TO_DATE('2022-11-19', 'YYYY--MM-DD'), TO_DATE('2022-11-19', 'YYYY--MM-DD'), TO_DATE('2022-12-10', 'YYYY--MM-DD'), '승인대기', 'KRW');
INSERT INTO t_order VALUES ('S00009', 'B00006', '아무개', TO_DATE('2022-11-25', 'YYYY--MM-DD'), TO_DATE('2022-11-25', 'YYYY--MM-DD'), TO_DATE('2022-12-23', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00010', 'B00008', '아무개', TO_DATE('2022-11-26', 'YYYY--MM-DD'), TO_DATE('2022-11-26', 'YYYY--MM-DD'), TO_DATE('2022-12-18', 'YYYY--MM-DD'), '입력완료', 'KRW');

DROP TABLE t_order;


CREATE TABLE t_order_detail (
	sono VARCHAR2(20),
	productcd VARCHAR2(20),
	qty number(11),
	unitprice number(11)
	--CONSTRAINT t_order_detail_pk PRIMARY KEY (sono, productcd)
);


DROP TABLE t_order_detail;

SELECT * FROM t_order;
SELECT * FROM t_order_detail;


INSERT INTO t_order VALUES ('SO00001', 'A00001', );


SELECT * FROM product;

SELECT * FROM product WHERE productcd = 'A00001';

SELECT * FROM product WHERE productnm = '새우깡';

SELECT * FROM product WHERE productgroup = '스낵류'


SELECT * FROM product WHERE productcd = 'A00001' AND productgroup = '스낵류';

SELECT * FROM product
WHERE upper(productCD) like upper('%a00%') ORDER BY productCD;


INSERT INTO t_order_detail VALUES ('S00001', 'P00002', 10, 30000);
INSERT INTO t_order_detail VALUES ('S00001', 'P00009', 5, 30000);
INSERT INTO t_order_detail VALUES ('S00001', 'P00010', 5, 50000);



SELECT * FROM t_order WHERE soNo = 'S00001';

SELECT * FROM m_buyer;

SELECT d.*, productNM, unit, productGroup  FROM t_order_detail d, m_product p WHERE d.productCD=p.productCD  AND soNo='S00001';

DELETE t_order_detail WHERE soNo='S00001' AND productCD='P00003';


SELECT * FROM t_order;
SELECT * FROM t_order_detail;

INSERT INTO t_order VALUES (#{soNo}, #{buyerCD}, #{soUser}, sysdate, sysdate, #{requestDate}, '임시저장', #{currency})

DELETE FROM t_order WHERE soNo = 'P00021';


UPDATE m_product SET productNM = #{productNM} WHERE productCD = #{productCD}


SELECT * FROM t_notice;

SELECT content FROM t_notice WHERE noticeCd = (SELECT MAX(noticeCd) FROM t_notice WHERE empCd='E00004' AND soNo='S00033');

SELECT content FROM t_notice WHERE noticeCd = (SELECT MAX(noticeCd) FROM t_notice WHERE empCd=#{empCd} AND soNo=#{soNo})

SELECT COUNT(*) FROM t_notice WHERE empCd='E00004' AND soNo='S00033';

SELECT COUNT(*) FROM t_notice WHERE empCD='E00004' AND soNo='S00034';
SELECT COUNT(*) FROM t_notice WHERE empCd=#{empCd} AND soNo=#{soNo}


SELECT * FROM m_employee;

SELECT * FROM t_order WHERE pricingDate BETWEEN TO_DATE('2022-10-04', 'YYYY-MM-DD') AND TO_DATE('2022-10-05', 'YYYY-MM-DD');


INSERT INTO m_price VALUES ( 'B00000', 'P00001', '1900-01-01', '1900-01-01', '20000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00002', '1900-01-01', '1900-01-01', '15000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00003', '1900-01-01', '1900-01-01', '30000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00004', '1900-01-01', '1900-01-01', '20000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00005', '1900-01-01', '1900-01-01', '12000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00006', '1900-01-01', '1900-01-01', '18000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00007', '1900-01-01', '1900-01-01', '19000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00008', '1900-01-01', '1900-01-01', '20000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00009', '1900-01-01', '1900-01-01', '24000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00010', '1900-01-01', '1900-01-01', '55000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00011', '1900-01-01', '1900-01-01', '30000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00012', '1900-01-01', '1900-01-01', '25000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00013', '1900-01-01', '1900-01-01', '40000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00014', '1900-01-01', '1900-01-01', '30000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00015', '1900-01-01', '1900-01-01', '22000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00016', '1900-01-01', '1900-01-01', '28000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00017', '1900-01-01', '1900-01-01', '12000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00018', '1900-01-01', '1900-01-01', '15000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00019', '1900-01-01', '1900-01-01', '45000', 'KRW', 'n' );
INSERT INTO m_price VALUES ( 'B00000', 'P00020', '1900-01-01', '1900-01-01', '55000', 'KRW', 'n' );

INSERT INTO m_price VALUES ( 'B00001', 'P00006', '2022-12-06', '2022-12-31', '22000', 'KRW', 'n' );

DELETE m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND listprice = 22000;

SELECT periodStart FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW';
SELECT periodEnd FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW';

TO_DATE('2022-11-15', 'YYYY--MM-DD')


SELECT COUNT(*) FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW'
	AND sysdate BETWEEN (SELECT periodStart FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW')
		AND (SELECT periodEnd FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW');

SELECT * FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW'
	AND sysdate BETWEEN (SELECT periodStart FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW')
		AND (SELECT periodEnd FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW');

SELECT count(*) FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW' AND sysdate >= periodstart AND sysdate <=periodend;

SELECT listprice FROM m_price WHERE buyerCD = 'B00001' AND productCD = 'P00006' AND currency='KRW' AND sysdate >= periodstart AND sysdate <=periodend;

SELECT listprice FROM m_price WHERE buyerCD = 'B00000' AND productCD = 'P00006' AND currency='KRW';

SELECT * FROM t_order_detail;

UPDATE t_order_detail SET productNM = #{productNM} WHERE productCD = #{productCD}

SELECT * FROM m_price;
UPDATE m_price SET del = 'y' WHERE buyercd = 'B00000';

SELECT * FROM m_buyer;

UPDATE m_buyer SET delyn = 'y' WHERE buyercd = 'B00000';

SELECT * FROM m_employee;

SELECT * FROM tabs;

SELECT * FROM t_order;

SELECT * FROM m_buyer;

SELECT * FROM m_employee;

SELECT o.*, buyernm, name FROM t_order o, m_buyer b, m_employee e WHERE o.buyercd = b.buyercd AND o.souser = e.empcd ORDER BY soNo DESC;


SELECT SUM(unitprice * qty) FROM t_order_detail WHERE soNo = 'S00053';

SELECT SUM(unitprice * qty) FROM t_order_detail WHERE soNo = #{soNo}


t_order o, m_buyer b, m_employee e


SELECT o.*, buyerNM, name FROM t_order o, m_buyer b, m_employee e WHERE currency IS NOT NULL AND o.buyerCD = b.buyerCD AND o.soUser = e.empcd ORDER BY soNo;

SELECT * FROM t_order WHERE soUser = '' ORDER BY soNo DESC;

SELECT * FROM m_buyer;

SELECT * FROM t_order;


INSERT INTO m_price VALUES ( 'B00000', #{productCD, '1900-01-01', '1900-01-01', #{defaultPrice}, 'KRW', 'n' );

DELETE FROM m_product WHERE productCD = 'P00032';


SELECT * FROM m_product;

SELECT COUNT(*) FROM m_product WHERE productNM = '가나다';

SELECT COUNT(*) FROM m_product WHERE productNM = #{productNM}


SELECT COUNT(*) FROM m_price WHERE buyerCD = 'B00024' AND productCD = 'P00001' AND currency = 'KRW' AND TO_DATE('2022-12-08', 'YYYY--MM-DD') >= periodstart AND TO_DATE('2022-12-10', 'YYYY--MM-DD') <=periodend

