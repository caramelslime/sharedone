package com.sharedone.sharedone.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.sharedone.sharedone.model.Employee;
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
	public String priceList(Model model, Price price) {
		if(price.getBuyerCD() != null && price.getBuyerCD() != "") {
			//바이어 코드에 해당하는 바이어 이름
			Buyer buyer2 = bs.selectBuyerNm(price.getBuyerCD());
			System.out.println("buyer2.getBuyerNm()" + buyer2.getBuyerNm());
			String buyerNm2 = buyer2.getBuyerNm();
			model.addAttribute("buyerNM2", buyerNm2);
		}
		if(price.getProductCD() != null && price.getProductCD() != "") {
			//바이어 코드에 해당하는 바이어 이름
			Product product = ps.selectProductNm(price.getProductCD());
			String productNM2 = product.getProductNM();
			model.addAttribute("productNM2", productNM2);
		}
		System.out.println(price.getBuyerCD());
		System.out.println(price.getProductCD());
		List<Price> priceList = pv.priceList(price);
		List<Buyer> buyerAllList = bs.selectBuyerAllList();
		List<Product> productAllList = ps.productAllList();
		
		model.addAttribute("priceList", priceList);
		model.addAttribute("buyerAllList", buyerAllList);
		model.addAttribute("productAllList", productAllList);
		model.addAttribute("productCD2", price.getProductCD());
		model.addAttribute("buyerCD2", price.getBuyerCD());
		
		return "/nolay/priceList";
	}
	
	@RequestMapping("priceDetail")
	public String priceDetail(Model model, Price price, String periodStart) {
		
		price = pv.priceDetail(periodStart);
		
		model.addAttribute("price", price);
		
		return "/nolay/priceList";
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
				String buyerCD = (String) priceInfo.get("buyerCD");
				String productCD = (String) priceInfo.get("productCD");
				String startDate = (String) priceInfo.get("periodStart");
				String endDate = (String) priceInfo.get("periodEnd");
				int listPrice = Integer.parseInt((String) priceInfo.get("listPrice"));
				String currency = (String) priceInfo.get("currency");
	            Date periodStart = Date.valueOf(startDate);
	            Date periodEnd = Date.valueOf(endDate);
	            price.setBuyerCD(buyerCD);
				price.setProductCD(productCD);
				price.setPeriodStart(periodStart);
				System.out.println(price.getPeriodStart());
				price.setPeriodEnd(periodEnd);
				System.out.println(price.getPeriodEnd());
				price.setListPrice(listPrice);
				price.setCurrency(currency);
				System.out.println(price.getBuyerCD());
				List<Price> price2 = pv.findDate(price); // 날짜 가 겹치는지 확인
				if(price2 == null || price2.isEmpty()) {
					int insertResult = pv.priceInsert(price);
					System.out.println(insertResult);
				}else {
					Exception e = new Exception("유효기간이 겹칩니다.");
					throw e;
				}
		    }  
		     result.put("result", "true");
		    
		} catch (Exception e) {
			System.out.println(e.getMessage());
			result.put("result",e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping(value = "priceDelete", produces = "text/html;charset=utf-8")
	public String priceDelete (Model model, @RequestParam("selectChk") String[] selectChk,Price price) {
		
		String[] selectDelete =selectChk;
		String[] delList= new String[selectDelete.length];
		String[] buyerList= new String[selectDelete.length];
		String[] productList= new String[selectDelete.length];
		String[] periodList= new String[selectDelete.length];
		String[] list = new String[3];		
		System.out.println(selectDelete[0]);
		if (selectDelete[0].equals("selectAll")) {
			for (int i = 1; i < selectDelete.length; i++) {
				System.out.println(selectDelete[i]);
				//,로 나눠줘서 각각 담아주기
				list=selectDelete[i].split("%");
				System.out.println(Arrays.toString(list));
				buyerList[i]=list[0];
				productList[i]=list[1];
				periodList[i]=list[2];
				price.setBuyerCD(buyerList[i]);
				price.setProductCD(productList[i]);
				price.setPeriodStart(Date.valueOf(periodList[i]));
				if (pv.delList(price).equals("n")) {
					delList[i-1] = "y";
				} else if (pv.delList(price).equals("y")) {
					delList[i-1] = "n";
				}
			}
		} else {
			for (int i = 0; i < selectDelete.length; i++) {
				//,로 나눠줘서 각각 담아주기
				list=selectDelete[i].split("%");
				System.out.println(Arrays.toString(list));
				buyerList[i]=list[0];
				productList[i]=list[1];
				periodList[i]=list[2];
				price.setBuyerCD(buyerList[i]);
				price.setProductCD(productList[i]);
				price.setPeriodStart(Date.valueOf(periodList[i]));
				if (pv.delList(price).equals("n")) {
					System.out.println(selectDelete[i]);
					delList[i] = "y";
				} else if (pv.delList(price).equals("y")) {
					delList[i] = "n";
				}
			}
		}
		
		int result=0;

		if (selectDelete[0].equals("selectAll")) {
			for (int i = 1; i < selectDelete.length; i++) {
				price.setBuyerCD(buyerList[i]);
				price.setProductCD(productList[i]);
				price.setPeriodStart(Date.valueOf(periodList[i]));
				price.setDel(delList[i-1]);
				result=pv.deletePrice(price);
			}
		} else { 
			for (int i = 0; i < selectDelete.length; i++) {
				price.setBuyerCD(buyerList[i]);
				price.setProductCD(productList[i]);
				price.setPeriodStart(Date.valueOf(periodList[i]));
				price.setDel(delList[i]);
				result=pv.deletePrice(price);
			}
		}
		
		System.out.println(result);
		model.addAttribute("result", result);
		
		return "/nolay/priceList";
	}
	
	@RequestMapping("priceUpdate")
	public String priceUpdate(Price price, Model model, String pricePK, String type, String value) {
		
		System.out.println(pricePK);
		System.out.println(type);
		System.out.println(value);
		price.setListPrice(0);
		if (type.equals("listPrice")) {
			System.out.println("listPrice");
			price.setListPrice(Integer.parseInt(value));
		} else if (type.equals("currency")) {
			System.out.println("currency");	
			price.setCurrency(value);
		}
		String[] list=pricePK.split(" ");
		price.setBuyerCD(list[0]);
		price.setProductCD(list[1]);
		price.setPeriodStart(Date.valueOf(list[2]));
		
		System.out.println(price.getPeriodStart());
		
		String result = String.valueOf(pv.priceUpdate(price));
		
		return "/nolay/priceList";
	}
	
	
}
