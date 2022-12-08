SELECT * FROM TABS;

--직원 테이블
CREATE TABLE m_employee (
	EMPCD	varchar(20)	NOT NULL PRIMARY KEY,
	PW	varchar(40)	NOT NULL,
	PHONE_NO	VARCHAR(20)	NOT NULL,
    name varchar(20) NOT NULL,
	EMAIL	VARCHAR(50)	NOT NULL,
	HIREDATE	date	NOT NULL,
    DEPT VARCHAR(20) NOT NULL,
	JOB	VARCHAR(10)	NOT NULL
);

DROP TABLE m_employee;

insert into m_employee values('E00001', '1', '01000000000', '이서연', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀장');
insert into m_employee values('E00002', '1', '01000000000', '김민준', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀원');
insert into m_employee values('E00003', '1', '01000000000', '안서윤', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀원');
insert into m_employee values('E00004', '1', '01000000000', '박서준', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀원');
insert into m_employee values('E00005', '1', '01000000000', '양지우', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀원');
insert into m_employee values('E00006', '1', '01000000000', '이예준', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀장');
insert into m_employee values('E00007', '1', '01000000000', '심하은', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀원');
insert into m_employee values('E00008', '1', '01000000000', '박주원', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀원');
insert into m_employee values('E00009', '1', '01000000000', '김지유', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀원');
insert into m_employee values('E00010', '1', '01000000000', '이준우', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀원');
insert into m_employee values('E00011', '1', '01000000000', '김채원', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀장');
insert into m_employee values('E00012', '1', '01000000000', '이건우', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀원');
insert into m_employee values('E00013', '1', '01000000000', '박은서', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀원');
insert into m_employee values('E00014', '1', '01000000000', '이우진', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀원');
insert into m_employee values('E00015', '1', '01000000000', '양다은', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀원');

select * from m_employee;



--거래처 테이블
CREATE TABLE M_BUYER (
	BUYERCD	VARCHAR2(20) PRIMARY KEY,		--거래처코드
	BUYERNM	VARCHAR2(50) NOT NULL,			--거래처명
	BRNO CHAR(10) NOT NULL,					--사업자등록번호
	RPRSVNM VARCHAR2(40) NOT NULL,			--대표자
	BUSINESSSTATUS	VARCHAR2(200) NOT NULL,	--업태
	EVENT VARCHAR2(200) NOT	NULL,			--종목
	EMPCD VARCHAR2(40) NOT NULL,			--담당자
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
ALTER TABLE M_BUYER RENAME COLUMN ADDRESS_DETAIL TO ADDRESSDETAIL
--영업1팀
--E00001의 거래처
insert into M_BUYER values(
'B00001' 				--거래처코드
, '이마트'				--거래처명
, '2068650911'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00001'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00001'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00002' 				--거래처코드
, '삼마트'				--거래처명
, '2068650912'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00001'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00001'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00003' 				--거래처코드
, '사마트'				--거래처명
, '2068650913'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00001'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00001'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00004' 				--거래처코드
, '오마트'				--거래처명
, '2068650914'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00001'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00001'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00005' 				--거래처코드
, '육마트'				--거래처명
, '2068650915'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00001'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00001'				--작성자
, 'n' 					--삭제여부
);
--E00002의 거래처
insert into M_BUYER values(
'B00006' 				--거래처코드
, '일마트'				--거래처명
, '2068650916'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00002'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00002'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00007' 				--거래처코드
, '칠마트'				--거래처명
, '2068650917'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00002'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00002'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00008' 				--거래처코드
, '팔마트'				--거래처명
, '2068650918'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00002'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00002'				--작성자
, 'n' 					--삭제여부
);
--영업2팀
--E00007의 거래처
insert into M_BUYER values(
'B00009' 				--거래처코드
, '구마트'				--거래처명
, '2068650919'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00007'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00007'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00010' 				--거래처코드
, '십마트'				--거래처명
, '2068650920'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00007'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00007'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00011' 				--거래처코드
, '십일마트'				--거래처명
, '2068650921'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00007'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00007'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00012' 				--거래처코드
, '십이마트'				--거래처명
, '2068650922'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00007'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00007'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00013' 				--거래처코드
, '십삼마트'				--거래처명
, '2068650923'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00007'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00007'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00014' 				--거래처코드
, '십사마트'				--거래처명
, '2068650924'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00007'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00007'				--작성자
, 'n' 					--삭제여부
);
--E00008의 거래처
insert into M_BUYER values(
'B00015' 				--거래처코드
, '십오마트'				--거래처명
, '2068650925'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00008'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00008'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00016' 				--거래처코드
, '십육마트'				--거래처명
, '2068650926'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00008'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00008'				--작성자
, 'n' 					--삭제여부
);
--E00009의 거래처
insert into M_BUYER values(
'B00017' 				--거래처코드
, '십칠마트'				--거래처명
, '2068650927'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00009'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00009'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00018' 				--거래처코드
, '십팔마트'				--거래처명
, '2068650928'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00009'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00009'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'B00019' 				--거래처코드
, '십구마트'				--거래처명
, '2068650929'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00010'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00010'				--작성자
, 'n' 					--삭제여부
);
--영업3팀
--E00014의 거래처
insert into M_BUYER values(
'B00020' 				--거래처코드
, '이십마트'				--거래처명
, '2068650930'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, 'E00014'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, 'test1@test1.com'		--이메일
, '이마트'				--참고사항
, sysdate				--등록일시
, 'E00014'				--작성자
, 'n' 					--삭제여부
);

drop table m_buyer;

--판매부번 테이블
CREATE TABLE m_product (
	productcd VARCHAR2(20) PRIMARY KEY,
	productnm VARCHAR2(50),
	unit VARCHAR2(10),
	productgroup VARCHAR2(20),
	del CHAR(1)
);

insert into m_product values('P00001', '새우깡',  '스낵류', 'n') ;
insert into m_product values('P00002', '야채타임',  '스낵류', 'n') ;
insert into m_product values('P00003', '촉촉한초코칩',  '스낵류', 'n') ;
insert into m_product values('P00004', '맛동산',  '스낵류', 'n') ;
insert into m_product values('P00005', '꼬깔콘',  '스낵류', 'n') ;
insert into m_product values('P00006', '오!감자',  '스낵류', 'n') ;
insert into m_product values('P00007', '꼬북칩',  '스낵류', 'n') ;
insert into m_product values('P00008', '몽쉘',  '스낵류', 'n') ;
insert into m_product values('P00009', '빠새',  '스낵류', 'n') ;
insert into m_product values('P00010', '죠리퐁',  '스낵류', 'n') ;
insert into m_product values('P00011', '바나나킥',  '스낵류', 'n') ;
insert into m_product values('P00012', '롯데샌드',  '스낵류', 'n') ;
insert into m_product values('P00013', '말랑카우',  '스낵류', 'n') ;
insert into m_product values('P00014', '인디안밥',  '스낵류', 'n') ;
insert into m_product values('P00015', '포스틱',  '스낵류', 'n') ;
insert into m_product values('P00016', '칸쵸',  '스낵류', 'n') ;
insert into m_product values('P00017', '쫄병스낵',  '스낵류', 'n') ;
insert into m_product values('P00018', '자갈치',  '스낵류', 'n') ;
insert into m_product values('P00019', '벌집핏자',  '스낵류', 'n') ;
insert into m_product values('P00020', '고래밥',  '스낵류', 'n') ;



--오더 헤더 테이블
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
select * from t_order where buyercd='B00001';
drop table t_order;
----여기부터
insert into t_order values('S00001', 'B00001', 'E00001', TO_DATE('2022-10-02', 'YYYY-MM-DD'), TO_DATE('2022-10-02', 'YYYY--MM-DD'), TO_DATE('2022-10-20', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00031', 'B00001', 'E00001', TO_DATE('2022-10-29', 'YYYY-MM-DD'), TO_DATE('2022-10-29', 'YYYY--MM-DD'), TO_DATE('2022-10-30', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00032', 'B00001', 'E00003', TO_DATE('2022-10-30', 'YYYY-MM-DD'), TO_DATE('2022-10-30', 'YYYY--MM-DD'), TO_DATE('2022-10-31', 'YYYY-MM-DD'), '승인완료', 'KRW');


insert into t_order values('S00002', 'B00002', 'E00001', TO_DATE('2022-10-03', 'YYYY-MM-DD'), TO_DATE('2022-10-03', 'YYYY--MM-DD'), TO_DATE('2022-10-25', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00003', 'B00003', 'E00001', TO_DATE('2022-10-04', 'YYYY-MM-DD'), TO_DATE('2022-10-04', 'YYYY--MM-DD'), TO_DATE('2022-11-02', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00004', 'B00004', 'E00001', TO_DATE('2022-10-05', 'YYYY-MM-DD'), TO_DATE('2022-10-05', 'YYYY--MM-DD'), TO_DATE('2022-11-05', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00005', 'B00005', 'E00001', TO_DATE('2022-10-06', 'YYYY-MM-DD'), TO_DATE('2022-10-06', 'YYYY--MM-DD'), TO_DATE('2022-11-07', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00006', 'B00006', 'E00002', TO_DATE('2022-10-10', 'YYYY-MM-DD'), TO_DATE('2022-10-10', 'YYYY--MM-DD'), TO_DATE('2022-11-08', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00007', 'B00007', 'E00002', TO_DATE('2022-10-13', 'YYYY-MM-DD'), TO_DATE('2022-10-13', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00008', 'B00008', 'E00002', TO_DATE('2022-10-15', 'YYYY-MM-DD'), TO_DATE('2022-10-15', 'YYYY--MM-DD'), TO_DATE('2022-11-16', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00009', 'B00009', 'E00007', TO_DATE('2022-10-19', 'YYYY-MM-DD'), TO_DATE('2022-10-19', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00010', 'B00010', 'E00007', TO_DATE('2022-10-25', 'YYYY-MM-DD'), TO_DATE('2022-10-25', 'YYYY--MM-DD'), TO_DATE('2022-11-20', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00011', 'B00011', 'E00007', TO_DATE('2022-10-30', 'YYYY-MM-DD'), TO_DATE('2022-10-30', 'YYYY--MM-DD'), TO_DATE('2022-11-22', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00012', 'B00012', 'E00007', TO_DATE('2022-11-02', 'YYYY-MM-DD'), TO_DATE('2022-11-02', 'YYYY--MM-DD'), TO_DATE('2022-11-23', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00013', 'B00013', 'E00007', TO_DATE('2022-11-04', 'YYYY-MM-DD'), TO_DATE('2022-11-04', 'YYYY--MM-DD'), TO_DATE('2022-11-24', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00014', 'B00014', 'E00007', TO_DATE('2022-11-08', 'YYYY-MM-DD'), TO_DATE('2022-11-08', 'YYYY--MM-DD'), TO_DATE('2022-11-25', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00015', 'B00015', 'E00008', TO_DATE('2022-11-10', 'YYYY-MM-DD'), TO_DATE('2022-11-10', 'YYYY--MM-DD'), TO_DATE('2022-11-26', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00016', 'B00016', 'E00008', TO_DATE('2022-11-14', 'YYYY-MM-DD'), TO_DATE('2022-11-14', 'YYYY--MM-DD'), TO_DATE('2022-11-27', 'YYYY-MM-DD'), '종결', 'KRW');
insert into t_order values('S00017', 'B00017', 'E00009', TO_DATE('2022-11-16', 'YYYY-MM-DD'), TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-11-28', 'YYYY-MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00018', 'B00018', 'E00009', TO_DATE('2022-11-18', 'YYYY-MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), TO_DATE('2022-11-29', 'YYYY-MM-DD'), '반려', 'KRW');

insert into t_order values('S00019', 'B00019', 'E00010', TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-15', 'YYYY-MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00020', 'B00020', 'E00014', TO_DATE('2022-12-02', 'YYYY-MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-18', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00021', 'B00001', 'E00001', TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-15', 'YYYY-MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00022', 'B00002', 'E00001', TO_DATE('2022-12-02', 'YYYY-MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-28', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00023', 'B00003', 'E00001', TO_DATE('2022-12-03', 'YYYY-MM-DD'), TO_DATE('2022-12-03', 'YYYY--MM-DD'), TO_DATE('2022-12-13', 'YYYY-MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00024', 'B00004', 'E00001', TO_DATE('2022-12-04', 'YYYY-MM-DD'), TO_DATE('2022-12-04', 'YYYY--MM-DD'), TO_DATE('2022-12-20', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00025', 'B00005', 'E00001', TO_DATE('2022-12-05', 'YYYY-MM-DD'), TO_DATE('2022-12-05', 'YYYY--MM-DD'), TO_DATE('2022-12-15', 'YYYY-MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00026', 'B00006', 'E00002', TO_DATE('2022-12-06', 'YYYY-MM-DD'), TO_DATE('2022-12-06', 'YYYY--MM-DD'), TO_DATE('2022-12-18', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00027', 'B00007', 'E00002', TO_DATE('2022-12-07', 'YYYY-MM-DD'), TO_DATE('2022-12-07', 'YYYY--MM-DD'), TO_DATE('2022-12-28', 'YYYY-MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00028', 'B00008', 'E00002', TO_DATE('2022-12-08', 'YYYY-MM-DD'), TO_DATE('2022-12-08', 'YYYY--MM-DD'), TO_DATE('2022-12-29', 'YYYY-MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00029', 'B00009', 'E00007', TO_DATE('2022-12-09', 'YYYY-MM-DD'), TO_DATE('2022-12-09', 'YYYY--MM-DD'), TO_DATE('2022-12-30', 'YYYY-MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00030', 'B00010', 'E00007', TO_DATE('2022-12-10', 'YYYY-MM-DD'), TO_DATE('2022-12-10', 'YYYY--MM-DD'), TO_DATE('2022-12-18', 'YYYY-MM-DD'), '승인완료', 'KRW');


--오더 아이템 테이블
CREATE TABLE t_order_detail (
	sono VARCHAR2(20),
	productcd VARCHAR2(20),
	qty number(11),
	unitprice number(11),
	CONSTRAINT t_order_detail_pk PRIMARY KEY (sono, productcd)
);

<<<<<<< HEAD
drop table t_order_detail;
insert into t_order_detail values('S00001', 'P00001', 200, 2000);
insert into t_order_detail values('S00001', 'P00001', 200, 2000);
insert into t_order_detail values('S00001', 'P00002', 100, 3000);
insert into t_order_detail values('S00001', 'P00005', 200, 2000);
insert into t_order_detail values('S00002', 'P00010', 100, 4000);
insert into t_order_detail values('S00002', 'P00002', 200, 2000);
insert into t_order_detail values('S00003', 'P00019', 200, 2000);
insert into t_order_detail values('S00003', 'P00011', 300, 3000);
insert into t_order_detail values('S00003', 'P00001', 300, 1000);
insert into t_order_detail values('S00003', 'P00008', 200, 4000);
insert into t_order_detail values('S00003', 'P00005', 100, 2000);
insert into t_order_detail values('S00004', 'P00012', 100, 2000);
insert into t_order_detail values('S00005', 'P00013', 200, 5000);
insert into t_order_detail values('S00005', 'P00015', 500, 1000);
insert into t_order_detail values('S00006', 'P00001', 200, 2000);
insert into t_order_detail values('S00006', 'P00002', 100, 5000);
insert into t_order_detail values('S00006', 'P00003', 200, 10000);
insert into t_order_detail values('S00006', 'P00004', 500, 2000);
insert into t_order_detail values('S00006', 'P00005', 100, 1000);
insert into t_order_detail values('S00006', 'P00006', 200, 2000);
insert into t_order_detail values('S00007', 'P00008', 100, 5000);
insert into t_order_detail values('S00008', 'P00010', 300, 5000);
insert into t_order_detail values('S00008', 'P00012', 200, 2000);
insert into t_order_detail values('S00009', 'P00001', 1000, 8000);
insert into t_order_detail values('S00010', 'P00003', 100, 8000);
insert into t_order_detail values('S00010', 'P00005', 200, 5000);
insert into t_order_detail values('S00010', 'P00007', 300, 2000);
insert into t_order_detail values('S00011', 'P00001', 200, 2000);
insert into t_order_detail values('S00011', 'P00005', 100, 2000);
insert into t_order_detail values('S00012', 'P00020', 200, 3000);
insert into t_order_detail values('S00012', 'P00018', 500, 2000);
insert into t_order_detail values('S00012', 'P00001', 100, 5000);
insert into t_order_detail values('S00012', 'P00005', 200, 2000);
insert into t_order_detail values('S00012', 'P00008', 1000, 7000);
insert into t_order_detail values('S00012', 'P00009', 200, 2000);
insert into t_order_detail values('S00013', 'P00008', 200, 2000);
insert into t_order_detail values('S00014', 'P00006', 200, 5000);
insert into t_order_detail values('S00015', 'P00001', 300, 2000);
insert into t_order_detail values('S00015', 'P00002', 500, 3000);
insert into t_order_detail values('S00015', 'P00003', 700, 5000);
insert into t_order_detail values('S00015', 'P00004', 200, 2000);
insert into t_order_detail values('S00015', 'P00005', 800, 1000);
insert into t_order_detail values('S00016', 'P00011', 1500, 2000);
insert into t_order_detail values('S00017', 'P00008', 1000, 5000);
insert into t_order_detail values('S00017', 'P00004', 500, 2000);
insert into t_order_detail values('S00018', 'P00011', 200, 9000);
insert into t_order_detail values('S00019', 'P00001', 200, 2000);
insert into t_order_detail values('S00019', 'P00003', 200, 2000);
insert into t_order_detail values('S00020', 'P00009', 200, 7000);
insert into t_order_detail values('S00020', 'P00011', 200, 2000);

insert into t_order_detail values('S00021', 'P00010', 300, 5000);
insert into t_order_detail values('S00021', 'P00012', 200, 2000);
insert into t_order_detail values('S00021', 'P00001', 1000, 8000);
insert into t_order_detail values('S00022', 'P00003', 100, 8000);
insert into t_order_detail values('S00022', 'P00005', 200, 5000);
insert into t_order_detail values('S00023', 'P00007', 300, 2000);
insert into t_order_detail values('S00023', 'P00001', 200, 2000);
insert into t_order_detail values('S00023', 'P00005', 100, 2000);
insert into t_order_detail values('S00023', 'P00020', 200, 3000);
insert into t_order_detail values('S00024', 'P00018', 500, 2000);
insert into t_order_detail values('S00024', 'P00001', 100, 5000);
insert into t_order_detail values('S00024', 'P00005', 200, 2000);
insert into t_order_detail values('S00024', 'P00008', 1000, 7000);
insert into t_order_detail values('S00024', 'P00009', 200, 2000);
insert into t_order_detail values('S00024', 'P00008', 200, 2000);
insert into t_order_detail values('S00024', 'P00006', 200, 5000);
insert into t_order_detail values('S00025', 'P00001', 300, 2000);
insert into t_order_detail values('S00025', 'P00002', 500, 3000);
insert into t_order_detail values('S00026', 'P00003', 700, 5000);
insert into t_order_detail values('S00026', 'P00004', 200, 2000);
insert into t_order_detail values('S00026', 'P00005', 800, 1000);
insert into t_order_detail values('S00026', 'P00011', 1500, 2000);
insert into t_order_detail values('S00027', 'P00008', 1000, 5000);
insert into t_order_detail values('S00027', 'P00004', 500, 2000);
insert into t_order_detail values('S00028', 'P00011', 200, 9000);
insert into t_order_detail values('S00029', 'P00001', 200, 2000);
insert into t_order_detail values('S00030', 'P00003', 200, 2000);
insert into t_order_detail values('S00030', 'P00009', 200, 7000);
insert into t_order_detail values('S00030', 'P00011', 200, 2000);
insert into t_order_detail values('S00031', 'P00011', 200, 2000);
insert into t_order_detail values('S00031', 'P00013', 200, 2000);
insert into t_order_detail values('S00032', 'P00001', 500, 2000);
insert into t_order_detail values('S00032', 'P00003', 200, 2000);
select * from t_order where TO_CHAR(pricingdate,'YYYY-MM')='2022-12' order by pricingdate;
--test--

select * from m_buyer;
SELECT * FROM m_buyer WHERE delyn='n' ORDER BY addDate DESC

--empCd 검색
			SELECT pricingDate, sum(qty*unitPrice) amount 
			FROM t_order o 
			LEFT OUTER JOIN t_order_detail od 
			ON o.sono=od.sono 
			WHERE o.souser='E00001' 
				AND o.pricingDate >= TO_DATE('2022-12','YYYY-MM') 
				AND o.pricingDate < ADD_MONTHS(TO_DATE('2022-12','YYYY-MM'), 1)
				AND o.status = '승인완료'
			GROUP BY pricingDate
			ORDER BY pricingDate;


			SELECT pricingDate, sum(qty*unitPrice) amount 
			FROM t_order o 
			LEFT OUTER JOIN t_order_detail od 
			ON o.sono=od.sono 
			WHERE o.souser='E00001' 
				AND o.pricingDate >= TO_DATE('2022-12','YYYY-MM') 
				AND o.pricingDate < ADD_MONTHS(TO_DATE('2022-12','YYYY-MM'), 1)
				AND o.status = '승인완료'
			GROUP BY pricingDate
			ORDER BY pricingDate;


--이번달 전체 매출 누적 그래프
			SELECT pricingDate, sum(qty*unitPrice) OVER(ORDER BY pricingDate) amount 
			FROM t_order o 
			LEFT OUTER JOIN t_order_detail od 
			ON o.sono=od.sono 
			WHERE o.souser='E00001' 
				AND o.pricingDate >= TO_DATE('2022-12','YYYY-MM') 
				AND o.pricingDate < ADD_MONTHS(TO_DATE('2022-12','YYYY-MM'), 1)
				AND o.status = '승인완료'
			ORDER BY pricingDate;

SELECT pricingDate, sum(qty*unitPrice) amount 
			FROM t_order o 
			LEFT OUTER JOIN t_order_detail od 
			ON o.sono=od.sono 
			WHERE o.souser='E00001' 
				AND o.pricingDate >= TO_DATE('2022-12','YYYY-MM') 
				AND o.pricingDate < ADD_MONTHS(TO_DATE('2022-12','YYYY-MM'), 1)
				AND o.status = '승인완료'
			GROUP BY pricingDate
			ORDER BY pricingDate;

select pricingDate, sum(amount) OVER(ORDER BY pricingDate) runningtotal from
		(select pricingDate, sum(qty*unitPrice) amount
		from  t_order o, t_order_detail od 
		where o.sono=od.sono 
			AND o.status='승인완료' 
			AND o.pricingDate >= TRUNC(SYSDATE, 'MM')
			AND o.pricingDate < LAST_DAY(SYSDATE)
		GROUP BY pricingDate
		ORDER BY pricingDate);


--팀별 원형그래프(매출액)


select dept, sum(qty*unitprice) 
from t_order o, t_order_detail od, m_buyer b, m_employee e
where o.sono=od.sono 
	and o.buyercd=b.buyercd 
	and b.empcd=e.empcd 
group by dept;

--올해 승인여부 막대그래프
select status, count(*) cnt from t_order 
group by status; 

--바이어 코드 검색

SELECT pricingDate, sum(qty*unitPrice) amount
FROM t_order o, t_order_detail od 
WHERE o.sono=od.sono 
AND o.buyerCd='B00001' 
AND o.pricingDate >= TO_DATE('2022-12','YYYY-MM') 
AND o.pricingDate < ADD_MONTHS(TO_DATE('2022-12','YYYY-MM'), 1)
GROUP BY pricingDate 
ORDER BY pricingDate;

--팀별 월별 영업이익 검색
select e.dept, odd.amount, odd.pricingDate from 
(select pricingDate, sum(qty*unitprice) amount, buyercd 
from t_order o, t_order_detail od 
where o.sono=od.sono 
group by pricingDate, buyercd) odd,
m_buyer b, m_employee e
where b.empcd=e.empcd
and odd.buyercd=b.buyercd
and e.dept='영업1팀'
AND odd.pricingDate >= TO_DATE('2022-12','YYYY-MM') 
AND odd.pricingDate < ADD_MONTHS(TO_DATE('2022-12','YYYY-MM'), 1)
order by dept, pricingDate;
;

--월별 승인여부 검색
select status, count(*) cnt, pricingDate from t_order 
where
pricingDate >= TO_DATE('2022-12','YYYY-MM') 
AND pricingDate < ADD_MONTHS(TO_DATE('2022-12','YYYY-MM'), 1)
AND status ='승인완료'
group by status, pricingDate; 
=======


-------------------------------------------------------------------------

SELECT * FROM TABS;

--직원 테이블
CREATE TABLE m_employee (
   EMPCD   varchar(20)   NOT NULL PRIMARY KEY,
   PW   varchar(40)   NOT NULL,
   PHONE_NO   VARCHAR(20)   NOT NULL,
    name varchar(20) NOT NULL,
   EMAIL   VARCHAR(50)   NOT NULL,
   HIREDATE   date   NOT NULL,
    DEPT VARCHAR(20) NOT NULL,
   JOB   VARCHAR(10)   NOT NULL
);


insert into m_employee values('E00001', '1', '01000000000', '이서연', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀장');
insert into m_employee values('E00002', '1', '01000000000', '김민준', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀원');
insert into m_employee values('E00003', '1', '01000000000', '안서윤', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀원');
insert into m_employee values('E00004', '1', '01000000000', '박서준', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀원');
insert into m_employee values('E00005', '1', '01000000000', '양지우', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업1팀', '팀원');
insert into m_employee values('E00006', '1', '01000000000', '이예준', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀장');
insert into m_employee values('E00007', '1', '01000000000', '심하은', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀원');
insert into m_employee values('E00008', '1', '01000000000', '박주원', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀원');
insert into m_employee values('E00009', '1', '01000000000', '김지유', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀원');
insert into m_employee values('E00010', '1', '01000000000', '이준우', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업2팀', '팀원');
insert into m_employee values('E00011', '1', '01000000000', '김채원', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀장');
insert into m_employee values('E00012', '1', '01000000000', '이건우', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀원');
insert into m_employee values('E00013', '1', '01000000000', '박은서', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀원');
insert into m_employee values('E00014', '1', '01000000000', '이우진', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀원');
insert into m_employee values('E00015', '1', '01000000000', '양다은', 'test@test.com', TO_DATE('2022-11-01', 'YYYY--MM-DD'), '영업3팀', '팀원');

select * from m_employee;

SELECT * FROM m_buyer;

DROP TABLE m_buyer;

--거래처 테이블
CREATE TABLE M_BUYER (
   BUYERCD   VARCHAR2(20) PRIMARY KEY,      --거래처코드
   BUYERNM   VARCHAR2(50) NOT NULL,         --거래처명
   BRNO CHAR(10) NOT NULL,               --사업자등록번호
   RPRSVNM VARCHAR2(40) NOT NULL,         --대표자
   BUSINESSSTATUS   VARCHAR2(200) NOT NULL,   --업태
   EVENT VARCHAR2(200) NOT   NULL,         --종목
   EMPCD VARCHAR2(40) NOT NULL,         --담당자
   STATUS VARCHAR2(20) NOT NULL,         --거래처상태
   NATIONCD CHAR(2) NOT NULL,            --국가코드
   POSTCODE CHAR(5) NOT NULL,            --우편번호
   ADDRESS   VARCHAR2(50) NOT NULL,         --소재지
   ADDRESS_DETAIL VARCHAR2(50) NOT NULL,   --소재지상세
   TEL   CHAR(11) NOT NULL,               --전화번호
   EMAIL VARCHAR2(320)   NULL,            --이메일
   REMARK VARCHAR2(1000) NULL,            --참고사항
   ADDDATE   DATE NOT NULL,               --등록일시
   ADDUSER   VARCHAR2(255) NOT NULL,         --작성자
   DELYN CHAR DEFAULT 'n' NOT NULL         --삭제여부
);

--영업1팀
--E00001의 거래처
insert into M_BUYER values(
'B00001'             --거래처코드
, '이마트'            --거래처명
, '2068650911'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00001'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00001'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00002'             --거래처코드
, '삼마트'            --거래처명
, '2068650912'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00001'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00001'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00003'             --거래처코드
, '사마트'            --거래처명
, '2068650913'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00001'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00001'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00004'             --거래처코드
, '오마트'            --거래처명
, '2068650914'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00001'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00001'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00005'             --거래처코드
, '육마트'            --거래처명
, '2068650915'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00001'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00001'            --작성자
, 'n'                --삭제여부
);
--E00002의 거래처
insert into M_BUYER values(
'B00006'             --거래처코드
, '일마트'            --거래처명
, '2068650916'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00002'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00002'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00007'             --거래처코드
, '칠마트'            --거래처명
, '2068650917'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00002'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00002'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00008'             --거래처코드
, '팔마트'            --거래처명
, '2068650918'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00002'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00002'            --작성자
, 'n'                --삭제여부
);
--영업2팀
--E00007의 거래처
insert into M_BUYER values(
'B00009'             --거래처코드
, '구마트'            --거래처명
, '2068650919'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00007'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00007'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00010'             --거래처코드
, '십마트'            --거래처명
, '2068650923'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00007'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00007'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00011'             --거래처코드
, '십일마트'            --거래처명
, '2068650933'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00007'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00007'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00012'             --거래처코드
, '십이마트'            --거래처명
, '2068650943'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00007'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00007'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00013'             --거래처코드
, '십삼마트'            --거래처명
, '2068650953'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00007'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00007'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00014'             --거래처코드
, '십사마트'            --거래처명
, '2068650963'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00007'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00007'            --작성자
, 'n'                --삭제여부
);
--E00008의 거래처
insert into M_BUYER values(
'B00015'             --거래처코드
, '십오마트'            --거래처명
, '2068650973'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00008'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00008'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00016'             --거래처코드
, '십육마트'            --거래처명
, '2068650983'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00008'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00008'            --작성자
, 'n'                --삭제여부
);
--E00009의 거래처
insert into M_BUYER values(
'B00017'             --거래처코드
, '십칠마트'            --거래처명
, '2068650993'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00009'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00009'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00018'             --거래처코드
, '십팔마트'            --거래처명
, '2068650903'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00009'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00009'            --작성자
, 'n'                --삭제여부
);
insert into M_BUYER values(
'B00019'             --거래처코드
, '십구마트'            --거래처명
, '2068650113'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00010'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00010'            --작성자
, 'n'                --삭제여부
);
--영업3팀
--E00014의 거래처
insert into M_BUYER values(
'B00020'             --거래처코드
, '이십마트'            --거래처명
, '2068650213'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00014'            --담당자
, '활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00014'            --작성자
, 'n'                --삭제여부
);
delete from m_buyer where buyerCd='B00021';
insert into M_BUYER values(
'B00021'             --거래처코드
, '이십일마트'            --거래처명
, '2068650213'         --사업자등록번호
, '강희석'            --대표자
, '도소매업'            --업태
, '기타'               --종목
, 'E00001'            --담당자
, '비활성'               --거래처상태
, 'KR'               --국가코드
, '33316'            --우편번호
, '서울특별시 성동구'         --소재지
, '뚝섬로 377(성수동2가)'   --소재지상세
, '023805678'         --전화번호
, 'test1@test1.com'      --이메일
, '이마트'            --참고사항
, sysdate            --등록일시
, 'E00014'            --작성자
, 'n'                --삭제여부
);

--판매부번 테이블
CREATE TABLE m_product (
   productcd VARCHAR2(20) PRIMARY KEY,
   productnm VARCHAR2(50),
   unit VARCHAR2(10),
   productgroup VARCHAR2(20),
   del CHAR(1)
);

drop table m_buyer;
DELETE FROM m_product;

SELECT * FROM tabs;

insert into m_product values('P00001', '새우깡', 'box', '스낵류', 'n') ;
insert into m_product values('P00002', '야채타임', 'box', '스낵류', 'n') ;
insert into m_product values('P00003', '촉촉한초코칩', 'box', '스낵류', 'n') ;
insert into m_product values('P00004', '맛동산', 'box', '스낵류', 'n') ;
insert into m_product values('P00005', '꼬깔콘', 'box', '스낵류', 'n') ;
insert into m_product values('P00006', '오!감자', 'box', '스낵류', 'n') ;
insert into m_product values('P00007', '꼬북칩', 'box', '스낵류', 'n') ;
insert into m_product values('P00008', '몽쉘', 'box', '스낵류', 'n') ;
insert into m_product values('P00009', '빠새', 'box', '스낵류', 'n') ;
insert into m_product values('P00010', '죠리퐁', 'box', '스낵류', 'n') ;
insert into m_product values('P00011', '바나나킥', 'box', '스낵류', 'n') ;
insert into m_product values('P00012', '롯데샌드', 'box', '스낵류', 'n') ;
insert into m_product values('P00013', '말랑카우', 'box', '스낵류', 'n') ;
insert into m_product values('P00014', '인디안밥', 'box', '스낵류', 'n') ;
insert into m_product values('P00015', '포스틱', 'box', '스낵류', 'n') ;
insert into m_product values('P00016', '칸쵸', 'box', '스낵류', 'n') ;
insert into m_product values('P00017', '쫄병스낵', 'box', '스낵류', 'n') ;
insert into m_product values('P00018', '자갈치', 'box', '스낵류', 'n') ;
insert into m_product values('P00019', '벌집핏자', 'box', '스낵류', 'n') ;
insert into m_product values('P00020', '고래밥', 'box', '스낵류', 'n') ;



--오더 헤더 테이블
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
select * from t_order;
drop table t_order;
----여기부터
insert into t_order values('S00001', 'B00001', 'E00001', TO_DATE('2022-10-02', 'YYYY--MM-DD'), TO_DATE('2022-10-02', 'YYYY--MM-DD'), TO_DATE('2022-10-20', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00002', 'B00002', 'E00001', TO_DATE('2022-10-03', 'YYYY--MM-DD'), TO_DATE('2022-10-03', 'YYYY--MM-DD'), TO_DATE('2022-10-25', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00003', 'B00003', 'E00001', TO_DATE('2022-10-04', 'YYYY--MM-DD'), TO_DATE('2022-10-04', 'YYYY--MM-DD'), TO_DATE('2022-11-02', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00004', 'B00004', 'E00001', TO_DATE('2022-10-05', 'YYYY--MM-DD'), TO_DATE('2022-10-05', 'YYYY--MM-DD'), TO_DATE('2022-11-05', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00005', 'B00005', 'E00001', TO_DATE('2022-10-06', 'YYYY--MM-DD'), TO_DATE('2022-10-06', 'YYYY--MM-DD'), TO_DATE('2022-11-07', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00006', 'B00006', 'E00002', TO_DATE('2022-10-10', 'YYYY--MM-DD'), TO_DATE('2022-10-10', 'YYYY--MM-DD'), TO_DATE('2022-11-08', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00007', 'B00007', 'E00002', TO_DATE('2022-10-13', 'YYYY--MM-DD'), TO_DATE('2022-10-13', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00008', 'B00008', 'E00002', TO_DATE('2022-10-15', 'YYYY--MM-DD'), TO_DATE('2022-10-15', 'YYYY--MM-DD'), TO_DATE('2022-11-16', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00009', 'B00009', 'E00007', TO_DATE('2022-10-19', 'YYYY--MM-DD'), TO_DATE('2022-10-19', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00010', 'B00010', 'E00007', TO_DATE('2022-10-25', 'YYYY--MM-DD'), TO_DATE('2022-10-25', 'YYYY--MM-DD'), TO_DATE('2022-11-20', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00011', 'B00011', 'E00007', TO_DATE('2022-10-30', 'YYYY--MM-DD'), TO_DATE('2022-10-30', 'YYYY--MM-DD'), TO_DATE('2022-11-22', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00012', 'B00012', 'E00007', TO_DATE('2022-11-02', 'YYYY--MM-DD'), TO_DATE('2022-11-02', 'YYYY--MM-DD'), TO_DATE('2022-11-23', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00013', 'B00013', 'E00007', TO_DATE('2022-11-04', 'YYYY--MM-DD'), TO_DATE('2022-11-04', 'YYYY--MM-DD'), TO_DATE('2022-11-24', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00014', 'B00014', 'E00007', TO_DATE('2022-11-08', 'YYYY--MM-DD'), TO_DATE('2022-11-08', 'YYYY--MM-DD'), TO_DATE('2022-11-25', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00015', 'B00015', 'E00008', TO_DATE('2022-11-10', 'YYYY--MM-DD'), TO_DATE('2022-11-10', 'YYYY--MM-DD'), TO_DATE('2022-11-26', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00016', 'B00016', 'E00008', TO_DATE('2022-11-14', 'YYYY--MM-DD'), TO_DATE('2022-11-14', 'YYYY--MM-DD'), TO_DATE('2022-11-27', 'YYYY--MM-DD'), '종결', 'KRW');
insert into t_order values('S00017', 'B00017', 'E00009', TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-11-16', 'YYYY--MM-DD'), TO_DATE('2022-11-28', 'YYYY--MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00018', 'B00018', 'E00009', TO_DATE('2022-11-18', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), TO_DATE('2022-11-29', 'YYYY--MM-DD'), '반려', 'KRW');
insert into t_order values('S00019', 'B00019', 'E00010', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00020', 'B00020', 'E00014', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');


insert into t_order values('S00021', 'B00001', 'E00002', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00022', 'B00002', 'E00002', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00023', 'B00003', 'E00014', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00024', 'B00004', 'E00014', TO_DATE('2022-12-03', 'YYYY--MM-DD'), TO_DATE('2022-12-03', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00025', 'B00005', 'E00010', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00026', 'B00006', 'E00014', TO_DATE('2022-12-04', 'YYYY--MM-DD'), TO_DATE('2022-12-04', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00027', 'B00007', 'E00008', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '반려', 'KRW');
insert into t_order values('S00028', 'B00008', 'E00008', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '반려', 'KRW');
insert into t_order values('S00029', 'B00009', 'E00008', TO_DATE('2022-12-07', 'YYYY--MM-DD'), TO_DATE('2022-12-07', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00030', 'B00010', 'E00008', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00031', 'B00011', 'E00008', TO_DATE('2022-12-08', 'YYYY--MM-DD'), TO_DATE('2022-12-08', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00032', 'B00012', 'E00014', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00033', 'B00013', 'E00002', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00034', 'B00014', 'E00002', TO_DATE('2022-12-04', 'YYYY--MM-DD'), TO_DATE('2022-12-04', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00035', 'B00015', 'E00010', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00036', 'B00016', 'E00008', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00037', 'B00017', 'E00010', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '종결', 'KRW');
insert into t_order values('S00038', 'B00018', 'E00008', TO_DATE('2022-12-05', 'YYYY--MM-DD'), TO_DATE('2022-12-05', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '종결', 'KRW');
insert into t_order values('S00039', 'B00019', 'E00008', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00040', 'B00020', 'E00002', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00041', 'B00001', 'E00002', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00042', 'B00002', 'E00014', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00043', 'B00003', 'E00010', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00044', 'B00004', 'E00014', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00045', 'B00005', 'E00010', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00046', 'B00006', 'E00014', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00047', 'B00007', 'E00010', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인대기', 'KRW');
insert into t_order values('S00048', 'B00008', 'E00001', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00049', 'B00009', 'E00001', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00050', 'B00010', 'E00001', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00051', 'B00011', 'E00001', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00052', 'B00012', 'E00001', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '승인완료', 'KRW');
insert into t_order values('S00053', 'B00011', 'E00001', TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-12-01', 'YYYY--MM-DD'), TO_DATE('2022-11-15', 'YYYY--MM-DD'), '반려', 'KRW');
insert into t_order values('S00054', 'B00012', 'E00001', TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-12-02', 'YYYY--MM-DD'), TO_DATE('2022-11-18', 'YYYY--MM-DD'), '반려', 'KRW');


DELETE FROM t_order;

--오더 아이템 테이블
CREATE TABLE t_order_detail (
   sono VARCHAR2(20),
   productcd VARCHAR2(20),
   qty number(11),
   unitprice number(11),
   CONSTRAINT t_order_detail_pk PRIMARY KEY (sono, productcd)
);

insert into t_order_detail values('S00001', 'P00001', 200, 2000);
insert into t_order_detail values('S00001', 'P00002', 100, 3000);
insert into t_order_detail values('S00001', 'P00005', 200, 2000);
insert into t_order_detail values('S00002', 'P00010', 100, 4000);
insert into t_order_detail values('S00002', 'P00002', 200, 2000);
insert into t_order_detail values('S00003', 'P00019', 200, 2000);
insert into t_order_detail values('S00003', 'P00011', 300, 3000);
insert into t_order_detail values('S00003', 'P00001', 300, 1000);
insert into t_order_detail values('S00003', 'P00008', 200, 4000);
insert into t_order_detail values('S00003', 'P00005', 100, 2000);
insert into t_order_detail values('S00004', 'P00012', 100, 2000);
insert into t_order_detail values('S00005', 'P00013', 200, 5000);
insert into t_order_detail values('S00005', 'P00015', 500, 1000);
insert into t_order_detail values('S00006', 'P00001', 200, 2000);
insert into t_order_detail values('S00006', 'P00002', 100, 5000);
insert into t_order_detail values('S00006', 'P00003', 200, 10000);
insert into t_order_detail values('S00006', 'P00004', 500, 2000);
insert into t_order_detail values('S00006', 'P00005', 100, 1000);
insert into t_order_detail values('S00006', 'P00006', 200, 2000);
insert into t_order_detail values('S00007', 'P00008', 100, 5000);
insert into t_order_detail values('S00008', 'P00010', 300, 5000);
insert into t_order_detail values('S00008', 'P00012', 200, 2000);
insert into t_order_detail values('S00009', 'P00001', 1000, 8000);
insert into t_order_detail values('S00010', 'P00003', 100, 8000);
insert into t_order_detail values('S00010', 'P00005', 200, 5000);
insert into t_order_detail values('S00010', 'P00007', 300, 2000);
insert into t_order_detail values('S00011', 'P00001', 200, 2000);
insert into t_order_detail values('S00011', 'P00005', 100, 2000);
insert into t_order_detail values('S00012', 'P00020', 200, 3000);
insert into t_order_detail values('S00012', 'P00018', 500, 2000);
insert into t_order_detail values('S00012', 'P00001', 100, 5000);
insert into t_order_detail values('S00012', 'P00005', 200, 2000);
insert into t_order_detail values('S00012', 'P00008', 1000, 7000);
insert into t_order_detail values('S00012', 'P00009', 200, 2000);
insert into t_order_detail values('S00013', 'P00008', 200, 2000);
insert into t_order_detail values('S00014', 'P00006', 200, 5000);
insert into t_order_detail values('S00015', 'P00001', 300, 2000);
insert into t_order_detail values('S00015', 'P00002', 500, 3000);
insert into t_order_detail values('S00015', 'P00003', 700, 5000);
insert into t_order_detail values('S00015', 'P00004', 200, 2000);
insert into t_order_detail values('S00015', 'P00005', 800, 1000);
insert into t_order_detail values('S00016', 'P00011', 1500, 2000);
insert into t_order_detail values('S00017', 'P00008', 1000, 5000);
insert into t_order_detail values('S00017', 'P00004', 500, 2000);
insert into t_order_detail values('S00018', 'P00011', 200, 9000);
insert into t_order_detail values('S00019', 'P00001', 200, 2000);
insert into t_order_detail values('S00019', 'P00003', 200, 2000);
insert into t_order_detail values('S00020', 'P00009', 200, 7000);
insert into t_order_detail values('S00020', 'P00011', 200, 2000);

DELETE FROM t_order_detail;

--test--
         SELECT pricingDate, sum(qty*unitPrice) amount 
         FROM t_order o 
         LEFT OUTER JOIN t_order_detail od 
         ON o.sono=od.sono 
         WHERE o.souser='E00001' 
            AND o.pricingDate >= TO_DATE('2022-10','YYYY-MM') 
            AND o.pricingDate < ADD_MONTHS(TO_DATE('2022-10','YYYY-MM'), 1)
         GROUP BY pricingDate
         ORDER BY pricingDate


SELECT * FROM t_order;


SELECT * FROM m_buyer WHERE brno='2068650113';

		SELECT * FROM m_buyer b, m_employee e
			WHERE b.empCd=e.empCd
			AND b.delyn='n'
		ORDER BY b.buyerCd DESC;


--오더 승인여부
	SELECT status, count(*) cnt --승인여부 항목과 항목별 개수
	FROM t_order  -- 오더테이블
	WHERE pricingDate >= TO_DATE('2022-12','YYYY-MM') --12월 1일부터
    AND pricingDate < ADD_MONTHS(TO_DATE('2022-12','YYYY-MM'), 1) --12월 31일 까지
	GROUP BY status