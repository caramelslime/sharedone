package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Product;

public interface ProductService {

	List<Product> productList(Product product);

	Product productDetail(String productCD);

	int productUpdate(Product product);

	int productInsert(Product product);

	int totalProduct();

	String delList(String productCD);

	int deleteProduct(String delList, String productCD);

	List<Product> productAllList();
	
	String selectByNm(String productNM);

//	khs 제품명 찾기
	Product selectProductNm(String productCD2);

	void cancelProductInsert(String productCD);

	int productNMCheck(String productNM);

}
