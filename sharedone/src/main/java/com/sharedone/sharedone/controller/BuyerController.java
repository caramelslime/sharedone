package com.sharedone.sharedone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.service.BuyerService;

@Controller
public class BuyerController {
	@Autowired
	private BuyerService bs;
	
	@RequestMapping
	public String buyerManagement(Model model, Buyer buyer) {
		//buyer정보 전체 리스트 불러오기
		List<Buyer> buyer_list = bs.selectBuyerList();
		
		model.addAttribute("buyer_list", buyer_list);
		return "/buyerManagement";
	}
}
