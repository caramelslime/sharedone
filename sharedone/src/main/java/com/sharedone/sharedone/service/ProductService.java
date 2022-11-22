package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Product;

public interface ProductService {

	List<Product> productList();

	Product productDetail(String productCD);

}
