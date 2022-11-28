package com.sharedone.sharedone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.model.Employee;
import com.sharedone.sharedone.service.BuyerService;
import com.sharedone.sharedone.service.EmployeeService;

import net.sf.json.JSONArray;

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
		
//		//거래처 코드 지정을 위한 거래처 리스트 count
//		int buyer_count = bs.buyerCount();
//		System.out.println(buyer_count);
//		String buyerCD;
//		buyerCD = "BA"+String.format("%04d",buyer_count+1);
//    	System.out.println(buyerCD);
		
		model.addAttribute("buyer_list", buyer_list);
		model.addAttribute("employee_list", employee_list);
		
//		model.addAttribute("buyerCD", buyerCD);
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

	
	@SuppressWarnings("unchecked")
	@RequestMapping(path = "buyerInsert")
	@ResponseBody
	public Map<String, Object> buyerInsert(@RequestParam String data, Model model, Buyer buyer) {
		System.out.println("왔다!");
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> info = new ArrayList<Map<String,Object>>();
		    info = JSONArray.fromObject(data);
		    System.out.println(info);
		    for (Map<String, Object> buyerInfo : info) {
		    	System.out.println("buyerInfo.get(\"buyerNM\")" + buyerInfo.get("buyerNM"));
		    	String buyerName = (String) buyerInfo.get("buyerNM");
		    	System.out.println("buyerName"  + buyerName);
		        String brno = (String) buyerInfo.get("brno");
		        String rprsv_nm = (String) buyerInfo.get("rprsv_nm");
		        String business_status = (String) buyerInfo.get("business_status");
		        String event = (String) buyerInfo.get("event");
		        String receiveuserid = (String) buyerInfo.get("receiveuserid");
		        String status = (String) buyerInfo.get("status");
		        String nationcd = (String) buyerInfo.get("nationcd");
		        String postcode = (String) buyerInfo.get("postcode");
		        String address = (String) buyerInfo.get("address");
		        String address_detail = (String) buyerInfo.get("address_detail");
		        String tel = (String) buyerInfo.get("tel");
		        String email = (String) buyerInfo.get("email");
		        String remark = (String) buyerInfo.get("remark");
		        String adddate = (String) buyerInfo.get("adddate");
		        String adduser = (String) buyerInfo.get("adduser");
		        
		        buyer.setBuyernm(buyerName);
		        buyer.setBrno(brno);
		        buyer.setRprsv_nm(rprsv_nm);
		        buyer.setBusiness_status(business_status);
		        buyer.setEvent(event);
		        buyer.setReceiveuserid(receiveuserid);
		        buyer.setStatus(status);
		        buyer.setNationcd(nationcd);
		        buyer.setPostcode(postcode);
		        buyer.setAddress(address);
		        buyer.setAddress_detail(address_detail);
		        buyer.setTel(tel);
		        buyer.setEmail(email);
		        buyer.setRemark(remark);
		        buyer.setAdddate(adddate);
		        buyer.setAdduser(adduser);
		        
		        System.out.println("buyer.getAddress()"+buyer.getAddress());
		        
				//거래처 코드 지정을 위한 거래처 리스트 count
				int buyer_count = bs.buyerCount();
				System.out.println(buyer_count);
				String buyerCD;
				buyerCD = "BA"+String.format("%04d",buyer_count+1);
				buyer.setBuyercd(buyerCD);
		    	System.out.println(buyerCD);
		        
		        int Buyerresult = bs.buyerInsert(buyer);
		        System.out.println(Buyerresult);
		        
		    }  
		     result.put("result", true);
		    
		} catch (Exception e) { result.put("result", false); }
				 
		
		return result;
	}

	
	@RequestMapping(value = "buyerDelete", produces = "text/html;charset=utf-8")
	public String buyerDelete (Model model, @RequestParam("selectChk") String[] selectChk) {
		
		String[] selectDelete =selectChk;
		String[] delList= new String[selectDelete.length];
		
		System.out.println(selectDelete);
		
		if (selectDelete[0].equals("selectAll")) {
			for (int i = 1; i < selectDelete.length; i++) {
				System.out.println(selectDelete[i]);
				if (bs.delList(selectDelete[i]).equals("n")) {
					delList[i-1] = "y";
				} else if (bs.delList(selectDelete[i]).equals("y")) {
					delList[i-1] = "n";
				}
			}
		} else {
			for (int i = 0; i < selectDelete.length; i++) {
				if (bs.delList(selectDelete[i]).equals("n")) {
					System.out.println(selectDelete[i]);
					delList[i] = "y";
				} else if (bs.delList(selectDelete[i]).equals("y")) {
					delList[i] = "n";
				}
			}
		}
		
		int result=0;

		if (selectDelete[0].equals("selectAll")) {
			for (int i = 1; i < selectDelete.length; i++) {
				result=bs.deleteBuyer(delList[i-1], selectDelete[i]);
			}
		} else { 
			for (int i = 0; i < selectDelete.length; i++) {
				result=bs.deleteBuyer(delList[i], selectDelete[i]);
			}
		}
		
		System.out.println(result);
		model.addAttribute("result", result);
		
		return "/nolay/buyerManagement";
	}

}
