package com.sharedone.sharedone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.sharedone.sharedone.service.PagingBean;
import com.sharedone.sharedone.model.Employee;
import com.sharedone.sharedone.model.Notice;
import com.sharedone.sharedone.model.Order;
import com.sharedone.sharedone.service.EmployeeService;
import com.sharedone.sharedone.service.NoticeService;
import com.sharedone.sharedone.service.OrderService;

import net.sf.json.JSONArray;

@Controller
public class ApprovalController {
	@Autowired
	private EmployeeService es;
	@Autowired
	private OrderService os;
//	@Autowired
//	private OrderDetailService ods;
	@Autowired
	private NoticeService ns;
	 
	
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
	public String pendingApprovalList(String pageNum, Model model,Order order,HttpSession session) {
		
//		 String empCd=(String) session.getAttribute("empCd");
		 order.setSoUser("E00006");
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
		 List<Order> list =os.pendingApprovalList(order);
//		 PagingBean pb = new PagingBean(currentPage,rowPerPage, total); 
//		 model.addAttribute("order",order);
//		 model.addAttribute("num",num);
		 model.addAttribute("orderList",list);
//		 model.addAttribute("pb",pb);
		 
	 
		return "/nolay/pendingApprovalList";
	}
	@RequestMapping("pendingApprovalDetail")
	public String view(String sono, String pageNum, Model model, HttpSession session) {
//		String empCd = (String)session.getAttribute("empCd");
//		OrderDetail odlist = ods.list(sono);
//		model.addAttribute("list",odlist);
//		model.addAttribute("sono",sono);
//		model.addAttribute("pageNum",pageNum);
		return "/nolay/pendingApprovalDetail";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(path = "approveOrRefer.do")
	@ResponseBody
	public Map<String, Object> approve(@RequestParam String data, Model model, HttpSession session, Notice notice) {
		String empCd = (String) session.getAttribute("empCd");
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			List<Map<String, Object>> info = new ArrayList<Map<String, Object>>();
			info = JSONArray.fromObject(data);

			for (Map<String, Object> noticeInfo : info) {
				System.out.println(noticeInfo.get("soNo"));
				String soNo = (String) noticeInfo.get("soNo");
				String content = (String) noticeInfo.get("content");
				String check = (String) noticeInfo.get("check");
				int noticeCd = ns.getMax();
				if(content == null || content.equals(""))content=" ";
				notice.setSoNo(soNo);
				notice.setContent(content);
				notice.setCheck(check);
				notice.setNoticeCd(noticeCd);
				notice.setEmpCd("E0005");
				System.out.println(content);

				
				int nInsertResult = ns.insertApproveOrRefer(notice);
				System.out.println(nInsertResult);
				int oInsertResult = os.updateApproveOrRefer(notice);
				System.out.println(oInsertResult);
			}
			result.put("result", true);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			result.put("result", e.getMessage());
		}

		return result;
	}
}
