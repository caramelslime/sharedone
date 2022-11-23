package com.sharedone.sharedone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedone.sharedone.dao.PriceDao;
import com.sharedone.sharedone.model.Price;

@Service
public class PriceServiceImpl implements PriceService {
	@Autowired
	private PriceDao pd;
	
	@Override
	public List<Price> priceList() {
		return pd.priceList();
	}
	
	@Override
	public Price priceDetail(String pricingCD) {
		return pd.priceDetail(pricingCD);
	}

}
