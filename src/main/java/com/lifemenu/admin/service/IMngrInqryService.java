package com.lifemenu.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.dto.MngrInqryDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-15
 * 	Version 	: 1.0.1
 * 
 * 	관리자 문의
 * 2021-06-26-0.0.2 	- 페이지 수정에 맞춰 서비스 수정, 등록, 수정, 삭제 기능 추가
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-15-1.0.1 	- 조건 조회 변경
 */

public interface IMngrInqryService {

	// 관리자 목록 상세 조회
	String selectOneMngrInqry(Model model, String mngrInqryNo, PageParamVo pageParamVo);
	
	// 전체 관리자 목록 조건 조회
	String selectMultiMngrInqryByCondition(Model model, ConditionParamVo conditionParamVo);
	
	// 관리자 문의 답변 등록
	String insertMngrAnswer(RedirectAttributes redirectAttributes, MngrInqryDto mngrInqryDto) throws Exception;
	
	// 관리자 문의 답변 수정
	String updateMngrAnswer(RedirectAttributes redirectAttributes, MngrInqryDto mngrInqryDto, PageParamVo pageParamVo) throws Exception;
	
	// 관리자 문의 답변 삭제
	String deleteMngrAnswer(RedirectAttributes redirectAttributes, String mngrInqryNo) throws Exception;
	
}
