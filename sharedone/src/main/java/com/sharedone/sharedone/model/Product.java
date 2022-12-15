package com.sharedone.sharedone.model;

import lombok.Data;

@Data
public class Product {
	private String productCD;
	private String productNM;
	private String unit;
	private String productGroup;
	private String del;
	
	private String delList;
	private String selectDelete;
	
	private String cdnm;
	private String type;
	private String value;
	
	private int listPrice;
	private String sortBy;
	private String sortAs;
	private int defaultPrice;
}
