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
	
//	@RequestMapping("/dashBoard")
//	@ResponseBody
//	public List<Report> dashBoard(Report report, String year, String month, String empCd, String buyerCd, String dept) {
//		System.out.println("year="+ year);
//		System.out.println("month="+ month);
//		System.out.println("year+month=" + year + month);
//		System.out.println("empCd="+ empCd);
//		System.out.println("buyerCd="+ buyerCd);
//		System.out.println("dept="+ dept);
//		//System.out.println("orderStatus="+ orderStatus);
//		
//		report.setAddDate(year + month);
//		report.setEmpCd(empCd);
//		report.setBuyerCd(buyerCd);
//		report.setDept(dept);
//		//report.setOrderStatus(orderStatus);
//		
//		List<Report> reportList = rs.selectReport(report);
//		System.out.println(reportList);
//		
//		
//		return reportList;
//	}
	
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
	
	
	//달별 매출 누적 합계
	@RequestMapping("/monthAllAmount")
	@ResponseBody
	public List<Report> monthAllAmount(Report report, String year, String month, String productCD, String buyerCd, String empCd2, String dept) {
		
		report.setYear(year);
		report.setMonth(month);
		report.setProductCD(productCD);
		report.setBuyerCd(buyerCd);
		report.setEmpCd(empCd2);
		report.setDept(dept);
		
		List<Report> reportAmountList = rs.selectReportAmountList(report);
		System.out.println(reportAmountList);
		
		
		return reportAmountList;
	}
	
	//팀별 매출
	@RequestMapping("/groupAllAmount")
	@ResponseBody
	public List<Report> groupAllAmount(Report report, String year, String month, String productCD, String buyerCd, String empCd2) {
		
		report.setYear(year);
		report.setMonth(month);
		report.setProductCD(productCD);
		report.setBuyerCd(buyerCd);
		report.setEmpCd(empCd2);
		
		List<Report> groupAllAmount = rs.selectgroupAllAmount(report);
		System.out.println(groupAllAmount);
		
		
		return groupAllAmount;
	}
	
	//승인여부 그래프
	@RequestMapping("/statusAllAmount")
	@ResponseBody
	public List<Report> statusAllAmount(Report report, String year, String month, String productCD, String buyerCd, String empCd2, String dept, String status) {
		
		report.setYear(year);
		report.setMonth(month);
		report.setProductCD(productCD);
		report.setBuyerCd(buyerCd);
		report.setEmpCd(empCd2);
		report.setDept(dept);
		report.setStatus(status);
		
		List<Report> statusAllAmount = rs.selectStatusAllAmount(report);
		System.out.println(statusAllAmount);
		
		
		return statusAllAmount;
	}
}
