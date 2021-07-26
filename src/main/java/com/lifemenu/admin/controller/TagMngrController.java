package com.lifemenu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.service.ITagMngrService;
import com.lifemenu.admin.vo.ConditionParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-18
 * 	Version 	: 1.0.1
 * 
 * 	태그, 태그 조회수
 * 2021-06-10-0.0.1 	- 최초 작성
 * 2021-06-28-0.0.2 	- 연동 확인, 등록, 수정, 삭제 기능 추가
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-18-1.0.1 	- 조건 조회 변경
 */

@Controller
public class TagMngrController {

	@Autowired
	@Qualifier("tagMngrService")
	private ITagMngrService tagMngrService;
	
	// 전체 태그 목록 조건조회
	@RequestMapping(value="tagMngrCondition.do")
	public String viewTagMngr(Model model, ConditionParamVo conditionParamVo) {
		return tagMngrService.selectMultiTagMngrByCondition(model, conditionParamVo);
	}
	
	// 태그 등록
	@RequestMapping(value="insertTagMngr.do")
	public String insertTagMngr(RedirectAttributes redirectAttributes, @ModelAttribute("tagName") String tagName, MultipartFile[] uploadFile) throws Exception {
		return tagMngrService.insertTagMngr(redirectAttributes, tagName, uploadFile);
	}
	
//	// 태그 수정
//	@RequestMapping(value="updateTagMngr.do")
//	public String updateTagMngr(RedirectAttributes redirectAttributes, TagDto tagDto, MultipartFile[] imageAdres, int imageAdresIndex, PageParamVo pageParamVo) throws Exception {
//		return tagMngrService.updateTagMngr(redirectAttributes, tagDto, imageAdres, imageAdresIndex, pageParamVo);
//	}
	
	// 태그 삭제
	@RequestMapping(value="deleteTagMngr.do")
	public String deleteTagMngr(RedirectAttributes redirectAttributes, @ModelAttribute("tagCode") String tagCode) throws Exception {
		return tagMngrService.deleteTagMngr(redirectAttributes, tagCode);
	}
	
}
