package com.lifemenu.admin.service;

import org.springframework.ui.Model;

import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-17
 * 	Version 	: 1.0.1
 * 
 * 	식사권, 예약, 결제, 환불 관리
 * 2021-06-16-0.0.2 	- DAO 테스트
 * 2021-06-29-0.0.3 	- 연동 확인, 변경사항 반영
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-17-1.0.1 	- 조건 조회 변경
 */

public interface IVochrMngrService {

	// 식사권 상세 조회
	String selectOneVochrMngr(Model model, String vochrCode, PageParamVo pageParamVo);
	
	// 식사권의 결제 조회(Ajax)
	String selectOneSetleMngrAjax(String vochrCode, int currentNo);
	
	// 전체 식사권 목록 조건 조회
	String selectMultiVochrByCondition(Model model, ConditionParamVo conditionParamVo);
	
	// 블라인드 처리(약관 위반된 식사권 또는 기간 만료된 식사권 등)
	String blindVochr(String vochrCode) throws Exception;
	
}
