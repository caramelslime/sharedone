package com.sharedone.sharedone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.model.Employee;
import com.sharedone.sharedone.service.BuyerService;
import com.sharedone.sharedone.service.EmployeeService;

@Controller
public class BuyerController {
	@Autowired
	private BuyerService bs;
	
	@Autowired
	private EmployeeService es;
	
	@RequestMapping("buyerManagement")
	public String buyerManagement(Model model, Buyer buyer, Employee employee) {
		//buyer정보 전체 리스트 불러오기
		List<Buyer> buyer_list = bs.selectBuyerList();
		
		//employee정보 전체 리스트 불러오기(검색용)
		List<Employee> employee_list = es.selectEmployeeList();
		
		model.addAttribute("buyer_list", buyer_list);
		model.addAttribute("employee_list", employee_list);
		return "/nolay/buyerManagement";
	}

	@RequestMapping(value = "newInsertConfirm", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String newInsertConfirm(Buyer buyer, Model model) {
		String msg = "";
		int result = 0;
		result = bs.buyerInsert(buyer);
		if(result == 1) {
			msg="y";
		}else {
			msg="n";
		}
		return msg;
	}
	
	@RequestMapping(value = "updateConfirm", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String updateConfirm(Buyer buyer, Model model) {
		String msg = "";
		int result = 0;
		result = bs.buyerUpdate(buyer);
		System.out.println(buyer);
		if(result == 1) {
			msg="y";
		}else {
			msg="n";
		}
		return msg;
	}

}
