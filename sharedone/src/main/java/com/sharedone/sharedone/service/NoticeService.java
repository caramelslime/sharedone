package com.sharedone.sharedone.service;

import com.sharedone.sharedone.model.Notice;

public interface NoticeService {

	Notice selectLastRequest(String soNo);

	int insertApproveOrRefer(Notice notice);
//	사유코드 가장큰거 구하기
	int getMax();

}
