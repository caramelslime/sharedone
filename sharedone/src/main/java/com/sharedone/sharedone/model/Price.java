package com.sharedone.sharedone.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Price {
	private String buyerCD;
	private String productCD;
	private Date periodStart;
	private Date periodEnd;
	private int listPrice;
	private String currency;
	private String del;
	
	private String delList;
	private String selectDelete;
	// 조인한 데이터
	private String buyerNM;
	private String productNM;
	
	public String bcdnm;
	public String pcdnm;
	
	private int defaultPrice;
}
