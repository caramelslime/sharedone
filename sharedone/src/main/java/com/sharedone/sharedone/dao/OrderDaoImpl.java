package com.sharedone.sharedone.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Order;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Order> orderList(Order order) {
		return sst.selectList("orderns.orderList", order);
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
	public List<Order> pendingApprovalList(Order order) {
		return sst.selectList("orderns.pendingApprovalList",order);
	}
}
