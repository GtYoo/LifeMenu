package com.lifemenu.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.BbscttDto;

public interface IBbscttService {

	//게시글 상세 조회
	String selectOneBbsctt(Model model, HttpSession session, String bbscttNo);
		
	//전체목록 조회
	String selectMultiBbsctt(Model model, PageParamVo pageParamVo);
	
	//게시글 수정 페이지
	String bbscttUpdateForm(Model model, HttpSession session, String bbscttNo);
	
	//게시글 수정
	String bbscttUpdate(Model model, HttpSession session, BbscttDto bbDto) throws Exception;
	
	//새글 등록
	String insertBbsctt(Model model, HttpSession session, BbscttDto bbDto) throws Exception;
	
	//댓글 등록
	String insertComent(Model model, HttpSession session, BbscttDto bbscDto, String bbscttNo) throws Exception;
	
	//본글 삭제
	String deleteBbsctt(Model model, String bbscttNo) throws Exception;
	
	//댓글 삭제
	String deleteComent(Model model, String upBbscttNo, String bbsctNo) throws Exception;
}
