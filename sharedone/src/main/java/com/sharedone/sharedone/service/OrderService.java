package com.sharedone.sharedone.service;

import java.sql.Date;
import java.util.List;

import com.sharedone.sharedone.model.Notice;
import com.sharedone.sharedone.model.Order;

public interface OrderService {

	List<Order> orderList(Order order);

	Order selectOrderHeader(String soNo);

	List<Order> selectOrderItems(String soNo);

	Order selectByProductCD(String productCD);

	int addOrderDetail(String soNo, String productCD, int qty, int unitPrice);

	int removeOrderDetail(String soNo, String productCD);

	int addOrder(String soNo, String buyerCD, String soUser, Date requestDate, String currency, String pricingDate);

	int totalOrder();

	int approvalUpdate(String soNo, String status);
	
//	khs 같은 팀의 승인 요청 리스트 불러오기
	List<Order> pendingApprovalList(Order order);

//	khs 승인/반려시 상태 업데이트
	int updateApproveOrRefer(Notice notice);

	int checkValidPrice(String productCD, String buyerCD, String currency, Date pricingDate);

	int validPrice(String productCD, String buyerCD, String currency, Date pricingDate);

	int defaultPrice(String productCD, String currency);

	int detailProductUpdate(String soNo, String productCD, int qty, int unitPrice);

	int detailProductDelete(String soNo);

	List<Order> orderAllList(Order order);

	int totalPrice(String soNo);

	int terminate(String soNo, String status);

}
