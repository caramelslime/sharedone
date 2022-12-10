package com.sharedone.sharedone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedone.sharedone.dao.NoticeDao;
import com.sharedone.sharedone.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao nd;
	
	@Override
	public Notice selectLastRequest(String soNo) {
		return nd.selectLastRequest(soNo);
	}

	@Override
	public int insertApproveOrRefer(Notice notice) {
		// TODO Auto-generated method stub
		return nd.insertApproveOrRefer(notice);
	}

	@Override
	public int getMax() {
		// TODO Auto-generated method stub
		return nd.getMax();
	}

	@Override
	public int addComment(String soNo, String content, int noticeCd, String empCd) {
		return nd.addComment(soNo, content, noticeCd, empCd);
	}

	@Override
	public int checkComment(String soNo, String empCd) {
		return nd.checkComment(soNo, empCd);
	}

	@Override
	public String loadComment(String soNo, String empCd) {
		return nd.loadComment(soNo, empCd);
	}

	@Override
	public int checkReturnComment(String soNo, String empCd) {
		return nd.checkReturnComment(soNo, empCd);
	}

	@Override
	public String loadReturnComment(String soNo, String empCd) {
		return nd.loadReturnComment(soNo, empCd);
	}

}
