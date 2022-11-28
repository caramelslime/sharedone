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

	@Override
	public int productUpdate(Product product) {
		return pd.productUpdate(product);
	}

	@Override
	public int productDelete(String productCD) {
		return pd.productDelete(productCD);
	}

	@Override
	public int productInsert(Product product) {
		return pd.productInsert(product);
	}

	@Override
	public int totalByProductGroup(String productGroup) {
		return pd.totalByProductGroup(productGroup);
	}

	@Override
	public String delList(String productCD) {
		return pd.delList(productCD);
	}

	@Override
	public int deleteProduct(String delList, String productCD) {
		return pd.deleteProduct(delList, productCD);
	}
}
