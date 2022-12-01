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

}
