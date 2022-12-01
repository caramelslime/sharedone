package com.sharedone.sharedone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedone.sharedone.model.Order;
import com.sharedone.sharedone.model.Product;
import com.sharedone.sharedone.service.OrderService;
import com.sharedone.sharedone.service.ProductService;

@Controller
public class OrderController {
	@Autowired
	private OrderService os;
	
	@Autowired
	private ProductService ps;
	
	@RequestMapping("order")
	public String order(Order order, Model model, String soNo, String buyerCD, String soUser, String addDate, String pricingDate, String requestDate, String status) {
		
		System.out.println("addDate: "+addDate);
		
		order.setSoNo(soNo);
		order.setBuyerCD(buyerCD);
		order.setSoUser(soUser);
//		order.setAddDate(addDate);
//		order.setPricingDate(pricingDate);
//		order.setRequestDate(requestDate);
		order.setStatus(status);
		
		List<Product> productAllList = ps.productAllList();
		
		model.addAttribute("productAllList", productAllList);
		
		
		List<Order> orderList = os.orderList(order);
		
		model.addAttribute("orderList", orderList);
		
		return "/nolay/order";
	}
	
	@RequestMapping("chart")
	public String chart() {
		return "/nolay/chart";
	}
	
}
