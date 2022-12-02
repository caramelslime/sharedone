package com.sharedone.sharedone.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.model.Employee;
import com.sharedone.sharedone.service.BuyerService;
import com.sharedone.sharedone.service.EmployeeService;

@Controller
public class DashboardController {
	
	@Autowired
	private BuyerService bs;
	
	@Autowired
	private EmployeeService es;
	
	
	@RequestMapping("orderReport")
	public String orderReport(Model model, Buyer buyer) {
		//buyer정보 전체 리스트 불러오기
		List<Buyer> buyerAllList = bs.selectBuyerAllList();
		
		//employee정보 전체 리스트 불러오기(검색용)
		List<Employee> employee_list = es.selectEmployeeList();
		
		model.addAttribute("buyerAllList", buyerAllList);
		model.addAttribute("employee_list", employee_list);
		return "/nolay/orderReport";
	}
	

}
