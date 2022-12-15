package com.sharedone.sharedone.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedone.sharedone.dao.OrderDao;
import com.sharedone.sharedone.model.Notice;
import com.sharedone.sharedone.model.Order;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao od;

	@Override
	public List<Order> orderList(Order order) {
		return od.orderList(order);
	}

	@Override
	public Order selectOrderHeader(String soNo) {
		return od.selectOrderHeader(soNo);
	}

	@Override
	public List<Order> selectOrderItems(String soNo) {
		return od.selectOrderItems(soNo);
	}

	@Override
	public Order selectByProductCD(String productCD) {
		return od.selectByProductCD(productCD);
	}

	@Override
	public int addOrderDetail(String soNo, String productCD, int qty, int unitPrice) {
		return od.addOrderDetail(soNo, productCD, qty, unitPrice);
	}

	@Override
	public int removeOrderDetail(String soNo, String productCD) {
		return od.removeOrderDetail(soNo, productCD);
	}

	@Override
	public int addOrder(String soNo, String buyerCD, String soUser, Date requestDate, String currency, String pricingDate) {
		return od.addOrder(soNo, buyerCD, soUser, requestDate, currency, pricingDate);
	}

	@Override
	public int totalOrder() {
		return od.totalOrder();
	}

	@Override
	public int approvalUpdate(String soNo, String status) {
		return od.approvalUpdate(soNo, status);
	}
	
	@Override
	public List<Order> pendingApprovalList(Order order) {
		// TODO Auto-generated method stub
		return od.pendingApprovalList(order);
	}

	@Override
	public int updateApproveOrRefer(Notice notice) {
		// TODO Auto-generated method stub
		return od.updateApproveOrRefer(notice);
	}

	@Override
	public int checkValidPrice(String productCD, String buyerCD, String currency, Date pricingDate) {
		return od.checkValidPrice(productCD, buyerCD, currency, pricingDate);
	}

	@Override
	public int validPrice(String productCD, String buyerCD, String currency, Date pricingDate) {
		return od.validPrice(productCD, buyerCD, currency, pricingDate);
	}

	@Override
	public int defaultPrice(String productCD, String currency) {
		return od.defaultPrice(productCD, currency);
	}

	@Override
	public int detailProductUpdate(String soNo, String productCD, int qty, int unitPrice) {
		return od.detailProductUpdate(soNo, productCD, qty, unitPrice);
	}

	@Override
	public int detailProductDelete(String soNo) {
		return od.detailProductDelete(soNo);
	}

	@Override
	public List<Order> orderAllList(Order order) {
		return od.orderAllList(order);
	}

	@Override
	public int totalPrice(String soNo) {
		// TODO Auto-generated method stub
		return od.totalPrice(soNo);
	}

	@Override
	public int terminate(String soNo, String status) {
		return od.terminate(soNo, status);
	}
}
