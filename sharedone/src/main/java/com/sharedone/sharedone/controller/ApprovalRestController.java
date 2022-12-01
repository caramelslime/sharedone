package com.sharedone.sharedone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sharedone.sharedone.model.Notice;
import com.sharedone.sharedone.service.BuyerService;
import com.sharedone.sharedone.service.NoticeService;
import com.sharedone.sharedone.service.OrderService;

@RestController
public class ApprovalRestController {
	
	@Autowired
	private NoticeService ns;
	
	@RequestMapping("/requestComment")
	@ResponseBody
	public Notice requestComment(String soNo) {
		Notice notice = ns.selectLastRequest(soNo);
		System.out.println(notice.getContent());
		return notice;
	}
}
