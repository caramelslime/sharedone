package com.sharedone.sharedone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedone.sharedone.dao.ProductDao;
import com.sharedone.sharedone.model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao pd;

	@Override
	public List<Product> productList() {
		return pd.productList();
	}

	@Override
	public Product productDetail(String productCD) {
		return pd.productDetail(productCD);
	}
}
