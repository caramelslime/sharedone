package com.sharedone.sharedone.service;

import com.sharedone.sharedone.model.Notice;

public interface NoticeService {

	Notice selectLastRequest(String soNo);

}
