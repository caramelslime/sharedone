package com.sharedone.sharedone.model;

import java.sql.Date;

import lombok.Data;


@Data
public class Buyer {
	private String buyercd;			//거래처코드
	private String buyernm;			//거래처명
	private String brno;			//사업자등록번호
	private String rprsv_nm;		//대표자
	private String business_status;	//업태
	private String event;			//종목
	private String receiveuserid;	//담당자
	private String status;			//거래처상태
	private String nationcd;		//국가코드
	private String postcode;		//우편번호
	private String address;			//소재지
	private String address_detail;	//소재지상세
	private String tel;				//전화번호
	private String email;			//이메일
	private String remark;			//참고사항
	private String adddate;			//등록일시
	private String adduser;			//작성자
	private String delyn;			//삭제여부
	
	//join
}
