package com.sharedone.sharedone.dao;

import java.util.List;

import com.sharedone.sharedone.model.Employee;

public interface EmployeeDao {

	Employee select(String empCd);

	//직원 정보 전체 리스트 불러오기
	List<Employee> selectEmployeeList();

	//직원 정보 한개 출력
	Employee selectEmpNm(String empCd);

	List<Employee> selectTeam(String empCd);

}
