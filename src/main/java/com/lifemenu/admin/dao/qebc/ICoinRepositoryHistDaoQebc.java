package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.dto.hist.CoinRepositoryHistDto;
import com.lifemenu.admin.vo.HistoryParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-17
 * 	Version 	: 1.0.1
 * 
 * 	히스토리
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-17-1.0.1 	- 히스토리 서비스 정리(ajax로 변경)
 */

public interface ICoinRepositoryHistDaoQebc {

	// 코인저장소 내역 조건 조회
	List<CoinRepositoryHistDto> selectMultiCoinRepositoryHistByCondition(HistoryParamVo historyParamVo);
	
	// 조건 조회 결과 건수
	int selectCoinRepositoryHistByConditionTotalCount(HistoryParamVo historyParamVo);
	
}
