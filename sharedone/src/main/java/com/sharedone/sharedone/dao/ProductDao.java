package com.sharedone.sharedone.dao;

import java.util.List;

import com.sharedone.sharedone.model.Product;

public interface ProductDao {

	List<Product> productList(Product product);

	Product productDetail(String productCD);

	int productUpdate(Product product);

	int productInsert(Product product);

	int totalByProductGroup(String productGroup);

	String delList(String productCD);

	int deleteProduct(String delList, String productCD);

	String selectByNm(String productNM);

}
