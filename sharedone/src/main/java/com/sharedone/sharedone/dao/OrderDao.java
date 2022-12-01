package com.sharedone.sharedone.dao;

import java.util.List;

import com.sharedone.sharedone.model.Order;

public interface OrderDao {

	List<Order> orderList(Order order);

	Order selectOrderHeader(String soNo);

	List<Order> selectOrderItems(String soNo);

	Order selectByProductCD(String productCD);

	List<Order> pendingApprovalList(Order order);

}
