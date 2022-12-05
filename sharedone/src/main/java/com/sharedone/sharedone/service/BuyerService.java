package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Buyer;

public interface BuyerService {
	
	//buyer정보 전체 리스트 불러오기
	List<Buyer> selectBuyerAllList();
	
	//buyer정보 전체 리스트 불러오기(검색용)
	List<Buyer> selectBuyerList(Buyer buyer);

	//buyer정보 insert
	int buyerInsert(Buyer buyer);

	//buyer정보 하나 불러오기
	Buyer selectBuyer(String buyerCd);

	//buyer정보 업데이트
	int buyerUpdate(Buyer buyer);

	//거래처 코드 지정을 위한 거래처 리스트 count
	int buyerCount();

	//거래처 삭제
	String delList(String buyerCd);

	//거래처 삭제(update)
	int deleteBuyer(String delList, String buyerCd);



}
