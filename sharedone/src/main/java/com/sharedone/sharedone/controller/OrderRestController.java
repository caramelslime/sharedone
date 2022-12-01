package com.sharedone.sharedone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.model.Order;
import com.sharedone.sharedone.service.BuyerService;
import com.sharedone.sharedone.service.OrderService;

@RestController
public class OrderRestController {
	
	@Autowired
	private OrderService os;
	
	@RequestMapping("/orderHeader")
	@ResponseBody
	public Order orderHeader(String soNo) {
		Order orderHeader = os.selectOrderHeader(soNo);
		return orderHeader;
	}
	
	@RequestMapping("/orderItems")
	@ResponseBody
	public List<Order> orderItems(String soNo) {
		List<Order> orderItems = os.selectOrderItems(soNo);
		System.out.println(orderItems);
		return orderItems;
	}
	
	
	@RequestMapping("/selectByProductCD")
	@ResponseBody
	public Order selectByProductCD(String productCD) {
		Order product = os.selectByProductCD(productCD);
		System.out.println(product);
		return product;
	}
	
}
