package com.sharedone.sharedone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedone.sharedone.dao.EmployeeDao;
import com.sharedone.sharedone.model.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeDao ed;

	@Override
	public Employee select(String empCd) {
		// TODO Auto-generated method stub
		return ed.select(empCd);
	}
}
