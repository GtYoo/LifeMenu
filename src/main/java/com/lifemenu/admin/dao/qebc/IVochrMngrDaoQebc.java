package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.dto.SetleMngrDto;
import com.lifemenu.admin.dto.VochrMngrDto;
import com.lifemenu.admin.vo.ConditionParamVo;

// ver.1.0.2

public interface IVochrMngrDaoQebc {

	// 식사권 조건 조회
	List<VochrMngrDto> selectMultiVochrByCondition(ConditionParamVo conditionParamVo);
	
	// 식사권 상세 조회 시 식사권 및 판매자 정보
	VochrMngrDto selectOneVochrMngr(String vochrCode);
	
	// 식사권 상세 조회 시 결제 건(lifemenu_v3_1, 예약결제 통합)
	SetleMngrDto selectOneSetle(String vochrCode, int currentNo);
	
	// 식사권 조건 조회 건수
	int selectVochrMngrByConditionTotalCount(ConditionParamVo conditionParamVo);
	
	// 식사권의 결제 건수
	int selectSetleByConditionTotalCount(String vochrCode);
	
}
