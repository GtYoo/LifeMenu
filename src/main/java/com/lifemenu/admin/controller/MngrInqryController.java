package com.lifemenu.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.dto.MngrInqryDto;
import com.lifemenu.admin.service.IMngrInqryService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.MberDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-15
 * 	Version 	: 1.0.1
 * 
 * 	관리자 문의
 * 2021-06-10-0.0.1 	- 최초 작성
 * 2021-06-26-0.0.2 	- 서비스 연동 확인 및 등록, 수정, 삭제 추가
 * 2021-06-30-0.0.3 	- 세션에서 관리자 정보 가져오는 것으로 수정
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-15-1.0.1 	- 조건 조회 변경
 */

@Controller
public class MngrInqryController {

	@Autowired
	private IMngrInqryService mngrInqryService;
	
	// 전체 관리자 문의 목록 조건조회
	@RequestMapping(value="mngrInqryCondition.do")
	public String selectMultiMngrInqryByCondition(Model model, ConditionParamVo conditionParamVo) {
		System.out.println(conditionParamVo.toString());
		return mngrInqryService.selectMultiMngrInqryByCondition(model, conditionParamVo);
	}
	
	// 관리자 문의 상세 조회
	@RequestMapping(value="mngrInqryDetail.do")
	public String selectOneMngrInqryDetail(Model model, @RequestParam("mngrInqryNo") String mngrInqryNo, PageParamVo pageParamVo) {
		return mngrInqryService.selectOneMngrInqry(model, mngrInqryNo, pageParamVo);
	}
	
	// 관리자 문의 등록 양식
	@RequestMapping(value="insertMngrInqryForm.do")
	public String insertMngrInqryForm(Model model, @ModelAttribute("mngrInqryNo") String mngrInqryNo, HttpSession session, PageParamVo pageParamVo) {
		
		// 세션에서 회원번호 가져오기(작성자 번호)
		MberDto mberDto = (MberDto)session.getAttribute("dto");
		
		model.addAttribute("MNGR_INQRY_NO", mngrInqryNo);
		model.addAttribute("MBER_CODE", mberDto.getMberCode());
		model.addAttribute("START", pageParamVo.getStart());
		model.addAttribute("CNT", pageParamVo.getCnt());
		
		return "admin/inqry/inqryForm";
	}
	
	// 관리자 문의 답변 등록
	@RequestMapping(value="insertMngrAnswer.do")
	public String insertMngrAnswer(RedirectAttributes redirectAttributes, MngrInqryDto mngrInqryDto) throws Exception {
		return mngrInqryService.insertMngrAnswer(redirectAttributes, mngrInqryDto);
	}
	
	// 관리자 문의 답변 수정
	@RequestMapping(value="updateMngrAnswer.do")
	public String updateMngrAnswer(RedirectAttributes redirectAttributes, MngrInqryDto mngrInqryDto, PageParamVo pageParamVo) throws Exception {
		return mngrInqryService.updateMngrAnswer(redirectAttributes, mngrInqryDto, pageParamVo);
	}
	
	// 관리자 문의 답변 삭제
	@RequestMapping(value="deleteMngrAnswer.do")
	public String deleteMngrAnswer(RedirectAttributes redirectAttributes, @RequestParam("mngrInqryNo") String mngrInqryNo) throws Exception {
		return mngrInqryService.deleteMngrAnswer(redirectAttributes, mngrInqryNo);
	}
	
}
