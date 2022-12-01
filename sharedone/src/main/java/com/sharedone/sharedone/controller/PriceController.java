package com.sharedone.sharedone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.model.Price;
import com.sharedone.sharedone.model.Product;
import com.sharedone.sharedone.service.BuyerService;
import com.sharedone.sharedone.service.PriceService;
import com.sharedone.sharedone.service.ProductService;

import net.sf.json.JSONArray;

@Controller
public class PriceController {
	
	@Autowired
	private PriceService pv;
	@Autowired
	private BuyerService bs;
	@Autowired
	private ProductService ps;
	
	@RequestMapping("priceList")
	public String priceList(Model model, Price price, Product product, String bcdnm, String pcdnm, String periodStart) {
		
//		price.setbCdnm(bcdnm);
//		price.setpCdnm(pcdnm);
//		
		List<Price> priceList = pv.priceList();
		List<Buyer> buyerList = bs.selectBuyerList();
		List<Product> productList = ps.productList(product);
		
		model.addAttribute("priceList", priceList);
		model.addAttribute("buyerList", buyerList);
		model.addAttribute("productList", productList);
		
		return "/nolay/priceList";
	}
	
	@RequestMapping("priceDetail")
	public String priceDetail(Model model, Price price, String periodStart) {
		
		price = pv.priceDetail(periodStart);
		
		model.addAttribute("price", price);
		
		return "/nolay/priceList";
	}
	
	@RequestMapping("priceUpdate")
	public String priceUpdate(Model model, Price price) {
		int result = 0;
		
		result =pv.priceUpdate(price);
		
		model.addAttribute("price", price);
		model.addAttribute("result", result);
		
		return "/nolay/priceUpdate";
	}
	
	@RequestMapping("priceIsertForm")
	public String priceIsertForm () {
		return "/nolay/priceInsertForm";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(path = "priceInsert")
	@ResponseBody
	public Map<String, Object> priceInsert(@RequestParam String data, Model model, Price price, Buyer buyer, Product product) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> info = new ArrayList<Map<String,Object>>();
			info = JSONArray.fromObject(data);
			
			for (Map<String, Object> priceInfo : info) {
				System.out.println(priceInfo.get("periodStart"));
				String buyerNM = (String) priceInfo.get("buyerNM");
				String productNM = (String) priceInfo.get("productNM");
				String periodStart = (String) priceInfo.get("periodStart");
				String listPrice = (String) priceInfo.get("listPrice");
				String currency = (String) priceInfo.get("currency");
				
				buyer.setBuyernm(buyerNM);
				product.setProductNM(productNM);
				price.setPeriodStart(periodStart);
				price.setListPrice(listPrice);
				price.setCurrency(currency);
		    }  
		     result.put("result", true);
		    
		} catch (Exception e) {
			result.put("result", false);
		}
		
		return result;
	}
	
	@RequestMapping(value = "priceDelete", produces = "text/html;charset=utf-8")
	public String priceDelete (Model model, @RequestParam("selectChk") String[] selectChk) {
		
		String[] selectDelete =selectChk;
		String[] delList= new String[selectDelete.length];
		
		System.out.println(selectDelete);
		
		if (selectDelete[0].equals("selectAll")) {
			for (int i = 1; i < selectDelete.length; i++) {
				System.out.println(selectDelete[i]);
				if (pv.delList(selectDelete[i]).equals("n")) {
					delList[i-1] = "y";
				} else if (pv.delList(selectDelete[i]).equals("y")) {
					delList[i-1] = "n";
				}
			}
		} else {
			for (int i = 0; i < selectDelete.length; i++) {
				if (pv.delList(selectDelete[i]).equals("n")) {
					System.out.println(selectDelete[i]);
					delList[i] = "y";
				} else if (pv.delList(selectDelete[i]).equals("y")) {
					delList[i] = "n";
				}
			}
		}
		
		int result=0;

		if (selectDelete[0].equals("selectAll")) {
			for (int i = 1; i < selectDelete.length; i++) {
				result=pv.deletePrice(delList[i-1], selectDelete[i]);
			}
		} else { 
			for (int i = 0; i < selectDelete.length; i++) {
				result=pv.deletePrice(delList[i], selectDelete[i]);
			}
		}
		
		System.out.println(result);
		model.addAttribute("result", result);
		
		return "/nolay/priceList";
	}
	
	
}
