package com.lifemenu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lifemenu.admin.service.IVochrMngrService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-21
 * 	Version 	: 1.0.2
 * 
 * 	식사권, 예약, 결제, 환불 관리
 * 2021-06-10-0.0.1 	- 최초 작성
 * 2021-06-30-0.0.2 	- 연동 확인
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-18-1.0.1 	- 조전 조회 변경
 * 2021-07-21-1.0.2 	- 상세 페이지 수정
 */

@Controller
public class VochrMngrController {

	@Autowired
	@Qualifier("vochrMngrService")
	private IVochrMngrService vochrMngrService;
	
	// 전체 식사권 목록 조건조회
	@RequestMapping(value="vochrMngrCondition.do")
	public String selectMultiVochrMngrByCondition(Model model, ConditionParamVo conditionParamVo) {
		return vochrMngrService.selectMultiVochrByCondition(model, conditionParamVo);
	}
	
	// 식사권 상세 조회
	@RequestMapping(value="vochrMngrDetail.do")
	public String selectMultiResveSetlt(Model model, @RequestParam("vochrCode") String vochrCode, PageParamVo pageParamVo) {
		return vochrMngrService.selectOneVochrMngr(model, vochrCode, pageParamVo);
	}
	
	// 식사권의 결제 정보 조회
	@RequestMapping(value="setleMngrOne.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String selectOneSetleMngr(@RequestParam("vochrCode") String vochrCode, @RequestParam("currentNo") int currentNo) throws Exception {
		System.out.println("vochrCode="+vochrCode+", currentNo="+currentNo);
		return vochrMngrService.selectOneSetleMngrAjax(vochrCode, currentNo);
	}
	
	// 식사권의 블라인드
	@RequestMapping(value="vochrMngrBlind.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String updateVochrMngr(@RequestParam("vochrCode") String vochrCode) throws Exception {
		return vochrMngrService.blindVochr(vochrCode);
	}
	
}
