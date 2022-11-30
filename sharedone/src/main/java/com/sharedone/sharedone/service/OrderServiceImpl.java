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
}
