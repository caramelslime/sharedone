package com.sharedone.sharedone.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Notice;
import com.sharedone.sharedone.model.Order;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Order> orderList(Order order) {
		
		System.out.println("order(OrderDaoImpl) : "+order);
		System.out.println("pricingDateRange(OrderDaoImpl) : "+order.getPricingDateRange());
		System.out.println("addDateRange(OrderDaoImpl) : "+order.getAddDateRange());
		System.out.println("requestDateRange(OrderDaoImpl) : "+order.getRequestDateRange());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", order.getSoNo());
		map.put("soUser", order.getSoUser());
		map.put("sortBy", order.getSortBy());
		map.put("sortAs", order.getSortAs());
		
		String pricingDateRange = order.getPricingDateRange();
		System.out.println(pricingDateRange);
		
		
		if (pricingDateRange == null || "".equals(pricingDateRange) || pricingDateRange.length() == 0) {
			
		} else {
			String[] splitPricingDate = order.getPricingDateRange().split("~");
			String pricingDateStart = splitPricingDate[0].trim();
			String pricingDateEnd = splitPricingDate[1].trim();
			map.put("pricingDateStart", pricingDateStart);
			map.put("pricingDateEnd", pricingDateEnd);
		}
		
		
		map.put("status", order.getStatus());
		map.put("buyerCD", order.getBuyerCD());
		
		if (order.getAddDateRange() != null && order.getAddDateRange()!="") {
			String[] splitAddDate = order.getAddDateRange().split("~");
			String addDateStart = splitAddDate[0].trim();
			String addDateEnd = splitAddDate[1].trim();
			map.put("addDateStart", addDateStart);
			map.put("addDateEnd", addDateEnd);
		}
		
		
		if (order.getRequestDateRange() != null && order.getRequestDateRange()!="") {
			String[] splitRequestDate = order.getRequestDateRange().split("~");
			String requestDateStart = splitRequestDate[0].trim();
			String requestDateEnd = splitRequestDate[1].trim();
			map.put("requestDateStart", requestDateStart);
			map.put("requestDateEnd", requestDateEnd);
		}
		
		
		return sst.selectList("orderns.orderList", map);
	}

	@Override
	public Order selectOrderHeader(String soNo) {
		return sst.selectOne("orderns.selectOrderHeader", soNo);
	}

	@Override
	public List<Order> selectOrderItems(String soNo) {
		return sst.selectList("orderns.selectOrderItems", soNo);
	}

	@Override
	public Order selectByProductCD(String productCD) {
		return sst.selectOne("orderns.selectByProductCD", productCD);
	}

	@Override
	public int addOrderDetail(String soNo, String productCD, int qty, int unitPrice) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("productCD", productCD);
		map.put("qty", qty);
		map.put("unitPrice", unitPrice);
		return sst.insert("orderns.addOrderDetail", map);
	}

	@Override
	public int removeOrderDetail(String soNo, String productCD) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("productCD", productCD);
		return sst.delete("orderns.removeOrderDetail", map);
	}

	@Override
	public int addOrder(String soNo, String buyerCD, String soUser, Date requestDate, String currency, String pricingDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("buyerCD", buyerCD);
		map.put("soUser", soUser);
		map.put("requestDate", requestDate);
		map.put("currency", currency);
		map.put("pricingDate", pricingDate);
		return sst.insert("orderns.addOrder", map);
	}

	@Override
	public int totalOrder() {
		return sst.selectOne("orderns.totalOrder");
	}

	@Override
	public int approvalUpdate(String soNo, String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("status", status);
		return sst.update("orderns.approvalUpdate", map);
	}
	
	public List<Order> pendingApprovalList(Order order) {
		return sst.selectList("orderns.pendingApprovalList",order);
	}

	@Override
	public int updateApproveOrRefer(Notice notice) {
		return sst.update("orderns.updateApproveOrRefer",notice);
	}

	@Override
	public int checkValidPrice(String productCD, String buyerCD, String currency, Date pricingDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productCD", productCD);
		map.put("buyerCD", buyerCD);
		map.put("currency", currency);
		map.put("pricingDate", pricingDate);
		System.out.println("dao(map): "+map);
		return sst.selectOne("orderns.checkValidPrice", map);
	}

	@Override
	public int validPrice(String productCD, String buyerCD, String currency, Date pricingDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productCD", productCD);
		map.put("buyerCD", buyerCD);
		map.put("currency", currency);
		map.put("pricingDate", pricingDate);
		return sst.selectOne("orderns.validPrice", map);
	}

	@Override
	public int defaultPrice(String productCD, String currency) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productCD", productCD);
		map.put("currency", currency);
		System.out.println(currency);
		return sst.selectOne("orderns.defaultPrice", map);
	}

	@Override
	public int detailProductUpdate(String soNo, String productCD, int qty, int unitPrice) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("productCD", productCD);
		map.put("qty", qty);
		map.put("unitPrice", unitPrice);
		return sst.update("orderns.detailProductUpdate", map);
	}

	@Override
	public int detailProductDelete(String soNo) {
		return sst.delete("orderns.detailProductDelete", soNo);
	}

	@Override
	public List<Order> orderAllList(Order order) {
		return sst.selectList("orderns.orderAllList", order);
	}

	@Override
	public int totalPrice(String soNo) {
		return sst.selectOne("orderns.totalPrice", soNo);
	}

	@Override
	public int terminate(String soNo, String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("status", status);
		return sst.update("orderns.terminate", map);
	}
}
