package com.sharedone.sharedone.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Product> productList(Product product) {
		return sst.selectList("productns.productList", product);
	}

	@Override
	public Product productDetail(String productCD) {
		return sst.selectOne("productns.productDetail", productCD);
	}

	@Override
	public int productUpdate(Product product) {
		return sst.update("productns.productUpdate", product);
	}

	@Override
	public int productInsert(Product product) {
		return sst.insert("productns.productInsert", product);
	}

	@Override
	public int totalProduct() {
		return sst.selectOne("productns.totalProduct");
	}

	@Override
	public String delList(String productCD) {
		return sst.selectOne("productns.delList", productCD);
	}

	@Override
	public int deleteProduct(String delList, String productCD) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("delList", delList);
		map.put("productCD", productCD);
		return sst.update("productns.deleteProduct", map);
	}

	@Override
	public List<Product> productAllList() {
		return sst.selectList("productns.productAllList");
	}
	
	public String selectByNm(String productNM) {
		return sst.selectOne("productns.selectByNm", productNM);
	}

	@Override
	public Product selectProductNm(String productCD2) {
		return sst.selectOne("productns.selectProductNm",productCD2);
	}

	@Override
	public void cancelProductInsert(String productCD) {
		sst.delete("productns.cancelProductInsert", productCD);
	}

	@Override
	public int productNMCheck(String productNM) {
		return sst.selectOne("productns.productNMCheck", productNM);
	}
}
