package com.sharedone.sharedone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedone.sharedone.model.Price;
import com.sharedone.sharedone.service.PriceService;

@Controller
public class PriceController {
	
	@Autowired
	private PriceService ps;
	
	@RequestMapping("priceList")
	public String priceList(Model model) {
		
		List<Price> priceList = ps.priceList();
		
		model.addAttribute("priceList", priceList);
		
		return "/nolay/priceList";
	}
	
	@RequestMapping("priceDetail")
	public String priceDetail(Model model, Price price, String pricingCD) {
		
		price = ps.priceDetail(pricingCD);
		
		model.addAttribute("price", price);
		
		return "/nolay/priceList";
	}

}
