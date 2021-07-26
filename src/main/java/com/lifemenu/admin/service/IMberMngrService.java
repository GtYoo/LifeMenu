package com.lifemenu.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.SellerDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-12
 * 	Version 	: 1.0.1
 * 
 * 	회원, 판매자 관리
 * 2021-06-16-0.0.2 	- 서비스 내용 확인 및 명시
 * 2021-06-24-0.0.3 	- 상세 조회 서비스 추가
 * 2021-06-26-0.0.4 	- 연동 확인 & 문서 업데이트
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-12-1.0.1 	- 조건검색 수정
 */

public interface IMberMngrService {

	// 회원 상세 조회
	String selectOneMberMngr(Model model, String mberCode, PageParamVo pageParamVo);
	
	// 전체 회원 목록 조건 조회
	String selectMultiMberByCondition(Model model, ConditionParamVo conditionParamVo);
	
	// 회원&판매자 정보 수정
	String updateMberMngr(RedirectAttributes redirectAttributes, MberDto mberDto, SellerDto sellerDto, PageParamVo pageParamVo) throws Exception;
	
	// 회원&판매자 탈퇴
	String deleteMberMngr(RedirectAttributes redirectAttributes, String mberCode) throws Exception;
	
}
