package com.sharedone.sharedone.dao;

import java.util.List;

import com.sharedone.sharedone.model.Product;

public interface ProductDao {

	List<Product> productList();

	Product productDetail(String productCD);

	int productUpdate(Product product);

	int productDelete(String productCD);

	int productInsert(Product product);

	int totalByProductGroup(String productGroup);

}
