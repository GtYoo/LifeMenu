package com.lifemenu.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.service.INoticeMngrService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.NoticeDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-18
 * 	Version 	: 1.0.1
 * 
 * 	공지사항
 * 2021-06-18-0.0.2 	- 페이지 처리
 * 2021-06-26-0.0.3 	- 서비스 연동 확인 및 등록, 수정, 삭제 추가
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-18-1.0.1 	- 조건 처리 변경
 */

@Controller
public class NoticeController {

	@Autowired
	@Qualifier("noticeMngrService")
	private INoticeMngrService noticeMngrService;
	
	// 전체 공지사항 목록 조건조회
	@RequestMapping(value="noticeMngrCondition.do")
	public String selectMultiNoticeByCondition(Model model, ConditionParamVo conditionParamVo) {
		System.out.println(conditionParamVo.toString());
		return noticeMngrService.selectMultiNoticeMngrByCondition(model, conditionParamVo);
	}
	
	// 공지사항 상세 조회
	@RequestMapping(value="noticeMngrDetail.do")
	public String selectOneNoticeDetail(Model model, @RequestParam("bbscttNo") String bbscttNo, PageParamVo pageParamVo) {
		return noticeMngrService.selectOneNoticeMngr(model, bbscttNo, pageParamVo);
	}
	
	// 공지사항 등록 양식
	@RequestMapping(value="insertNoticeForm.do")
	public String insertNoticeForm(Model model, HttpSession session, PageParamVo pageParamVo) {
		
		String viewPage = "admin/notice/noticeForm";
		MberDto mberDto;
		if (session.getAttribute("dto") instanceof MberDto) {
			mberDto = (MberDto)session.getAttribute("dto");
			
			model.addAttribute("MBER_CODE", mberDto.getMberCode());
		}
		else {
			viewPage = "noticeMngrCondition.do";
		}
		
		model.addAttribute("START", pageParamVo.getStart());
		model.addAttribute("CNT", pageParamVo.getCnt());
		
		return viewPage;
		
	}
	
	// 공지사항 등록
	@RequestMapping(value="insertNotice.do")
	public String insertNotice(RedirectAttributes redirectAttributes, NoticeDto noticeDto) throws Exception {
		return noticeMngrService.insertNoticeMngr(redirectAttributes, noticeDto);
	}
	
	// 공지사항 수정
	@RequestMapping(value="updateNotice.do")
	public String updateNotice(RedirectAttributes redirectAttributes, NoticeDto noticeDto, PageParamVo pageParamVo) throws Exception {
		return noticeMngrService.updateNoticeMngr(redirectAttributes, noticeDto, pageParamVo);
	}
	
	// 공지사항 삭제
	@RequestMapping(value="deleteNotice.do")
	public String deleteNotice(RedirectAttributes redirectAttributes, @ModelAttribute("bbscttNo") String bbscttNo) throws Exception {
		return noticeMngrService.deleteNoticeMngr(redirectAttributes, bbscttNo);
	}
	
}
