package com.sharedone.sharedone.model;

import lombok.Data;

@Data
public class Price {
	private String pricingCD;
	private String buyerCD;
	private String productCD;
	private String price;
	private String currency;
	private String periodStart;
	private String periodEnd;
	private String rate;
}
