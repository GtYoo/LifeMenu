package com.lifemenu.dao.qebc;

import java.util.List;

import com.lifemenu.dto.NoticeDto;

public interface INoticeDaoQebc {
	

	List<NoticeDto> selectMultiNotice();
	
//	List<NoticeDto> selectMultiNoticeByCondition(ConditionParamVo conditionParamVo);
//	
	int selectNoticeTotalCount();
//	
	int selectNextBbscttNo();

}
