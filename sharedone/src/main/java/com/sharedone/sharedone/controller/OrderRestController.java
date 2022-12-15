package com.sharedone.sharedone.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sharedone.sharedone.model.Buyer;
import com.sharedone.sharedone.model.Order;
import com.sharedone.sharedone.model.Product;
import com.sharedone.sharedone.service.BuyerService;
import com.sharedone.sharedone.service.NoticeService;
import com.sharedone.sharedone.service.OrderService;

import net.sf.json.JSONArray;

@RestController
public class OrderRestController {

	@Autowired
	private OrderService os;
	
	@Autowired
	private NoticeService ns;

	@RequestMapping("/orderHeader")
	@ResponseBody
	public Order orderHeader(String soNo) {
		Order orderHeader = os.selectOrderHeader(soNo);
		return orderHeader;
	}

	@RequestMapping("/orderItems")
	@ResponseBody
	public List<Order> orderItems(String soNo) {
		List<Order> orderItems = os.selectOrderItems(soNo);
		return orderItems;
	}

	@RequestMapping("/selectByProductCD")
	@ResponseBody
	public Order selectByProductCD(String productCD) {
		Order product = os.selectByProductCD(productCD);
		return product;
	}

	@RequestMapping("/addOrderDetail")
	@ResponseBody
	public int addOrderDetail(String soNo, String productCD, int qty, int unitPrice) {
		int result = os.addOrderDetail(soNo, productCD, qty, unitPrice);
		return result;
	}

	@RequestMapping("/removeOrderDetail")
	@ResponseBody
	public int removeOrderDetail(String soNo, String productCD) {
		int result = os.removeOrderDetail(soNo, productCD);
		return result;
	}

	@RequestMapping("/orderInsert")
	@ResponseBody
	public String orderInsert(String buyerCD, String soUser, Date requestDate, String currency, String pricingDate) {

		int totalOrder = os.totalOrder();


		String soNo = "";
		soNo = "S" + String.format("%05d", totalOrder + 1);

		int result = os.addOrder(soNo, buyerCD, soUser, requestDate, currency, pricingDate);
		return soNo;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(path = "orderDetailInsert")
	@ResponseBody
	public Map<String, Object> orderDetailInsert(@RequestParam String data, Model model, Order order) {

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> info = new ArrayList<Map<String, Object>>();
			info = JSONArray.fromObject(data);

			for (Map<String, Object> orderInfo : info) {
				String soNo = (String) orderInfo.get("soNo");
				String productCD = (String) orderInfo.get("productCD");
				String strQty = (String) orderInfo.get("qty");
				String strUnitPrice = (String) orderInfo.get("unitPrice");

				int qty = Integer.parseInt(strQty);
				int unitPrice = Integer.parseInt(strUnitPrice);

				os.addOrderDetail(soNo, productCD, qty, unitPrice);

			}
			result.put("result", true);

		} catch (Exception e) {
			System.out.println("inputerror");
			System.out.println(e.getMessage());
			result.put("result", false);
		}

		return result;
	}

	

	@RequestMapping("requestApproval")
	public int requestApproval(String soNo, String content, String status, String empCd) {
	
	String previousStatus = status;
	status = "승인대기";
	
	
	int noticeCd = ns.getMax();
	
	int approvalUpdateResult = os.approvalUpdate(soNo, status);
	int result=0;
	if (approvalUpdateResult > 0) {
		
		result = ns.addComment(soNo, content, noticeCd, empCd);
		if 	(result == 0) {
			status = previousStatus;
			os.approvalUpdate(soNo, status);
		}
	} else if (approvalUpdateResult == 0) {
		result = -1;
	}
	
	return result;
	
	}
	
	@RequestMapping("terminate")
	public int terminate(String soNo, String content, String status, String empCd) {
		
		String previousStatus = status;
		status = "종결";
		
		int noticeCd = ns.getMax();
		int terminateResult = os.terminate(soNo, status);
		int result = 0;
		
		if (terminateResult > 0) {
			
			result = ns.addComment(soNo, content, noticeCd, empCd);
			if 	(result == 0) {
				status = previousStatus;
				os.approvalUpdate(soNo, status);
			}
		} else if (terminateResult == 0) {
			result = -1;
		}
		
		return result;
	}
	
	
	
	
	@RequestMapping("checkComment")
	public int checkComment(Model model, String soNo, String empCd) {
		int count = 0;
		count = ns.checkComment(soNo, empCd);
		return count;
	}
	
	
	@RequestMapping(value = "loadComment", produces = "text/html;charset=utf-8")
	public String loadComment(Model model, String soNo, String empCd, String content) {
		content ="";
		content = ns.loadComment(soNo, empCd);
		return content;
	}
	
	
	@RequestMapping("checkReturnComment")
	public int checkReturnComment(Model model, String soNo, String empCd) {
		int count = 0;
		count = ns.checkReturnComment(soNo, empCd);
		return count;
	}
	
	@RequestMapping("/checkValidPrice")
	@ResponseBody
	public int checkValidPrice(String productCD, String buyerCD, String currency, Date pricingDate) {
		System.out.println("컨트롤러(pricingDate): "+pricingDate);
		int count = os.checkValidPrice(productCD, buyerCD, currency, pricingDate);
		System.out.println("count(컨트롤러): "+count);
		return count;
	}
	
	@RequestMapping(value = "loadReturnComment", produces = "text/html;charset=utf-8")
	public String loadReturnComment(Model model, String soNo, String empCd, String content) {
		content ="";
		content = ns.loadReturnComment(soNo, empCd);
		return content;
	}
	
	@RequestMapping("/validPrice")
	@ResponseBody
	public int validPrice(String productCD, String buyerCD, String currency, Date pricingDate) {
		int price = os.validPrice(productCD, buyerCD, currency, pricingDate);
		return price;
	}
	
	@RequestMapping("/defaultPrice")
	@ResponseBody
	public int defaultPrice(String productCD, String currency) {
		int price = os.defaultPrice(productCD, currency);
		return price;
	}
	
	
	
	
	
	@RequestMapping("detailProductDelete")
	public String detailProductDelete(String soNo) {
		
		int result = os.detailProductDelete(soNo);
		
		
		return "/nolay/order";
	}
	
	@RequestMapping("detailProductUpdate")
	public String detailProductUpdate(Order order, Model model, String soNo, String productCD, int qty, int unitPrice) {
		
		int result = os.detailProductUpdate(soNo, productCD, qty, unitPrice);
		
		
		return "/nolay/order";
	}
	
	
	
	
	
	
}
