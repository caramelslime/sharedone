package com.sharedone.sharedone.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.sharedone.sharedone.service.PagingBean;
import com.sharedone.sharedone.model.Employee;
//import com.sharedone.sharedone.model.Order;
import com.sharedone.sharedone.service.EmployeeService;

@Controller
public class ApprovalController {
	@Autowired
	private EmployeeService es;
//	@Autowired
//	private OrderService os;
//	@Autowired
//	private OrderDetailService ods;
	 
	
	@RequestMapping("empLoginForm")
	public String empLoginForm() {
		return "/empLoginForm";
	}
	@RequestMapping("empLogin")
	public String empLogin(Employee emp,Model model,HttpSession session) {
		Employee emp2 = es.select(emp.getEmpCd());
		int result= 0;
		if (emp2 == null) result = -1; // 없는 id
		else if (emp2.getPw().equals(emp.getPw())) {
			result = 1; // 성공 id와 password가 일치
			session.setAttribute("empCd", emp2.getEmpCd());
			session.setAttribute("name", emp2.getName());
		}
		model.addAttribute("result", result);
		return "empLogin";
	}
	@RequestMapping("pendingApprovalList")
	public String pendingApprovalList(String pageNum, Model model,/*Order order,*/HttpSession session) {
		
//		 String empCd=(String) session.getAttribute("empCd");
//		 int rowPerPage = 10;
//		 //한 화면에 보여주는 페이지 수 
//		 if(pageNum == null || pageNum.equals(""))pageNum="1"; 
//		 intcurrentPage = Integer.parseInt(pageNum);
//		 int total =os.pendingApprovalTotal();
//		 int startRow = (currentPage - 1) * rowPerPage +1;
//		 int endRow = startRow + rowPerPage -1;
//		 int num = total - startRow + 1;
//		 order.setStartRow(startRow);
//		 order.setEndRow(endRow);
//		 List<Order> list =as.pendingApprovalList(order);
//		 PagingBean pb = new PagingBean(currentPage,rowPerPage, total); 
//		 model.addAttribute("order",order);
//		 model.addAttribute("num",num);
//		 model.addAttribute("list",list);
//		 model.addAttribute("pb",pb);
		 
	 
		return "/pendingApprovalList";
	}
	@RequestMapping("pendingApprovalDetail")
	public String view(String sono, String pageNum, Model model, HttpSession session) {
//		String empCd = (String)session.getAttribute("empCd");
//		OrderDetail odlist = ods.list(sono);
//		model.addAttribute("list",odlist);
//		model.addAttribute("sono",sono);
//		model.addAttribute("pageNum",pageNum);
		return "/pendingApprovalDetail";
	}
	@RequestMapping("approveOrRefer.do")
	public String approve(int sono,String pageNum,Model model,HttpSession session,String content,int check) {
//		String empCd = (String)session.getAttribute("empCd");
//		int result =-1;
//		result = os.approve(sono,check);
//		if(result>0) {result=cs.insert(empCd,content);}
//		model.addAttribute("result",result);
//		model.addAttribute("pageNum",pageNum);
//		model.addAttribute("check",check);
		return "/approveOrRefer";
	}
}
