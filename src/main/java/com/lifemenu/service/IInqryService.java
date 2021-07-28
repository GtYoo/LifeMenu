package com.lifemenu.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.InqryDto;

public interface IInqryService {

	//문의 게시글 상세 조회
	String selectOneInqry(Model model, HttpSession session, String mngrInqryNo);
		
	//전체목록 조회
	String selectMultiInqry(Model model, PageParamVo pageParamVo);
	
	//문의 게시글 수정 페이지
	String inqryUpdateForm(Model model, HttpSession session, String mngrInqryNo);
	//문의 게시글 수정
	String inqryUpdate(Model model, HttpSession session, InqryDto bbDto) throws Exception;
	
	//새글 등록
	String insertInqry(Model model, HttpSession session, InqryDto bbDto) throws Exception;
	
	//댓글 등록
	String insertComent(Model model, HttpSession session, InqryDto bbscDto, String mngrInqryNo) throws Exception;
	
	//본글 삭제
	String deleteInqry(Model model, String mngrInqryNo) throws Exception;
	
	//댓글 삭제
	String deleteComent(Model model, String mngrAnswerNo, String mngrInqryNo) throws Exception;

	
}
