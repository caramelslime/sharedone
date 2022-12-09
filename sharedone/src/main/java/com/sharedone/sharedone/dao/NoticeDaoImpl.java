package com.sharedone.sharedone.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public Notice selectLastRequest(String soNo) {
		return sst.selectOne("noticens.selectLastRequest",soNo);
	}

	@Override
	public int insertApproveOrRefer(Notice notice) {
		// TODO Auto-generated method stub
		return sst.insert("noticens.insertApproveOrRefer",notice);
	}

	@Override
	public int getMax() {
		// TODO Auto-generated method stub
		return sst.selectOne("noticens.getMax");
	}

	@Override
	public int addComment(String soNo, String content, int noticeCd, String empCd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("content", content);
		map.put("noticeCd", noticeCd);
		map.put("empCd", empCd);
		return sst.insert("noticens.addComment", map);
	}

	@Override
	public int checkComment(String soNo, String empCd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("empCd", empCd);
		return sst.selectOne("noticens.checkComment", map);
	}

	@Override
	public String loadComment(String soNo, String empCd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("empCd", empCd);
		return sst.selectOne("noticens.loadComment", map);
	}

	@Override
	public int checkReturnComment(String soNo, String empCd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("empCd", empCd);
		return sst.selectOne("noticens.checkReturnComment", map);
	}

	@Override
	public String loadReturnComment(String soNo, String empCd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soNo", soNo);
		map.put("empCd", empCd);
		return sst.selectOne("noticens.loadReturnComment", map);
	}

}
