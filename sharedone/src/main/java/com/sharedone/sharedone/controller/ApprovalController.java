package com.sharedone.sharedone.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedone.sharedone.model.Employee;
import com.sharedone.sharedone.service.EmployeeService;

@Controller
public class ApprovalController {
	@Autowired
	private EmployeeService es;
	
	@RequestMapping("empLoginForm")
	public String empLoginForm() {
		return "empLoginForm";
	}
	@RequestMapping("empLogin")
	public String empLogin(Employee emp,Model model,HttpSession session) {
		Employee emp2 = es.select(emp.getEmpCd());
		int result= 0;
		if (emp2 == null) result = -1; // 없는 id
		else if (emp2.getPw().equals(emp.getPw())) {
			result = 1; // 성공 id와 password가 일치
			session.setAttribute("id", emp2.getEmpCd());
			session.setAttribute("authority", emp2.getAuthority());
			session.setAttribute("name", emp2.getName());
		}
		model.addAttribute("result", result);
		return "empLogin";
	}
}
