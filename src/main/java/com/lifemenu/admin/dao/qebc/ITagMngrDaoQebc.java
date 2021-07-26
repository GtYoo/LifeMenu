package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.dto.TagMngrDto;
import com.lifemenu.admin.vo.ConditionParamVo;

// ver.1.0.2

public interface ITagMngrDaoQebc {

	// 전체 태그 조건 조회
	List<TagMngrDto> selectMultiTagMngrByCondition(ConditionParamVo conditionParamVo);	
	
	// 현재 사용중인 태그 확인시 사용(태그 수정 및 삭제 시)
	int selectTagSearchCount(String tagCode);
	
	// 조건 조회 결과 건수
	int selectTagMngrByConditionTotalCount(ConditionParamVo conditionParamVo);
	
	// 태그 등록시 사용할 태그코드(서비스에서 새로운 번호 부여)
	String selectMaxTagCode();
	
}
