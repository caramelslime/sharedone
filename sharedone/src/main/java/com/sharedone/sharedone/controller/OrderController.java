package com.sharedone.sharedone.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.model.Employee;
import com.sharedone.sharedone.model.Order;
import com.sharedone.sharedone.model.Product;
import com.sharedone.sharedone.service.BuyerService;
import com.sharedone.sharedone.service.EmployeeService;
import com.sharedone.sharedone.service.OrderService;
import com.sharedone.sharedone.service.ProductService;

@Controller
public class OrderController {
	@Autowired
	private OrderService os;
	
	@Autowired
	private ProductService ps;
	
	@Autowired
	private BuyerService bs;
	
	@Autowired
	private EmployeeService es;
	
	@RequestMapping("order")
	public String order(HttpSession session, Order order, Model model, String soNo, String buyerCD, String soUser, String addDateRange, String pricingDateRange, String requestDateRange, String status) {
		
		soUser = (String) session.getAttribute("empCd");
		
		order.setSoNo(soNo);
		order.setBuyerCD(buyerCD);
		order.setSoUser(soUser);
		order.setAddDateRange(addDateRange);
		order.setPricingDateRange(pricingDateRange);
		order.setRequestDateRange(requestDateRange);
		order.setStatus(status);
		
		List<Product> productAllList = ps.productAllList();
		model.addAttribute("productAllList", productAllList);
		
		List<Order> orderList = os.orderList(order);
		model.addAttribute("orderList", orderList);
		
		List<Buyer> buyerAllList = bs.selectBuyerAllList();
		model.addAttribute("buyerAllList", buyerAllList);
		
		List<Employee> employee_list = es.selectEmployeeList();
		model.addAttribute("employee_list", employee_list);
		
		model.addAttribute("order", order);
		
		return "/nolay/order";
	}
	
}
