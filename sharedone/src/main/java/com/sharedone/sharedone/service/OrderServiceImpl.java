package com.sharedone.sharedone.service;

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
}
