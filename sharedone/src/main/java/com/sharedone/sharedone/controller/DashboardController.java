package com.sharedone.sharedone.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.model.Employee;
import com.sharedone.sharedone.model.Product;
import com.sharedone.sharedone.model.Report;
import com.sharedone.sharedone.service.BuyerService;
import com.sharedone.sharedone.service.EmployeeService;
import com.sharedone.sharedone.service.ProductService;
import com.sharedone.sharedone.service.ReportService;

@Controller
public class DashboardController {
	
	@Autowired
	private BuyerService bs;
	
	@Autowired
	private EmployeeService es;
	
	@Autowired
	private ProductService ps;
	
	@Autowired
	private ReportService rs;
	
	
	@RequestMapping("orderReport")
	public String orderReport(Model model, Buyer buyer, Report report, String year, String month, String productCD, String empCd2, String dept, String buyerCd, String status) {
		
		//buyer정보 전체 리스트 불러오기
		List<Buyer> buyerAllList = bs.selectBuyerAllList();
		
		//employee정보 전체 리스트 불러오기(검색용)
		List<Employee> employee_list = es.selectEmployeeList();
		
		//product 전체 리스트 불러오기
		List<Product> productAllList = ps.productAllList();
		System.out.println(productAllList);
		
		//리스트 전체 테이블 불러오기
		report.setYear(year);
		report.setMonth(month);
		report.setProductCD(productCD);
		report.setEmpCd(empCd2);
		report.setBuyerCd(buyerCd);
		report.setDept(dept);
		report.setStatus(status);
		List<Report> reportList = rs.reportList(report);
		System.out.println(reportList);
		
		int cumSales = 0;
		for(Report rl : reportList) {
			int amount = rl.getAmount();
			cumSales += amount;
			rl.setCumSales(cumSales);
		}
		
		if(productCD != null && productCD != "") {
			//바이어 코드에 해당하는 바이어 이름
			Product product = ps.productDetail(productCD);
			System.out.println("product.getProductNM()" + product.getProductNM());
			String productNM2 = product.getProductNM();
			model.addAttribute("productNM2", productNM2);
			}
		if(buyerCd != null && buyerCd != "") {
			//바이어 코드에 해당하는 바이어 이름
			Buyer buyer2 = bs.selectBuyerNm(buyerCd);
			System.out.println("buyer2.getBuyerNm()" + buyer2.getBuyerNm());
			String buyerNm2 = buyer2.getBuyerNm();
			model.addAttribute("buyerNm2", buyerNm2);
			}
		if(empCd2 != null && empCd2 != "") {
			//사원 코드에 해당하는 바이어 이름
			Employee emp = es.selectEmpNm(empCd2);
			System.out.println("emp.getName()" + emp.getName());
			String empNm2 = emp.getName();
			model.addAttribute("empNm2", empNm2);
			}
		System.out.println(month);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("productCD", productCD);
		model.addAttribute("empCd2", empCd2);
		model.addAttribute("buyerCd", buyerCd);
		model.addAttribute("dept", dept);
		model.addAttribute("status", status);
		model.addAttribute("reportList", reportList);
		model.addAttribute("productAllList", productAllList);
		model.addAttribute("buyerAllList", buyerAllList);
		model.addAttribute("employee_list", employee_list);
		return "/nolay/orderReport";
	}
	

}
