package com.lifemenu.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.NoticeDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-17
 * 	Version 	: 1.0.1
 * 
 * 	공지사항
 * 2021-06-17-0.0.2 	- 서비스 명세 및 DAO연결 확인
 * 2021-06-26-0.0.3 	- 연동 확인, 등록, 수정, 삭제 추가
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-17-1.0.1 	- 조건 조회 변경
 */

public interface INoticeMngrService {

	// 공지글 상세 조회
	String selectOneNoticeMngr(Model model, String bbscttNo, PageParamVo pageParamVo);
	
	// 전체 공지글 목록 조건 조회
	String selectMultiNoticeMngrByCondition(Model model, ConditionParamVo conditionParamVo);
	
	// 공지사항 등록
	String insertNoticeMngr(RedirectAttributes redirectAttributes, NoticeDto noticeDto) throws Exception;
	
	// 공지사항 수정
	String updateNoticeMngr(RedirectAttributes redirectAttributes, NoticeDto noticeDto, PageParamVo pageParamVo) throws Exception;
	
	// 공지사항 삭제
	String deleteNoticeMngr(RedirectAttributes redirectAttributes, String bbscttNo) throws Exception;
	
}
