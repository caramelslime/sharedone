package com.sharedone.sharedone.dao;

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
	public List<Price> priceList() {
		return sst.selectList("pricens.priceList");
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
	public String delList(String periodStart) {
		return sst.selectOne("pricens.delList", periodStart);
	}

	@Override
	public int deleteProduct(String delList, String periodStart) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("delList", delList);
		map.put("priceCD", periodStart);
		return sst.update("pricens.deletePrice", map);
	}
}
