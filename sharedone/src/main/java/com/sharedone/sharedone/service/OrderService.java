package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Notice;
import com.sharedone.sharedone.model.Order;

public interface OrderService {

	List<Order> orderList(Order order);

	Order selectOrderHeader(String soNo);

	List<Order> selectOrderItems(String soNo);

	Order selectByProductCD(String productCD);

//	khs 같은 팀의 승인 요청 리스트 불러오기
	List<Order> pendingApprovalList(Order order);

//	khs 승인/반려시 상태 업데이트
	int updateApproveOrRefer(Notice notice);

}
