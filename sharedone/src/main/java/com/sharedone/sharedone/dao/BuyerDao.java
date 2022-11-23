package com.sharedone.sharedone.dao;

import java.util.List;

import com.sharedone.sharedone.model.Buyer;

public interface BuyerDao {
	//buyer정보 전체 리스트 불러오기
	List<Buyer> selectBuyerList();

}
