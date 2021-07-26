package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.dto.MberDto;

// ver.1.0.2

public interface IMberMngrDaoQebc {

	// 전체 회원 조건 조회
	List<MberDto> selectMultiMberMngrByCondition(ConditionParamVo conditionParamVo);

	// 조건 조회 결과 건수
	int selectMberByConditionTotalCount(ConditionParamVo conditionParamVo);
	
}
