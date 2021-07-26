package com.lifemenu.cmmn;

import com.lifemenu.admin.dto.hist.VochrHistDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.dto.VoucherDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-17
 * 	Version 	: 1.0.1
 * 
 * 	관리자 공통 메소드
 * 2021-07-12-1.0.0 	- 관리 시작 버전
 * 2021-07-17-1.0.1 	- 태그 조건 조회 총 건수 구하는 쿼리관련 수정
 */

public interface IAdminCommons {

	// 사용자가 입력한 검색어를 sql문으로 수정
	public void convertCondition(ConditionParamVo conditionParamVo);
	
	// 날짜형식 sql문으로 수정
	public String convertDate(String sDate);
	
	// 테이블 별 조건조회 건 수 가져오기(페이지 계산 시 사용)
	public int selectTotalCountByTableName(String tableName, ConditionParamVo conditionParamVo);
	
	// 식사권 히스토리 등록 시 Dto 생성
	public VochrHistDto createVochrHist(VoucherDto voucherDto, String histSe);
	
}
