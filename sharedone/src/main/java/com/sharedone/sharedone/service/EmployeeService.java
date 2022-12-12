package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Employee;

public interface EmployeeService {
	//로그인
	Employee select(String empCd);

	//직원 정보 전체 리스트 출력
	List<Employee> selectEmployeeList();

	//직원 정보 한개 출력
	Employee selectEmpNm(String empCd);

	List<Employee> selectTeam(String empCd);

}
