package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Employee;

public interface EmployeeService {

	Employee select(String empCd);

	//직원 정보 전체 리스트 출력
	List<Employee> selectEmployeeList();

}
