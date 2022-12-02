package com.sharedone.sharedone.dao;

import java.util.List;
import java.util.Map;

import com.sharedone.sharedone.model.Report;

public interface ReportDao {

	List<Report> selectReport(Report report);

}
