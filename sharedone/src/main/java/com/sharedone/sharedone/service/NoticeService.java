package com.sharedone.sharedone.service;

import com.sharedone.sharedone.model.Notice;

public interface NoticeService {

	Notice selectLastRequest(String soNo);

	int insertApproveOrRefer(Notice notice);
//	사유코드 가장큰거 구하기
	int getMax();

	int addComment(String soNo, String content, int noticeCd, String empCd);

	int checkComment(String soNo, String empCd);

	String loadComment(String soNo, String empCd);

	int checkReturnComment(String soNo, String empCd);

	String loadReturnComment(String soNo, String empCd);

}
