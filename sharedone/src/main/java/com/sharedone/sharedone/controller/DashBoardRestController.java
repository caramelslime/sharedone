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
	public List<Report> dashBoard(Report report, String year, String month, String empCd, String buyerCd, String dept) {
		System.out.println("year="+ year);
		System.out.println("month="+ month);
		System.out.println("year+month=" + year + month);
		System.out.println("empCd="+ empCd);
		System.out.println("buyerCd="+ buyerCd);
		System.out.println("dept="+ dept);
		//System.out.println("orderStatus="+ orderStatus);
		
		report.setAddDate(year + month);
		report.setEmpCd(empCd);
		report.setBuyerCd(buyerCd);
		report.setDept(dept);
		//report.setOrderStatus(orderStatus);
		
		List<Report> reportList = rs.selectReport(report);
		System.out.println(reportList);
		
		
		return reportList;
	}
	
	//이번달 매출 누적 합계
	@RequestMapping("/monthAmount")
	@ResponseBody
	public List<Report> monthAmount() {
		
		List<Report> reportList = rs.selectAllAmount();
		System.out.println(reportList);
		
		
		return reportList;
	}
	
	//팀별 누적 매출 합계
	@RequestMapping("/groupAmount")
	@ResponseBody
	public List<Report> groupAmount() {
		
		List<Report> reportList = rs.selectGroupAmount();
		System.out.println(reportList);
		
		
		return reportList;
	}
	
	//승인여부 그래프
	@RequestMapping("/statusAmount") 
	@ResponseBody
	public List<Report> statusAmount() {
		
		List<Report> reportList = rs.selectStatusAmount();
		System.out.println(reportList);
		
		
		return reportList;
	}
	
}
