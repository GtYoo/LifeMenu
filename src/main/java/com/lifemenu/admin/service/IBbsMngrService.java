package com.lifemenu.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-17
 * 	Version 	: 1.0.1
 * 
 * 	자유게시판
 * 2021-06-18-0.0.2 	- 서비스 명세 및 확인
 * 2021-06-27-0.0.3 	- 연동 확인 및 삭제 기능 추가
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-17-1.0.1 	- 조건 조회 변경
 */

public interface IBbsMngrService {

	// 게시글 상세 조회
	String selectOneBbsMngr(Model model, String bbscttNo, PageParamVo pageParamVo);
	
	// 전체 게시글 목록 조건 조회
	String selectMultiBbsMngrByCondition(Model model, ConditionParamVo conditionParamVo);
	
	// 게시글 삭제
	String deleteBbsMngr(RedirectAttributes redirectAttributes, String bbscttNo) throws Exception;
	
}
