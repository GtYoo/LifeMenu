package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.dto.BbsMngrDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.dto.BbscttDto;

// ver.1.0.2

public interface IBbsMngrDaoQebc {

	// 전체 게시글 조건 조회
	List<BbsMngrDto> selectMultiBbsMngrByCondition(ConditionParamVo conditionParamVo);
	
	// 게시글의 리플 조회
	List<BbscttDto> selectMultiBbsReply(String bbscttNo);
	
	// 조건 조회 결과 건수
	int selectBbsByConditionTotalCount(ConditionParamVo conditionParamVo);
	
}
