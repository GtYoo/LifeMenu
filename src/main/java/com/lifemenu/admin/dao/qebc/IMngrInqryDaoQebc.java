package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.dto.InqryMngrDto;
import com.lifemenu.admin.dto.MngrInqryDto;
import com.lifemenu.admin.vo.ConditionParamVo;

// ver.1.0.2

public interface IMngrInqryDaoQebc {

	// 답변 가져오기
	MngrInqryDto selectOneMngrInqryByMngrAnswerNo(String mngrAnswerNo);
	
	// 전체 관리자 문의 조건 조회
	List<InqryMngrDto> selectMultiMngrInqryByCondition(ConditionParamVo conditionParamVo);
	
	// 조건 조회 결과 건수
	int selectMngrInqryByConditionTotalCount(ConditionParamVo conditionParamVo);
	
	// 관리자 문의 답변 등록시 다음 관리자 번호
	String selectMaxMngrInqryNo();
	
}
