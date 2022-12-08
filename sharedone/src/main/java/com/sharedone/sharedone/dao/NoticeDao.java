package com.sharedone.sharedone.dao;

import com.sharedone.sharedone.model.Notice;

public interface NoticeDao {

	Notice selectLastRequest(String soNo);

	int insertApproveOrRefer(Notice notice);

	int getMax();

	int addComment(String soNo, String content, int noticeCd, String empCd);

	int checkComment(String soNo, String empCd);

	String loadComment(String soNo, String empCd);

	int checkReturnComment(String soNo, String empCd);

	String loadReturnComment(String soNo, String empCd);

}
