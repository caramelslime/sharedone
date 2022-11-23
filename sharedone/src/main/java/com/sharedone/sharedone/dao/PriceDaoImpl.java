package com.sharedone.sharedone.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Price;

@Repository
public class PriceDaoImpl implements PriceDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public List<Price> priceList() {
		return sst.selectList("pricens.priceList");
	}
	
	@Override
	public Price priceDetail(String pricingCD) {
		return sst.selectOne("pricens.priceDetail", pricingCD);
	}

}
