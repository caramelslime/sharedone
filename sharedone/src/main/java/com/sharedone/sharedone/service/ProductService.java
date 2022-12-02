package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Product;

public interface ProductService {

	List<Product> productList(Product product);

	Product productDetail(String productCD);

	int productUpdate(Product product);

	int productInsert(Product product);

	int totalByProductGroup(String productGroup);

	String delList(String productCD);

	int deleteProduct(String delList, String productCD);

	List<Product> productAllList();
	
	String selectByNm(String productNM);

}
