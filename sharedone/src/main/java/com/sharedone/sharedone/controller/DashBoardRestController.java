package com.sharedone.sharedone.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sharedone.sharedone.model.Report;
import com.sharedone.sharedone.service.ReportService;

@RestController
public class DashBoardRestController {
	
	@Autowired
	private ReportService rs;
	
	@RequestMapping("/dashBoard")
	@ResponseBody
	public List<Report> dashBoard(Report report, String year, String month, String buyercd, String dept, String empcd, String orderStatus) {
		System.out.println("year="+ year);
		System.out.println("month="+ month);
		System.out.println("year+month=" + year + month);
		System.out.println("buyercd="+ buyercd);
		System.out.println("dept="+ dept);
		System.out.println("empcd="+ empcd);
		System.out.println("orderStatus="+ orderStatus);
		
		
		report.setAddDate(year + month);
		report.setBuyerCd(buyercd);
		report.setDept(dept);
		report.setEmpCd(empcd);
		report.setOrderStatus(orderStatus);
		
		
		
		List<Report> reportList = rs.selectReport(report);
		System.out.println(reportList);
		
		
		return reportList;
	}
}
