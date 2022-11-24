package com.sharedone.sharedone.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Product> productList() {
		return sst.selectList("productns.productList");
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
	public int productDelete(String productCD) {
		return sst.delete("productns.productDelete", productCD);
	}

	@Override
	public int productInsert(Product product) {
		return sst.insert("productns.productInsert", product);
	}

	@Override
	public int totalByProductGroup(String productGroup) {
		return sst.selectOne("productns.totalByProductGroup", productGroup);
	}
}
