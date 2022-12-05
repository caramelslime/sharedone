package com.sharedone.sharedone.dao;

import java.util.List;
import java.util.Map;

import com.sharedone.sharedone.model.Report;

public interface ReportDao {

	List<Report> selectReport(Report report);

	//이번달 매출 누적 합계
	List<Report> selectAllAmount();

	//팀별 누적 매출 합계
	List<Report> selectGroupAmount();

	//승인여부 그래프
	List<Report> selectStatusAmount();

	//거래처 코드 검색
	List<Report> selectBuyerCd(Report report);

}
