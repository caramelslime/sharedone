package com.sharedone.sharedone.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Employee {
	private String empCd;
	private String pw;
	private String phone_no;
	private String name;
	private String email;
	private Date hiredate;
	private String dept;
	private String job;
}
