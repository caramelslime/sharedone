package com.sharedone.sharedone.service;

import java.util.List;

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

	//직원 정보 전체 리스트 출력
	public List<Employee> selectEmployeeList() {
		return ed.selectEmployeeList();
	}
}
