package com.sharedone.sharedone.dao;

import java.util.List;

import com.sharedone.sharedone.model.Price;

public interface PriceDao {

	List<Price> priceList();

	Price priceDetail(String periodStart);

	int priceUpdate(Price price);

	int priceDelete(String periodStart);

	int priceInsert(Price price);
	
	String delList(String periodStart);

	int deleteProduct(String delList, String periodStart);

	

	
	

}
