package com.sharedone.sharedone.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

import lombok.Data;

@Data
public class Report {
	private String year;
	private String month;
	private String buyerCd;
	private String dept;
	private String empCd;
	private String orderStatus;
	private int amount;
	private int runningTotal;
	private int cnt;
	private int cumSales;
	
	//buyer
	private String buyerNm;			//거래처명
	private String brno;			//사업자등록번호
	private String rprsvNm;		//대표자
	private String businessStatus;	//업태
	private String event;			//종목
	private String status;			//거래처상태
	private String nationCd;		//국가코드
	private String postcode;		//우편번호
	private String address;			//소재지
	private String addressDetail;	//소재지상세
	private String tel;				//전화번호
	private String email;			//이메일
	private String remark;			//참고사항
	private String addDate;			//등록일시
	private String addUser;			//작성자
	private String delyn;			//삭제여부
	
	//order
	private String soNo;
	private String soUser;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date pricingDate;
	private String requestDate;
	private String currency;
	private String productCD;
	private String qty;
	private String unit;
	private String unitPrice;
	
	//emp
	private String pw;
	private String phone;
	private String name;
	private Date hireDate;
	private String job;
	
	//product
	private String productNM;
	private String productGroup;
	private String del;
	private String delList;
	private String selectDelete;
	private String cdnm;
}
