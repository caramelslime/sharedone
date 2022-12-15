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
	public String order(HttpSession session, Order order, Model model, String soNo, String buyerCD, String soUser, String addDateRange, String pricingDateRange, String requestDateRange, String status, String sortBy, String sortAs) {
		
		System.out.println("pricingDateRange(OrderController) : "+pricingDateRange);
		System.out.println("addDateRange(OrderController) : "+addDateRange);
		System.out.println("requestDateRange(OrderController) : "+requestDateRange);
		
		String leaderSoUser = soUser;
		soUser = (String) session.getAttribute("empCd");
		
		String team = "";
		String leader = "n";
		if (soUser.equals("E00001")) {
			team = "team1";
			leader = "y";
		} else if (soUser.equals("E00006")) {
			team = "team2";
			leader = "y";
		} else if (soUser.equals("E00011")) {
			team = "team3";
			leader = "y";
		}
		
		if (soUser.equals("E00001") || soUser.equals("E00006") || soUser.equals("E00011")) {
			if (leaderSoUser == null) {
				soUser = "";
			} else if (leaderSoUser != null) {
				soUser = leaderSoUser;
			}
		}
		
		model.addAttribute("team", team);
		model.addAttribute("leader", leader);
		
		order.setSoNo(soNo);
		order.setBuyerCD(buyerCD);
		order.setSoUser(soUser);
		order.setAddDateRange(addDateRange);
		order.setPricingDateRange(pricingDateRange);
		order.setRequestDateRange(requestDateRange);
		order.setStatus(status);
		order.setSortBy(sortBy);
		order.setSortAs(sortAs);
		System.out.println(order);
		
		List<Product> productAllList = ps.productAllList();
		model.addAttribute("productAllList", productAllList);
		
		List<Order> orderList = os.orderList(order);
		
		for (int i=0; i < orderList.size(); i++) {
			orderList.get(i).setTotalPrice(os.totalPrice(orderList.get(i).getSoNo()));
		}
		
		model.addAttribute("orderList", orderList);
		
		List<Order> orderAllList = os.orderAllList(order);
		model.addAttribute("orderAllList", orderAllList);
		
		List<Buyer> buyerAllList = bs.selectBuyerAllList();
		model.addAttribute("buyerAllList", buyerAllList);
		
		List<Employee> employee_list = es.selectEmployeeList();
		model.addAttribute("employee_list", employee_list);
		
		model.addAttribute("order", order);
		
		model.addAttribute("soNo", soNo);
		model.addAttribute("soUser", soUser);
		model.addAttribute("addDateRange", addDateRange);
		model.addAttribute("status", status);
		model.addAttribute("pricingDateRange", pricingDateRange);
		model.addAttribute("buyerCD", buyerCD);
		model.addAttribute("requestDateRange", requestDateRange);
		model.addAttribute("leaderSoUser", leaderSoUser);
		model.addAttribute("sortBy", sortBy);
		model.addAttribute("sortAs", sortAs);
		
		return "/nolay/order";
	}
	
}
