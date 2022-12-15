package com.sharedone.sharedone.dao;

import java.sql.Date;
import java.util.List;

import com.sharedone.sharedone.model.Price;

public interface PriceDao {

	List<Price> priceList(Price price);

	Price priceDetail(String periodStart);

	int priceUpdate(Price price);

	int priceDelete(String periodStart);

	int priceInsert(Price price);
	
	String delList(Price price);

	int deleteProduct(Price price);

	List<Price> findDate(Price price);

	int defaultPrice(String productCD, int defaultPrice);

	

	
	

}
