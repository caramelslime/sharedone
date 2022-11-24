package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Buyer;

public interface BuyerService {
	
	//buyer정보 전체 리스트 불러오기
	List<Buyer> selectBuyerList();

	//buyer정보 insert
	int buyerInsert(Buyer buyer);

	//buyer정보 하나 불러오기
	Buyer selectBuyer(String buyercd);

	//buyer정보 업데이트
	int buyerUpdate(Buyer buyer);

}
