package com.sharedone.sharedone.dao;

import java.util.List;

import com.sharedone.sharedone.model.Price;

public interface PriceDao {
	
	List<Price> priceList();
	
	Price priceDetail(String pricingCD);

}
