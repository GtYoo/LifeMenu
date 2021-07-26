package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.dto.HistDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.HistoryParamVo;

public interface IHistDaoQebc {

	List<HistDto> selectMultiHist(HistoryParamVo historyParamVo);
	List<HistDto> selectMultiHistByCondition(ConditionParamVo conditionParamVo);
	
}
