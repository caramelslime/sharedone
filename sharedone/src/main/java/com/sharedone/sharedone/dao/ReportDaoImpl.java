package com.sharedone.sharedone.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharedone.sharedone.model.Report;

@Repository
public class ReportDaoImpl implements ReportDao{

	@Autowired
	private SqlSessionTemplate sst;


	public List<Report> selectReport(Report report) {
		return sst.selectList("reportns.selectReport", report);
	}


	//이번달 매출 누적 합계
	public List<Report> selectAllAmount() {
		return sst.selectList("reportns.selectAllAmount");
	}


	//팀별 누적 매출 합계
	public List<Report> selectGroupAmount() {
		return sst.selectList("reportns.selectGroupAmount");
	}


	//승인여부 그래프
	public List<Report> selectStatusAmount() {
		return sst.selectList("reportns.selectStatusAmount");
	}


	//거래처 코드 검색
	public List<Report> selectBuyerCd(Report report) {
		return sst.selectList("reportns.selectBuyerCd", report);
	}


	//리스트 전체 테이블 불러오기
	public List<Report> reportList(Report report) {
		return sst.selectList("reportns.reportList", report);
	}


	//달별 매출 그래프
	public List<Report> selectReportAmountList(Report report) {
		return sst.selectList("reportns.selectReportAmountList", report);
	}


	//팀별 매출
	public List<Report> selectgroupAllAmount(Report report) {
		return sst.selectList("reportns.selectgroupAllAmount", report);
	}


	//승인여부 그래프
	public List<Report> selectStatusAllAmount(Report report) {
		return sst.selectList("reportns.selectStatusAllAmount", report);
	}
}
