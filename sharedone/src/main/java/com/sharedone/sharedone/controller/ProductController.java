package com.sharedone.sharedone.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedone.sharedone.model.Product;
import com.sharedone.sharedone.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService ps;
	
	@RequestMapping("main")
	public String main () {
		return "/main";
	}
	
	
	@RequestMapping("productList")
	public String productList(Model model) {
		
		List<Product> productList = ps.productList();
		
		model.addAttribute("productList", productList);
		
		return "/nolay/productList";
	}
	
	@RequestMapping("productDetail")
	public String productDetail(Model model, Product product, String productCD) {

		product = ps.productDetail(productCD);
		
		model.addAttribute("product", product);
		
		return "/nolay/productList";
	}
}
