package com.lifemenu.cmmn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lifemenu.admin.dao.qebc.IAdminCommonsDaoQebc;
import com.lifemenu.admin.dto.hist.VochrHistDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.dto.VoucherDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-15
 * 	Version 	: 1.0.1
 * 
 * 	관리자 공통 메소드
 * 2021-07-12-1.0.0 	- 관리 시작 버전
 * 2021-07-15-1.0.1 	- 제목+내용 조회 추가
 */

@Component("adminCommons")
public class AdminCommonsImpl implements IAdminCommons {

	@Autowired
	private IAdminCommonsDaoQebc adminCommonsDaoQebc;
	
	// 조건 검색 시, 조건을 sql쿼리에 맞게 세팅
	public void convertCondition(ConditionParamVo conditionParamVo) {
		
		String condition = conditionParamVo.getCondition();
		String conditionType = conditionParamVo.getConditionType();
		
		// 조회 조건이 없을 때(첫 화면 출력시 포함)
		if (condition == null || "".equals(condition.trim()) || "1".equals(conditionType)) {
			conditionParamVo.setConditionType("'1'");
			conditionParamVo.setCondition("1");
		}
		// 제목+내용 조회 시
		else if("BBSCTT_SJ_CN".equals(conditionType)) {
			conditionParamVo.setConditionType("(BBSCTT_SJ");
			conditionParamVo.setCondition("%"+condition+"& OR BBSCTT_CN LIKE %"+condition+"%) ");
		}
		// 조건 조회
		else {
			conditionParamVo.setCondition("%"+condition+"%");
		}
	}
	
	public String convertDate(String sDate) {
		System.out.println("sDate = "+sDate+", length = "+sDate.length());
		String convertedDate = "";
		if(sDate.length() >= 8) {
			convertedDate
			= sDate.substring(0, 4) + "-"
			+ sDate.substring(4, 6) + "-"
			+ sDate.substring(6, 8);
		}
		if(sDate.length() == 10) {
			convertedDate += " ";
			convertedDate += sDate.substring(8, 10)+":00:00.0";
		}
		else if(sDate.length() == 12) {
			convertedDate += " ";
			convertedDate += sDate.substring(8, 10)+":";
			convertedDate += sDate.substring(10, 12)+":00.0";
		}
		else if(sDate.length() == 14) {
			convertedDate += " ";
			convertedDate += sDate.substring(8, 10)+":";
			convertedDate += sDate.substring(10, 12)+":";
			convertedDate += sDate.substring(12, 14)+".0";
		}
		else {
			convertedDate += " 00:00:00.0";
		}
		System.out.println("convertedDate = "+convertedDate);
		return convertedDate;
	}
	
	// 목록 조회 시 페이징 처리를 위해 테이블 별로 전체 건 수 가져오기
	@Override
	public int selectTotalCountByTableName(String tableName, ConditionParamVo conditionParamVo) {
		return adminCommonsDaoQebc.selectTotalCountByTableNameAndCondition(tableName, conditionParamVo);
	}
	
	// 식사권 히스토리 등록을 위한 Dto매핑 함수
	public VochrHistDto createVochrHist(VoucherDto voucherDto, String histSe) {
		
		VochrHistDto vochrHistDto = new VochrHistDto();
		
		vochrHistDto.setHistSe(histSe);
		
		vochrHistDto.setVochrCode( voucherDto.getVochrCode() );
		vochrHistDto.setMberCode( voucherDto.getMberCode() );
		vochrHistDto.setVochrPrice( voucherDto.getVochrPrice() );
		vochrHistDto.setMealPrearngeDt( voucherDto.getMealPrearngeDt() );
//		vochrHistDto.setVochrRegistDt( Date.valueOf(voucherDto.getVochrRegistDt()) );// DB 등록 일시
		vochrHistDto.setMealTime( voucherDto.getMealTime() );
		vochrHistDto.setDelngAt( String.valueOf(voucherDto.getDelngAt() ));
		
		return vochrHistDto;
		
	}
	
}
