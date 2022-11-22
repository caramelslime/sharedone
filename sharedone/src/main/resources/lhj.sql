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

insert into M_BUYER values(
'BA0001' 				--거래처코드
, '이마트'				--거래처명
, '2068650913'			--사업자등록번호
, '강희석'				--대표자
, '도소매업'				--업태
, '기타'					--종목
, '김철수'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '33316'				--우편번호
, '서울특별시 성동구'			--소재지
, '뚝섬로 377(성수동2가)'	--소재지상세
, '023805678'			--전화번호
, ''					--이메일
, ''					--참고사항
, sysdate				--등록일시
, '김철수'				--작성자
, 'n' 					--삭제여부
);
insert into M_BUYER values(
'BA0002' 				--거래처코드
, '노스마트'				--거래처명
, '6548250913'			--사업자등록번호
, '강영희'				--대표자
, '소매업'				--업태
, '식품'					--종목
, '김미애'				--담당자
, '활성'					--거래처상태
, 'KR'					--국가코드
, '37956'				--우편번호
, '서울특별시 강남구'			--소재지
, '377동'				--소재지상세
, '028524687'			--전화번호
, ''					--이메일
, ''					--참고사항
, sysdate				--등록일시
, '김미애'				--작성자
, 'n' 					--삭제여부
);