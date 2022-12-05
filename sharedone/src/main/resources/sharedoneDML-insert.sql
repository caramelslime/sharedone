--회원 데이터
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

--제품 데이터
insert into m_product values('P00001', '새우깡' , 'box', '스낵류', 'n') ;
insert into m_product values('P00002', '야채타임' , 'box', '스낵류', 'n') ;
insert into m_product values('P00003', '촉촉한초코칩' , 'box', '스낵류', 'n') ;
insert into m_product values('P00004', '맛동산' , 'box', '스낵류', 'n') ;
insert into m_product values('P00005', '꼬깔콘' , 'box', '스낵류', 'n') ;
insert into m_product values('P00006', '오!감자' , 'box', '스낵류', 'n') ;
insert into m_product values('P00007', '꼬북칩' , 'box', '스낵류', 'n') ;
insert into m_product values('P00008', '몽쉘' , 'box', '스낵류', 'n') ;
insert into m_product values('P00009', '빠새' , 'box', '스낵류', 'n') ;
insert into m_product values('P00010', '죠리퐁' , 'box', '스낵류', 'n') ;
insert into m_product values('P00011', '바나나킥' , 'box', '스낵류', 'n') ;
insert into m_product values('P00012', '롯데샌드' , 'box', '스낵류', 'n') ;
insert into m_product values('P00013', '말랑카우' , 'box', '스낵류', 'n') ;
insert into m_product values('P00014', '인디안밥' , 'box', '스낵류', 'n') ;
insert into m_product values('P00015', '포스틱' , 'box', '스낵류', 'n') ;
insert into m_product values('P00016', '칸쵸' , 'box', '스낵류', 'n') ;
insert into m_product values('P00017', '쫄병스낵' , 'box', '스낵류', 'n') ;
insert into m_product values('P00018', '자갈치' , 'box', '스낵류', 'n') ;
insert into m_product values('P00019', '벌집핏자' , 'box', '스낵류', 'n') ;
insert into m_product values('P00020', '고래밥' , 'box', '스낵류', 'n') ;
--거래처 데이터
--영업1팀
--E00001의 거래처
insert into M_BUYER values(
'B00001'             --거래처코드
, '이마트'            --거래처명
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
'B00002'             --거래처코드
, '삼마트'            --거래처명
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
'B00005'             --거래처코드
, '육마트'            --거래처명
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
--E00002의 거래처
insert into M_BUYER values(
'B00006'             --거래처코드
, '일마트'            --거래처명
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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
, '2068650913'         --사업자등록번호
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

--판매가격 데이터
INSERT INTO m_price VALUES ( 'B00001', 'P00001', '2022-11-20', '2022-12-20', '2000', '원', 'n' );
INSERT INTO m_price VALUES ( 'B00002', 'P00002', '2022-11-21', '2022-12-21', '1500', '원', 'n' );
INSERT INTO m_price VALUES ( 'B00003', 'P00003', '2022-11-22', '2022-12-22', '3000', '원', 'n' );
INSERT INTO m_price VALUES ( 'B00004', 'P00004', '2022-11-23', '2022-12-23', '2000', '원', 'n' );
INSERT INTO m_price VALUES ( 'B00005', 'P00005', '2022-11-24', '2022-12-24', '1200', '원', 'n' );
INSERT INTO m_price VALUES ( 'B00001', 'P00006', '2022-11-05', '2022-12-05', '1800', '원', 'n' );
INSERT INTO m_price VALUES ( 'B00002', 'P00007', '2022-11-06', '2022-12-06', '1900', '원', 'n' );
INSERT INTO m_price VALUES ( 'B00003', 'P00008', '2022-11-07', '2022-12-07', '2000', '원', 'n' );
INSERT INTO m_price VALUES ( 'B00004', 'P00009', '2022-11-08', '2022-12-08', '2400', '원', 'n' );
INSERT INTO m_price VALUES ( 'B00005', 'P00010', '2022-11-09', '2022-12-09', '5500', '원', 'n' );
--오더 데이터
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

--오더 아이템
insert into t_order_detail values('S00001', 'P00001', 200 , 2000);
insert into t_order_detail values('S00001', 'P00001', 200 , 2000);
insert into t_order_detail values('S00001', 'P00002', 100 , 3000);
insert into t_order_detail values('S00001', 'P00005', 200 , 2000);
insert into t_order_detail values('S00002', 'P00010', 100 , 4000);
insert into t_order_detail values('S00002', 'P00002', 200 , 2000);
insert into t_order_detail values('S00003', 'P00019', 200 , 2000);
insert into t_order_detail values('S00003', 'P00011', 300 , 3000);
insert into t_order_detail values('S00003', 'P00001', 300 , 1000);
insert into t_order_detail values('S00003', 'P00008', 200 , 4000);
insert into t_order_detail values('S00003', 'P00005', 100 , 2000);
insert into t_order_detail values('S00004', 'P00012', 100 , 2000);
insert into t_order_detail values('S00005', 'P00013', 200 , 5000);
insert into t_order_detail values('S00005', 'P00015', 500 , 1000);
insert into t_order_detail values('S00006', 'P00001', 200 , 2000);
insert into t_order_detail values('S00006', 'P00002', 100 , 5000);
insert into t_order_detail values('S00006', 'P00003', 200 , 10000);
insert into t_order_detail values('S00006', 'P00004', 500 , 2000);
insert into t_order_detail values('S00006', 'P00005', 100 , 1000);
insert into t_order_detail values('S00006', 'P00006', 200 , 2000);
insert into t_order_detail values('S00007', 'P00008', 100 , 5000);
insert into t_order_detail values('S00008', 'P00010', 300 , 5000);
insert into t_order_detail values('S00008', 'P00012', 200 , 2000);
insert into t_order_detail values('S00009', 'P00001', 1000 , 8000);
insert into t_order_detail values('S00010', 'P00003', 100 , 8000);
insert into t_order_detail values('S00010', 'P00005', 200 , 5000);
insert into t_order_detail values('S00010', 'P00007', 300 , 2000);
insert into t_order_detail values('S00011', 'P00001', 200 , 2000);
insert into t_order_detail values('S00011', 'P00005', 100 , 2000);
insert into t_order_detail values('S00012', 'P00020', 200 , 3000);
insert into t_order_detail values('S00012', 'P00018', 500 , 2000);
insert into t_order_detail values('S00012', 'P00001', 100 , 5000);
insert into t_order_detail values('S00012', 'P00005', 200 , 2000);
insert into t_order_detail values('S00012', 'P00008', 1000 , 7000);
insert into t_order_detail values('S00012', 'P00009', 200 , 2000);
insert into t_order_detail values('S00013', 'P00008', 200 , 2000);
insert into t_order_detail values('S00014', 'P00006', 200 , 5000);
insert into t_order_detail values('S00015', 'P00001', 300 , 2000);
insert into t_order_detail values('S00015', 'P00002', 500 , 3000);
insert into t_order_detail values('S00015', 'P00003', 700 , 5000);
insert into t_order_detail values('S00015', 'P00004', 200 , 2000);
insert into t_order_detail values('S00015', 'P00005', 800 , 1000);
insert into t_order_detail values('S00016', 'P00011', 1500 , 2000);
insert into t_order_detail values('S00017', 'P00008', 1000 , 5000);
insert into t_order_detail values('S00017', 'P00004', 500 , 2000);
insert into t_order_detail values('S00018', 'P00011', 200 , 9000);
insert into t_order_detail values('S00019', 'P00001', 200 , 2000);
insert into t_order_detail values('S00019', 'P00003', 200 , 2000);
insert into t_order_detail values('S00020', 'P00009', 200 , 7000);
insert into t_order_detail values('S00020', 'P00011', 200 , 2000);

--상세사유
insert into t_notice values(1,'승인좀요.
 확인하고 승인 부탁드립니다.','E00002','S00001',sysdate,'승인요청');
insert into t_notice values(2,'수량이 일치하지 않습니다.
다시 확인하고 승인 요청 부탁드립니다.','E00002','S00001',sysdate,'반려');
insert into t_notice values(3,'수량이 일치하지 않습니다.
다시 확인하고 승인 요청 부탁드립니다.','E00002','S00001',sysdate,'승인');--상태로는 승인,반려,승인요청이 있을거 같습니다.
insert into t_notice values(4,'승인요청부탁드려용.
다시 확인하고 승인 요청 부탁드립니다.','E00002','S00008',sysdate,'승인');
insert into t_notice values(5,'승인요청부탁드려용.
다시 확인하고 승인 요청 부탁드립니다.','E00002','S00008',sysdate,'승인요청');
insert into t_notice values(6,'승인요청부탁드려용.
다시 확인하고 승인 요청 부탁드립니다.','E00002','S00007',sysdate,'승인요청');
insert into t_notice values(7,'재승인부탁드려용.
다시 확인하고 승인 부탁드립니다.','E00002','S00001',sysdate,'승인');
insert into t_notice values(8,'승인요청부탁드려용.
다시 확인하고 승인 부탁드립니다.','E00002','S00008',sysdate,'승인요청');
insert into t_notice values(9,'승인부탁드려용.
다시 확인하고 승인  부탁드립니다.','E00002','S00009',sysdate,'승인요청');