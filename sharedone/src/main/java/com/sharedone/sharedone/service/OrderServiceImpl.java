package com.sharedone.sharedone.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedone.sharedone.dao.OrderDao;
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
	public int addOrder(String soNo, String buyerCD, String soUser, Date requestDate, String currency) {
		return od.addOrder(soNo, buyerCD, soUser, requestDate, currency);
	}

	@Override
	public int totalOrder() {
		return od.totalOrder();
	}

	@Override
	public int approvalUpdate(String soNo, String status) {
		return od.approvalUpdate(soNo, status);
	}
}
