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
	public List<Buyer> selectBuyerAllList() {
		return bd.selectBuyerAllList();
	}
	
	//buyer정보 전체 리스트 불러오기(검색용)
	public List<Buyer> selectBuyerList(Buyer buyer) {
		return bd.selectBuyerList(buyer);
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

	//거래처 코드 지정을 위한 거래처 리스트 count
	public int buyerCount() {
		return bd.buyerCount();
	}

	//거래처삭제
	public String delList(String buyercd) {
		return bd.delList(buyercd);
	}

	//거래처삭제(update)
	public int deleteBuyer(String delList, String buyercd) {
		return bd.deleteBuyer(delList, buyercd);
	}

	//거래처 리스트 수정
	public int buyerListUpdate(Buyer buyer) {
		return bd.buyerListUpdate(buyer);
	}

	//사업자 등록번호 중복검사
	public Buyer brnoDupCheck(String brno) {
		return bd.brnoDupCheck(brno);
	}

	//바이어 코드에 해당하는 바이어 이름
	public Buyer selectBuyerNm(String buyerCd) {
		return bd.selectBuyerNm(buyerCd);
	}

}
