package com.sharedone.sharedone.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Notice;
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

	@Override
	public int updateApproveOrRefer(Notice notice) {
		// TODO Auto-generated method stub
		return sst.update("orderns.updateApproveOrRefer",notice);
	}
	public int addOrderDetail(String soNo, String productCD, int qty, int unitPrice) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("productCD", productCD);
		map.put("qty", qty);
		map.put("unitPrice", unitPrice);
		return sst.insert("orderns.addOrderDetail", map);
	}

	@Override
	public int removeOrderDetail(String soNo, String productCD) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("productCD", productCD);
		return sst.delete("orderns.removeOrderDetail", map);
	}

	@Override
	public int addOrder(String soNo, String buyerCD, String soUser, Date requestDate, String currency) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("buyerCD", buyerCD);
		map.put("soUser", soUser);
		map.put("requestDate", requestDate);
		map.put("currency", currency);
		return sst.insert("orderns.addOrder", map);
	}

	@Override
	public int totalOrder() {
		return sst.selectOne("orderns.totalOrder");
	}

	@Override
	public int approvalUpdate(String soNo, String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("status", status);
		return sst.update("orderns.approvalUpdate", map);
	}
}
