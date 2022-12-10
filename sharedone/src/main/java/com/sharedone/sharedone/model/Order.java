package com.sharedone.sharedone.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Order {
	
	private String soNo;
	private String buyerCD;
	private String soUser;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date addDate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date pricingDate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date requestDate;
	private String status;
	private String currency;
	
	private String productCD;
	private String qty;
	private String unit;
	private String unitPrice;
	private String productNM;
	private String productGroup;
	
	private String addDateRange;
	private String pricingDateRange;
	private String requestDateRange;
	
}
