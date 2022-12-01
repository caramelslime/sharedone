package com.sharedone.sharedone.dao;

import java.util.List;

import com.sharedone.sharedone.model.Order;

public interface OrderDao {

	List<Order> orderList(Order order);

}
