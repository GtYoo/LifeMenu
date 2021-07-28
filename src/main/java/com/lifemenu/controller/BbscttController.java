package com.lifemenu.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.BbscttDto;
import com.lifemenu.service.IBbscttService;



@Controller
public class BbscttController {
    
	@Autowired
	@Qualifier("bbscttService")
	private IBbscttService bbscttService;
	
	//전체 목록 조회
	@RequestMapping(value="bbscttMulti.do")
	public String selectMultiBbsctt(Model model, PageParamVo pageParamVo) {
		return bbscttService.selectMultiBbsctt(model, pageParamVo);
	}
	
	//게시글 상세 조회
	@RequestMapping(value="bbscttDetail.do")
	public String selectOneBbsctt(Model model, HttpSession session, @RequestParam("BBSCTT_NO") String bbscttNo) {
		return bbscttService.selectOneBbsctt(model, session, bbscttNo);
	}
	
	//새글 등록페이지
	@RequestMapping(value="bbscttInsertForm.do")
	public String insertBbscttForm() {
		return "bbsctt/bbscttInsertForm";
	}
	
	//새글 등록
	@RequestMapping(value="bbscttInsert.do")
	public String insertBbsctt(Model model, HttpSession session, BbscttDto bbscDto) throws Exception {
		
		return bbscttService.insertBbsctt(model, session, bbscDto);
	}
	//댓글 등록
	@RequestMapping(value="comentInsert.do")
	public String insertComent(Model model, HttpSession session, 
			BbscttDto bbscDto, @RequestParam(value="BBSCTT_NO") String bbscttNo) throws Exception {
		
		return bbscttService.insertComent(model, session, bbscDto, bbscttNo);
	}
	
	//본글 수정페이지
	@RequestMapping(value="bbscttUpdateForm.do")
	public String updateBbscttForm(Model model, HttpSession session, 
			@RequestParam(value="BBSCTT_NO") String bbscttNo) {
		
		return bbscttService.bbscttUpdateForm(model, session, bbscttNo);
	}
	
	//본글 수정
	@RequestMapping(value="bbscttUpdate.do")
	public String updateBbsctt(Model model, HttpSession session, BbscttDto bbscttDto) throws Exception {
		
		return bbscttService.bbscttUpdate(model, session, bbscttDto);
	}
	
	//본글 삭제
	@RequestMapping(value="bbscttDelete.do")
	public String deleteBbsctt(Model model, @RequestParam(value="BBSCTT_NO") String bbscttNo) throws Exception {
		
		return bbscttService.deleteBbsctt(model, bbscttNo);
	}
	
	//댓글 삭제
	@RequestMapping(value="comentDelete.do")
	public String deleteComent(Model model, @RequestParam(value="UPBBSCTT_NO") String upBbscttNo, 
			@RequestParam(value="BBSCTT_NO") String bbscttNo) throws Exception {
		
		return bbscttService.deleteComent(model, upBbscttNo, bbscttNo);
	}

}
