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
	public String buyerManagement(Model model, Buyer buyer, Employee employee, String buyerCd, String empCd, String status) {

		if(buyerCd != null && buyerCd != "") {
		//바이어 코드에 해당하는 바이어 이름
		Buyer buyer2 = bs.selectBuyerNm(buyerCd);
		System.out.println("buyer2.getBuyerNm()" + buyer2.getBuyerNm());
		String buyerNm2 = buyer2.getBuyerNm();
		model.addAttribute("buyerNm2", buyerNm2);
		}
		if(empCd != null && empCd != "") {
			//사원 코드에 해당하는 바이어 이름
			Employee emp = es.selectEmpNm(empCd);
			System.out.println("emp.getName()" + emp.getName());
			String empNm = emp.getName();
			model.addAttribute("empNm", empNm);
		}
		
		System.out.println("buyerCd"+buyerCd);
		buyer.setBuyerCd(buyerCd);
		buyer.setEmpCd(empCd);
		buyer.setStatus(status);
		
		//buyer정보 전체 리스트 불러오기
		List<Buyer> buyerAllList = bs.selectBuyerAllList(); 
		//System.out.println(buyerAllList);
		//buyer정보 전체 리스트 불러오기(검색용)
		List<Buyer> buyer_list = bs.selectBuyerList(buyer);
		
		//employee정보 전체 리스트 불러오기(검색용)
		List<Employee> employee_list = es.selectEmployeeList();
		
		System.out.println("buyer_list="+buyer_list);
		
		String empCd2 = empCd;
		

		model.addAttribute("buyerCd", buyerCd);
		model.addAttribute("empCd2", empCd2);
		model.addAttribute("status", status);
		
		model.addAttribute("buyerAllList", buyerAllList);
		model.addAttribute("buyer_list", buyer_list);
		model.addAttribute("employee_list", employee_list);
		
		return "/nolay/buyerManagement";
	}

	
	@RequestMapping(value = "updateConfirm", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String updateConfirm(Buyer buyer, Model model) {
		String msg = "";
		int result = 0;
		result = bs.buyerUpdate(buyer);
		System.out.println("수정 buyer=" + buyer);
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
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> info = new ArrayList<Map<String,Object>>();
		    info = JSONArray.fromObject(data);
		    System.out.println("info="+info);
		    for (Map<String, Object> buyerInfo : info) {
		    	System.out.println("buyerInfo.get(\"buyerNm\")" + buyerInfo.get("buyerNm"));
		    	String buyerName = (String) buyerInfo.get("buyerNm");
		        String brno = (String) buyerInfo.get("brno");
		        String rprsvNm = (String) buyerInfo.get("rprsvNm");
		        String businessStatus = (String) buyerInfo.get("businessStatus");
		        String event = (String) buyerInfo.get("event");
		        String empCd = (String) buyerInfo.get("empCd");
		        String status = (String) buyerInfo.get("status");
		        String nationCd = (String) buyerInfo.get("nationCd");
		        String postcode = (String) buyerInfo.get("postcode");
		        String address = (String) buyerInfo.get("address");
		        String addressDetail = (String) buyerInfo.get("addressDetail");
		        String tel = (String) buyerInfo.get("tel");
		        String email = (String) buyerInfo.get("email");
		        String remark = (String) buyerInfo.get("remark");
		        String addDate = (String) buyerInfo.get("addDate");
		        System.out.println(addDate);
		        String addUser = (String) buyerInfo.get("addUser");  
		        
		        buyer.setBuyerNm(buyerName);
		        buyer.setBrno(brno);
		        buyer.setRprsvNm(rprsvNm);
		        buyer.setBusinessStatus(businessStatus);
		        buyer.setEvent(event);
		        buyer.setEmpCd(empCd);
		        buyer.setStatus(status);
		        buyer.setNationCd(nationCd);
		        buyer.setPostcode(postcode);
		        buyer.setAddress(address);
		        buyer.setAddressDetail(addressDetail);
		        buyer.setTel(tel);
		        buyer.setEmail(email);
		        buyer.setRemark(remark);
		        System.out.println(buyer.getRemark());
		        buyer.setAddDate(addDate);
		        buyer.setAddUser(addUser);
		        
		        System.out.println("buyer.getAddress()"+buyer.getAddress());
		        
				//거래처 코드 지정을 위한 거래처 리스트 count
				int buyer_count = bs.buyerCount();
				System.out.println("buyer_count"+buyer_count);
				String buyerCd;
				buyerCd = "B"+String.format("%05d",buyer_count+1);
				buyer.setBuyerCd(buyerCd);
		    	System.out.println(buyerCd);
		        
		        int Buyerresult = bs.buyerInsert(buyer);
		        System.out.println("buyerResult"+Buyerresult);
		        
		    }  
		     result.put("result", true);
		    
		} catch (Exception e) { result.put("result", false); }
				 
		
		return result;
	}

	
	@RequestMapping(value = "buyerDelete", produces = "text/html;charset=utf-8")
	public String buyerDelete(Model model, @RequestParam("selectChk") String[] selectChk) {
		
		System.out.println("selectChk:" + selectChk);
		String[] selectDelete = selectChk;
		String[] delList= new String[selectDelete.length];
		
		System.out.println("selectDelete : "+selectDelete);
		
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
					System.out.println("selectDelete[i]:"+selectDelete[i]);
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
		
		System.out.println("result:"+result);
		model.addAttribute("result", result);
		
		return "/nolay/buyerManagement";
	}
	
	@RequestMapping("buyerListUpdate")
	public String productUpdate(Buyer buyer, Model model, String buyerCd, String type, String value) {
			
			System.out.println(buyerCd);
			System.out.println(type);
			System.out.println(value);
			
			if (type.equals("buyerNm")) {
				System.out.println("buyerNm");
				buyer.setBuyerNm(value);
			} else if (type.equals("brno")) {
				buyer.setBrno(value);
			} else if (type.equals("rprsvNm")) {
				buyer.setRprsvNm(value);
			} else if (type.equals("businessStatus")) {
				buyer.setBusinessStatus(value);
			} else if (type.equals("event")) {
				buyer.setEvent(value);
			} else if (type.equals("name")) {
				buyer.setName(value);
			} else if (type.equals("status")) {
				buyer.setStatus(value);
			} else if (type.equals("nationCd")) {
				buyer.setNationCd(value);
			} else if (type.equals("addressDetail")) {
				buyer.setAddressDetail(value);
			} else if (type.equals("tel")) {
				buyer.setTel(value);
			} else if (type.equals("email")) {
				buyer.setEmail(value);
			} else if (type.equals("remark")) {
				buyer.setRemark(value);
			}
			
			buyer.setBuyerCd(buyerCd);
			
			System.out.println(buyer);
			
			String result = String.valueOf(bs.buyerListUpdate(buyer));
			System.out.println(result);
			
			return "/nolay/buyerManagement";
		}
	
	
	@RequestMapping(value = "brnoDupCheck", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String brnoDupCheck(String brno) {
		System.out.println("brno="+brno);
		String msg="";
		Buyer buyer = bs.brnoDupCheck(brno);
		System.out.println("buyer="+buyer);
		if(buyer != null) {
			msg="y";
		}else {
			msg="n";
		}
		System.out.println("msg="+msg);
		return msg;
	}
	
}
