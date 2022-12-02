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
	DELYN CHAR DEFAULT 'n' NOT NULL			--삭제여부
);

--영업1팀
--E00001의 거래처
insert into M_BUYER values(
'B00001' 				--거래처코드
, '이마트'				--거래처명
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
'B00002' 				--거래처코드
, '삼마트'				--거래처명
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
'B00005' 				--거래처코드
, '육마트'				--거래처명
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
--E00002의 거래처
insert into M_BUYER values(
'B00006' 				--거래처코드
, '일마트'				--거래처명
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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
, '2068650913'			--사업자등록번호
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


--판매부번 테이블
CREATE TABLE m_product (
	productcd VARCHAR2(20) PRIMARY KEY,
	productnm VARCHAR2(50),
	unit VARCHAR2(10),
	productgroup VARCHAR2(20),
	del CHAR(1)
);

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

----여기부터
insert into t_order values('S00001', 'B00002', 'E00001', TO_DATE('2022-10-02', 'YYYY--MM-DD'), TO_DATE('2022-10-02', 'YYYY--MM-DD'), TO_DATE('2022-11-05', 'YYYY--MM-DD'), '승인완료', 'KRW')

--오더 아이템 테이블
CREATE TABLE t_order_detail (
	sono VARCHAR2(20),
	productcd VARCHAR2(20),
	qty number(11),
	unit VARCHAR2(10),
	unitprice number(11),
	CONSTRAINT t_order_detail_pk PRIMARY KEY (sono, productcd)
);