package com.sharedone.sharedone.service;

import java.util.List;

import com.sharedone.sharedone.model.Report;

public interface ReportService {

	//연습
	List<Report> selectReport(Report report);

	//이번달 매출 누적합계
	List<Report> selectAllAmount();

	//팀별 누적 매출 합계
	List<Report> selectGroupAmount();

	//승인여부 그래프
	List<Report> selectStatusAmount();

	//거래처 코드 검색
	List<Report> selectBuyerCd(Report report);

	//리스트 전체 테이블 불러오기
	List<Report> reportList(Report report);

	//달별 매출 그래프
	List<Report> selectReportAmountList(Report report);

	//팀별 매출
	List<Report> selectgroupAllAmount(Report report);

	//승인여부 그래프
	List<Report> selectStatusAllAmount(Report report);


}
