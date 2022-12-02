package com.sharedone.sharedone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedone.sharedone.dao.ReportDao;
import com.sharedone.sharedone.model.Report;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDao rd;

	//연습
	public List<Report> selectReport(Report report) {
		return rd.selectReport(report);
	}
}
