package com.sharedone.sharedone.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Order {
	
	private String soNo;
	private String buyerCD;
	private String soUser;
	private Date addDate;
	private Date pricingDate;
	private Date requestDate;
	private String status;
	private String currency;
	
	private String productCD;
	private String qty;
	private String unit;
	private String unitprice;
	
}
