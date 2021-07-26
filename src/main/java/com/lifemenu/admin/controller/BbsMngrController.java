package com.lifemenu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.service.IBbsMngrService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-18
 * 	Version 	: 1.0.1
 * 
 * 	게시판 관리
 * 2021-06-12-0.0.1 	- 최초 작성
 * 2021-06-27-0.0.2 	- 서비스 명체 및 연동 확인, 삭제 기능 추가
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-18-1.0.1 	- 조건 조회 변경
 */

@Controller
public class BbsMngrController {

	@Autowired
	@Qualifier("bbsMngrService")
	private IBbsMngrService bbsMngrService;
	
	// 전체 게시글 목록 조건조회
	@RequestMapping(value="bbsMngrCondition.do")
	public String selectMultiBbsMngrByCondition(Model model, ConditionParamVo conditionParamVo) {
		return bbsMngrService.selectMultiBbsMngrByCondition(model, conditionParamVo);
	}
	
	// 게시글 상세 조회
	@RequestMapping(value="bbsMngrDetail.do")
	public String selectOneBbsMngr(Model model, @RequestParam("bbscttNo") String bbscttNo, PageParamVo pageParamVo) {
		return bbsMngrService.selectOneBbsMngr(model, bbscttNo, pageParamVo);
	}
	
	// 게시글 삭제
	@RequestMapping(value="deleteBbsMngr.do")
	public String deleteBbsMngr(RedirectAttributes redirectAttributes, @RequestParam("bbscttNo") String bbscttNo) throws Exception {
		return bbsMngrService.deleteBbsMngr(redirectAttributes, bbscttNo);
	}
	
}
