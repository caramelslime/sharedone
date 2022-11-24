package com.sharedone.sharedone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedone.sharedone.dao.BuyerDao;
import com.sharedone.sharedone.model.Buyer;

@Service
public class BuyerServiceImpl implements BuyerService{
	@Autowired
	private BuyerDao bd;

	//buyer정보 전체 리스트 불러오기
	public List<Buyer> selectBuyerList() {
		return bd.selectBuyerList();
	}

	//buyer정보 insert
	public int buyerInsert(Buyer buyer) {
		return bd.buyerInsert(buyer);
	}

	//buyer정보 하나 불러오기
	public Buyer selectBuyer(String buyercd) {
		return bd.selectBuyer(buyercd);
	}

	//buyer정보 업데이트
	public int buyerUpdate(Buyer buyer) {
		return bd.buyerUpdate(buyer);
	}
}
