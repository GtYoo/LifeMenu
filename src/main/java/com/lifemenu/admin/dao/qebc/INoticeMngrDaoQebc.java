package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.dto.NoticeMngrDto;
import com.lifemenu.admin.vo.ConditionParamVo;

// ver.1.0.2

public interface INoticeMngrDaoQebc {

	// 전체 공지글 조건 조회
	List<NoticeMngrDto> selectMultiNoticeByCondition(ConditionParamVo conditionParamVo);
	
	// 조건 조회 결과 건수
	int selectNoticeByConditionTotalCount(ConditionParamVo conditionParamVo);
	
	// 공지사항 등록시 사용할 공지글 번호
	String selectMaxBbscttNo();
	
}
