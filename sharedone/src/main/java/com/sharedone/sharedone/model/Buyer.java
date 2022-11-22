package com.sharedone.sharedone.model;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class Buyer {
	private String BUYERCD;			//거래처코드
	private String BUYERNM;			//거래처명
	private String BRNO;			//사업자등록번호
	private String RPRSV_NM;		//대표자
	private String BUSINESS_STATUS;	//업태
	private String EVENT;			//종목
	private String RECEIVEUSERID;	//담당자
	private String STATUS;			//거래처상태
	private String NATIONCD;		//국가코드
	private String POSTCODE;		//우편번호
	private String ADDRESS;			//소재지
	private String ADDRESS_DETAI;	//소재지상세
	private String TEL;				//전화번호
	private String EMAIL;			//이메일
	private String REMARK;			//참고사항
	private DATE ADDDATE;			//등록일시
	private String ADDUSER;			//작성자
	private String DELYN;			//삭제여부
	
	//join
}
