package com.sharedone.sharedone.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Employee select(String empCd) {
		// TODO Auto-generated method stub
		return sst.selectOne("empns.select",empCd);
	}

	//직원 정보 전체 리스트 불러오기
	public List<Employee> selectEmployeeList() {
		return sst.selectList("empns.selectEmployeeList");
	}

	//직원 정보 한개 출력
	public Employee selectEmpNm(String empCd) {
		return sst.selectOne("empns.selectEmpNm", empCd);
	}

	@Override
	public List<Employee> selectTeam(String empCd) {
		// TODO Auto-generated method stub
		return sst.selectList("empns.selectTeam",empCd);
	}
}
