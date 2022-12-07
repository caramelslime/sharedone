package com.sharedone.sharedone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.service.BuyerService;

@RestController
public class BuyerRestController {
	
	@Autowired
	private BuyerService bs;
	@RequestMapping("/updateForm")
	@ResponseBody
	public Buyer updateForm(String buyercd) {
		Buyer buyer = bs.selectBuyer(buyercd);
		return buyer;
	}
}
