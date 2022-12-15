package com.sharedone.sharedone.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Price;

@Repository
public class PriceDaoImpl implements PriceDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Price> priceList(Price price) {
		return sst.selectList("pricens.priceList", price);
	}

	@Override
	public Price priceDetail(String periodStart) {
		return sst.selectOne("pricens.priceDetail", periodStart);
	}

	@Override
	public int priceUpdate(Price price) {
		return sst.update("pricens.priceUpdate", price);
	}

	@Override
	public int priceDelete(String periodStart) {
		return sst.delete("pricens.pricetDelete", periodStart);
	}

	@Override
	public int priceInsert(Price price) {
		return sst.insert("pricens.priceInsert", price);
	}

	@Override
	public String delList(Price price) {
		return sst.selectOne("pricens.delList", price);
	}

	@Override
	public int deleteProduct(Price price) {
		return sst.update("pricens.deletePrice", price);
	}

	@Override
	public List<Price> findDate(Price price) {
		// TODO Auto-generated method stub
		return sst.selectList("pricens.findDate",price);
	}

	@Override
	public int defaultPrice(String productCD, int defaultPrice) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productCD", productCD);
		map.put("defaultPrice", defaultPrice);
		return sst.update("pricens.defaultPrice", map);
	}
}
