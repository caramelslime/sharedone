--거래처 마스터 테이블
CREATE TABLE M_BUYER (
	BUYERCD	VARCHAR2(20) PRIMARY KEY,		--거래처코드
	BUYERNM	VARCHAR2(50) NOT NULL,			--거래처명
	BRNO CHAR(10) NOT NULL,					--사업자등록번호
	RPRSV_NM VARCHAR2(40) NOT NULL,			--대표자
	BUSINESS_STATUS	VARCHAR2(200) NOT NULL,	--업태
	EVENT VARCHAR2(200) NOT	NULL,			--종목
	EMPCD VARCHAR2(40) NOT NULL,			--담당자
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
	DELYN CHAR DEFAULT 'n' NOT NULL,		--삭제여부
);

--fk추가해야함
SELECT * FROM M_BUYER;
DROP TABLE M_BUYER;
ALTER TABLE m_buyer MODIFY nationcd char(5);
DELETE FROM m_buyer WHERE buyercd='B00002';

insert into M_BUYER values(
'B00001' 				--거래처코드
, '이마트'				--거래처명
, '2068650913'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'b1234'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b1234'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00002' 				--거래처코드
, '노스마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00003' 				--거래처코드
, '가마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00004' 				--거래처코드
, '나마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00005' 				--거래처코드
, '다마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00006' 				--거래처코드
, '라마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00007' 				--거래처코드
, '마마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00008' 				--거래처코드
, '바마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00009' 				--거래처코드
, '사마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00010' 				--거래처코드
, '아마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00011' 				--거래처코드
, '자마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00012' 				--거래처코드
, '차마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00013' 				--거래처코드
, '카마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00014' 				--거래처코드
, '타마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00015' 				--거래처코드
, '파마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '도소매업'				--업태
, '식료품'				--종목
, 'b0247'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, 'test2@test2.com'		--이메일
, ''					--참고사항
, sysdate				--등록일시
, 'b0247'				--작성자
, 'n' 					--삭제여부
);


update M_BUYER set remark='이 가게는 우리집 앞에 있다 안간지 오래됐넹 한번 가보쟈' where buyercd='B00001';
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

delete from employee;
insert into employee values('b0247','1234','010-8838-0247','김현서','ksh98520@naver.com','1998-07-13','영업1','staff');
insert into employee values('b1234','1234','010-8838-0245','엄준식','ksh624@naver.com','1998-07-05','영업1','staff');
insert into employee values('b2345','1234','010-2634-0247','하인호','ksh5325@naver.com','1995-03-24','영업1','staff');
insert into employee values('b3456','1234','010-7457-0247','최인석','ksh93250@naver.com','1990-06-22','영업1','staff');
insert into employee values('b4567','1234','010-3067-4088','강병준','kbj010@naver.com','2002-03-29','영업1','manager');
select * from employee;




-- 제품 테이블

DROP TABLE m_product;

CREATE TABLE m_product (
	productcd VARCHAR2(20) PRIMARY KEY,
	productnm VARCHAR2(50),
	unit VARCHAR2(10),
	productgroup VARCHAR2(20),
	del CHAR(1)
);

SELECT * FROM m_product;

INSERT INTO m_product VALUES ( 'A00001', '새우깡', 'box', '스낵류', 'n' );
INSERT INTO m_product VALUES ( 'A00002', '포카칩', 'box', '스낵류', 'n'  );
INSERT INTO m_product VALUES ( 'A00003', '바나나킥', 'box', '스낵류', 'n'  );
INSERT INTO m_product VALUES ( 'A00004', '꼬북칩', 'box', '스낵류', 'n'  );
INSERT INTO m_product VALUES ( 'A00005', '빈츠', 'box', '스낵류', 'n'  );
INSERT INTO m_product VALUES ( 'B00001', 'ABC 초콜릿', 'box', '초콜릿류', 'n'  );
INSERT INTO m_product VALUES ( 'B00002', '트윅스', 'box', '초콜릿류', 'n'  );
INSERT INTO m_product VALUES ( 'B00003', '스니커즈', 'box', '초콜릿류', 'n'  );
INSERT INTO m_product VALUES ( 'B00004', '카카오 72', 'box', '초콜릿류', 'n'  );
INSERT INTO m_product VALUES ( 'B00005', '허쉬', 'box', '초콜릿류', 'n'  );

UPDATE m_product set del='n';

DELETE m_product;
SELECT * FROM TABS;

select * from t_order;
drop table t_order;
drop table t_order_detail;
CREATE TABLE t_order (
	sono VARCHAR2(20) PRIMARY KEY,
	buyercd VARCHAR2(20),
	souser VARCHAR2(20),
	adddate DATE,
	pricingdate DATE,
	requestdate DATE,
	status VARCHAR(20),
	currency CHAR(3),
);

INSERT INTO t_order VALUES ('S00001', 'B00001', 'b0247', TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-01', 'YYYY--MM-DD'), TO_DATE('2022-11-05', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00002', 'B00003', 'b0247', TO_DATE('2022-11-05', 'YYYY--MM-DD'), TO_DATE('2022-11-02', 'YYYY--MM-DD'), TO_DATE('2022-11-10', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00003', 'B00005', 'b0247', TO_DATE('2022-11-05', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-25', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00004', 'B00007', 'b0247', TO_DATE('2022-11-07', 'YYYY--MM-DD'), TO_DATE('2022-11-07', 'YYYY--MM-DD'), TO_DATE('2022-12-05', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00005', 'B00009', 'b0247', TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-12-10', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00006', 'B00011', 'b0247', TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-12-30', 'YYYY--MM-DD'), '반려', 'KRW');
INSERT INTO t_order VALUES ('S00007', 'B00002', 'b0247', TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-12-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
INSERT INTO t_order VALUES ('S00008', 'B00004', 'b0247', TO_DATE('2022-11-19', 'YYYY--MM-DD'), TO_DATE('2022-11-19', 'YYYY--MM-DD'), TO_DATE('2022-12-10', 'YYYY--MM-DD'), '승인대기', 'KRW');
INSERT INTO t_order VALUES ('S00009', 'B00006', 'b0247', TO_DATE('2022-11-25', 'YYYY--MM-DD'), TO_DATE('2022-11-25', 'YYYY--MM-DD'), TO_DATE('2022-12-23', 'YYYY--MM-DD'), '승인완료', 'KRW');
INSERT INTO t_order VALUES ('S00010', 'B00008', 'b0247', TO_DATE('2022-11-26', 'YYYY--MM-DD'), TO_DATE('2022-11-26', 'YYYY--MM-DD'), TO_DATE('2022-12-18', 'YYYY--MM-DD'), '입력완료', 'KRW');
INSERT INTO t_order VALUES ('S00011', 'B00011', 'b0247', TO_DATE('2022-11-09', 'YYYY--MM-DD'), TO_DATE('2022-11-27', 'YYYY--MM-DD'), TO_DATE('2022-12-30', 'YYYY--MM-DD'), '반려', 'KRW');
INSERT INTO t_order VALUES ('S00012', 'B00002', 'b0247', TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-11-28', 'YYYY--MM-DD'), TO_DATE('2022-12-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
INSERT INTO t_order VALUES ('S00013', 'B00004', 'b0247', TO_DATE('2022-11-19', 'YYYY--MM-DD'), TO_DATE('2022-11-29', 'YYYY--MM-DD'), TO_DATE('2022-12-10', 'YYYY--MM-DD'), '승인대기', 'KRW');
INSERT INTO t_order VALUES ('S00014', 'B00006', 'b0247', TO_DATE('2022-11-25', 'YYYY--MM-DD'), TO_DATE('2022-11-30', 'YYYY--MM-DD'), TO_DATE('2022-12-23', 'YYYY--MM-DD'), '승인완료', 'KRW');


delete t_order where sono='S00014';
DROP TABLE product;

select * from t_order_detail;

CREATE TABLE t_order_detail (
	sono VARCHAR2(20),
	productcd VARCHAR2(20),
	qty number(11),
	unit VARCHAR2(10),
	unitprice number(11),
);

INSERT INTO t_order_detail VALUES ('S00001', 'A00001', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00002', 'A00002', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00003', 'A00003', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00004', 'A00004', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00005', 'A00001', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00006', 'A00001', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00007', 'A00001', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00008', 'A00001', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00009', 'A00001', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00010', 'A00001', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00001', 'A00003', 200, 'box', 2000);
INSERT INTO t_order_detail VALUES ('S00001', 'A00004', 200, 'box', 2000);



DROP TABLE t_order_detail;






--test--
SELECT * FROM 
(SELECT * FROM t_order o INNER JOIN t_order_detail od ON o.sono=od.sono) to INNER JOIN m_buyer b,  

--영업사원별 이익 계산 : 오더헤더, 오더 아이템 join(판매가, 수량 가져오기 위해)
SELECT * FROM t_order o LEFT OUTER JOIN t_order_detail od ON o.sono=od.sono WHERE o.souser='b0247' AND o.requestdate BETWEEN TO_DATE('2022-11','YYYY-MM') AND TO_DATE('2022-12','YYYY-MM');


SELECT * FROM employee e LEFT OUTER JOIN t_order od ON e.empcd=od.souser; 

SELECT * FROM t_order o LEFT OUTER JOIN t_order_detail od ON o.sono=od.sono WHERE o.souser='b0247' AND o.pricingdate BETWEEN TO_DATE('2022-11','YYYY-MM') AND ADD_MONTHS(TO_DATE('2022-11','YYYY-MM'), 1);

SELECT pricingdate, sum(qty*unitprice) amount FROM t_order o LEFT OUTER JOIN t_order_detail od ON o.sono=od.sono WHERE o.souser='b0247' AND o.pricingdate >= TO_DATE('2022-11','YYYY-MM') AND o.pricingdate < ADD_MONTHS(TO_DATE('2022-11','YYYY-MM'), 1) GROUP BY pricingdate;
