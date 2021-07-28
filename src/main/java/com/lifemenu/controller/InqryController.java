package com.lifemenu.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.InqryDto;
import com.lifemenu.service.IInqryService;



@Controller
public class InqryController {
    
	@Autowired
	@Qualifier("inqryService")
	private IInqryService inqryService;
	
	//전체 목록 조회
	@RequestMapping(value="inqryMulti.do")
	public String selectMultiInqry(Model model, PageParamVo pageParamVo) {
		return inqryService.selectMultiInqry(model, pageParamVo);
	}
	
	//문의 게시글 상세 조회
	@RequestMapping(value="inqryDetail.do")
	public String selectOneInqry(Model model, HttpSession session, @RequestParam("MNGR_INQRY_NO") String mngrInqryNo) {
		return inqryService.selectOneInqry(model, session, mngrInqryNo);
	}
	
	//새글 등록페이지
	@RequestMapping(value="inqryInsertForm.do")
	public String insertInqryForm() {
		return "inqry/inqryInsertForm";
	}
	
	//새글 등록
	@RequestMapping(value="inqryInsert.do")
	public String insertInqry(Model model, HttpSession session, InqryDto bbscDto) throws Exception {
		
		return inqryService.insertInqry(model, session, bbscDto);
	}
	//댓글 등록
	@RequestMapping(value="comentInsertInqry.do")
	public String insertComent(Model model, HttpSession session, 
			InqryDto inqryDto, @RequestParam(value="MNGR_INQRY_NO") String mngrInqryNo) throws Exception {
		
		return inqryService.insertComent(model, session, inqryDto, mngrInqryNo);
	}
	
	//본글 수정페이지
	@RequestMapping(value="inqryUpdateForm.do")
	public String updateInqryForm(Model model, HttpSession session, 
			@RequestParam(value="MNGR_INQRY_NO") String mngrInqryNo) {
		
		return inqryService.inqryUpdateForm(model, session, mngrInqryNo);
	}
	
	//본글 수정
	@RequestMapping(value="inqryUpdate.do")
	public String updateInqry(Model model, HttpSession session, InqryDto inqryDto) throws Exception {
		
		return inqryService.inqryUpdate(model, session, inqryDto);
	}
	
	//본글 삭제
	@RequestMapping(value="inqryDelete.do")
	public String deleteInqry(Model model, @RequestParam(value="MNGR_INQRY_NO") String mngrInqryNo) throws Exception {
		
		return inqryService.deleteInqry(model, mngrInqryNo);
	}
	
	//댓글 삭제
	@RequestMapping(value="comentDeleteInqry.do")
	public String deleteComent(Model model, @RequestParam(value="MNGRANSWER_NO") String mngrAnswerNo, 
			@RequestParam(value="MNGR_INQRY_NO") String mngrInqryNo) throws Exception {
		
		return inqryService.deleteComent(model, mngrAnswerNo, mngrInqryNo);
	}

}
