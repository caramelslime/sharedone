package com.sharedone.sharedone.model;

import lombok.Data;

@Data
public class Price {
	private String buyerCD;
	private String productCD;
	private String periodStart;
	private String periodEnd;
	private String listPrice;
	private String currency;
	private String del;
	
	private String delList;
	private String selectDelete;
	// 조인한 데이터
	private String buyerNM;
	private String productNM;
}
