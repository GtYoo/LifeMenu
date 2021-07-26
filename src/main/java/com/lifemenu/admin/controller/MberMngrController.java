package com.lifemenu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.service.IMberMngrService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.SellerDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-14
 * 	Version 	: 1.0.1
 * 
 * 	회원, 판매자 관리
 * 2021-06-10-0.0.1 	- 최초 작성
 * 2021-06-26-0.0.2 	- 연동 확인
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-14-1.0.1 	- 조건 조회 변경(페이지 처리 수정)
 */

@Controller
public class MberMngrController {

	@Autowired
	private IMberMngrService mberMngrService;
	
	// 전체 회원 목록 조건조회
	@RequestMapping(value="mberMngrCondition.do")
	public String selectMultiMberMngrByCondition(Model model, ConditionParamVo conditionParamVo) {
		System.out.println(conditionParamVo.toString());
		return mberMngrService.selectMultiMberByCondition(model, conditionParamVo);
	}
	
	// 회원 상세 조회
	@RequestMapping(value="mberMngrDetail.do")
	public String selectOneMberMngrDetail(Model model, String mberCode, PageParamVo pageParamVo) {
		return mberMngrService.selectOneMberMngr(model, mberCode, pageParamVo);
	}
	
	// 회원 및 판매자 수정
	@RequestMapping(value="updateMberMngr.do")
	public String updateMberMngrDetail(RedirectAttributes redirectAttributes, MberDto mberDto, SellerDto sellerDto, PageParamVo pageParamVo) throws Exception {
		return mberMngrService.updateMberMngr(redirectAttributes, mberDto, sellerDto, pageParamVo);
	}
	
	// 회원 및 판매자 삭제(탈퇴 처리)
	@RequestMapping(value="deleteMberMngr.do")
	public String deleteMberMngrDetail(RedirectAttributes redirectAttributes, @ModelAttribute("mberCode") String mberCode, PageParamVo pageParamVo) throws Exception {
		return mberMngrService.deleteMberMngr(redirectAttributes, mberCode);
	}
	
}
