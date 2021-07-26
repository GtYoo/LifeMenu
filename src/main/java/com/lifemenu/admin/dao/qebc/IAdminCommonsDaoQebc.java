package com.lifemenu.admin.dao.qebc;

import com.lifemenu.admin.vo.ConditionParamVo;

// ver.1.0.0

public interface IAdminCommonsDaoQebc {
	
	int selectTotalCountByTableNameAndCondition(String tableName, ConditionParamVo conditionParamVo);

	String selectMaxCodeByTableName(String tableName, String pkColumnName);
	
}
