package com.sharedone.sharedone.dao;

import com.sharedone.sharedone.model.Notice;

public interface NoticeDao {

	Notice selectLastRequest(String soNo);

}
