package com.sharedone.sharedone.service;

import java.sql.Date;
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
	public List<Price> priceList(Price price) {
		return pd.priceList(price);
	}

	@Override
	public Price priceDetail(String periodStart) {
		return pd.priceDetail(periodStart);
	}
	
	@Override
	public int priceUpdate(Price price) {
		return pd.priceUpdate(price);
	}

	@Override
	public int priceDelete(String periodStart) {
		return pd.priceDelete(periodStart);
	}

	@Override
	public int priceInsert(Price price) {
		return pd.priceInsert(price);
	}
	
	@Override
	public String delList(Price price) {
		return pd.delList(price);
	}

	@Override
	public int deletePrice(Price price) {
		return pd.deleteProduct(price);
	}

	@Override
	public List<Price> findDate(Price price) {
		// TODO Auto-generated method stub
		return pd.findDate(price);
	}

	@Override
	public int defaultPrice(String productCD, int defaultPrice) {
		return pd.defaultPrice(productCD, defaultPrice);
		
	}
}
