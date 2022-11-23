package com.sharedone.sharedone.dao;

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
}
