package com.sharedone.sharedone.dao;

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

}
