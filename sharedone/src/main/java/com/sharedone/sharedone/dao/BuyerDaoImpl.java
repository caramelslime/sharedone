package com.sharedone.sharedone.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Buyer;

@Repository
public class BuyerDaoImpl implements BuyerDao {
	@Autowired
	private SqlSessionTemplate sst;

	//buyer정보 전체 리스트 불러오기
	public List<Buyer> selectBuyerList() {
		return sst.selectList("buyerns.selectBuyerList");
	}

	//buyer정보 insert
	public int buyerInsert(Buyer buyer) {
		return sst.insert("buyerns.buyerInsert", buyer);
	}

	//buyer정보 하나 불러오기
	public Buyer selectBuyer(String buyercd) {
		return sst.selectOne("buyerns.selectBuyer", buyercd);
	}

	//buyer정보 수정
	public int buyerUpdate(Buyer buyer) {
		return sst.update("buyerns.buyerUpdate", buyer);
	}
}
