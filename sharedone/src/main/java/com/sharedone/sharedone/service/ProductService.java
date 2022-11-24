package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Product;

public interface ProductService {

	List<Product> productList();

	Product productDetail(String productCD);

	int productUpdate(Product product);

	int productDelete(String productCD);

	int productInsert(Product product);

	int totalByProductGroup(String productGroup);

}
