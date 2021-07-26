package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.dto.hist.ResveSetleHistDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.HistoryParamVo;

public interface IResveSetleHistDaoQebc {

	List<ResveSetleHistDto> selectMultiResveSetleHist(HistoryParamVo historyParamVo);
	List<ResveSetleHistDto> selectMultiResveSetleHistByCondition(ConditionParamVo conditionParamVo);
	
}
