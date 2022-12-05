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
import com.sharedone.sharedone.service.OrderService;

import net.sf.json.JSONArray;

@RestController
public class OrderRestController {

	@Autowired
	private OrderService os;

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
		System.out.println(orderItems);
		return orderItems;
	}

	@RequestMapping("/selectByProductCD")
	@ResponseBody
	public Order selectByProductCD(String productCD) {
		Order product = os.selectByProductCD(productCD);
		System.out.println(product);
		return product;
	}

	@RequestMapping("/addOrderDetail")
	@ResponseBody
	public int addOrderDetail(String soNo, String productCD, int qty, int unitPrice) {
		int result = os.addOrderDetail(soNo, productCD, qty, unitPrice);
		System.out.println(result);
		return result;
	}

	@RequestMapping("/removeOrderDetail")
	@ResponseBody
	public int removeOrderDetail(String soNo, String productCD) {
		int result = os.removeOrderDetail(soNo, productCD);
		System.out.println(result);
		return result;
	}

	@RequestMapping("/orderInsert")
	@ResponseBody
	public String orderInsert(String buyerCD, String soUser, Date requestDate, String currency) {

		int totalOrder = os.totalOrder();

		System.out.println("totalOrder : " + totalOrder);

		String soNo = "";
		soNo = "S" + String.format("%05d", totalOrder + 1);

		int result = os.addOrder(soNo, buyerCD, soUser, requestDate, currency);
		System.out.println("result : " + result);
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
				System.out.println(orderInfo.get("soNo"));
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
			System.out.println(e.getMessage());
			result.put("result", false);
		}

		return result;
	}

	
	/*
	 * @RequestMapping("requestApproval") public int requestApproval(Order order,
	 * Model model, String soNo, String content, String status) {
	 * 
	 * String previousStatus = status; status = "승인대기";
	 * 
	 * int approvalUpdateResult = os.approvalUpdate(soNo, status); int result=0; if
	 * (approvalUpdateResult > 0) { result = ns.addComment(soNo, content); if
	 * (result == 0) { status = previousStatus; os.approvalUpdate(soNo, status); } }
	 * else if (approvalUpdateResult == 0) { result = -1; }
	 * 
	 * return result;
	 * 
	 * }
	 */
	

}
