package com.sharedone.sharedone.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Buyer;

@Repository
public class BuyerDaoImpl implements BuyerDao {
	@Autowired
	private SqlSessionTemplate sst;

	//buyer정보 전체 리스트 불러오기
	public List<Buyer> selectBuyerAllList() {
		return sst.selectList("buyerns.selectBuyerAllList");
	}
	
	//buyer정보 전체 리스트 불러오기(검색용)
	public List<Buyer> selectBuyerList(Buyer buyer) {
		return sst.selectList("buyerns.selectBuyerList", buyer);
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

	//거래처 코드 지정을 위한 거래처 리스트 count
	public int buyerCount() {
		return sst.selectOne("buyerns.buyerCount");
	}

	//거래처 삭제
	public String delList(String buyercd) {
		return sst.selectOne("buyerns.delList", buyercd);
	}

	//거래처 삭제
	public int deleteBuyer(String delList, String buyercd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("delList", delList);
		map.put("buyercd", buyercd);
		return sst.update("buyerns.deleteBuyer", map);
	}

	@Override
	public String selectByNm(String buyerNM) {
		return sst.selectOne("buyerns.selectByNm", buyerNM);
	}
}
