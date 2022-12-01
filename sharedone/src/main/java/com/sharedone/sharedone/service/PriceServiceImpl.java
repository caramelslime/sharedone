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
	public String delList(String periodStart) {
		return pd.delList(periodStart);
	}

	@Override
	public int deletePrice(String delList, String periodStart) {
		return pd.deleteProduct(delList, periodStart);
	}
}
