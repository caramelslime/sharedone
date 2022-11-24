package com.sharedone.sharedone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedone.sharedone.model.Buyer;

@Controller
public class DashboardController {
	@RequestMapping("orderReport")
	public String orderReport(Model model, Buyer buyer) {
		return "/nolay/orderReport";
	}
}
