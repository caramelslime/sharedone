package com.sharedone.sharedone.dao;

import java.sql.Date;
import java.util.List;

import com.sharedone.sharedone.model.Order;

public interface OrderDao {

	List<Order> orderList(Order order);

	Order selectOrderHeader(String soNo);

	List<Order> selectOrderItems(String soNo);

	Order selectByProductCD(String productCD);

	int addOrderDetail(String soNo, String productCD, int qty, int unitPrice);

	int removeOrderDetail(String soNo, String productCD);

	int addOrder(String soNo, String buyerCD, String soUser, Date requestDate, String currency);

	int totalOrder();

}
