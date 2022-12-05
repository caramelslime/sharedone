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

	//이번달 매출 누적 합계
	public List<Report> selectAllAmount() {
		return rd.selectAllAmount();
	}

	//팀별 누적 매출 합계
	public List<Report> selectGroupAmount() {
		return rd.selectGroupAmount();
	}

	//승인여부 그래프
	public List<Report> selectStatusAmount() {
		return rd.selectStatusAmount();
	}

	//거래처 코드 검색
	public List<Report> selectBuyerCd(Report report) {
		return rd.selectBuyerCd(report);
	}
}
