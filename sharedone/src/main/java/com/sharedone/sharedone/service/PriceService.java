package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Price;

public interface PriceService {

	List<Price> priceList();

	Price priceDetail(String pricingCD);

}
