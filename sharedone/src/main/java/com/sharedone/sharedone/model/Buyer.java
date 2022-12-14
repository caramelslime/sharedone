package com.sharedone.sharedone.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
public class Buyer {
	private String buyerCd;			//거래처코드
	private String buyerNm;			//거래처명
	private String brno;			//사업자등록번호
	private String rprsvNm;		//대표자
	private String businessStatus;	//업태
	private String event;			//종목
	private String empCd;			//담당자
	private String status;			//거래처상태
	private String nationCd;		//국가코드
	private String postcode;		//우편번호
	private String address;			//소재지
	private String addressDetail;	//소재지상세
	private String tel;				//전화번호
	private String email;			//이메일
	private String remark;			//참고사항
	//@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private String addDate;			//등록일시
	private String addUser;			//작성자
	private String delyn;			//삭제여부
	
	//join
	private String name;
	
	//사원 이름 불러오기
	private String empName;
	private String addUserName;
}

