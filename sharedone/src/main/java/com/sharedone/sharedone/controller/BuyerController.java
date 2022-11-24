package com.sharedone.sharedone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.service.BuyerService;

@Controller
public class BuyerController {
	@Autowired
	private BuyerService bs;
	
	@RequestMapping("buyerManagement")
	public String buyerManagement(Model model, Buyer buyer) {
		//buyer정보 전체 리스트 불러오기
		List<Buyer> buyer_list = bs.selectBuyerList();
		
		model.addAttribute("buyer_list", buyer_list);
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
