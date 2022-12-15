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
	public List<Product> productList(Product product) {
		return pd.productList(product);
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
	public int productInsert(Product product) {
		return pd.productInsert(product);
	}

	@Override
	public int totalProduct() {
		return pd.totalProduct();
	}

	@Override
	public String delList(String productCD) {
		return pd.delList(productCD);
	}

	@Override
	public int deleteProduct(String delList, String productCD) {
		return pd.deleteProduct(delList, productCD);
	}

	@Override
	public List<Product> productAllList() {
		return pd.productAllList();
	}
	
	public String selectByNm(String productNM) {
		return pd.selectByNm(productNM);
	}

	@Override
	public Product selectProductNm(String productCD2) {
		// TODO Auto-generated method stub
		return pd.selectProductNm(productCD2);
	}

	@Override
	public void cancelProductInsert(String productCD) {
		pd.cancelProductInsert(productCD);
	}

	@Override
	public int productNMCheck(String productNM) {
		return pd.productNMCheck(productNM);
	}
}
