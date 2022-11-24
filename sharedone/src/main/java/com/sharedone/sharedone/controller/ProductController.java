package com.sharedone.sharedone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		return "/nolay/productDetail";
	}
	
	@RequestMapping("productUpdate")
	public String productUpdate(Model model, Product product) {
		int result = 0;

		result = ps.productUpdate(product);
		
		model.addAttribute("product", product);
		model.addAttribute("result", result);
		
		return "/nolay/productUpdate";
	}
	
	@RequestMapping("productDelete")
	public String productDelete(Model model, String productCD) {
		int result = 0;

		result = ps.productDelete(productCD);
		
		model.addAttribute("result", result);
		
		return "/nolay/productDelete";
	}
	
	@RequestMapping("productInsertForm")
	public String productInsertForm () {
		return "/nolay/productInsertForm";
	}
	
	@RequestMapping("productInsert")
	public String productInsert(Model model, Product product) {
		int result = 0;

		int totalByProductGroup = ps.totalByProductGroup(product.getProductGroup());
		
		String productCD = "";
		
		if (product.getProductGroup() == "스넥류") {
			productCD = "A"+String.format("%05d",totalByProductGroup+1);
			System.out.println(productCD);
			product.setProductCD(productCD);
		} else if (product.getProductGroup() == "초콜릿류") {
			productCD = "B"+String.format("%05d",totalByProductGroup+1);
			System.out.println(productCD);
			product.setProductCD(productCD);
		}
		
		result = ps.productInsert(product);
		
		model.addAttribute("product", product);
		model.addAttribute("result", result);
		
		return "/nolay/productUpdate";
	}
	
}
