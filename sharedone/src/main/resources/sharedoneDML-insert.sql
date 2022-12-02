--회원 데이터
insert into employee values('E0001','1234','010-8838-0247','김현서','ksh98520@naver.com','1998-07-13','영업1','staff');
insert into employee values('E0002','1234','010-8838-0245','엄준식','ksh624@naver.com','1998-07-05','영업1','staff');
insert into employee values('E0003','1234','010-2634-0247','하인호','ksh5325@naver.com','1995-03-24','영업1','staff');
insert into employee values('E0004','1234','010-7457-0247','최인석','ksh93250@naver.com','1990-06-22','영업1','staff');
insert into employee values('E0005','1234','010-3067-4088','강병준','kbj010@naver.com','2002-03-29','영업1','manager');
--제품 데이터
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
--거래처 데이터
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
, '소매업'				--업태
, '식품'					--종목
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
--판매가격 데이터
INSERT INTO price VALUES ( 'B00001', 'P00001', '2022-11-20', '2022-12-20', '2000', '원', 'n' );
INSERT INTO price VALUES ( 'B00002', 'P00002', '2022-11-21', '2022-12-21', '1500', '원', 'n' );
INSERT INTO price VALUES ( 'B00003', 'P00003', '2022-11-22', '2022-12-22', '3000', '원', 'n' );
INSERT INTO price VALUES ( 'B00004', 'P00004', '2022-11-23', '2022-12-23', '2000', '원', 'n' );
INSERT INTO price VALUES ( 'B00005', 'P00005', '2022-11-24', '2022-12-24', '1200', '원', 'n' );
INSERT INTO price VALUES ( 'B00001', 'P00006', '2022-11-05', '2022-12-05', '1800', '원', 'n' );
INSERT INTO price VALUES ( 'B00002', 'P00007', '2022-11-06', '2022-12-06', '1900', '원', 'n' );
INSERT INTO price VALUES ( 'B00003', 'P00008', '2022-11-07', '2022-12-07', '2000', '원', 'n' );
INSERT INTO price VALUES ( 'B00004', 'P00009', '2022-11-08', '2022-12-08', '2400', '원', 'n' );
INSERT INTO price VALUES ( 'B00005', 'P00010', '2022-11-09', '2022-12-09', '5500', '원', 'n' );
--오더 데이터
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
--오더 아이템
--상세사유
insert into t_notice values(1,'승인좀요.
 확인하고 승인 부탁드립니다.','E0001','S00001',sysdate,'승인요청');
insert into t_notice values(2,'수량이 일치하지 않습니다.
다시 확인하고 승인 요청 부탁드립니다.','E0001','S00001',sysdate,'반려');
insert into t_notice values(3,'수량이 일치하지 않습니다.
다시 확인하고 승인 요청 부탁드립니다.','E0001','S00001',sysdate,'승인');--상태로는 승인,반려,승인요청이 있을거 같습니다.
insert into t_notice values(4,'승인요청부탁드려용.
다시 확인하고 승인 요청 부탁드립니다.','E0001','S00008',sysdate,'승인');
insert into t_notice values(5,'승인요청부탁드려용.
다시 확인하고 승인 요청 부탁드립니다.','E0001','S00008',sysdate,'승인요청');
insert into t_notice values(6,'승인요청부탁드려용.
다시 확인하고 승인 요청 부탁드립니다.','E0001','S00007',sysdate,'승인요청');
insert into t_notice values(7,'재승인부탁드려용.
다시 확인하고 승인 부탁드립니다.','E0001','S00001',sysdate,'승인');
insert into t_notice values(8,'승인요청부탁드려용.
다시 확인하고 승인 부탁드립니다.','E0001','S00008',sysdate,'승인요청');
insert into t_notice values(9,'승인부탁드려용.
다시 확인하고 승인  부탁드립니다.','E0001','S00009',sysdate,'승인요청');