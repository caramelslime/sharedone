package com.sharedone.sharedone.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Notice {
	private int noticeCd;
	private String content;
	private String empCd;
	private String soNo;
	private Date registDate;
	private String status;
//	승인/반려 체크용
	private String check;
	
}
