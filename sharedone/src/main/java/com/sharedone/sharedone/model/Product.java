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
}
