package com.sharedone.sharedone.dao;

import java.util.List;

import com.sharedone.sharedone.model.Product;

public interface ProductDao {

	List<Product> productList();

	Product productDetail(String productCD);

}
