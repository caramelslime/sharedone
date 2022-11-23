package com.sharedone.sharedone.dao;

import com.sharedone.sharedone.model.Employee;

public interface EmployeeDao {

	Employee select(String empCd);

}
