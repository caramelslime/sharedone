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
}
