package com.sharedone.sharedone.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	public Buyer updateForm(String buyerCd) throws ParseException {
		Buyer buyer = bs.selectBuyer(buyerCd);
		System.out.println("buyer.getAddDate() =" + buyer.getAddDate());
		
		// 문자열
        String addDate = buyer.getAddDate();
        // 포맷터
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        // 문자열 -> Date
        Date date = formatter.parse(addDate);
        
        //Date->String
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String str = format.format(date);
        
        System.out.println(str);
		buyer.setAddDate(str);
        
		return buyer;
	}
}
