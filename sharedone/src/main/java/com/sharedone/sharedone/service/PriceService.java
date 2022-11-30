package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.model.Price;

public interface PriceService {

	List<Price> priceList();

	Price priceDetail(String periodStart);

	int priceUpdate(Price price);
	
	int priceDelete(String periodStart);

	int priceInsert(Price price);

	String delList(String periodStart);

	int deletePrice(String delList, String periodStart);





}
