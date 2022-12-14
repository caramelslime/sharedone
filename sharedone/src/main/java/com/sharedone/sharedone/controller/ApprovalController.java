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

import com.sharedone.sharedone.model.Buyer;
//import com.sharedone.sharedone.service.PagingBean;
import com.sharedone.sharedone.model.Employee;
import com.sharedone.sharedone.model.Notice;
import com.sharedone.sharedone.model.Order;
import com.sharedone.sharedone.service.BuyerService;
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
	@Autowired
	private BuyerService bs;
	 
	
	@RequestMapping("empLoginForm")
	public String empLoginForm() {
		return "/nolay/empLoginForm";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/logout";
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
			session.setAttribute("job", emp2.getJob());
		}
		model.addAttribute("result", result);
		return "empLogin";
	}
	@RequestMapping("pendingApprovalList")
	public String pendingApprovalList(String pageNum, Model model, Order order, HttpSession session,String empCd2) {
		if(order.getBuyerCD() != null && order.getBuyerCD() != "") {
		//바이어 코드에 해당하는 바이어 이름
		Buyer buyer2 = bs.selectBuyerNm(order.getBuyerCD());
		System.out.println("buyer2.getBuyerNm()" + buyer2.getBuyerNm());
		String buyerNm2 = buyer2.getBuyerNm();
		model.addAttribute("buyerNm2", buyerNm2);
		}
		if(empCd2 != null && empCd2 != "") {
			//바이어 코드에 해당하는 바이어 이름
			Employee emp = es.selectEmpNm(empCd2);
			System.out.println("emp.getName()" + emp.getName());
			String empNm = emp.getName();
			model.addAttribute("empNm", empNm);
		}
		 String empCd=(String) session.getAttribute("empCd");
		 order.setSoUser(empCd2);
		 order.setEmpCd2(empCd);
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
		 for (int i=0; i < list.size(); i++) {
				list.get(i).setTotalPrice(os.totalPrice(list.get(i).getSoNo()));
			}
//		 PagingBean pb = new PagingBean(currentPage,rowPerPage, total); 
		//buyer정보 전체 리스트 불러오기
		List<Buyer> buyerAllList = bs.selectBuyerAllList();
		// System.out.println(buyerAllList);
		// employee정보 팀 리스트 불러오기(검색용)
		List<Employee> employee_list = es.selectTeam(empCd);
		
//		 model.addAttribute("order",order);
//		 model.addAttribute("num",num);
		 model.addAttribute("orderList",list);
		 model.addAttribute("buyerList",buyerAllList);
		 model.addAttribute("teamList",employee_list);
		 model.addAttribute("buyerCd", order.getBuyerCD());
		 model.addAttribute("empCd2", empCd2);
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
				notice.setEmpCd(empCd);
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
